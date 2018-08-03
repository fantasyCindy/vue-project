<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">

    <head>
        <title>历史直播</title>
        <%@ include file="../common/all.jspf"%>
            <link href="/private/live/css/history.css" rel="stylesheet">
            <style>
            .btn-back {
                border-radius: 4px;
                width: 110px;
                height: 30px;
                margin-bottom: 20px;
                border: none;
                color: #fff;
                background-color: #EB1927;
            }
            </style>
    </head>

    <body>
        <!-- 引入头部 -->
        <%@ include file="../common/head.jsp" %>
            <!--页面主体-->
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <p class="navg">
                            <img src="${path }/web/images/house.png"><a href="javascript:goHome()">首页</a>&gt;<a href="javascript:goLive()">直播</a>&gt;<a href="javascript:void(0)" class="orange">${room.title }</a>
                        </p>
                    </div>
                </div>
            </div>
            <!--页面主体-->
            <p class="titi container">
                今日主题：${periodical.todaysubject }<span><b>直播号：</b><a>${periodical.roomid }</a><b>在线人数</b><a>${periodical.membercount }人</a></span>
            </p>
            <div class="container room">
                <div class="row">
                    <div class="col-xs-12 teacher">
                        <div class="row">
                            <div class="col-xs-8">
                                <div class="row">
                                    <div class="col-xs-2">
                                        <p class="teacher_head">
                                            <%-- <a href="${path }/html/teacherCenter.htmlx?teacherId=${teacher.teacherid}"> --%>
                                                <img src="${path }${teacher.photo}">
                                                <%-- </a> --%>
                                        </p>
                                    </div>
                                    <div class="col-xs-10">
                                        <h3 style="margin-bottom: 10px;"><b style="float:left">${teacher.title }</b><span
										onclick="attentionTeacher(${teacher.teacherid},this);" style="cursor:pointer; "><c:if test="${attention == true }">已关注</c:if><c:if test="${attention != true }">+关注</c:if></span><span
										id="private" style="cursor:pointer; ">提问</span>
								</h3>
                                        <%-- <span><img src="${path}/web/images/xz.png">粉丝：${teacher.popularity_number }</span> --%>
                                            <p>${teacher.investmentstyle}</p>
                                    </div>
                                    <!--提问弹窗-->
                                    <div id="divTop">
                                        <textarea placeholder="私信内容不超过200字" id="textarea_1" onfocus="validateLogin();" onkeyup="words_deal(1);"></textarea>
                                        <div>
                                            <span><a id="textCount_1">200</a>/200</span>
                                            <button class="btn btn-default" type="button" onclick="sendLetter(${teacher.teacherid},$('#textarea_1').val());">提交</button>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                    $(document).ready(function() {
                                        privateLetter();
                                    });
                                    </script>
                                    <!--提问弹窗end-->
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <dl>
                                    <dt>
                                        <h4>${teacher.title }</h4>
                                    </dt>
                                    <aside>${teacher.description }</aside>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="row">
                            <p class="tit" style="margin-top:20px;">
                                <span>往期直播回顾</span>
                                <a href="#"></a>
                            </p>
                            <div class="review">
                                <ul class="review_one">
                                    <li>直播日期</li>
                                    <li>直播主题</li>
                                    <li>参与人数(人次)</li>
                                    <li>直播条数</li>
                                    <li>查看内容</li>
                                </ul>
                                <div id="history_list" style="height: 600px; overflow: auto;">
                                    <script type="text/html" id="historylistbar">
                                        {{each}}
                                        <ul>
                                            <li>{{$value.publisher_timeStringDay}}</li>
                                            <li>{{$value.todaysubject}}</li>
                                            <li>{{$value.membercount}}</li>
                                            <li>{{$value.broadCastingCount}}</li>
                                            <li>
                                                <button onclick="openHistory({{$value.periodicalid}})" class="btn btn-default" type="button">查看记录</button>
                                            </li>
                                        </ul>
                                        {{/each}}
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--清除浮动-->
            <div class="clearfix"></div>
            <script type="text/javascript">
            var roomid = "${room.roomid}";
            var hasMore = true;
            var page = 1;
            var rows = 10;
            $(function() {
                loadHistory();
                //滚动加载
                $("#history_list").scroll(function() {
                    var scrollTop = $(this).scrollTop();
                    if (scrollTop - 50 <= 0) {
                        if (hasMore) {
                            loadHistory();
                        }

                    }
                });
            });

            //加载期刊列表
            function loadHistory() {
                if (!hasMore) {
                    return;
                }
                var index1 = layer.load("加载中...", 3);
                $.get(path + "/html/periodicalList.htmlx", {
                    roomid: roomid,
                    page: page,
                    rows: rows
                }, function(data) {
                    setTimeout(function() {
                        layer.close(index1);
                    }, 500);
                    page++;
                    eval("var _data=" + data);
                    // if (page == 2) {
                    // 	$("#history_list").html("");
                    // }
                    var _html = template('historylistbar', _data);
                    $("#history_list").html(_html);

                    if (page == 2) {
                        $("#history_list").scrollTop(
                            $("#history_list")[0].scrollHeight);
                    }
                    if (_data.length < rows) {
                        live_hasMore = false;
                    }
                });
            }

            function openHistory(periodicalid) {
                window.location.href = path + "/html/periodicalDetail.htmlx?periodicalid=" + periodicalid;
            }
            </script>
            <%@ include file="../common/foot.jsp"%>
    </body>

    </html>
