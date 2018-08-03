<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">

    <head>
        <%@ include file="../common/seo.jspf" %>
            <title>Vip直播室</title>
            <%@ include file="../common/front-common.jspf" %>
                <link rel="stylesheet" href="/private/live/css/liveDetail.css" />
                <link rel="stylesheet" href="/private/live/css/liveVip.css?v=20170414151641" />
                <script type="text/javascript">
                /* beautify preserve:start */
            var projectPath = "${path}";
            var periodicalid = "${periodical.periodicalid}";
            var room_id = "${periodical.roomid}";
            var teacherList = ${teacherList};
            var room_userid = "${teacher.user_id}";
            var room_nickName = "${teacher.title}";
            var liveStatus = '${periodical.status}';
            /* beautify preserve:end */

                var __roomId = (function() {
                    var match = window.location.href.match(/roomid=(\d+)/)
                    return match ? match[1] : null
                })()

                if (!__roomId) window.location.href = live_path;
                </script>
    </head>

    <body>
        <%@ include file="../common/front-head.jsp" %>
            <div id="operate" class="banner"></div>
            <div class="bg">
                <div id="operate-list">
                    <div class="operate-l"></div>
                    <div class="operate-r">
                        <div class="o-r-title">
                            <a class="o-r-more" target="_blank">
                                <span>更多</span>
                                <i class="icon fa fa-angle-right fa-lg"></i>
                            </a>
                            <span class="title">操盘必读</span>
                        </div>
                        <div class="o-r-list"></div>
                    </div>
                </div>
                <!-- liveDetail BEGIN -->
                <div id="liveDetail" class="hide">
                    <!-- 栏目菜单 -->
                    <div class="liveContent">
                        <div class="leftBar">
                            <!-- 直播 -->
                            <div id="live" class="leftBarChild ">
                                <div class="yn-title-1">
                                    <span class="yn-title-1-icon"></span>
                                    <span class="txt" id="liveContent-title-1">第<strong id="pidvalue"></strong>期直播内容</span>
                                    <span style="margin-left:13px;font-size:13px;">风险提示： 以下内容仅供参考。投资有风险，操作需谨慎。</span>
                                </div>
                                <div class="items" id="items-middle"></div>
                                <div class="settting">
                                    <div class="sound inline">
                                        <span class="txt">声音提示</span>
                                        <span class="yn-icon-sound"></span>
                                    </div>
                                    <div class="font inline">
                                        <span class="txt">字号</span>
                                        <span class="font-size-item" data-size="large">大</span>
                                        <span class="font-size-item select" data-size="middle">中</span>
                                        <span class="font-size-item" data-size="small">小</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /////////// Right /////////// -->
                        <div class="rightBar">
                            <div id="friendTalk">
                                <div class="yn-title-1">
                                    <span class="yn-title-1-icon"></span>
                                    <div class="inline t-item user" style="display: none;">
                                        <span class="txt active" data-value="all">股友互动</span>
                                        <span class="txt" data-value="mine">我的互动</span>
                                    </div>
                                    <div class="inline t-item teacher" style="display: none;">
                                        <span class="txt active" data-value="wait">待审核</span>
                                        <span class="txt" data-value="done">已经审核</span>
                                        <a href="" target="_blank" class="replyList">回复列表</a>
                                    </div>
                                </div>
                                <div class="action">
                                    <span class="audio yn-icon-sound"></span>
                                </div>
                                <div class="items"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Chat -->
            <script id="friendTalk-template" type="text/html">
                {{each}}
                <div class="item {{$value._isTeacherTalk}}" data-periodicalid="{{$value.periodicalid}}" data-userid="{{$value.userid}}" data-chatid="{{$value.chatid}}">
                    <div class="line line1">
                        <span class="avatar"></span>
                        <span class="name">{{$value.nickName}}</span>
                        <span class="user_type {{$value._isTeacherTalk}}"><i class="fa fa-vimeo-square"></i></span>
                    </div>
                    <div class="line line2">
                        <div class="pubContent">{{$value.replyMark}}{{#$value.content}}</div>
                    </div>
                    <div class="line line3">
                        <span class="time">{{$value.ctimeString}}</span>
                        <span class="divice"></span>
                        <a href="#talkWindow" class="reply {{$value.showReply}}" id="{{$value.id}}" data-id="{{$value.id}}">回复</a>
                    </div>
                </div>
                {{/each}}
            </script>
            <%@ include file="../common/module-face.jsp" %>
                <%@ include file="../common/front-foot.jsp" %>
                    <script src="/public/bundle/liveVip_history.bundle.js"></script>
                    <script>
                    var href = window.location.href;
                    var match = href.match(/\&pid=(\d+)/);
                    var __periodicalid = match ? match[1] : "";
                    $('.replyList').attr('href', '${path}/vip-teacher-reply.htm?pid=' + __periodicalid)
                    </script>
    </body>

    </html>
