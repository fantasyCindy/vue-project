//相关观点
var list = (function() {
    var container, params = {
        currentPage: 1,
        pageSize: 10
    }

    var create = arr => {
        return _.map(arr, item => {
            return `</li><li class="right-item">
                                <div class="related-t">相关观点相关观点相关观点相关观点相关</div>
                                <div class="right-msg">
                                    <span class="name">东燊论股</span>
                                    <span class="time">07-05</span>
                                </div>
                            </li>`
        }).join('')
    }
    var handleData = arr => {
        return _.map(arr, item => {
            item._create_time = item.create_time.substr(5, 11)
            item.link = `/headlines/headlinesDetail.htm?type=${item.type}&articleid=${item.articleid}`
            if (item.shortContent.length > 200) {
                item._shortContent = item.shortContent.substr(0, 200) + '..'
            } else {
                item._shortContent = item.shortContent
            }
            return item;
        })
    }
    return {
        init: function() {
            container = $('.container')
            page = $('.page')
            bootpag = yntool.bootpag(page);
            bootpag.on('page', function(err, n) {
                params.currentPage = n;
                list.render()
            })
        },
        render: function() {
            $.getJSON('/headlines/index.htm', params, back => {
                // if (back.rows.length >= 1) {
                container.html(create(handleData(back.rows)))
                back.pageNumber = _.max([1, Math.ceil(+back.total / params.pageSize)])
                bootpag.bootpag({ page: params.currentPage, total: back.pageNumber })
                    // }
            })
        }
    }
})()



$(function() {
    list.init()
    list.render()
})
