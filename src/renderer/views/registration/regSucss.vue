<!--
 *  登记成功
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="padding-tb-lg marlrAuto margin-bottom regCont">
      <img class="margin-bottom-lg succImg" src="../../assets/home/sucss.png" />
      <p class="fontSize-24">{{ $t('reg.succ') }}</p>
    </div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="handle"
        >{{ $t('reg.fanhui') }}</el-button
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
    handle() {
      this.$router.push({ name: 'home' })
    },
  },
  created() {},
  mounted() {},
}
</script>
<style scoped>
.regCont {
  margin-top: 150px;
  width: 650px;
  height: 280px;
  background-color: #00498d;
}
.succImg {
  width: 94px;
  height: 86px;
}
</style>
