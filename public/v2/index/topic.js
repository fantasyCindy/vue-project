var indexTopic = (function() {
    var container;
    var create = item => {
        return `<span class="index-topic-container">
            <span class="topic-title-text"><a href="/app/topicDetail.htm?topic_id=${item.id}" target="_blank">#${item._topic_title}#</a></span> |
            <span class="topic-attention">${item.attention}</span>人关注
            <span class="topic-comment">${item.commentCount}</span>条投顾讨论
            <span class="topic-addAttention ${item._style}" data-id="${item.id}">${item._attentionText}</span> |
        </span>`
    }

    var createTag = arr => {
        return _.map(arr, item => 　{
            return `<span class="topic-teachers">
            <span class="topic-teacher-photo"><img src="http://101.201.41.116:8080/public/v2/index/images/zhangshengyu.jpg" alt="" /></span><i class="item-icon item-icon-guwen"></i>
        </span>`
        }).join('')
    }

    var handle = item => {
        if (item.topic_title.length > 15) {
            item._topic_title = item.topic_title.substr(0, 15) + '..'
        } else {
            item._topic_title = item.topic_title
        }
        item._attentionText = ['+关注', '取消关注'][item.isAttention]
        item._style = ['add', 'cancel'][item.isAttention]
        return item
    }

    return {
        init: function() {
            container = $('.index-topic')

            $.getJSON('app/topicIndex.htm', back => {
                console.log('back', back)
                var teacherlist = []
                var href = ''
                if (back.data.teacherList.length > 7 ) {
                    teacherlist = _.take(teacherlist, 7)
                    container.find('.topic-arrow').show()
                } else {
                    teacherlist = back.data.teacherList
                }
                container.find('.index-topic-container').html(create(handle(back.data)))
                container.find('.topic-teacher').html(createTag(teacherlist))

                href = container.find('.topic-title-text a').attr('href')
                container.find('.topic-arrow a').attr('href',href)
            })


            //关注
            container.on('click', '.add', function() {
                var topicId = $(this).data('id')
                $.post('app/topicAttention.htm', { topic_id: topicId }, back => {
                    if (back.status == '1') {
                        layer.msg('话题关注成功')
                        container.find('.topic-addAttention').text('取消关注').removeClass('add').addClass('cancel')
                        var cur = container.find('.topic-attention').html()
                        container.find('.topic-attention').html(++cur)
                    }
                }, 'json')
            })

            //取消关注
            container.on('click', '.cancel', function() {
                var topicId = $(this).data('id')
                $.post('app/topicAttention.htm', { topic_id: topicId }, back => {
                    if (back.status == '1') {
                        layer.msg('已取消关注话题')
                        container.find('.topic-addAttention').text('+关注').removeClass('cancel').addClass('add')
                        var cur = container.find('.topic-attention').html()
                        container.find('.topic-attention').html(--cur)
                    }
                }, 'json')
            })
        }
    }
})()


module.exports = indexTopic
