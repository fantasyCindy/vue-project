var postComment = require('~/ui/post-comment.js');
var Face = require('m/qqface/main.js');
var error = require('e/error-type');
///////////////////isFeed////////////////////////////

$('.refer_isFeed').show()
$('.subscription').show()
    //内参列表
var referContent = (function() {
    var container, items, bootpag, loading, totalCount, param = {
        pageSize: 5,
        currentPage: 1
    };

    var handleData = arr => {
        return _.map(arr, item => {
            var match = item.pubtime.match(/^\d+-(\d+-\d+\s+\d+:\d+)/);
            item._time = match ? match[1] : "---";
            return item;
        })
    }

    var create = item => {
        return `<div class="refer_list clear">
                <span class="teacherPhoto fl"><img src="${item.teacherPhoto}" alt="" /></span>
                <span class="name fl">${item.puiblisher}<i class="teacher-icon"></i></span>

                <span class="time fl">${item._time}</span>
                <div class="refer_item fl">${item.content}</div>
            </div>`
    }

    return {
        init: function() {
            container = $(".refer_detail");
            items = container.find('.refer_content');
            totalCount = $(".total-refer-count");
            bootpag = yn.bootpag(container).hide();
            bootpag.on('page', (err, num) => this.render({
                currentPage: num
            }));

            // container.on('click', 'img', function() {
            //     yn.zoomImage($(this).attr('src'))
            // })
            /*  放大图片 */
            setTimeout(function() {
                container.find('img').each(function() {
                    $(this).zoomify()
                })
            }, 1000)
        },
        render: function(ops) {
            $(window).scrollTop(0)
            _.extend(param, ops);
            var isSelf = ynTeacherId == __data.createId;
            $.getJSON('/reference_periodical/list.htm', {
                referenceid: __data.id,
                pageSize: param.pageSize,
                currentPage: param.currentPage
            }, function(data) {
                if (data.status == 1) {
                    totalCount.text(data.data.total); //条数
                    if (__data.isOrder || isSelf) {
                        if (data.data.list.length < 1) {
                            items.html(ynconfig.none({
                                margin: 100
                            }));
                            return;
                        }
                        var rows = handleData(data.data.list);
                        var pageNumber = _.max([1, Math.ceil(+data.data.total / param.pageSize)]);
                        items.html(_.map(rows, item => create(item)).join(""));
                        bootpag.show().bootpag({
                            page: param.currentPage,
                            total: pageNumber
                        })
                    } else {
                        items.html(`<div class="none"><span>订阅后可查看内参！</span></div>`);
                        bootpag.hide();
                    }
                } else() => {
                    return layer.msg(error[data.status]) }

            })
        }
    }
})()


//评论列表
var comments = (function() {
    var container, items, totalCount, bootpag, param = {
        pageSize: 5,
        currentPage: 1
    };

    var result = []

    function handleData(data, replyFlag) {
        _.forEach(data, function(item) {
            item.photo = item.photo || "/public/images/user.jpg";
            item._reply = "";
            item._style = "";
            item._isSelf = __data.isSelf ? 'true' : 'false';
            // item.content = yn.parseFaceCode(item.content)
            //解析表情符
            item._content = item.content.replace(/\[.+?\]/g, match => {
                var isOld = /face=/.test(match)
                if (isOld) {
                    return yn.parseFaceCode(match)
                } else {
                    var name = Face.getInstance().titleToName(match)
                    if (!name) return match;
                    var src = `${__path}/public/module/qqface/png/${name}@2x.png`
                    return `<img class="img-qqface" src="${src}" style="position:relative;top:4px" title="${match}" >`
                }
            })

            item._teacherIcon = item.create_id == __data.pubId ? 'show' : 'hide' //用户端只有老师评论后面才有回复功能
            if (!__data.isSelf && __data.status != "2") {
                item._replyTeacher = item.create_id == __data.pubId ? 'show' : 'hide'
            }
            item._create_time = item.create_time.substr(0, 16)
            if (!item.nickName) {
                item._nickName = '默认昵称'
            } else {
                item._nickName = item.nickName
            }


            result.push(item);
            if (replyFlag) {
                // item._reply = "<span style='font-size:12px;color:#f57a17;position:relative;top:-1px'>回复" +
                //     "<i style='margin:0 10px;' class='fa fa-angle-right'></i></span>";
                item._reply = ''
                item._style = "isReply";
            }
            if (item.childList && item.childList.length > 0) {
                handleData(item.childList.reverse(), item.nickName);
            }
        })
    }

    return {
        init: function() {
            var self = this;
            container = $(".refer_comment")
            items = container.find('.comment_bar')
            totalCount = container.find('.cmentnum')

            bootpag = yn.bootpag(container).hide()
            bootpag.on('page', (e, num) => this.render({
                currentPage: num
            }))

            // 回复
            container.on('click', '.reply', function() {
                var createid = $(this).data('createid')
                if (+createid == ynUserId) {
                    return layer.msg('自己不能回复自己哦')
                }
                var id = $(this).data('id');
                var name = $(this).data('name')
                self.clickReply({
                    id: id,
                    name: name
                })
            })

            // 删除
            container.on('click', '.delete', function() {
                var id = $(this).data('id');
                layer.confirm('确定要删除吗', function() {
                    $.post("/reference/delcomment.htm", {
                        id: id
                    }, back => {
                        back = JSON.parse(back)
                        if (back.status == '1') {
                            layer.msg('删除成功');
                            setTimeout(function() {
                                window.location.reload()
                            }, 500)
                        } else {
                            return layer.msg(error[back.status])
                        }
                    })
                })
            })
        },
        render: function(props) {
            _.extend(param, props);

            // if (!(__data.isOrder || __data.isSelf) && __data.status != "2") {
            //     return items.html(`<div class="none">订阅后可查看评论!</div>`);
            // }

            $.getJSON('/reference/commentList.htm', {
                type: 0, //0=所有
                reference_id: __data.id,
                productStatus: __data.status,
                pageSize: param.pageSize,
                currentPage: param.currentPage
            }, data => {
                if (data.status == 1) {
                    result = [];
                    if (data.data.list.length < 1) {
                        items.html(ynconfig.none({
                            margin: 100
                        }))
                        return;
                    }

                    handleData(data.data.list);
                    items.html(template('comment_bar_template', result));

                    if (__data.status == '2') {
                        container.find('.reply').remove();
                    }

                    //设置页码
                    totalCount.text(`(${data.data.total})`);
                    var pageNumber = _.max([1, Math.ceil(+data.data.total / param.pageSize)])
                    bootpag.show().bootpag({
                        page: param.currentPage,
                        total: pageNumber
                    })
                } else() => {
                    return layer.msg(error[data.status])
                }

            })
        },
        clickReply: () => layer.msg("override not override...")
    }
})()

//内参更新弹窗
var updateRefer = (function() {
    var container, ue, inputStock;
    return {
        init: function() {
            container = $('#uprefer');
            inputStock = $('#insertStockCodeInput');
            ue = UE.getEditor('ueditContainer', {
                toolbars: [
                    ['simpleupload']
                ],
                initialFrameHeight: 319,
                elementPathEnabled: false,
                wordCount: false,
                enableContextMenu: false,
                enableAutoSave: false,
                pasteplain: true,
                autotypeset: {
                    removeEmptyline: true, //去掉空行
                    removeEmptyNode: false, // 去掉空节点
                }
            });

            var left = ($(window).width() - 700) / 2;
            container.css('left', left);

            //插入股票
            yn.showStockList(inputStock, {
                listLen: 4,
                top: 0,
                onSelect: item => inputStock.val('') && ue.execCommand('inserthtml', item.stockWrap)
            })

            //关闭
            container.on('click', '> .close', e => {
                container.hide();
                ue.setContent('');
                yn.bodyScroll(true);
            })

            //提交
            container.on('click', '.submit', function() {
                var content = _.trim(UE.getEditor('ueditContainer').getContent());
                if (content == '') return layer.msg('更新内容不能为空!');
                content = content.replace(/(<img)\s+(?:class="big_pic")?(.+?(jpg"|png"))/g, '$1  $2 class="big_pic"');
                container.hide();
                $.post('/reference_periodical/add.htm', {
                    referenceid: __data.id,
                    content: content,
                    puiblisher: __data.name,
                    puiblisherid: __data.pubId
                }, data => {
                    data = JSON.parse(data)
                    if (data.status == 1) {
                        layer.msg('发表成功！');
                        ue.setContent('');
                        yn.bodyScroll(true);
                        referContent.render();
                    }else () => {return layer.msg(error[data.status])}
                })
            })
        },
        render: () => {
            container.velocity('transition.flipXIn', {
                duration: 300
            })
            yn.bodyScroll(false);
        },
    }
})()

//内参简介
var profile = (function() {
    var container, update;
    return {
        init: function() {
            container = $(".refer_detail");
            update = $("#update");
            $("#icon-refer-status").addClass(`status ${__data.icon}`); //内参状态

            //更新内参
            var isRun = __data.status === "0";
            var pass = __data.isSelf && isRun;
            if (pass) update.html('<button class="addRefer">更新内参</button>');
            update.on('click', '.addRefer', () => {
                if (!pass) return layer.msg("NO Permit");
                updateRefer.render();
            })
        }
    }
})()


$(function() {
    referContent.init(); //内参内容
    referContent.render();
    comments.init(); //内参评论
    comments.render();
    updateRefer.init();
    profile.init(); //内参介绍

    if (__data.status === "0" && (__data.isOrder || __data.isSelf)) { //添加评论
        var post = new postComment({
            container: $(".postContainer"),
            onSubmit: info => {
                $.post('/reference/addComment.htm', {
                    reference_id: __data.id,
                    parent_id: post.parentId,
                    create_id: ynUserId,
                    content: info.value,
                }, data => {
                    data = JSON.parse(data)
                    if (data.status == 80001) {
                        return layer.msg('您输入的内容违反相关规定，不能予以展示！')
                    } else if (data.status == '1') {
                        layer.msg('发表成功')
                    } else() => {
                            return layer.msg(error[data.status]) }
                        // 如果是回复, 则刷新当前页面
                    var param = null
                    if (!info.parentId) {
                        param = {
                            currentPage: 1
                        }
                    }
                    comments.render(param)
                })
            }
        });
        comments.clickReply = info => {
            post.addReply(info.id, info.name)
        }
    }
})
