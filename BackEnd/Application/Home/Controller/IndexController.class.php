<?php
namespace Home\Controller;
use Think\Controller;
use Think\Model\MongoModel;

class IndexController extends Controller {

	/* 
	* 首页接口
	*/

	// 获取最新推送
	public function getNews() {
		$model = new MongoModel('News');
		$result = $model->limit(7)->select();
		$this->ajaxReturn($result, 'JSON');
	}

	
    public function index() {
        
    	$music = new MongoModel('Music');
    	// $map['name'] = '相爱很难';
    	// $map['singer'] = '李克勤 - 容祖儿';
        // $map['class_id'] = 1;
    	// $map['src'] = 'http://7xstax.com1.z0.glb.clouddn.com/lrc-love.mp3';
    	// $map['lyric'] = '';
    	// $map['listeners'] = 3230;
    	// $data = $music->where($map)->delete();
        // $map['_id'] = "585e41569bea959c05000029";
        // $data['comment'] = 
    	// $data = $music->where($data)->save($map);
        // $data = $music->add($map);

    	$this->ajaxReturn($data, 'JSON');

        // $setting = M('music');
        // $map['music_id'] = 2;
        // $data = $setting->where($map)->select();
        // $this->ajaxReturn($data, 'JSON');
    }
}