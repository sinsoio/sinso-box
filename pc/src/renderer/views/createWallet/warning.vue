<!--
 *  警告
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class=" warning">
    <div class="flex  align-center justify-center margin-bottom-xl">
      <img
        class="margin-right-xs warImg"
        src="../../assets/home/warningImg.png"
      />
      <p class="fontSize-30 ">{{ $t('cwa.jinggao') }}</p>
    </div>
    <div class="margin-bottom-xs paddigLes">
      {{ $t('cwa.miaoshu') }}
    </div>
    <div class="margin-bottom paddigLes">
      {{ $t('cwa.miaoshu1') }}
    </div>
    <div class="marBots paddigLes">{{ $t('cwa.miaoshu2') }}</div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
        >{{ $t('cwa.fanhui') }}</el-button
      >
      <el-button
        class="margin-left-sm wodthButton backJianBuls"
        type="primary"
        round
        @click="doSave"
      >
        <a>{{ $t('cwa.xiayibu') }}</a>
      </el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'warning',
  components: {},
  props: {},
  data() {
    return {}
  },
  computed: {},
  methods: {
    doSave() {
      let value = this.$route.query.value || ''
      if (value == 3) {
        this.$router.push({ name: 'piivateKey', query: { value } })
      } else {
        this.$router.push({ name: 'jiWords', query: { value } })
      }
    },
  },
  created() {
    console.log(this.$route)
  },
  mounted() {},
}
</script>
<style scoped>
.warning {
  padding-top: 138px;
  position: relative;
}
.warImg {
  width: 58px;
  height: 47px;
}
.warning p {
  color: #ff1f1f;
  font-weight: 600;
}
.marBots {
  margin-bottom: 110px;
}
.paddigLes {
  padding-left: 300px;
}
</style>
