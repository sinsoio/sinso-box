<!--
 *  身份识别
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="flex justify-center marTos">
      <div
        class="margin-right-sm currPointer shiCont"
        @click="handle('zhengJian')"
      >
        <img class="sheImg" src="../../assets/home/identity.png" />
        <p>{{ $t('rdi.shibie') }}</p>
      </div>
      <div class="margin-left-sm currPointer shiCont" @click="handle">
        <img class="zhiImg" src="../../assets/home/zhiwenBai.png" />
        <p>{{ $t('rdi.shibie1') }}</p>
      </div>
    </div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="goHome"
        >{{ $t('rdi.fanhui') }}</el-button
      >
    </div>
  </div>
</template>

<script>
export default {
  name: 'regSucss',
  components: {},
  props: {},
  data() {
    return {}
  },
  computed: {},
  methods: {
    handle(status) {
      if (status === 'zhengJian') {
        this.$router.push({ name: 'registration', query: { type: 2 } })
      } else {
        this.$router.push({ name: 'fingerprint', query: { type: 2 } })
      }
    },
    goHome() {
      this.$router.replace({ name: 'home' })
    },
  },
  created() {},
  mounted() {},
}
</script>
<style scoped>
.marTos {
  margin-top: 122px;
}
.shiCont {
  width: 233px;
  height: 280px;
  padding-top: 60px;
  margin-bottom: 60px;
  background: url(../../assets/home/back6.png) no-repeat;
  background-size: cover;
  position: relative;
}
.sheImg {
  width: 92px;
  height: 68px;
}
.zhiImg {
  width: 84px;
  height: 78px;
}
.shiCont p {
  position: absolute;
  width: 233px;
  bottom: 80px;
  left: 0px;
}
</style>
