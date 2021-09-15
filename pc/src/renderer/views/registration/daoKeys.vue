<!--
 *  导入私钥
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="padding-tb marlrAuto margin-bottom regCont">
      <p class="fontSize-28 margin-bottom">{{ $t('rke.daoru') }}</p>
      <p class="fontSize-16 coloC6FF margin-bottom-sm">{{ $t('rke.shuru') }}</p>
      <!-- <textarea
       
        placeholder="助记词用空格隔开"
      ></textarea> -->
      <el-input
        type="textarea"
        :rows="10"
        class="radius_10 textarea"
        :placeholder="$t('rke.tishi')"
        v-model="textarea"
      >
      </el-input>
    </div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
        >{{ $t('rke.fanhui') }}</el-button
      >
      <el-button
        class="margin-left-sm wodthButton backJianBuls"
        type="primary"
        round
        @click="doSave"
        >{{ $t('rke.queding') }}</el-button
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
      textarea: '',
    }
  },
  computed: {},
  methods: {
    doSave() {
      if (!this.textarea) {
        this.$message.error(`输入不能位空`)
        return
      }
      this.$router.push({
        name: 'createWallet',
        query: { siYao: this.textarea },
      })
    },
  },
  created() {},
  mounted() {},
}
</script>
<style scoped>
.mars {
  height: 150px;
  padding-top: 80px;
}
.regCont {
  margin-top: 70px;
  width: 650px;
  height: 388px;
  background-color: #00498d;
}
.textarea {
  width: 584px;
}
::v-deep .textarea .el-textarea__inner {
  background-color: #0e6ac0;
  border: none;
  color: #ffffff;
}
.zhiImg {
  width: 93px;
  height: 95px;
}
::v-deep .textarea textarea::-webkit-input-placeholder {
  color: #2085e8;
}
::v-deep .textarea textarea::-moz-input-placeholder {
  color: #2085e8;
}
::v-deep .textarea textarea::-ms-input-placeholder {
  color: #2085e8;
}
</style>
