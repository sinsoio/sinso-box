<!--
 *  导入钱包
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="flex justify-center marTos">
      <div class="margin-right-sm currPointer shiCont" @click="handle('siyao')">
        <img class="yaoImg" src="../../assets/home/yaoshi.png" />
        <div>
          {{ $t('rmo.daoru') }}
          <p class="fontSize-12 margin-top-xs">{{ $t('rmo.daoru1') }}</p>
        </div>
      </div>
      <div class="margin-left-sm currPointer shiCont" @click="handle">
        <img class="cisImg" src="../../assets/home/cis.png" />
        <div>
          {{ $t('rmo.zhudaoru') }}
          <p class="fontSize-12 margin-top-xs">{{ $t('rmo.shurudao') }}</p>
        </div>
      </div>
    </div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="goHome"
      >
        {{ $t('rmo.fanhui') }}</el-button
      >
    </div>
  </div>
</template>

<script>
export default {
  name: 'daoMoney',
  components: {},
  props: {},
  data() {
    return {}
  },
  computed: {},
  methods: {
    handle(status) {
      if (status === 'siyao') {
        this.$router.push({ name: 'daoKeys' })
      } else {
        this.$router.push({ name: 'daoWords' })
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
  height: 300px;
  padding-top: 60px;
  margin-bottom: 60px;
  background: url(../../assets/home/back7.png) no-repeat;
  background-size: cover;
  position: relative;
}
.yaoImg {
  width: 72px;
  height: 80px;
}
.cisImg {
  width: 58px;
  height: 66px;
}
.shiCont div {
  position: absolute;
  width: 233px;
  bottom: 50px;
  left: 0px;
}
</style>
