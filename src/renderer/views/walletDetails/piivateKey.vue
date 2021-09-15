<!--
 *  备份私钥
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="piivateKey">
    <div class="flex  align-center padding-left-sm margin-bottom-sm backC">
      <img
        class="margin-right-xs smallImg"
        src="../../assets/home/smallWar.png"
      />
      <p class="fontSize-12">
        {{ $t('wpi.jinggao') }}
      </p>
    </div>
    <div class="padding-tb-sm padding-lr textTx">
      0bcd697fbfef35679ad5g6a0f701607c4adba82f7bceffd2e5127088d2b4b238
    </div>
    <div class="text-center">
      <el-button
        class="margin-left-sm widthBigButt backJianBuls"
        type="primary"
        round
        @click="doSave"
        >{{ $t('wpi.beifen') }}</el-button
      >
    </div>
  </div>
</template>

<script>
export default {
  name: 'piivateKey',
  components: {},
  props: {},
  data() {
    return {}
  },
  computed: {},
  methods: {
    doSave() {
      this.$router.replace({ name: 'walletDetails' })
    },
  },
  created() {},
  mounted() {},
}
</script>
<style scoped>
.piivateKey {
  padding: 50px 100px 0px 100px;
}
.backC {
  background: #f1f1f1;
  color: #ffa800;
  height: 40px;
}
.smallImg {
  width: 24px;
  height: 24px;
}
.textTx {
  height: 300px;
  background: #f1f1f1;
  margin-bottom: 100px;
}
</style>
