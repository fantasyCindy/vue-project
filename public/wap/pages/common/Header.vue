<template>
  <div class="header logo-bar">
        <a @click="jump"><img src="http://m.live.yuetougu.com/public/images/yn-h5/logo.jpg"></a>
        <span class="text" v-text="text"></span>
        <!-- <span @click="logout">退出</span> -->
        <a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.yueniu.finance&ckey=CK1396958283535" class="download">下载APP</a>
    </div>
</template>
<script>
 var href = window.location.href
    export default{
        data(){
            return{
                text:'约投顾'
            }
        },
        methods:{
            logout(){
                this.$store.dispatch('logout')
            },
            jump(){
                if(href.indexOf('app=yngp') != '-1'){
                    window.location.href =  "http://m.live.yuetougu.com/?app=yngp"
                }else{
                     window.location.href="http://m.live.yuetougu.com/"
                }
            }
        },
        mounted(){
            if (href.indexOf("app=yngp") != '-1') {
                this.text="约牛股票"
            }
        }
    }
</script>
<style scoped>
.logo-bar{
    width:100%;
	height:1.2rem;
	text-align:center;
	background:#d52720;
	font-size:.48rem;
	color:#fff;
	line-height:1.3rem;
	position:fixed;
    top:0;
    left:0;
    z-index:100;
}
.logo-bar img{
	width:0.76rem;
	position:absolute;
	left:0.4rem;
	top:0.3rem;
}
.logo-bar a.download{
	display: inline-block;
    position: absolute;
    right: .35rem;
    top: .3rem;
    font-size: .3rem;
    border: 1px solid #fff;
    border-radius: .1rem;
    text-align: center;
    line-height: .63rem;
    color: #fff;
    width: 1.5rem;
    height: .57rem;
}
</style>