<template>
  <div id="popup" v-show="showModule">
    <div class="popup-wall"></div>
    <div class="popup-box clear">
      <span class="close" @click="showModule=false">×</span>
      <div class="popup-info clear">
        <div class="popup-img fl clear">
          <img class="fl" :src="opinionInfo.photo" :alt="opinionInfo.name">
          <i class="teacher-icon fl" v-if="opinionInfo.type_ioc"><img :src="opinionInfo.type_ioc" alt=""></i>
        </div>
        <span class="fl popup-teacher-name">
          {{opinionInfo.name}}
        </span>
        <span class="fl popup-teacher-num">
          证书编号{{opinionInfo.certificate_num}}
        </span>
      </div>
      <div class="popup-txt">
        <p class="title tc">{{opinionInfo.title}}</p>
        <p class="m-time tc">{{opinionInfo._create_time}}</p>
        <div class="popup-content" v-html="opinionInfo.content" @click="zoomImg($event)">
        </div>
        <div class="popup-hint tc">
          <p class="m-title">风险提示：以上内容仅代表个人观点，不构成投资建议，股市有风险，投资需谨慎。</p>
        </div>
      </div>

    </div>
  </div>
</template>
<script>
import * as http from "@/api";

export default {
  prps:['showModule'],
  data() {
    return {
      showModule: false,
      opinionInfo: []
    };
  },
  methods: {
    getOpinionInfo(ops) {
      ops.type == 'opinion' ? this.opinionDetail(ops.id) : this.learningDetail(ops.id);
    },
    async opinionDetail(id){
      const back = await http.getOpinionInfo({ articleId: id });
      this.opinionInfo = this.handle(back.data);
      this.showModule = true;
    },
    async learningDetail(id){
      const back = await http.getLearningInfo({ learning_stocksId: id });
      this.opinionInfo = this.handle(back.data);
      this.showModule = true;
    },
    handle(item){
      item.photo  = item.teacherPhoto || item.teacher_photo;
      item.name = item.createrName || item.author;
      item._create_time = item.create_time.substr(0,16);
      return item;
    },
    zoomImg(e){
      if(e.target.src){
          hub.emit('zoom-img',e.target.src);
      }
    }
  },
  mounted(){
  }
};
</script>
<style lang="scss" scoped>
#popup {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index:2;
  .popup-wall {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4);
  }
  .popup-box {
    position: absolute;
    width: 800px;
    height: 714px;
    background: #fff;
    top: 50%;
    margin-top: -357.5px;
    left: 50%;
    margin-left: -400px;
    .close {
      position: absolute;
      right: 8px;
      top: 8px;
      font-size: 20px;
      cursor: pointer;
    }
    .popup-info {
      height: 67px;
      border-bottom: 1px solid #e5e5e5;
      line-height: 67px;
      padding-left: 28px;
      .popup-img {
        margin-top: 17px;
        margin-right: 10px;
        position: relative;
        img {
        width: 30px;
        height: 30px;
        border-radius: 100%;
        }
        .teacher-icon{
        width:12px;
        position:absolute;
        right:0;
        bottom:0;
          img{
            width:100%;
            height:auto;
          }
        }
      }
      .popup-teacher-name {
        font-size: 16px;
        color: #333333;
        margin-right: 10px;
      }
      .popup-teacher-num {
        font-size: 14px;
        color: #999999;
      }
    }
    .popup-txt {
      margin: 20px 28px 0;
      min-height: 593px;
      max-height: 593px;
      overflow-y: auto;
      background: #f7f7f7;
      padding: 20px 28px;
      box-sizing: border-box;
      .title {
        font-size: 18px;
        color: #333333;
        font-weight: bold;
        margin-bottom: 15px;
      }
      .m-time {
        font-size: 12px;
        color: #999999;
      }
      .popup-content {
        font-size: 14px;
        color: #666666;
        line-height: 25px;
        margin-top: 20px;
      }
      .popup-hint .m-title {
        font-size: 14px;
        color: #d12a2b;
        display: inline-block;
        background: #fef8f8;
        border: 1px solid #f9f0f0;
        margin-top: 10px;
        padding: 15px 50px;
      }
    }
  }
}
</style>
