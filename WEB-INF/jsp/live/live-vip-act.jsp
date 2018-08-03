<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
pageContext.setAttribute("path", path);
%>
                <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                <html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">

                <head>
                    <title>操盘内线</title>
                    <%@ include file="../common/front-common.jspf" %>
                        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                        <meta name="renderer" content="webkit">
                        <meta content=always name=referrer>
                        <meta http-equiv="Content-Language" content="zh-CN" />
                        <meta http-equiv="Cache-Control" content="no-siteapp" />
                        <meta name="baidu-site-verification" content="98ebBPqVhQ" />
                        <link href="/public/css/all.css" rel="stylesheet" />
                        <link rel="stylesheet" href="/public/css/live-vip-act.css?v=2017080110" />
                        <link href="/public/css/login_register.css" rel="stylesheet" />
                        <link rel="stylesheet" href="/public/css/font-awesome.min.css">
                        <script src="http://cdn.bootcss.com/jquery/1.10.1/jquery.min.js"></script>
                        <script src="/public/entry/slider.js"></script>
                        <script src="http://www.jsgaotie.com:8080/socket.io/socket.io.js"></script>
                </head>
                <script>
                    var __login = '${frontLoginName}'
                    var is_vip = '${vipTeacher}';
                    //baidutongji
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?9317806537eb105048bfc65593802ee9";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>

                <body>
                    <%@ include file="../common/front-login.jsp" %>
                        <div id="vip-act">
                            <div class="vip-act-header">
                                <div class="header-wrap">
                                    <div class="header-logo"><img src="${path}/public/images/vipact/logo.png" alt="" /></div>
                                    <div class="welcome fr">
                                        <a class="index-show" href="http://www.yueniucj.com">首页</a>
                                        <c:if test="${frontLoginName != null and frontLoginName !=''}">
                                            <div class="isLogin login">
                                                <span>欢迎您：</span>
                                                <div style="display:inline-block">
                                                    <img class="userphoto" src="/private/head/images/user.png" />
                                                    <a href="/auth/user/userCenter.htm" class="username orghover">${frontLoginName}</a>
                                                </div>
                                                <a class="logout orghover" id="ynLogout">退出</a>
                                            </div>
                                        </c:if>
                                        <!-- 注册 -->
                                        <c:if test="${frontLoginName == null}">
                                            <a href="${path}/refer-login.htm" style="color:rgb(153, 153, 153)">登录</a>
                                        </c:if>
                                        <div class="scan-wxcode">
                                            <div class="trigger">
                                                <i class="icon"></i>
                                                <span class="label">手机客户端</span>
                                            </div>
                                            <div class="content">
                                                <div class="codeImg">
                                                    <img src="${path}/public/cpnx/images/act/android.png" width="100%">
                                                </div>
                                                <div class="text hide">
                                                    <span>安卓扫码下载</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <div class="vip-banner">
                                <div class="banner-content"></div>
                                <div class="banner-btn-bar">
                                    <div class="wrap">
                                        <a class="buy banner-buy">立即加入</a>
                                    </div>
                                </div>
                            </div>
                            <div class="act-who">
                                <div class="who-wrap">
                                    <div class="who-im-i">我们是谁？</div>
                                    <div class="who-im-ii">《操盘内线》是由云南产业投资管理有限公司（证券投资咨询机构编号：ZX0093）携手约牛财经精心打造，集独家资讯、专家直播和操盘绝学三位于一体的在线内参。</div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <div class="container-box">
                                <div class="vip-wrap">
                                    <div class="three-func">《操盘内线》三大特色功能，实时挖掘起涨点</div>
                                    <div class="lunbo1">
                                        <div class="container">
                                            <div id="slide" class="slide" class="index-slide" alt="star">
                                                <!-- 轮播图片数量可自行增减 -->
                                                <div class="img">
                                                    <img class="three1" src="${path}/public/images/vipact/neican1.png" />
                                                    <img class="three2" src="${path}/public/images/vipact/neican2.png" />
                                                </div>
                                                <div class="img">
                                                    <img class="three1" src="${path}/public/images/vipact/juexue1.png" />
                                                    <img class="three2" src="${path}/public/images/vipact/juexue2.png" />
                                                </div>
                                                <div class="img">
                                                    <img class="three1" src="${path}/public/images/vipact/zhibo1.png" />
                                                    <img class="three2" src="${path}/public/images/vipact/zhibo2.png" />
                                                </div>
                                                <div class="slide-bt"></div>
                                            </div>
                                            <div onclick="left()" class="btnPrev"></div>
                                            <div onclick="right()" class="btnNext"></div>
                                            <div class="lunbo-items">
                                                <li id="refer">
                                                    <div class="ynlogo">
                                                        <div class="imac"><img src="${path}/public/images/vipact/n1.png" alt="" /></div>
                                                        <div class="mac"><img src="${path}/public/images/vipact/n2.png" alt="" /></div>
                                                    </div>
                                                    <div class="yntxt">
                                                        <p><span class="livetime">·更新时间</span>每个交易日9:00</p>
                                                        <p><span class="livetime">·功能特色</span></p>
                                                        <p>大盘趋势解析，潜力热点前瞻，早盘个股挖掘，拒绝马后炮，赢在开盘前。</p>
                                                    </div>
                                                </li>
                                                <li id="juexue">
                                                    <div class="ynlogo">
                                                        <div class="imac"><img src="${path}/public/images/vipact/c1.png" alt="" /></div>
                                                        <div class="mac"><img src="${path}/public/images/vipact/c2.png" alt="" /></div>
                                                    </div>
                                                    <div class="yntxt">
                                                        <p><span class="livetime">·更新时间</span>每天一次</p>
                                                        <p><span class="livetime">·功能特色</span></p>
                                                        <p>资深高手绝招解密， 要赚钱，先学习，只有不为普通人知的招式，才是致命的招式。</p>
                                                    </div>
                                                </li>
                                                <li id="live-room">
                                                    <div class="ynlogo">
                                                        <div class="imac"><img src="${path}/public/images/vipact/z1.png" alt="" /></div>
                                                        <div class="mac"><img src="${path}/public/images/vipact/z2.png" alt="" /></div>
                                                    </div>
                                                    <div class="yntxt">
                                                        <p><span class="livetime">·直播时间</span>实时在线</p>
                                                        <p><span class="livetime">·功能特色</span></p>
                                                        <p>专家实时在线互动，提示大盘趋势，参与股友互动，解决投资疑难，跟高手，学操盘，选股选时不再难。
                                                        </p>
                                                    </div>
                                                </li>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="buy1">
                                        <a class="buy auto inline">立即加入</a>
                                    </div>
                                </div>
                            </div>
                            <div class="vip-wrap">
                                <div class="platinum-case">
                                    <div class="case-title">牛股案例</div>
                                    <div class="case-stitle">再现《操盘内线》功力，一站式解决炒股多重难题</div>
                                    <div class="case_list">
                                        <div class="case_item">
                                            <div class="case_item_top">
                                                <span class="stock_infor">
                                            <span class="stock_code">北新路桥(002307)</span>
                                                <span class="stock_time">6月1日提示关注</span>
                                                </span>
                                                <img src="${path}/public/images/vipact/after/trend1.jpg">
                                            </div>
                                            <div class="case_item_bottom">
                                                <div class="stock_correlation">
                                                    <div class="stock_correlation_left">
                                                        <span class="stock_code">北新路桥(002307)</span>
                                                        <span class="stock_time">提示时间：2017年6月1日</span>
                                                    </div>
                                                    <div class="stock_correlation_right">
                                                        <i class="range_icon"></i>
                                                        <span class="range">
                                                    4天涨幅
                                                    <font color="#f40000">30.75%</font>
                                                </span>
                                                    </div>
                                                </div>
                                                <div class="reason">
                                                    <span class="reason_title">建议关注理由</span>
                                                    <div class="reason_list">
                                                        <span class="reason_item">
                                                    <i class="reason_icon"></i>
                                                    一带一路国家持续扶持概念板块
                                                </span>
                                                        <span class="reason_item">
                                                    <i class="reason_icon"></i>
                                                    前期调整数日，缩量止跌后量能开始有效配合
                                                </span>
                                                        <span class="reason_item">
                                                    <i class="reason_icon"></i>
                                                    主力资金介入明显
                                                </span>
                                                        <span class="reason_item">
                                                    <i class="reason_icon"></i>
                                                    短短4个交易日，区间最大涨幅30.75%
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="case_item">
                                            <div class="case_item_top">
                                                <span class="stock_infor">
                                            <span class="stock_code">红墙股份(002809)</span>
                                                <span class="stock_time">6月2日提示关注</span>
                                                </span>
                                                <img src="${path}/public/images/vipact/after/trend2.jpg">
                                            </div>
                                            <div class="case_item_bottom">
                                                <div class="stock_correlation">
                                                    <div class="stock_correlation_left">
                                                        <span class="stock_code">红墙股份(002809)</span>
                                                        <span class="stock_time">提示时间：2017年6月2日</span>
                                                    </div>
                                                    <div class="stock_correlation_right">
                                                        <i class="range_icon"></i>
                                                        <span class="range">
                                                    5天涨幅
                                                    <font color="#f40000">51.22%</font>
                                                </span>
                                                    </div>
                                                </div>
                                                <div class="reason">
                                                    <span class="reason_title">建议关注理由</span>
                                                    <div class="reason_list">
                                                        <span class="reason_item">
                                                    <i class="reason_icon"></i>
                                                    积极参与雄安新区建设
                                                </span>
                                                        <span class="reason_item">
                                                    <i class="reason_icon"></i>
                                                    超跌反弹，量价配合理想
                                                </span>
                                                        <span class="reason_item">
                                                    <i class="reason_icon"></i>
                                                    6月2日李达老师在《操盘内线》直播中建议关注
                                                </span>
                                                        <span class="reason_item">
                                                    <i class="reason_icon"></i>
                                                    短短5个交易日，区间最大涨幅51.22%
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="buy1">
                                    <a class="buy auto inline">立即加入</a>
                                </div>
                            </div>
                            <div class="container-box">
                                <div class="vip-wrap">
                                    <div class="case-tit">专业资质·经营许可证</div>
                                    <div class="case-stit text">云南产投是中国证监会首批颁发认证的专业投资咨询机构，执业资格证书编号：ZX0093,具有专业、丰富、合规、可信的证券投资咨询经验。</div>
                                    <div class="case-stit text">我们拥有证监会认证的精英分析师团队，长期精耕细作在市场一线，全面、客观、旗帜鲜明地分析股票行情，撰写专业的宏观研究、数据分析、企业调研、个股解读等深度投资内参。</div>
                                    <div class="act-zheng">
                                        <img src="${path}/public/images/vipact/after/zheng1.jpg" alt="" />
                                        <img src="${path}/public/images/vipact/after/zheng2.jpg" alt="" />
                                    </div>
                                    <div class="buy1">
                                        <a class="buy auto inline">立即加入</a>
                                    </div>
                                </div>
                            </div>
                            <div class="vip-wrap">
                                <div class="case-tit">投顾介绍</div>
                                <div class="lunbo2">
                                    <div class="teacherCard fl">
                                        <div class="photo"><img src="${path}/public/images/vipact/lida_touxiang.png" alt="" /></div>
                                        <div class="name">李达：高级投资顾问</div>
                                        <div class="content">曾在民族证券公司做过投资顾问总监多年，也曾在私募、公募等基金公司担任过要职，实盘操作的经验非常丰富。曾用量化对冲的方法布局过很多大资金。同时，个人对于个股的把握尤其擅长，指导过很多股民投资，并且多数股民均获利颇丰！受到很多投资者好评。</div>
                                    </div>
                                    <div class="teacherCard fr">
                                        <div class="photo"><img src="${path}/public/images/vipact/xuchen_touxiang.png" alt="" /></div>
                                        <div class="name">徐晨：高级投资顾问</div>
                                        <div class="content">曾任职于中信建投高级投资顾问，金融学证券投资学士，国家二级理财规划师，长期从事投资研究工作，擅于把握主题性投资机会，深刻领悟主力机构投资运作规律，坚持长线为金，趋势为王的投资理念，分析精辟，观点鲜明，理念与实战兼顾，帮助用户实现复利稳健增长的投资目标。</div>
                                    </div>
                                </div>
                            </div>
                            <div class="vip-act-footer">
                                <div class="footer-wrap">
                                    <div class="connect-way">约牛免费客服电话：010-81912220</div>
                                    <div class="footer-txt">经营证券期货业务许可证 统一社会信用代码（境外机构编号）：91530000292111019M</div>
                                </div>
                            </div>
                        </div>
                        <div class="pay pay-center" style="display: none;">
                            <i class="fa fa-times close-pay" aria-hidden="true" style="float:right;font-size:22px;cursor: pointer;position: relative;top:-10px;right:-6px;"></i>
                            <div class="title-top">约牛网操盘内线支付</div>
                            <!-- 操盘内线支付 -->
                            <div class="vip-refer">
                                <div class="title-1">价格区间</div>
                                <div class="items">
                                    <div class="item">
                                        <span>￥<strong>2980/</strong>月</span>
                                    </div>
                                    <div class="item">
                                        <span>￥<strong>6980/</strong>季度</span>
                                    </div>
                                    <div class="item">
                                        <span>￥<strong>12800/</strong>半年</span>
                                    </div>
                                </div>
                                <div class="Tips">
                                    <div class="title-1">选择支付方式：</div>
                                    <div class="tip">
                                        <p>购买必读：为了保证该产品的正常使用，请您务必在付款成功之后<strong>联系客服开通</strong>产品VIP账号！！！ 客服电话：
                                            <span class="phone">010-81733516</span>（注：请保留微信、支付宝付款截图或银行转账单据）</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 付款方式 -->
                            <div class="pay-category">
                                <div class="item ali-pay" data-type="ali">
                                    <img src="/public/images/pay/pay-ali.jpg" />
                                    <i class="icon"></i>
                                </div>
                                <div class="item weixin-pay" data-type="weixin">
                                    <img src="/public/images/pay/pay-wx.jpg" />
                                    <i class="icon"></i>
                                </div>
                                <div class="item cardBar active" data-type="card">
                                    <img src="/public/images/pay/pay-card.jpg" />
                                    <i class="icon"></i>
                                </div>
                            </div>
                            <div class="pay-types">
                                <div class="pay-type hide" id="code-ali">
                                    <div class="bg top2"><b>支付宝支付</b></div>
                                    <div class="ewm"><img src="${path}/public/images/vipact/alipaycode.png" alt="" /></div>
                                    <div class="scan">扫一扫，操盘内线拿回家</div>
                                </div>
                                <div class="pay-type hide" id="code-weixin">
                                    <div class="bg top1"><b>微信支付</b></div>
                                    <div class="ewm"><img src="${path}/public/images/vipact/wxcode.png" alt="" /></div>
                                    <div class="scan">扫一扫，操盘内线拿回家</div>
                                </div>
                                <div class="pay-type" id="code-card">
                                    <div class="cardBar ">
                                        <div class="card-item ">
                                            <div class="imgw"><img class="icon-bank " src="/public/images/pay/jh.jpg "></div>
                                            <div class="info">
                                                <div>户名：云南产业投资管理有限公司</div>
                                                <div>开户行：中国建设银行股份有限公司昆明滇龙支行</div>
                                                <div>银行账号：<i class="num ">5305 0161 5537 0000 0130</i></div>
                                            </div>
                                        </div>
                                        <div class="card-item ">
                                            <div class="imgw"><img class="icon-bank " src="/public/images/pay/nh.jpg "></div>
                                            <div class="info">
                                                <div>户名：云南产业投资管理有限公司</div>
                                                <div>开户行：中国农业银行股份有限公司昆明护国支行</div>
                                                <div>银行账号：<i class="num ">2401 9501 0400 34924</i></div>
                                            </div>
                                        </div>
                                        <div class="card-item ">
                                            <div class="imgw"><img class="icon-bank " src="/public/images/pay/gh.jpg "></div>
                                            <div class="info">
                                                <div>户名：云南产业投资管理有限公司</div>
                                                <div>开户行：中国工商银行股份有限公司昆明城市开发支行</div>
                                                <div>银行账号：<i class="num ">2502 0215 1920 0032 245</i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="prompt" style="display: none;">
                            <div class="pro-prompt pro-service">
                                <p class="pro-head"><i class="pro-img"></i>服务协议<i class='pro-img pro-close cursor'></i></p>
                                <div class="pro-content">
                                    <div>
                                        <p>
                                            <p class="pro-bold">
                                                云南产业投资管理有限公司投资顾问业务服务协议
                                            </p>
                                            <p class="pro-bold">
                                                合同编号：
                                            </p>
                                            <p class="pro-bold">
                                                甲方(个人投资者/机构投资者)
                                            </p>
                                            <p>
                                                法定代表人（机构投资者）：
                                            </p>
                                            <p>
                                                证件号码（身份证件号码/营业执照号码）：
                                            </p>
                                            <p>
                                                授权代理人（机构投资者）：
                                            </p>
                                            <p>
                                                代理人证件号码（身份证件号码）：
                                            </p>
                                            <p class="pro-bold">
                                                乙方：云南产业投资管理有限公司
                                            </p>
                                            <p>
                                                公司网站：http://www.zx0093.com/download.htm
                                            </p>
                                            <p>
                                                咨询电话：010-53181132 投诉电话：010-53181109
                                            </p>
                                            <p>
                                                为规范甲乙双方开展证券投资顾问业务，明确双方在开展投资顾问业务中的权利义务关系，经双方友好协商，依据《中华人民共和国证券法》、《中华人民共和国合同法》和《证券投资顾问投资暂行规定》等法律法规，以及中国证券业协会的有关自律规则的规定，甲乙双方本着公平、合理、自愿的原则，就乙方向甲方提供证券投资顾问服务事宜，签订协议，内容如下：
                                            </p>
                                            <p class="">
                                                第一章服务的内容和方式
                                            </p>
                                            <p>
                                                一、服务内容：乙方接受甲方委托，向甲方提供涉及证券及证券相关产品的投资建议服务，辅助甲方做出投资建议决策。投资建议服务内容具体包括投资参考、投资组合建议、理财规划建议、账户跟踪、账户诊断、向甲方开展投资者教育活动，传播证券投资知识等。在本协议有效期内，乙方向甲方提供前述服务的一种或多种。
                                            </p>
                                            <p>
                                                投资顾问：执业编号：
                                            </p>
                                            <p>
                                                二、服务方式：乙方为甲方提供证券投资顾问服务的方式包括但不限于通过短信、电话、电子邮件、微信或其他互联网方式提供服务。
                                            </p>
                                            <p class="">
                                                第二章服务期限、类型、收费标准和支付方式
                                            </p>
                                            <p>
                                                一、服务期限：累计服务期限--个月，服务期限自本协议签订之日起的5日内开始实施，自 年 月 日到 年 月 日。
                                            </p>
                                            <p>
                                                二、服务费用：元整（小写），（大写）
                                            </p>
                                            <p>
                                                三、服务/产品名称：
                                            </p>
                                            <p>
                                                支付方式：甲方应在本协议签订之日起3个工作日内，向乙方指定账户一次性足额支付服务费用，乙方指定账户及支付方式详见乙方网站，网址为http://www.zx0093.com/download.htm
                                            </p>
                                            <p class="">
                                                第三章服务的职责和禁止行为
                                            </p>
                                            <p>
                                                1、乙方应遵循诚实信用原则为甲方提供证券投资顾问服务；
                                            </p>
                                            <p>
                                                2、乙方应当根据了解的甲方情况，在评估甲方风险承受能力和服务需求的基础上，向甲方提供适当的投资建议服务；
                                            </p>
                                            <p>
                                                3、乙方向甲方提供投资建议，应当提示潜在的投资风险；
                                            </p>
                                            <p>
                                                4、乙方不得以虚假信息、市场传言或者内部信息为依据向甲方提供投资分析、预测或建议，建议应当有合理的依据；
                                            </p>
                                            <p>
                                                5、乙方对因提供本协议规定的服务内容而知悉的甲方个人财产状况等其他个人资料负有保密义务，未经甲方事先书面许可，不得向第三方提供。但因监管机关要求及司法需要等原因除外；
                                            </p>
                                            <p>
                                                6、乙方向甲方提供证券投资顾问服务，应忠于甲方的利益，不得为自身或其他关联方的利益损害甲方利益；不得为特定客户利益损害其他客户利益；
                                            </p>
                                            <p>
                                                7、乙方不得代理甲方进行证券的买卖和操作，或替甲方做出投资决策；
                                            </p>
                                            <p>
                                                8、乙方应当以公司账户收取投资顾问服务费用，不得以个人名义向甲方收取证券投资顾问服务费用；
                                            </p>
                                            <p>
                                                9、不得为自己买卖股票；不得利用向客户提供咨询建议而谋取不正当利益；
                                            </p>
                                            <p>
                                                10、乙方不得与甲方约定分享投资收益或分担损失，也不得以任何方式向甲方保证或承诺证券投资收益；乙方不得对证券市场的涨跌或价格走势做出确定性判断；
                                            </p>
                                            <p>
                                                11、在知悉甲方作出具体投资决策计划时，不得向他人泄露甲方的投资决策计划信息；
                                            </p>
                                            <p>
                                                12、不得利用咨询服务与他人合谋操纵市场或利用内幕消息进行交易；
                                            </p>
                                            <p>
                                                13、不得有法律、法规、规章所禁止的其他证券欺诈行为。
                                            </p>
                                            <p>
                                                甲方知晓并理解乙方证券投资顾问不得从事上述行为，如果甲方与乙方证券投资顾问从事上述行为的，由甲方自行承担法律后果。
                                            </p>
                                            <p class="">
                                                第四章双方的权利义务
                                            </p>
                                            <p>
                                                一、甲方的权利义务
                                            </p>
                                            <p>
                                                1、甲方有权要求乙方依约为其提供证券投资顾问服务，未经乙方同意，不得转让其在本协议下的任何权利义务；
                                            </p>
                                            <p>
                                                2、甲方有权要求乙方为其更换投资顾问，有权应乙方之邀参加乙方举办的报告会；
                                            </p>
                                            <p>
                                                3、甲方有权决定是否采用乙方提供的咨询意见和投资建议，甲方基于独立判断，自行决定证券投资，承担相应的投资风险和损失；
                                            </p>
                                            <p>
                                                4、甲方应当全面、客观和及时的向乙方提供与服务有关的各种信息、文件、资料，并对所提供信息和资料的真实性、准确性、合法性和完整性负责，如果发生相关信息的变动，应及时通知乙方；甲方应及时的向乙方提供与证券投资顾问服务有关的投资偏好、收益预期、收入状况等情况、文件和资料；
                                            </p>
                                            <p>
                                                5、甲方应向乙方提供有效的联系方式，如有变动需及时以乙方指定途径进行变更，如因甲方自身原因或不可抗力因素导致其未能及时获取证券投资顾问服务，责任由甲方自行承担；
                                            </p>
                                            <p>
                                                6、甲方应妥善保管证券账户、资金账户和相应的密码，不得委托乙方或乙方的员工保管其账户，代理买卖证券，不得与乙方或乙方的员工另行签订证券投资收益保证、利益共享或者损失分担的协议或达成约定；
                                            </p>
                                            <p>
                                                7、甲方应妥善保管乙方提供的终端工具或平台的用户账号和密码，甲方的用户账号和密码仅限于本人使用，甲方因个人原因导致用户账号和密码泄露造成经济损失的，乙方不承担任何责任；
                                            </p>
                                            <p>
                                                8、甲方应按时、足额向乙方支付证券投资顾问服务费用；
                                            </p>
                                            <p>
                                                二、乙方的权利义务
                                            </p>
                                            <p>
                                                1、乙方应遵循诚实信用原则，勤勉审慎地为甲方提供证券投资顾问服务；
                                            </p>
                                            <p>
                                                2、按照甲方要求为其更换证券投资顾问；
                                            </p>
                                            <p>
                                                3、乙方应按照本协议规定，向甲方提供证券投资顾问服务，辅助甲方做出投资决策，乙方向甲方提出的建议仅供甲方参考；
                                            </p>
                                            <p>
                                                4、乙方应当根据了解的甲方情况，在评估甲方风险承受能力和服务需求的基础上，向甲方提供适当的投资建议服务；
                                            </p>
                                            <p>
                                                5、乙方享有所提供的证券投资顾问服务内容的所有权、知识产权及其他相关权利，未经乙方书面许可，甲方不得进行模仿、复制、传播、转发或提供给其他第三方；若甲方违反本规定，则乙方有权终止本协议，乙方向甲方发出书面通知书后，协议终止且乙方无须向甲方退还任何费用；
                                            </p>
                                            <p>
                                                6、乙方向甲方开展投资者教育活动，传播证券投资知识；
                                            </p>
                                            <p>
                                                7、乙方有权根据本协议约定收取证券投资顾问服务费用。
                                            </p>
                                            <p class="">
                                                第五章声明与承诺
                                            </p>
                                            <p>
                                                一、甲方声明与承诺
                                            </p>
                                            <p>
                                                1、甲方是拥有签订履行本协议义务所需的完全权利能力和完全行为能力的自然人，不存在法律、行政法规、规章及其他规范性文件禁止或限制其参与证券投资顾问业务的情形；
                                            </p>
                                            <p>
                                                2、甲方自愿遵守法律、行政法规、规章及其他规范性文件制定以及乙方制定的相关业务规则的规定；
                                            </p>
                                            <p>
                                                3、甲方有责任对委托服务事项及投资风险做出独立的判断、决策，甲方根据乙方证券投资顾问提供的建议、方案所做出的决定而导致的损失，由甲方自行承担。甲方知晓并充分了解乙方不以任何方式保证甲方获得投资收益或承担甲方投资损失；
                                            </p>
                                            <p>
                                                4、甲方已详细阅读本协议及其附件《证券投资顾问业务风险揭示书》的所有条款及内容，听取了乙方对证券投资顾问业务规则和本协议内容的充分说明，正确理解本协议及《证券投资顾问业务风险揭示书》的正确含义，特别是甲方的责任条款和乙方的免责条款的含义，清楚认识并愿意自愿承担证券投资顾问业务的全部风险，接受本协议的约束；
                                            </p>
                                            <p>
                                                5、甲方进行任何投资，包括其投资判断和决策，并不依赖于乙方和/或其员工提供的建议、方案、报告或相关信息；
                                            </p>
                                            <p>
                                                6、甲方承诺在进行证券投资前已经对证券交易规则、证券交易惯例、证券交易知识、所投资的证券产品有一定的了解，并完全知悉证券投资过程中可能蕴含的亏损风险与盈利机会，并已充分理解证券市场“买者自负”的含义，愿意遵守“买者自负”原则；
                                            </p>
                                            <p>
                                                7、甲方向乙方提供的《风险承受能力评估表》及本人相关信息真实有效，甲方通过隐瞒、伪造、变造或其他手段向乙方提供虚假个人信息致使乙方对甲方作出错误的风险评级标准，由此导致的损失由甲方自行承担；
                                            </p>
                                            <p>
                                                8、甲方根据乙方证券投资顾问服务及软件工具、终端设备载体所提供的所有信息数据以及观点、投资建议、投资分析等资料操作而造成的必然或偶然的损失，由甲方自行承担；
                                            </p>
                                            <p>
                                                9、甲方已仔细阅读本协议条款，不存在重大误解情况。
                                            </p>
                                            <p>
                                                二、乙方声明与承诺
                                            </p>
                                            <p>
                                                1、乙方是根据中国法律依法设立并有序存续的公司，拥有法人资格；
                                            </p>
                                            <p>
                                                2、乙方不以任何方式保证甲方获得投资收益或承担甲方投资损失；
                                            </p>
                                            <p>
                                                3、乙方拥有签订本协议并履行本协议义务所需的完全权利能力和完全行为能力及一切合法授权。
                                            </p>
                                            <p class="">
                                                第六章风险提示和免责条款
                                            </p>
                                            <p>
                                                一、乙方向甲方提供本协议项下的服务，有可能需要依赖软件工具、终端设备等为载体，甲方在使用乙方提供的载体前应仔细阅读该载体的相关说明书，知悉并了解其实际功能、信息来源、固有缺陷和使用风险，由于甲方自身原因导致该软件工具、终端设备等使用不当或受到病毒入侵、黑客攻击等不良影响的，由此导致的风险将由甲方自行承担；
                                            </p>
                                            <p>
                                                二、乙方提供的具备自动选择证券投资品种或者提示买卖时机的软件工具、终端设备载体；在乙方知情的范围内，乙方以及财产上的利害关系人与所评价的证券没有任何利害关系。由于证券技术分析本身固有的局限性，设备载体提示会随时间和股票价格变动而动态更新。此功能不构成任何投资和股票买卖的建议或依据，甲方据此操作，风险自担；
                                            </p>
                                            <p>
                                                三、甲方应综合考虑投资风险并进行风险控制，由于甲方忽略风险控制而造成的任何损失，乙方不承担任何经济和法律责任；
                                            </p>
                                            <p>
                                                四、乙方尽力提供完整、及时、准确的信息，但不对所提供信息的完整性、及时性、准确性承担任何责任；
                                            </p>
                                            <p>
                                                五、乙方全力保障信息的优质传输，但不对因任何原因造成的信息异常或信息传递异常情况所导致的后果承担任何责任；
                                            </p>
                                            <p>
                                                六、因发生不可抗力、政策法规规定、监督机构等政府机关的要求、通信链路中断、软件系统/终端设备载体故障、黑客攻击、网络中断、病毒侵害、信息源异常等原因导致乙方无法向甲方提供证券投资顾问服务或证券投资顾问服务内容发生遗漏、错误、丢失、延迟、中断等情形的，乙方不对此向甲方承担责任；
                                            </p>
                                            <p>
                                                七、甲方深刻理解证券投资的风险，充分认识到乙方提供的证券投资顾问服务仅供甲方参考使用，不构成甲方进行投资决策的依据，乙方不承担任何经济和法律责任；
                                            </p>
                                            <p>
                                                八、乙方工作人员不得以书面或口头等形式向甲方出具本协议以外的服务内容，如甲方发现乙方工作人员有此类情况发生的，甲方拥有向乙方告知的义务。如乙方工作人员与甲方私自签订任何形式的协议，其协议和约定事项无效，乙方不承担任何责任，并保留对其追究责任的权利。
                                            </p>
                                            <p class="">
                                                第七章保密条款
                                            </p>
                                            <p>
                                                一、甲乙双方均有保守秘密的义务，未经另一方事先书面许可，任何一方不得对外披露、透露或提供与本协议有关的信息或内容。违反本规定给对方造成损失的应当负赔偿责任；
                                            </p>
                                            <p>
                                                国家有关部门依法要求查询或要求提供与本协议相关的内容，不受前款约束。
                                            </p>
                                            <p>
                                                二、以下信息不属于保密信息：
                                            </p>
                                            <p>
                                                1、有书面证据表明接收方先前已知悉的任何信息；
                                            </p>
                                            <p>
                                                2、非因接收方的过错而进入公共领域或为公众所知晓的信息；
                                            </p>
                                            <p>
                                                3、或接收方其后从其他途径合法获得的信息；
                                            </p>
                                            <p>
                                                三、乙方可将秘密信息透漏给其相关的雇员或其所聘请的专业人士，但乙方应确保上述人员亦受本协议的约束，使保密信息出于保密状态并仅为本协议履行之目的使用该等保密信息。
                                            </p>
                                            <p class="">
                                                第八章违约责任
                                            </p>
                                            <p>
                                                一、甲乙双方须严格、全面履行本协议相关条款，任何一方不得违约，否则，除法律规定或本协议约定可以免责的以外，违约方应承担违约责任；
                                            </p>
                                            <p>
                                                二、甲方无正当理由不支付服务费，乙方有权要求甲方支付未付的服务费及延期支付的利息；
                                            </p>
                                            <p>
                                                三、甲方同意保障和维护乙方及其他客户的利益，如因甲方违反有关法律、法规或合同约定给乙方造成损失，甲方必须承担由此造成的损害赔偿责任；
                                            </p>
                                            <p>
                                                四、如果甲方将乙方提供的终端工具或平台的用户账号和密码泄露给第三方，乙方有权终止本协议，造成的一切损失由乙方承担。乙方无须向甲方退还任何费用，并有权向甲方追究其违约责任。
                                            </p>
                                            <p class="">
                                                第九章协议的变更与终止
                                            </p>
                                            <p>
                                                一、自本协议签订之日起五个工作日内，甲方可以书面通知方式提出解除本协议，乙方收到解除协议书面通知时，本协议解除，并全部退还已支付的服务费；
                                            </p>
                                            <p>
                                                二、甲方有下列情形之一的，乙方有权解除本协议：
                                            </p>
                                            <p>
                                                1、甲方逾期30日仍不向乙方支付服务费；
                                            </p>
                                            <p>
                                                2、甲方有捏造事实或者隐瞒重要情节等情形，致使乙方证券投资顾问不能依法提供有效的服务。
                                            </p>
                                            <p>
                                                三、本协议签署后，若有关法律法规、行业自律规则修订，本协议与之不相适应的内容或条款自动失效，相关内容及条款按新修订的法律法规、行业自律规则办理。但本协议的其他内容及条款依然有效；
                                            </p>
                                            <p>
                                                四、如根据新生效的法律法规、行业自律规则，需要修改或增补本协议的，调整后的内容自动成为协议的有效组成部分，协议未变更的部分效力不变。
                                            </p>
                                            <p class="">
                                                第十章法律适用与争议解决
                                            </p>
                                            <p>
                                                一、有关本协议的订立、签署、效力和争议的解决等均使用中华人民共和国法律法规或规则的约束；
                                            </p>
                                            <p>
                                                二、因本协议的解释、履行、违约、终止和效力引起的或与之有关的任何争议及主张，双方应通过友好协商加以解决。协商不能解决的，任何一方均可向乙方所在地有管辖权的人民法院提起诉讼。
                                            </p>
                                            <p class="">
                                                第十一章通知与送达
                                            </p>
                                            <p>
                                                一、甲乙双方证券投资顾问服务中通知与送达根据以下约定进行：
                                            </p>
                                            <p>
                                                1、乙方收到甲方书面通知的时间视为送达，甲方未书面通知乙方的，乙方以甲方原留存的联系方式为准；因甲方未及时将联络方式的变更结果通知乙方所产生的一切责任由甲方承担；
                                            </p>
                                            <p>
                                                2、乙方有权依据本协议中所载明的甲方联络方式采用电子邮件、录音电话、传真、手机短信、邮寄等一种或几种方式对甲方发出本协议所载的各种通知。
                                            </p>
                                            <p class="">
                                                第十二章附则
                                            </p>
                                            <p>
                                                一、本协议附件和本协议具有同等法律效力。一方或双方此前就本协议有关事项以口头或书面形式形成的相同性质的许诺、承诺、声明、建议、保证、安排、草案、协议、谅解、备忘录等，凡与本协议有冲突之处，均以本协议约定为准。未经本协议双方书面同意，本协议条款不得变更；
                                            </p>
                                            <p>
                                                二、本协议所附的《证券投资顾问业务风险揭示书》为本协议的组成部分，与本协议具有同等效力；
                                            </p>
                                            <p>
                                                三、甲乙双方确认，乙方与甲方签订投资顾问服务协议的，乙方总公司为证券投资顾问服务的责任主体；
                                            </p>
                                            <p>
                                                四、投资者为自然人的，本协议自甲方签字，乙方加盖公章之日起生效；投资者为机构的，本协议自甲方法定代表人或代理人签字并加盖公章，乙方加盖公章之日起生效；
                                            </p>
                                            <p>
                                                五、乙方已向甲方说明证券投资顾问业务的风险，不保证甲方获得投资收益或承担甲方投资损失；甲方确认已认真阅读并全面接受本协议的全部条款，已充分知悉、理解本协议项下的权利、义务和责任，自愿参与证券投资顾问业务并自行承担由此产生风险和法律后果。
                                            </p>
                                            <p>
                                                本协议正式生效日期为年月日。（此处为我公司填写）
                                            </p>
                                            <p>
                                                本协议一式两份，甲乙双方各执一份。
                                            </p>
                                            <div class="pro-sign">
                                                <div class="pro-jia">
                                                    <p>甲方：</p>
                                                    <br />
                                                    <p>授权代表（签字）：</p>
                                                </div>
                                                <div class="pro-yi pro-jia">
                                                    <p>乙方：云南产业投资管理有限公司（盖章）</p>
                                                    <p>日期：</p>
                                                    <p>日期：</p>
                                                </div>
                                            </div>
                                        </p>
                                    </div>
                                </div>
                                <p class="pro-footer"><span class="pro-btn pro-next cursor">下一步</p>
                        </div>
                        <div class="pro-prompt pro-risk" style="display: none;">
                            <p class="pro-head"><i class="pro-img"></i>风险揭示书<i class='pro-img pro-close cursor'></i></p>
                            <div class="pro-content">
                                <div>
                                    <p class="pro-bold">
                                        投资顾问业务风险揭示书
                                    </p>
                                    <p >
                                        为了使您充分了解证券投资顾问业务的风险，我公司依据《证券投资顾问业务暂行规定》，面向投资者提供《证券投资顾问业务风险揭示书》，充分揭示接受证券投资顾问服务中存在的风险。我公司提供的《证券投资顾问业务风险揭示书》以书面形式存在，投资者签收确认后生效，并由我公司进行投资顾问业务的档案保存工作。
                                    </p>
                                    <p  >
                                        一、在您接受证券投资顾问服务前，必须了解提供服务的证券公司、证券投资咨询机构是否具备证券投资咨询业务资格，证券公司、证券投资咨询机构提供服务的人员是否具备证券投资咨询执业资格并已经注册登记为证券投资顾问。我公司具有中国证监会颁发的证券投资咨询业务资格，有关信息可在中国证券业协会网站和我公司官网查询确认。
                                    </p>
                                    <p >
                                        二、在您接受证券投资顾问服务前，须知我公司开展的投资顾问业务仅限于以下业务范畴：接受您的委托，按照约定，向您提供涉及证券及证券相关产品的投资建议服务，辅助您做出投资决策，其中投资建议服务内容包括投资的品种选择、投资组合及理财规划建议等。
                                        <span class="pro-bold">关于您，务必重点注意：在您接受证券投资顾问服务后需自主作出投资决策并独立承担投资风险。</span>
                                </p>
                                <p class="pro-bold">
                                    三、在您接受证券投资顾问服务前须知我公司及其工作人员提供的证券投资顾问服务不能确保投资者获得盈利或本金不受损失。
                                </p>
                                <p>
                                    四、在您接受证券投资顾问服务前，必须充分了解我公司、证券投资咨询机构及其人员提供的投资建议具有针对性和时效性，不能在任何市场环境下长期有效。
                                </p>
                                <p>
                                    五、在您接受证券投资顾问服务前，必须充分了解我公司提供的证券研究报告和投资分析意见等，可能存在不准确、不全面或者被误读的风险，您有权向证券投资顾问了解证券研究报告的发布人和发布时间以及投资分析意见的来源，以便在进行投资决策时作出理性判断。
                                </p>
                                <p>
                                    六、在您接受证券投资顾问服务前，必须充分了解我公司服务的收费标准和方式，按照公平、合理、自愿的原则与我公司协商并书面约定收取证券投资顾问服务费用的安排。证券投资顾问服务收费应向公司账户支付（指定账户请至公司网站http://www.zx0093.com/download.htm查看），不得向证券投资顾问人员或其他个人账户支付。
                                </p>
                                <p>
                                    七、如您发现投资顾问存在违法违规行为或利益冲突情形，如泄露客户投资决策计划、传播虚假信息、进行关联交易等，您可以向我公司投资咨询机构投诉或向有关部门举报。
                                </p>
                                <p>
                                    八、我公司可能存在因停业、解散、撤销、破产，或者被中国证监会撤销相关业务许可、责令停业整顿等原因导致不能履行职责的风险。
                                </p>
                                <p>
                                    九、我公司证券投资顾问人员存在因离职、离岗等原因导致更换投资顾问服务人员并影响服务连续性的风险。
                                </p>
                                <p>
                                    十、在您接受证券投资顾问服务前，应向我公司证券投资咨询机构说明自身资产与收入状况、投资经验、投资需求和风险偏好等情况并接受评估，填写《风险承受能力评估表》，以便于我公司能根据您的风险承受能力和服务需求，向您提供适当的证券投资顾问服务。
                                </p>
                                <p>
                                    十一、您需要向我公司提供有效的联系方式和服务获取方式，如有变动须及时向我公司进行说明，如因您自身原因或不可抗力因素导致您未能及时获取证券投资顾问服务，责任将由您自行承担。
                                </p>
                                <p>
                                    十二、在您接受证券投资顾问服务时，请保管好自己的证券账户、资金账户和相应的密码，不要委托我公司任何人员管理自己的证券账户、资金账户，代理买卖证券，否则由此导致的风险将由您自行承担。
                                </p>
                                <p>
                                    十三、在您接受以软件工具、终端设备等为载体的投资建议或者类似功能服务前，请先务必仔细阅读相关说明书，了解其实际功能、信息来源、固有缺陷和使用风险，由于您自身原因导致该软件工具、终端设备等使用不当或受到病毒入侵、黑客攻击等不良影响的，由此导致的风险将由您自行承担。我公司的软件工具、终端设备具有选择证券投资品种或者提示买卖时机功能，产品说明书中揭示了其功能原理和使用方法，并指出了其局限性和使用风险，请您认真阅读了解。
                                </p>
                                <p>
                                    十四、我公司基本信息：
                                </p>
                                <p>
                                    公司名称：云南产业投资管理有限公司
                                </p>
                                <p>
                                    证券投资咨询业务资格证书编号：zx0093
                                </p>
                                <p>
                                    客户服务电话:010-83426855 / 010-53181132
                                </p>
                                <p>
                                    客户投诉电话：010-82177612
                                </p>
                                <p>
                                    公司网站：http://www.zx0093.com/download.htm
                                </p>
                                <p class="pro-bold">
                                    十五、本风险揭示书的揭示事项仅为列举性质，未能详尽列明投资者接受证券投资顾问服务所面临的全部风险和可能导致投资者投资损失的所有因素。
                                </p>
                                <p class="pro-bold">
                                    在您接受证券投资顾问服务前，应认真阅读并理解相关业务规则、证券投资顾问服务协议及本风险揭示书的全部内容。
                                </p>
                                <p class="pro-bold">
                                    关于接受证券投资顾问服务的您，应自行承担投资风险，我公司不以任何方式向您作出不受损失或者取得最低收益的承诺。
                                </p>
                                <p class="pro-bold">
                                    以上《风险揭示书》所有内容本人已阅读并完全理解。
                                </p>
                                <p class="pro-right">
                                    投资者签字：
                                </p>
                                <p class="pro-right">
                                    签字日期： 年 月 日
                                </p>
                            </div>
                        </div>
                        <p class="pro-footer"><span class="pro-btn pro-yes cursor">确定</p>
                        </div>
                    </div>
                    <div id="login_register" style="display: none">
                        <div class="l-r-content">
                            <div class="l-r-topti">
                                <i class="l-r-fa"></i>
                               <!--  <span class="l-r-title on mgl20 l-login">登录</span>
                            <span class="l-r-title l-register">注册</span> -->
                            <span class="l-r-close"><i class="fa fa-times closed" aria-hidden="true"></i></span>
                            <div class="m10">约牛控股云南产业投资管理公司（证监会持牌机构），请放心注册</div>
                            </div>
                            <div class="login">
                                <div class="w300">
                                    <div class="login-inpt login-phone">
                                        <i class="login-fa login-fa-user"></i>
                                        <input type="text" name="userName" autocomplete="off" class="l-r-input l-phone" placeholder="请输入手机号/用户名">
                                    </div>
                                    <div class="login-inpt login-password">
                                        <i class="login-fa login-fa-lock"></i>
                                        <input type="password" name="password" class="l-r-input l-pass" placeholder="密码" autocomplete="off">
                                    </div>
                                    <div class="login-box">
                                        <!--    <input type="checkbox" value="y" name="isLogin" class="l-check" />
                                        <span>自动登录</span> -->
                                        <a href="/public/user/forget.htm" target="_blank" class="fr">忘记密码？</a>
                                    </div>
                                    <div class="login-info">
                                        <span class="l-r-submit l-r-input l-submit">登录</span>
                                        <span class="l-r-buy l-r-input l-buy">购买</span>
                                    </div>
                                </div>
                            </div>
                            <div class="register hid">
                                <div class="w300">
                                    <div class="register-inpt login-phone">
                                        <input type="text" name="userName" class="l-r-input r-phone" placeholder="请输入手机号">
                                    </div>
                                    <div class="register-inpt login-password">
                                        <i class="register-fa r-see"></i>
                                        <input type="password" name="password" class="l-r-input r-pass" placeholder="请输入密码">
                                    </div>
                                    <div class="register-inpt login-password">
                                        <img class="image-code" src="${path}/validCode.htm"></img>
                                        <input type="text" name="text" class="l-r-input r-imgcode" placeholder="请输入图片验证码">
                                    </div>
                                    <div class="register-inpt login-password">
                                        <i class="register-fa r-code">获取验证码</i>
                                        <input type="text" name="message" class="l-r-input r-message" placeholder="请输入手机验证码">
                                    </div>
                                    <div class="register-inpt login-password">
                                        <input type="text" name="text" class="l-r-input r-invite" placeholder="请输入邀请码">
                                    </div>
                                    <div class="login-info">
                                        <span class="l-r-submit l-r-input">注册</span>
                                    </div>
                                    <div class="inline">
                                        <input id="agree" type="checkbox" checked="" class="r-check">
                                        <span>我已阅读并同意遵守
                                <a  class="register-blue" target="_blank" href="/html/protocol.htm">《约牛网网站用户注册协议》</a>
                            </span>
                                    </div>
                                </div>
                            </div>
                            </div>
                            </div>
                            <script src="/public/js/lodash.js"></script>
                            <script src="/public/js/velocity.js"></script>
                            <script src="/public/js/velocity.ui.js"></script>
                            <script src="/public/bundle/live-vip-act.bundle.js?v=20170420074745"></script>
                </body>

                </html>