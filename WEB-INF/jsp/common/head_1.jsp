<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <!-- menu_top -->
    <div id="yn-header">
        <div class="yn-wrap">
            <!-- welcome -->
            <div class="welcome">
                <c:if test="${frontLoginName != null and frontLoginName !=''}">
                    <div class="isLogin">
                        <span>欢迎您:</span>
                        <span class="imgw"><c:choose>  
                        <c:when test="${login_user_front.photo  != null }">  
                        <img src="/public/${login_user_front.photo}" />   
                        </c:when>     
                        <c:otherwise> 
                        <img src="/public/images/default_head.jpg" />
                        </c:otherwise>  
                        </c:choose>
                        </span>
                        <a class="username" href="javascript:goUserCenter();"><span>${frontLoginName}</span></a>
                        <a class="username" href="javascript:goUserCenter();"><span>${frontLoginName}</span></a>
                        <a class="logout" id="ynLogout">退出</a>
                        <a class="yn-in" href="javascript:settled()" id="settled_down">申请入驻</a>
                    </div>
                </c:if>
                <c:if test="${frontLoginName == null }">
                    <div>
                        <span>哞，欢迎来约牛！</span>
                        <span>请</span>
                        <a class="yn-sign" id="ynLogin">登录</a>
                        <a class="yn-register" href="/user/register.htm">免费注册</a>
                        <a class="yn-in" href="javascript:loginart()">申请入驻</a>
                    </div>
                </c:if>
            </div>
            <!-- account -->
            <div class="account">
                <table>
                    <tr>
                        <td class="item">
                            <span class="icon fa fa-mobile fa-lg"></span>
                            <span>下载移动客户端</span>
                            <span class="icon fa fa-angle-down fa-lg"></span>
                        </td>
                        <td class="item">
                            <span><a href="${path  }/helpcenter.htm" target="_blank">帮助中心</a></span>
                        </td>
                        <td class="item">
                            <div class="dope">
                                <p class="dope-hover">
                                    <span class="icon fa fa-envelope-o"></span>
                                </p>
                                <div class="dope-block" style="display:none;">
                                    <ul>
                                        <li>
                                            <a href="">
                                                <span class="notify fr">0</span>
                                                <span>问答提醒</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="notify fr">0</span>
                                                <span>投资组合消息</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="notify fr">0</span>
                                                <span>自选股提醒</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="notify fr">3</span>
                                                <span>系统消息</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span class="notify fr">0</span>
                                                <span>投资内参消息</span>
                                            </a>
                                        </li>
                                        <li class="more">
                                            <a href="">查看全部</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!-- /////////////////////////////////// -->
    <!--  -->
    <div id="yn-top">
        <div class="yn-wrap">
            <div class="logo"><img src="/public/images/logo_v4.png"></div>
            <div class="search">
                <div class="types">
                    <table>
                        <tr>
                            <td class="select">
                                <span>搜股票</span>
                                <span class="triangle select fa fa-caret-down fa-lg"></span>
                            </td>
                            <td>
                                <span>搜直播室</span>
                                <span class="triangle fa fa-caret-down  fa-lg"></span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="inputs">
                    <form id="queryForm" action="" method="post" target="_black">
                        <table>
                            <tr>
                                <td class="inputWrap">
                                    <input type="text" placeholder="名称/代码/拼音" data-provide="typeahead" autocomplete="off" id="stock_code">
                                    <input type="text" placeholder="请输入直播室名称" name="queryText" id="query_room" style="display: none;">
                                </td>
                                <td id="btn_search">
                                    搜索
                                </td>
                            </tr>
                        </table>
                    </form>
                    <form id="queryForm_stockcode" action="/public/marketLine.htm" method="get" target="_black">
                        <input type="hidden" id="query_stock_code" name="stockcode">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--页面主体-->
    <div id="yn-menu">
        <div class="yn-wrap">
            <table>
                <tr>
                    <td><a href="/index.htm?hl0">首页</a></td>
                    <td><a href="/html/list.htm?hl1">直播室</a></td>
                    <td><a href="/article/index.htm?hl2">资讯</a></td>
                    <td><a href="/consultation/index.htm?hl3">咨询</a></td>
                    <td><a href="/video/index.htm?hl4">股民学院</a></td>
                    <td><a href="/html/findTeacher.htm?hl5">找投顾</a></td>
                    <td id="goMyCenter"><a href="/myCenter.htm?hl6">我的</a></td>
                </tr>
            </table>
        </div>
    </div>
    <script src="/private/head/js/head.js"></script>
