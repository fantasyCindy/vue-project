<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">

    <head>
        <%@ include file="../common/seo.jspf" %>
            <title>操盘内线</title>
            <%@ include file="../common/front-common.jspf" %>
                <link href="/public/css/live-vip-inside.css" rel="stylesheet" />
                <script src="/public/js/bdshare.js"></script>
                <script>
                var projectPath = "${path}";
                console.log('projectPath', projectPath);
                </script>
                <style>
                .web-yueniucj .paid-list {
                    display: none
                }
                </style>
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
            <div id="inside">
                <div class="inside-wrap">
                    <div class="inside-banner"><img src="${path}/public/images/inside_banner.jpg" alt=""></div>
                    <div class="inside-contents">
                        <div class="inside-left fl">
                            <div class="inside-logo"></div>
                            <div class="left-list">
                                <ul>
                                    <li data-to="&" class="hide" id="menu-item-history">
                                        <span class="arrow"><i class="fa fa-angle-right" ></i></span>
                                        <span class="value">历史直播</span>
                                    </li>
                                    <li data-to="&classify=5" class="referli" data-classify="5">
                                        <span class="arrow"><i class="fa fa-angle-right" ></i></span>
                                        <span class="value">独家内参</span>
                                    </li>
                                    <li data-to="&classify=4" class="juexueli" data-classify="4">
                                        <span class="arrow"><i class="fa fa-angle-right" ></i></span>
                                        <span class="value"> 操盘绝学</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="inside-right fr">
                            <!-- ==右边 面包屑导航== -->
                            <div class="history-live">
                                <div class="history-top" id="navigation">
                                    <div class="historylive fl"></div>
                                    <div class="leader-list fr">
                                        <span>当前位置：</span>
                                        <a href="http://www.yueniuwang.com">首页</a>
                                        <i class="fa fa-angle-right"></i>
                                        <a class="link_vip">VIP直播</a>
                                        <i class="fa fa-angle-right"></i>
                                        <span class="current" href="#"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <!-- ==refer-contents为内容容器== -->
                                <div class="refer-contents">
                                    <!-- ==历史直播表格== -->
                                    <div class="history-table">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <td class="td1">时间</td>
                                                    <td class="td2">主题</td>
                                                    <td class="td3">参与人数</td>
                                                    <td class="td5">操作</td>
                                                </tr>
                                            </thead>
                                            <tbody class="live-tbody"></tbody>
                                        </table>
                                    </div>
                                    <!-- 独家内参-->
                                    <div class="exclusive_refer">
                                        <ul class="refer-list"></ul>
                                    </div>
                                    <!-- 内参详情-->
                                    <div class="article-detail hide">
                                        <div class="article-detail-container">
                                            <div class="detail-msg">
                                                <div class="fl time"></div>
                                                <div class="fl">发布：<span class="name"></span></div>
                                                <div class="detail-share fl">
                                                    <span>分享：</span>
                                                    <div class="bdsharebuttonbox" data-tag="share_questionDetail" style="display:inline-block">
                                                        <a id="wx" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                                                        <a id="wb" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                                                        <a id="qq" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <h3 class="title-1"></h3>
                                            <div class="refer-content"></div>
                                            <div class="a-alert">
                                                <stron>风险提示：以上内容仅供参考，不构成投资建议，股市有风险，投资需谨慎！</stron>
                                            </div>
                                            <div class="award">
                                                <div class="award-txt show-pay">赏</div>
                                            </div>
                                            <div class="paid-list"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pageNav"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <%@ include file="../common/vip-refer-foot.jsp" %>
                <script src="${path}/public/bundle/live_vip_inside.bundle.js?20170601103140"></script>
    </body>

    </html>
