<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">

    <head>
    </head>

    <body>
       <div id="id_test_video" style="width:100%; height:auto;"></div>
    </body>
	<script src="//imgcache.qq.com/open/qcloud/video/vcplayer/TcPlayer.js" charset="utf-8"></script>     
      <script type="text/javascript">
		var player =  new TcPlayer('id_test_video', {
		"m3u8": "http://1252927922.vod2.myqcloud.com/a0bb1150vodtransgzp1252927922/b2c0ac714564972818941124863/v.f220.m3u8",
		//"flv": "http://2157.liveplay.myqcloud.com/live/2157_358535a.flv", //增加了一个flv的播放地址，用于PC平台的播放 请替换成实际可用的播放地址
		"autoplay" : true,      //iOS下safari浏览器，以及大部分移动端浏览器是不开放视频自动播放这个能力的
		"coverpic" : "http://101.201.41.116:8080//public/v2/live-list/images/001.jpg?00002",
		"width" :  '480',//视频的显示宽度，请尽量使用视频分辨率宽度
		"height" : '320'//视频的显示高度，请尽量使用视频分辨率高度
		});
	</script>
</html>
