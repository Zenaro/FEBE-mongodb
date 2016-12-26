<?php
namespace Home\Model;
use Think\Model\MongoModel;

class MusicModel extends MongoModel {

	/*
	* 获取某首歌曲的信息
	* @param 
	* $music_id:歌曲id
	*/
	public function getItem($music_id) {

		$model = new MongoModel('music');
		$map['_id'] = $music_id;
		$result = $model->where($map)->find();
		if (count($result) > 0) {
			return ['msg'=>'succ', 'result'=>$result];

		} else {
			return ['msg'=>'empty', 'result'=>-1];
		}
	}

	/*
	* 获取某一类型的歌曲信息
	* @param
	* $class_id:歌曲类型的id
	*/
	public function getList($class_id) {
		$model = new MongoModel('music');

		$map['class_id'] = $class_id;
		$result = $model->where($map)->limit(10)->select();

		if (count($result) > 0) {
			return ['msg'=>'succ', 'result'=>$result];

		} else {
			return ['msg'=>'empty', 'result'=>-1];
		}
	}

	/*
	* 获取一系列歌曲的信息
	* @param
	* $arr: 歌曲id组成的数组
	*/
	public function getArray($type) {
		$model = new MongoModel();
		$map['class_id'] = $type;
		$result = $model->where($map)->limit(10)->select();

		return ['msg'=>'', 'result'=>$result];
	}

	/*
	* 获取某首歌曲的评论
	* @param
	* $music_id:歌曲id
	*/
	public function getComment($music_id) {

		$model = new MongoModel('music');
		$map['_id'] = $music_id;
		$result = $model->where($map)
			->field('comment')
			->order('time')
			->find();

		if (count($result) > 0) {
			return ['msg'=>'succ', 'result'=>$result];

		} else {
			return ['msg'=>'empty', 'result'=>-1];
		}
	}

	/*
	* 添加歌曲评论
	* @param
	* $uid:用户id;	
	*/
	public function setComment($mid, $uid, $content) {
		$map['uid'] = $uid;
		$data = new MongoModel('User');
		$map['name'] = $data->where($map)->find();
		$map['mid'] = $mid;
		$map['comment'] = $content;
		$model = new MongoModel('Comment');
		$result = $model->where($map)->select();
		return ['msg'=>'succ', 'result'=>$result];
	}

	/*
	* 获取某首歌曲的歌词
	* @param
	* $music_id:歌曲id
	*/
	public function getLyric($music_id) {

		$data = new MongoModel('Music');
		$map['_id'] = $music_id;
		$result = $data->where($map)->find();
		return ['msg'=>'', 'result'=>$result];
	}

	/*
	* 搜索相似歌曲
	* @param 
	* $str:目标文本
	*/
	public function searchMusic($str) {

		$model = new MongoModel('music');
		$map['name'] = array('like', $str);
		// $map['singer'] = array('like', '');
		$result = $model->where($map)
			//->where("music.music_id = mrs.music_id and mrs.singer_id=singer.singer_id and (music.name LIKE'%".$str."%' or singer_name LIKE '%".$str."%')")
			// ->field('_id, name, singer')
			->select();

		if (count($result) > 0) {
			return ['msg'=>'succ', 'result'=>$result];
			
		} else {
			return ['msg'=>'empty', 'result'=>-1];
		}
		
	}
}
?>