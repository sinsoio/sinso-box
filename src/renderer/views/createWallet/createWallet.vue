<!--
 *  设置钱包名称
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="padding-tb-lg marlrAuto margin-bottom regCont">
      <p class="fontSize-28 margin-bottom">{{ $t('ccr.shezhi') }}</p>
      <p class="fontSize-16 coloC6FF margin-bottom-xl">
        {{ $t('ccr.migncheng') }}
      </p>
      <el-form
        :model="addForm"
        :rules="formRules"
        ref="addForm"
        class="marlrAuto elInput"
      >
        <el-form-item prop="text">
          <el-input
            v-model="addForm.text"
            type="text"
            :placeholder="$t('ccr.tishi')"
            maxLength="10"
          ></el-input>
        </el-form-item>
      </el-form>
    </div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
        >{{ $t('ccr.fanhui') }}</el-button
      >
      <el-button
        class="margin-left-sm wodthButton backJianBuls"
        type="primary"
        round
        @click="doSave"
      >
        <a>{{ $t('ccr.queding') }}</a>
      </el-button>
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
      type: '',
      addForm: {
        text: '',
      },
      formRules: {
        text: [
          {
            required: true,
            message: `${this.$t('ccr.tishi1')}`,
            trigger: 'blur',
          },
        ],
      },
    }
  },
  computed: {},
  methods: {
    doSave() {
      this.$refs.addForm.validate((valid) => {
        if (valid) {
          let siYao = this.$route.query.siYao

          let name = this.addForm.text
          this.$router.push({ name: 'setPassword', query: { siYao, name } })
        }
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
  margin-top: 122px;
  width: 650px;
  height: 280px;
  background-color: #00498d;
}
::v-deep .elInput input::-webkit-input-placeholder {
  color: #2085e8;
}
::v-deep .elInput input::-moz-input-placeholder {
  color: #2085e8;
}
::v-deep .elInput input::-ms-input-placeholder {
  color: #2085e8;
}
</style>
