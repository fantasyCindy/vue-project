var ajax = require('module/ajax.js')
require('./guestLive.css')
var emerging = function() {
    var items, url, params

    var handle = function(data) {
        return _.map(data, item => {
            item.link = item.link = `${live_path}live/${item.teacherid}/`;
            return `<div class="emerging-item clear">
	            		<div class="avatar fl" data-userid="${item.user_id}">
	                        <img class="photo" src="${item.photo}" alt="">
	                        <span class="moods"><img src="/public/v2/live-list/images/hot.png" alt="">${item.popularity_number}</span>
	                    </div>
	                    <div class="content fl">
	                        <p class="clear top"><a href="${item.link}" target="_blank" class="title fl f4 b">${item.title}</a><a href="${item.link}" target="_blank" class="enter fr f2">查看直播</a></p>
	                        <p class="text bomb-tan">
	                            ${item.description}
	                        </p>
	                    </div>
                    </div>`;
        }).join("")
    }
    return {
        init: function(container, URL, option) {
            items = $(container)
            url = URL
            params = option
        },
        render: function() {
            ajax.ajax(url, params, function(data) {
                items.html(handle(data));
            });
        }
    }
}()
module.exports = emerging