<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">

    <head>
        <%@ include file="../common/seo.jspf" %>
            <title>VIP操盘内线 | 约投顾</title>
            <%@ include file="../common/front-common.jspf" %>
                <link rel="stylesheet" href="/private/live/css/liveDetail.css?v=20170511154436" />
                <link rel="stylesheet" href="/private/live/css/liveVip.css?v=20170511154433" />
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

                if (periodicalid == "-1") {
                    if (is_vip == "1") {
                        window.location.href = '${path}/backstage/myLive.htm'
                    } else {
                        window.location.href = live_path + '/live/live-vip-inside.htm#roomid=' + __roomId
                    }
                }
                </script>
    </head>

    <body>
        <script>
        if (projectPath.indexOf("yueniucj") >= 0) {
            document.body.className = 'web-yueniucj'
        } else {
            document.body.className = 'web-yueniu'
        }
        </script>
        <%@ include file="../common/vip-refer-head.jsp" %>
            <div id="operate" class="banner">
                <div class="renew">
                    <div class="box">
                    </div>
                </div>
            </div>
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
                                    <span class="txt" id="liveContent-title-1">今日直播</span>
                                    <span style="margin-left:13px;font-size:13px;">风险提示： 以下内容，仅供参考。投资有风险，操作需谨慎。</span>
                                </div>
                                <div class="items" id="items-middle"></div>
                                <div class="tooltip tooltip-live">有新的直播</div>
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
                            <!-- 礼物 -->
                            <div id="gift" class="b220 bg-white mt15 hide">
                                <div class="yn-title-1">
                                    <span class="yn-title-1-icon"></span>
                                    <span class="txt">送老师礼物</span>
                                </div>
                                <div class="content-1">
                                    <div class="gift-list">
                                        <div class="items" id="allGifts">
                                            <span class="arrow left fa fa-arrow-circle-left gray" data-direction="left"></span>
                                            <span class="arrow right fa fa-arrow-circle-right" data-direction="right"></span>
                                            <div class="gift-item-container">
                                                <div class="gift-item-wrap">
                                                    <!-- 礼物 -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pay relative" id="gift-pay">
                                            <div class="label center absolute any">随意赏</div>
                                            <span class="circle">
                                                <span class="txt">赏</span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="gift-send">
                                        <span class="txt">数量</span>
                                        <table class="shoppingCart">
                                            <tr>
                                                <td class="minus bg-235 cursor"><span class="fa fa-minus"></span></td>
                                                <td class="value gift-count">1</td>
                                                <td class="plus bg-235 cursor"><span class="fa fa-plus"></span></td>
                                            </tr>
                                        </table>
                                        <span class="txt">共需<span class="sum">0</span>牛币</span>
                                        <button class="submit">立即赠送</button>
                                        <span class="tip">赠送无悔, 概不退款</span>
                                    </div>
                                </div>
                            </div>
                            <!-- 发布直播 -->
                            <div id="pubEditer" class=" leftBarChild hide">
                                <div class="yn-title-1">
                                    <span class="yn-title-1-icon"></span>
                                    <span class="txt">发表直播</span>
                                </div>
                                <div class="contents">
                                    <!-- 直播引用的内容 -->
                                    <div class="pub-quote-bar hide">
                                        <i class="close fa fa-times-circle"></i>
                                        <div class="pub-quote-content"></div>
                                    </div>
                                    <script id="ueditContainer" name="content" type="text/plain"></script>
                                    <div class="info">
                                        <input type="text" class="insertStockCode" placeholder="插入股票代码/拼音" />
                                        <button class="submit">发表</button>
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
                                        <span class="txt active" data-value="all" data-fn="getAllTalk">股友互动</span>
                                        <span class="txt" data-value="mine" data-fn="getMyTalk">我的互动</span>
                                    </div>
                                    <div class="inline t-item teacher" style="display: none;">
                                        <span class="txt active" data-value="wait" data-fn="getNotAllow">待审核</span>
                                        <span class="txt" data-value="done" data-fn="getAllTalk">已经审核</span>
                                        <a style="font-size:15px;" href="http://www.yueniuwang.com/vip-teacher-reply.htm?pid=${periodical.periodicalid}" target="_blank">回复列表</a>
                                        <a style="font-size:15px;" href="${path}/public/other/vip-banned-list.html" target="_blank">禁言列表</a>
                                    </div>
                                </div>
                                <div class="action">
                                    <span class="audio yn-icon-sound"></span>
                                </div>
                                <div class="items">
                                    <!-- 内容区 -->
                                    <div class="loadMore" style="display: none">加载更多</div>
                                    <div class="items-content"></div>
                                </div>
                            </div>
                            <!-- 互动窗口 -->
                            <div id="talkWindow" class="hide">
                                <div class="yn-title-1">
                                    <span class="yn-title-1-icon"></span>
                                    <span class="txt">和股友交流</span>
                                </div>
                                <div class="content chat">
                                    <div class="line line1">
                                        <div class="usereply replyInfo hide">
                                            <span class="text"></span>
                                            <span class="close fr"><i class="fa fa-times"></i></span>
                                        </div>
                                        <textarea id="textarea_3" placeholder="与股友交流，学习更多炒股技巧"></textarea>
                                    </div>
                                    <div class="line line2">
                                        <span class="wordCount"><span class="value">200</span>/200</span>
                                        <button class="btn submit" type="button">提交</button>
                                        <span class="face"></span>
                                    </div>
                                </div>
                                <div class="content nochat hide">
                                    <div class="msg">
                                        <p>您已被管理员禁言1天</p>
                                        <p class="endtime">距离发言时间为<span class="hour" style="color:red;"></span>小时<span class="minutes" style="color:red;"></span>分钟</p>
                                    </div>
                                </div>
                                <div class="content nochat-f hide">
                                    <div class="msg">
                                        <p>您已被管理员永久禁言</p>
                                    </div>
                                    <button>禁言申诉</button>
                                </div>
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
                <%@ include file="../common/vip-refer-foot.jsp" %>
                    <script src="/public/ueditor/ueditor.config.js"></script>
                    <script src="/public/ueditor/ueditor.all.min.js"></script>
                    <script src="/public/ueditor/lang/zh-cn/zh-cn.js"></script>
                    <script src="/public/bundle/liveVip.bundle.js?v=20170601103147"></script>
    </body>

    </html>
