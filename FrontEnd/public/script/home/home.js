/*
 *
 */
define(function(require, exports, module) {

	var URLPrefix = '../../BackEnd/index.php/Home';

	function Home() {
		this.btnDwn = '.btns .btn-down'; //宣传栏左侧的下载按钮
		this.btnSm = '.btns .sm'; //宣传栏左侧的其他按钮
		this.slides = '.slides'; //滚动框
		this.sliUL = '.slides ul.points'; //滚动框 图片
		this.sliTips = '.slides ul.sub-tips li'; //滚动图小按钮
		this.SIZE; //滚动图片宽度
		this.LENGTH; //滚动图片数量
		this._timer; //滚动定时器
		this.btnNews = '.aside ul.aside-tab li'; //宣传栏右侧的导航

		this.rank = '.rank dl';
		this.rankALLPlay = '.rank dl dt .dt-txt a.icon-play'; //飙升榜
		this.rankALLStore = '.rank dl dt .dt-txt a.icon-store'; //飙升榜

		this.rankLI = '.rank dl dd'; //排行榜li
		this.rankLIPlay = '.rank dl dd .dd-oper a.icon-play'; //排行榜li的播放按钮
		this.rankLIAdd = '.rank dl dd .dd-oper a.icon-add'; //排行榜li的添加按钮
		this.rankLIStore = '.rank dl dd .dd-oper a.icon-store'; //排行榜li的收藏按钮
	}

	module.exports = Home;

	Home.prototype.render = function() {
		this._init();
		this._load();
		this._bind();
	};

	Home.prototype._init = function() {

		var self = this;
		this.SIZE = $(this.sliUL).find('img').width();
		this.LENGTH = $(this.sliUL).find('img').length;

		$(this.sliUL).css('width', this.SIZE * this.LENGTH + 'px');

		this._fnTimer(0);
	};

	Home.prototype._fnTimer = function(i) {

		var index = i || 0;
		var self = this;
		var SIZE = this.SIZE;
		var LENGTH = this.LENGTH;

		this._timer && clearInterval(this._timer);

		ahead();

		this._timer = setInterval(ahead, 6000);

		function ahead() {
			$(self.sliUL).animate({
				left: -index * SIZE + 'px'
			}, 500);

			$(self.sliTips).removeClass('active').eq(index).addClass('active');

			index = (++index >= LENGTH ? 0 : index);
		}
	};

	Home.prototype._load = function() {
		var self = this;
		$.get(URLPrefix + '/Index/getNews', function(res) {
			var html = '';
			$.each(res, function(index, value) {
				html += '<li>' +
					'<a href="javascript:;">' + value.title + '</a>' +
					'<span>' + value.pubDate.substring(5, 10) + '</span>' +
					'</li>';
			});
			$('ul.aside-list').append(html).find('a').first().attr('class', 'active');
		});

		// 初始化三个排行榜
		rank(0);
		rank(1);
		rank(2);

		function rank(i) {
			$.get(URLPrefix + '/Music/getList', {
				data: i
			}, function(res) {
				var json = res.result;
				var html = '';
				var key = 1;
				$.each(json, function(index, value) {
					html += '<dd data-id="' + value._id + '">' +
						'<span>' + (key++) + '</span>' +
						'<a href="javascript:;">' + value.name + '</a>' +
						'<div class="dd-oper">' +
						'<a href="javascript:;" class="icon-play"></a>' +
						'<a href="javascript:;" class="icon-add"></a>' +
						'<a href="javascript:;" class="icon-store"></a>' +
						'</div>' +
						'</dd>';
				});
				html += '<div class="dd"><a href="javascript:;" class="dd-more">查看更多&gt;</a></div>';
				$(self.rank).eq(i).append(html);
				$(self.rank).eq(i).children('dd:even').css('background', '#e8e8e8');
			});
		}
	};

	Home.prototype._bind = function() {
		var self = this,
			Music = require('../common/music'),
			MList = require('../common/mlist');

		$('.wrap .main-top').on({
			mouseover: function() {
				$(this).animate({
					fontSize: "19px"
				});
			},
			mouseleave: function() {
				$(this).animate({
					fontSize: "20px"
				});
			}
		}, this.btnDwn).on({
			mouseover: function() {
				$(this).animate({
					textIndent: "0"
				}, 400);
			},
			mouseleave: function() {
				$(this).animate({
					textIndent: "10px"
				}, 300);
			}

		}, this.btnSm).on({
			mouseover: function() {
				$(self.sliTips).parent('ul').attr('class', 'sub-tips sub-bg'); //加背景
			},
			mouseout: function() {
				$(self.sliTips).parent('ul').attr('class', 'sub-tips'); //移除背景
			}

		}, this.slides).on('click', this.sliTips, function() {
			self._fnTimer($(this).index());

		}).on('click', this.btnNews, function() {
			$(self.btnNews).children('a').attr('class', '');
			$(self.btnNews).eq($(this).index()).children('a').addClass('active');
		});

		$('.wrap .main-rank').on('click', this.rankALLPlay, function() {
			var arr = [], // 造一个歌曲的id数组
				id = 0,
				objList = $(this).parents('dl').children('dd');
			for (var i = 0; i < objList.length; i++) {
				id = $(objList).eq(i).attr('data-id');
				arr.push(id);
			}
			Music.appendEle(arr); // append一个数组
			Music.init(arr[0]);
			MList.update({
				add: 300
			});

		}).on('click', this.rankALLStore, function() {
			if (cookie('unique') && cookie('unique') != '') {
				var t = $(this).attr('data-type');
				$.ajax({
					'url': URLPrefix + '/User/colClassMusic',
					'type': 'POST',
					'data': {
						uid: cookie('unique'),
						type: t
					},
					'success': function(res) {
						// alert(res);
						console.log(res);
					}
				});
			} else {
				alert('您尚未登录');
			}

		}).on({
			mouseover: function() {
				$(this).children('a').first().attr('class', 'title');
				$(this).children('div.dd-oper').show();
			},
			mouseleave: function() {
				$(this).children('a').first().removeClass('title');
				$(this).children('div.dd-oper').hide();
			}

		}, this.rankLI).on('click', this.rankLIPlay, function() {
			var addID = $(this).parents('dd').attr('data-id');
			Music.appendEle(addID);
			Music.init(addID);
			MList.update();

		}).on('click', this.rankLIAdd, function() {
			var addID = $(this).parents('dd').attr('data-id');
			Music.appendEle(addID);
			MList.update();

		}).on('click', this.rankLIStore, function() {
			if (!cookie('unique')) {
				alert('您尚未登录');

			} else {
				var trgid = $(this).parents('dd').attr('data-id');
				$.get(URLPrefix + '/User/colSingleMusic', {
					uid: cookie('unique'),
					mid: trgid
				}, function(result) {
					alert(result);
				});
			}
		});
	};
});