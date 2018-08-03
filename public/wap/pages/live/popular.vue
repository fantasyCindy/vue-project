<template>
    <div id="new_live" class="clear">
        <div class="new_live_list" v-for="(id,index) in ids" :key="id" @click="goRoom(id)" :class="{fr:(index + 1)%2 == 0}">
            <div class="new_live_list_name">{{byId[id]._title}}</div>
            <div class="new_live_list_photo">
                <span class="new_live_btop" v-show="byId[id].is_btop">{{byId[id].phonetag_name}}</span>
                <span class="new_live_tphoto"><img :src= "byId[id].photo_path" alt=""></span>
                <i class="new_live_teacherIcon"><img :src="byId[id].type_ioc" alt=""></i>
            </div>
            <div class="new_live_list_line" v-show="type == 2">
                <span class="new_live_num">{{byId[id].liveContentCount}}条</span>直播内容
            </div>
            <div class="new_live_list_line" v-show="type == 1">
                参与人数<span class="new_live_num">{{byId[id]._popularity}}</span>
            </div>
            <div class="new_live_speciality-wrap">
                <span v-for="short in byId[id].short" class="new_live_list_speciality" :key="short">{{short}}</span>
            </div>
            <i class="new_live_line"></i>
            <div class="new_live_list_bottom clear">
                <div class="new_live_status"><i :class="{icon0:!byId[id].status}" class="new_live_status_icon1"></i>{{byId[id].isLive}}</div>
                <div class="new_live_btn" v-show="!byId[id]._isAttention" v-on:click.stop="care(byId[id])"><i class="care-icon"></i>关注</div>
                <div class="new_live_btn cancel" v-show="byId[id]._isAttention" v-on:click.stop="care(byId[id])"><i class="care-icon cancel"></i>取消关注</div>
            </div>
        </div>
    </div>
</template>
<script>
import {
    getPopLive,
    attention
} from '../../api';
import {
    Toast
} from 'vant';
import {
    mapState
} from 'vuex'


export default {
    data() {
            return {
                ids: [],
                type: 2,
            }
        },
        computed: {
            ...mapState({
                activeIds: state => state.live.activityTeachers,
                popularIds: state => state.live.popularTeachers,
                byId: state => state.live.teachersById,
                shouldMore: state => state.live.shouldLoadMoreLive,
            }),
        },
        watch: {
            activeIds(value) {
                if (this.type == 2) {
                    this.ids = value
                }
            }
        },

        methods: {
            care(item) {
                if (!ynIsLogin) {
                    this.$store.dispatch('jumpLogin')
                    return
                }
                this.$store.dispatch('careTeacher', item)
            },
            goRoom(item) {
                this.$router.push('/live/room/' + item)
            },
            changeType(value) {
                this.type = value
                const types = {
                    1: this.popularIds,
                    2: this.activeIds
                }
                types[value] && (this.ids = types[value])
            }
        },
        mounted() {}
}
</script>
<style scoped>
/*active*/

a {
    display: block;
}

#new_live .new_live_list {
    float:left;
    width: 4.16rem;
    height: 5rem;
    margin-bottom: 0.4rem;
    padding: 0.4rem 0.2rem 0.2rem;
    background: red;
    background: #fff;
    box-shadow: 2px 2px 5px 1px #d2d2d2;
    text-align: center;
}
#new_live .new_live_list.fr{
    float:right;
}
.new_live_list:active {
    background: rgba(0, 0, 0, .05) !important;
}

.new_live_list .new_live_list_name {
    color: #000;
    font-size: 0.4rem;
    text-align: center;
}

.new_live_list .new_live_list_photo {
    position: relative;
    display: block;
    text-align: center;
}

.new_live_btop {
    display: inline-block;
    position: absolute;
    top: .05rem;
    right: 0.45rem;
    width: 1.28rem;
    height: .613rem;
    background: url(/public/wap/images/icon-btop.png?1) no-repeat;
    background-size: 100%;
    color:#fff;
    text-align: center;
    line-height: 0.54rem;
    font-size:0.3rem;
}

.new_live_list .new_live_tphoto {
    display: inline-block;
    width: 1.2rem;
    height: 1.2rem;
    border-radius: 50%;
    overflow: hidden;
    margin: 0.4rem auto 0 auto;
    position: relative;
    left: 0.25rem;    
    border: 1px solid #f5f5f5;
}

#new_live img {
    width:100%;
    height: 100%;
}

.new_live_list .new_live_teacherIcon {
    display: inline-block;
    width: 0.30rem;
    position: relative;
    right:0.15rem;
}

.new_live_teacherIcon img {
    width: 100%;
}

.new_live_list .new_live_list_line {
    text-align: center;
    color: #666;
    font-size: 0.35rem;
    margin-top:0.4rem;
}

.new_live_list .new_live_num {
    color: red;
    margin: 0 0.15rem;
}

.new_live_speciality-wrap {
    height: 1.44rem;
}

.new_live_list .new_live_list_speciality {
    display: inline-block;
    height: 0.45rem;
    -ms-line-height: 0.47rem;/*IE9+支持*/
    -webkit-line-height: 0.47rem; /*chrome safair*/
    -moz-line-height: 0.47rem;/*火狐*/
    line-height: 0.5rem;
    padding: 0 0.3em;
    margin: 0.2rem 0.15rem 0.2rem 0;
    font-size: 0.35rem;
    border: 1px solid #5da5fd;
    border-radius: 0.1rem;
    color: #5da5fd;
}

.new_live_list .new_live_list_bottom {
    display:block;
    /* display: flex; 
    justify-content: space-between; */
    margin-top: 0.37rem;
    color: #666;
    font-size: 0.35rem;
    cursor: pointer;
}
.new_live_list_bottom .new_live_status{
    float:left;
}

.new_live_list_bottom .new_live_btn{
    float:right;
}
.new_live_list .new_live_status_icon1.icon0 {
    display: inline-block;
    width: 0.3rem;
    height: 0.3rem;
    margin-right: 0.1rem;
    background: url(/public/wap/images/icon-live.png) no-repeat;
    background-size: 100%;
}

.new_live_list .new_live_status_icon1 {
    display: inline-block;
    width: 0.3rem;
    height: 0.3rem;
    margin-right: 0.1rem;
    background: url(/public/wap/images/icon-offline.png) no-repeat;
    background-size:100%;
}

.care-icon {
    display: inline-block;
    width: .32rem;
    height: .28rem;
    margin-right: 0.1rem;
    background: url(/public/wap/images/icon-care.png) no-repeat;
    background-size:100% 100%;
}

.care-icon.cancel {
    display: inline-block;
    width: .32rem;
    height: .28rem;
    margin-right: 0.1rem;
    background: url(/public/wap/images/icon-cancel.png) no-repeat;
    background-size: 100% 100%;
}

.new_live_list .new_live_btn {
    color: #ff5054;
}

.new_live_list .new_live_btn.cancel {
    color: #999;
}
.new_live_line{
    display: block;
    width:100%;
    height:1px;
    background:#f5f5f5;
}
</style>
