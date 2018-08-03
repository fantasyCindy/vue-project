<template>
    <div class="liveroom-btop" v-show="topInfoData.id">
        <span class="btop-icon inline" v-text="topInfoData.phonetag_name"></span>
        <span class="btop-text inline" v-text="topInfoData.shortContent"></span>
        <span class="btop-arrow-down inline" :class="{up:isOpen}" @click="showTopDetail(topInfoData)"></span>
    </div>
</template>
<script>
import {
    mapState
} from 'vuex'
export default {
    data() {
            return { isOpen: false, }
        },
        computed: {
            ...mapState({
                topInfoData: state => state.chat.topData,
            })
        },
        methods: {
            showTopDetail(item) { //直播间有牛股展开收起
                if (!this.isOpen) {
                    this.topInfoData.shortContent = item.content
                    this.isOpen = true
                } else {
                    this.topInfoData.shortContent = item.content.substr(0, 18)
                    this.isOpen = false
                }
            }
        }
}
</script>
<style scoped>
.liveroom-btop {
	width:9.3rem;
    padding: 0.35rem;
    /*padding-left: 2.2rem;*/
    background: #fff7f6 ;
    font-size: 0.35rem;
    color: #666;
    border-bottom: 1px solid #f5f5f5;
    position:fixed;
    left: 50%;
    margin-left: -5rem;
    z-index:3;
}
.btop-icon{
    width:1.76rem;
    height:0.827rem;
    background:url(../../images/icon-live-btop.png) no-repeat;
    background-size: 1.76rem .827rem;
    color:#fff;
    text-align: center;
    line-height: 0.65rem;
    position:absolute;
    top:0.25rem;
}
.liveroom-btop.show {
    overflow: visible;
}

.btop-text {
    width: 6.5rem;
    line-height: 0.5rem;
    margin-left: 2.1rem;
}

.btop-arrow-down {
    width: .267rem;
    height: .267rem;
    background: url(../../images/icon-fold.png) no-repeat;
    background-size: .267rem;
    float:right;
    position: relative;
    top:0.1rem;
}

.btop-arrow-down.up {
    width: .267rem;
    height: .267rem;
    background: url(../../images/icon-unfold.png) no-repeat;
    background-size: .267rem;
    float:right;
    position: relative;
    top:0.1rem;
}
</style>
