<!--
 *  收款
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="padding-tb-lg marlrAuto margin-bottom-xl regCont">
      <p class="fontSize-24 margin-bottom">{{ $t('wco.saoyisao') }}</p>
      <img class="margin-bottom maImg" src="../../assets/feiqi/erWeiMa.png" />
      <p>{{ address }}</p>
    </div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
        >{{ $t('wco.fanhui') }}</el-button
      >
    </div>
  </div>
</template>

<script>
export default {
  name: 'registration',
  components: {},
  props: {},
  data() {
    return {
      address: '',
    }
  },
  computed: {},
  methods: {},
  created() {
    //
    this.address =
      this.$route.query.address || 'xch18q8hyw3t2vsfhjkadshkjh4qx4mzwxdsar2f8h'
  },
  mounted() {},
}
</script>
<style scoped>
.mars {
  height: 150px;
  padding-top: 80px;
}
.regCont {
  margin-top: 122px;
  width: 650px;
  /* height: 280px; */
  background-color: #00498d;
}
.maImg {
  width: 160px;
  height: 160px;
}
</style>
