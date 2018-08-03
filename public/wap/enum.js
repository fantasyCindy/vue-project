export const TabData = [
    { text: "活跃", id: 0, type: 2 },
    { text: "人气", id: 1, type: 1 },
    { text: "新晋", id: 2, type: 3 }
];

export const NavData = [
    { text: "直播", id: 0, to: "/live/list" },
    { text: "问股", id: 1, to: "/ask/list" },
    { text: "观点", id: 2, to: "/opinion/list" },
    { text: "圆桌", id: 3, to: "/meeting/list" }
];

export const errorCode = {
    "1": "请求成功",
    "-1": "请求繁忙",
    "10001": "股票代码不存在",
    "10002": "查询条件为空",
    "20001": "用户未登录",
    "20002": "token为空",
    "20003": "用户名不存在",
    "20004": "密码为空",
    "20005": "密码不匹配",
    "20006": "登录失败",
    "20007": "用户不存在",
    "20008": "操作失败",
    "20009": "密码不一致",
    "20010": "TOKEN 错误",
    "20011": "参数错误",
    "20012": "获取验证码失败",
    "20013": "期刊ID为空",
    "20014": "直播室ID为空",
    "20015": "提问内容为空",
    "20016": "直播室未开启",
    "20017": "直播老师未关联直播室",
    "20018": "期刊不存在",
    "20019": "已在其他终端登陆",
    "20020": "提问次数超出限制",
    "20021": "该条问题已被采纳过",
    "20022": "不是该问题提问人",
    "30001": "手机验证码为空",
    "30002": "图片验证码错误",
    "30003": "手机验证码错误",
    "30004": "账号已存在",
    "30005": "注册异常",
    "30006": "第三方第一次登录",
    "30007": "第三方非法用户",
    "30008": "手机号为空",
    "30009": "手机号已被绑定",
    "30010": "手机号错误",
    "30011": "该号码不是约投顾的工作电话，慎防假冒！",
    "40001": "参数为空",
    "40002": "服务器异常",
    "40003": "已点赞",
    "40004": "评论失败",
    "40005": "起始值为空",
    "40006": "查询失败",
    "40007": "请求方向格式错误",
    "40008": "用户自选股已经存在",
    "40009": "关注",
    "40010": "没有此股票信息",
    "40011": "取消关注",
    "40012": "直播老师不存在",
    "40013": "股票代码和名称不匹配",
    "40014": "买入股票时资本不够",
    "50001": "消息为空",
    "50002": "老师不能提问",
    "50003": "老师不能关注",
    "60000": "支付成功",
    "60001": "商品ID为空",
    "60002": "商品类型为空",
    "60003": "订单类型为空",
    "60004": "订单ID为空",
    "60005": "订单不存在",
    "60006": "支付失败",
    "60007": "签名为空",
    "60008": "未传支付密码",
    "60009": "支付密码错误",
    "60010": "账户余额不足",
    "60011": "用户没有开通账户",
    "60012": "支付密码格式不正确",
    "60013": "充值来源错误",
    "60014": "订单金额类型不存在",
    "60015": "订单金额错误",
    "60016": "产品购买数量错误",
    "60017": "礼物不存在",
    "60018": "商品类型不存在",
    "60019": "商品不存在",
    "60020": "商品已购买",
    "60021": "商品已付款请等待客服人员与您联系",
    "60022": "商品未购买",
    "70001": "组合不存在",
    "70002": "组合已技术评价",
    "70003": "收益信息为空",
    "70004": "委托记录为空",
    "80000": '该手机号被用户举报，涉嫌违规操作，目前不能操作',
    "80001": '您输入的内容违反相关规定，不能予以展示!',
    "90000": "身份证号格式验证不通过",
    "90001": "已通过实名制验证",
    "90002": "还没有进行实名制验证",
    "90003": "还没有进行风险评估",
    "90004": "当天实名验证次数到达上线",
    "100001": "活动注册成功",
    "100002": "活动注册失败",
    "100003": "活动已过期",
    "100005": "用户不符合活动条件",
};