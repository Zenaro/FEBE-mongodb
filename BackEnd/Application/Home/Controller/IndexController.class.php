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
		$data = new MongoModel('News');
		$result = $data->limit(7)->select();
		$this->ajaxReturn($result, 'JSON');
	}

	
    public function index(){
    	$music = new MongoModel('music');
    	// $map['name'] = 'V.A.-キミを思うメロディー';
    	// $map['singer'] = 'V.A.';
    	// $map['class_id'] = 1;
    	// $map['src'] = 'http://7xstax.com1.z0.glb.clouddn.com/VA-missing.mp3';
    	// $map['lyric'] = '纯音乐无歌词';
    	// $map['listeners'] = 2800;
    	// $data = $music->where('1')->save($map);
        // $map['_id'] = "585e41569bea959c05000029";
        // $data['comment'] = 
        $map['name'] = array('like', 'you');
    	$data = $music->where($map)->select();
        // $data = $music->add($map);
    	$this->ajaxReturn($data, 'JSON');

        // $setting = M('music');
        // $map['music_id'] = 2;
        // $data = $setting->where($map)->select();
        // $this->ajaxReturn($data, 'JSON');
    }
}