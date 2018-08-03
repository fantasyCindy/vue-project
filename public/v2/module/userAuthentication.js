/* 
    实名认证弹窗
*/

var ajax = require('m/ajax');
var verification = require('m/id-verify')
require('./realName.css')

/*///////////////////////////////////////////////////////////////////*/

var _isVerify = false // 是否认证
var _isAppraisal = false // 是否评估

// 检查是否实名认证
var check = function (callback) {
    $.post('/app/isIdCard.htm', back => {
        if (back.status == 1) {
            _isVerify = back.data.isCard
            _isAppraisal = back.data.isRisk
            callback()
        }
    }, 'json')
}

var w = $(window).width();
var h = $(window).height();

var layoutBox = function (box) {
    var cw = box.outerWidth()
    var ch = box.outerHeight()
    box.css({
        left: (w - cw) / 2 + "px",
        top: (h - ch) / 2 + "px"
    })
}

var createElement = function () {
    return `<div id="auth-verify">
        <div class="title"><span class="value">实名认证</span> <i class="close fa fa-close"></i></div>
        <div class="auth-frame card">
            <div classs="form-item form">
                <div class="line">
                    <span>姓名</span>
                    <input class="auth-verify-name" type="text" placeholder="请填写您身份证上的名字">
                </div>
                <div class="line">
                    <span>身份证号</span>
                    <input class="auth-verify-code" type="text" placeholder="填写您的15位或18伪身份证号">
                </div>
                <div class="line">
                    <p class="submit">确认</p>
                </div>
            </div>
            <div class="form-item done">
                <div class="result">
                    <span class="cg"></span>
                    <p>恭喜您认证成功</p>
                </div>
                <div class="to-btn">即将跳转到评估页面</div>
            </div>
        </div>
        <div class="auth-frame appraisal">只需一次风险评估，方便我们永久为您更好地服务！</div>
    </div>`
}


var verify = (function () {

    var instance = null

    var createInstance = function () {

        var container,
            frame_card,
            frame_appraisal,
            group_form,
            group_success,
            name,
            code,
            submit

        var init = function () {
            $('body').append(createElement())
            container = $('#auth-verify')
            frame_card = container.find('.auth-frame.card')
            frame_appraisal = container.find('.auth-frame.appraisal')
            group_form = container.find('.form-item.form')
            group_success = container.find('.form-item.done')
            name = container.find('.auth-verify-name')
            code = container.find('.auth-verify-code')
            submit = container.find('.submit')
        }

        var reset = function () {

        }

        return {
            render() {

                if (_isAppraisal && _isVerify) { // 已经认证完毕
                    return
                }

                init()

                if (!_isVerify) { // 没有认证
                    return frame_card.show()
                }

                if (!_isAppraisal) { // 认证未评估
                    frame_appraisal.show()
                }
            }
        }
    }

    return {
        get() {
            if (!instance) {
                instance = createInstance()
            }
            return instance
        }
    }
})()


module.exports = verify








// var realName = function () {
//     var container

//     function layoutBox() {
//         var w = $(window).width();
//         var h = $(window).height();
//         var cw = container.outerWidth()
//         var ch = container.outerHeight()
//         container.css({
//             left: (w - cw) / 2 + "px",
//             top: (h - ch) / 2 + "px"
//         })
//     }

//     return {
//         init: function (ops) {
//             var self = this
//             $('body').append(createElement)
//             container = $('#realName');
//             layoutBox()
//             affirm = container.find('.affirm')

//             /* EVENT */

//             $('#AuthName').keyup(_.debounce(function () {
//                 var reg = /^([\u4e00-\u9fa5]{1,20}|[a-zA-Z\.\s]{1,20})$/;
//                 var status = reg.test(_.trim($(this).val()))
//                 state1 = status
//                 hint($(this), status ? '' : '姓名格式错误')
//                 state1 && state2 ? affirm.addClass('touch') : affirm.removeClass('touch')
//             }, 1000))


//             $('#AuthCode').keyup(_.debounce(function () {
//                 var status = verification(_.trim($(this).val()));
//                 state2 = status
//                 state1 && state2 ? affirm.addClass('touch') : affirm.removeClass('touch')
//                 hint($(this), status ? '' : '身份证格式错误')
//             }, 1000))

//             // 提交表单
//             container.on('click', '.touch', function () {
//                 var send = $('#Auth_form').serialize()
//                 ajax.postJSON('/app/verificationIdCard.htm', send, function (data) {
//                     if (data.status == 1) {
//                         container.hide()
//                         container.find('.name-success').show()
//                         $('#Auth_form').hide()
//                         setTimeout(function () {
//                             if (typeof self.done == "function") {
//                                 self.done(true)
//                             }
//                         }, 1000)
//                     }
//                     if (data.status == 90000) {
//                         layer.msg(`还有${data.data.validateCount}次认证机会`)
//                     }
//                     if (data.status == 90001) {
//                         layer.msg('以通过实名制认证')
//                     }
//                     if (data.status == 90004) {
//                         layer.msg('认证次数已用完，请明天再试')
//                     }
//                 })
//             })

//             container.on('click', '.close', function () {
//                 container.hide()
//             })

//         },

//         render: function (_callback) {
//             callback = _callback
//             container.show()
//         },
//         done: null
//     }
// }()

// module.exports = realName