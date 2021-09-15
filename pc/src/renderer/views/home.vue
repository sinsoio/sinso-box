<!--
 *  主页
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF backsImg">
    <div class="flex  justify-end  ">
      <div
        class="flex align-center padding-tb padding-lr-sm currPointer"
        @click="switchCli"
      >
        <img class="switchImg" src="../assets/home/switch.png" />
        <div>{{ $t('home.qiehuan') }}</div>
      </div>
    </div>
    <div class="text-center fontSize-40">
      sinso-box
    </div>
    <div class="flex align-center justify-center heights">
      <div class="flex flex-wrap  widthCont">
        <div class="text-center back2 currPointer" @click="handle(1)">
          <img class="back2Img" src="../assets/home/identity.png" />
          <p>{{ $t('home.shenfen') }}</p>
        </div>
        <div class="text-center back3 currPointer" @click="handle(2)">
          <img class="back3Img" src="../assets/home/adds.png" />
          <p>{{ $t('home.chuangjian') }}</p>
        </div>
        <div class="text-center back4 currPointer" @click="handle(3)">
          <img class="back4Img" src="../assets/home/daos.png" />
          <p>{{ $t('home.daoru') }}</p>
        </div>
        <div class="text-center back5 currPointer" @click="handle(4)">
          <img class="back5Img" src="../assets/home/sousuo.png" />
          <p>{{ $t('home.chaxun') }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'home',
  components: {},
  props: {},
  data() {
    return {}
  },
  computed: {},
  methods: {
    handle(type) {
      // //先判断是否有身份登记 没有直接先去登录
      // if (!this.$store.state.Public.identification.shenfen) {
      //   this.$router.push({ name: 'registration' })
      // } else {
      //   this.$store.commit('DECREMENT_Index', { num: type })
      //   if (type === 1) {
      //     this.$router.push({ name: 'registration' })
      //   } else if (type === 2) {
      //     this.$router.push({ name: 'distinguish' })
      //   } else if (type === 3) {
      //     this.$router.push({ name: 'daoMoney' })
      //   } else if (type === 4) {
      //     this.$router.push({ name: 'wallet' })
      //   }
      // }

      // 从哪个页面进入的
      this.$store.commit('DECREMENT_Index', { num: type })
      if (type === 1) {
        this.$router.push({ name: 'registration' })
      } else {
        this.$router.push({ name: 'distinguish' })
      }
    },
    // 切换语言
    switchCli() {
      console.log(this.$store.state.Public)
      this.$i18n.locale == 'zh'
        ? (this.$i18n.locale = 'en')
        : (this.$i18n.locale = 'zh')
    },
  },
  created() {},
  mounted() {
    console.log(this.$store.state.Public)
    // 只要进入页面 清除全部缓存
    this.$store.commit('DECREMENT_clear')
  },
}
</script>
<style scoped>
.switchImg {
  width: 22px;
  height: 22px;
  margin-right: 4px;
}
.heights {
  height: calc(100vh - 140px);
}
.widthCont {
  width: 620px;
}
.widthCont > div {
  padding-top: 40px;
  margin-bottom: 20px;
  margin-left: 10px;
  margin-right: 10px;
  width: 290px;
  height: 170px;
  position: relative;
}
.widthCont p {
  position: absolute;
  width: 290px;
  bottom: 30px;
  left: 0px;
}
.back2 {
  background: url(../assets/home/back2.png) no-repeat;
  background-size: cover;
}
.back3 {
  background: url(../assets/home/back3.png) no-repeat;
  background-size: cover;
}
.back4 {
  background: url(../assets/home/back4.png) no-repeat;
  background-size: cover;
}
.back5 {
  background: url(../assets/home/back5.png) no-repeat;
  background-size: cover;
}
.back2Img {
  width: 67px;
  height: 51px;
}
.back3Img {
  width: 65px;
  height: 65px;
}
.back4Img {
  width: 65px;
  height: 56px;
}
.back5Img {
  width: 61px;
  height: 60px;
}
</style>
