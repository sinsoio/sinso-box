<!--
 *  身份登记
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="fontSize-32 mars">
      {{ $t('rre.shouji') }}
    </div>
    <div class="padding-tb-lg marlrAuto margin-bottom regCont">
      <p class="fontSize-28 margin-bottom" v-if="type === 1">
        {{ $t('rre.shenfen') }}
      </p>
      <p class="fontSize-28 margin-bottom" v-else>
        {{ $t('rre.shenfen1') }}
      </p>
      <p class="fontSize-16 coloC6FF margin-bottom-xl">
        {{ $t('rre.zhegnjian') }}
      </p>
      <el-form
        :model="addForm"
        :rules="formRules"
        ref="addForm"
        class="marlrAuto elInput"
      >
        <el-form-item prop="text">
          <el-input v-model="addForm.text" type="text"></el-input>
        </el-form-item>
      </el-form>
    </div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
        >{{ $t('rre.fanhui') }}</el-button
      >
      <el-button
        class="margin-left-sm wodthButton backJianBuls"
        type="primary"
        round
        @click="doSave"
      >
        <a v-if="type != 4">{{ $t('rre.queding') }}</a>
        <a v-else>{{ $t('rre.queding1') }}</a>
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
            message: `${this.$t('rre.tishi')}`,
            trigger: 'blur',
          },
        ],
      },
    }
  },
  computed: {},
  methods: {
    doSave() {
      // 进入设置钱包名称
      this.$refs.addForm.validate((valid) => {
        if (valid) {
          if (this.$store.state.Public.homeIndex == 1) {
            this.$router.push({ name: 'fingerprint' })
          } else if (this.$store.state.Public.homeIndex == 2) {
            this.$router.push({ name: 'createWallet' })
          } else if (this.$store.state.Public.homeIndex == 3) {
            this.$router.push({ name: 'daoMoney' })
          } else if (this.$store.state.Public.homeIndex == 4) {
            let list = [
              {
                createId: 1,
                name: 'My wallet', //钱包名称
                password: 222, // 密码
                totalAssets: 3000, //总资产
                address: `TXMsg7FpZAqo7Dq87h1F3B7ESrnwsT32CN`, //钱包地址
                siYao: 111,
                ssetsList: [
                  {
                    id: 1,
                    name: 'SINSO', //资产名称
                    imgImg: 'https://www.sinso.io/static/img/phImgs.png', //资产图片
                    money: 1000,
                    charge: 0.0001, //手续费百分比
                  },
                  {
                    id: 2,
                    name: 'XCH', //资产名称
                    imgImg: 'https://www.sinso.io/static/img/phImg.png', //资产图片
                    money: 2000,
                    charge: 0.0001, //手续费百分比
                  },
                ],
                tranList: [
                  {
                    id:
                      'f6068d33ea789e3fb5e2b2601152b593d7eeb875e6df796532c1eb5242e6ef00',
                    dealId: 'xch18w3t2****4mdsar2f8h',
                    height: 12321,
                    time: '2021-12-07 19:53:2',
                    status: 1, //成功
                    from: 'TXMsg7FpZ****SrnwsT32CN',
                    to: 'xch18w3t2****4mdsar2f8h',
                    isJia: '-',
                    amounto: 136,
                    brand: 'sinso',
                    gas: 0.04,
                  },
                  {
                    id:
                      'f6068d33ea789e3fb5e2b2601152b593d7eeb875e6df796532c1eb5242e6ef34',
                    dealId: 'xch18w3t2****4mdsar2f8h',
                    height: 12321,
                    time: '2021-12-07 19:53:2',
                    status: 1, //成功
                    from: 'TXMsg7FpZ****SrnwsT32CN',
                    to: 'xch18w3t2****4mdsar2f8h',
                    isJia: '+',
                    amounto: 66,
                    brand: 'sinso',
                    gas: 0.04,
                  },
                ],
              },
              {
                createId: 3,
                name: 'My family savings', //钱包名称
                password: 1111, // 密码
                totalAssets: 5000, //总资产
                address: `TVvkXGgJraFJeAt1wDV65d8Vo1CogHdbgt`, //钱包地址
                siYao: 22,
                ssetsList: [
                  {
                    id: 1,
                    name: 'SINSO', //资产名称
                    imgImg: 'https://www.sinso.io/static/img/phImgs.png', //资产图片
                    money: 2400,
                    charge: 0.0001, //手续费百分比
                  },
                  {
                    id: 2,
                    name: 'XCH', //资产名称
                    imgImg: 'https://www.sinso.io/static/img/phImg.png', //资产图片
                    money: 2600,
                    charge: 0.0001, //手续费百分比
                  },
                ],
                tranList: [
                  {
                    id:
                      'f6068d33ea789e3fb5e2b2601152b593d7eeb875e6df796532c1eb5242e6ef3s',
                    dealId: 'xch18w3t2****4mdsar2f8h',
                    height: 12321,
                    time: '2021-12-07 19:53:2',
                    status: 1, //成功
                    from: 'TVvkXGgJr****o1CogHdbgt',
                    to: 'xch18w3t2****4mdsar2f8h',
                    isJia: '-',
                    amounto: 88,
                    brand: 'sinso',
                    gas: 0.04,
                  },
                  {
                    id:
                      'f6068d33ea789e3fb5e2b2601152b593d7eeb875e6df796532c1eb5242e6ef36',
                    dealId: 'xch18w3t2****4mdsar2f8h',
                    height: 12321,
                    time: '2021-12-07 19:53:2',
                    status: 1, //成功
                    from: 'TVvkXGgJr****o1CogHdbgt',
                    to: 'xch18w3t2****4mdsar2f8h',
                    isJia: '+',
                    amounto: 1000,
                    brand: 'sinso',
                    gas: 0.04,
                  },
                ],
              },
            ]
            this.$store.commit('DECREMENT_create', { num: list })
            this.$router.push({ name: 'wallet' })
          }
        }
      })
    },
    formSub() {},
  },
  created() {
    this.type = this.$store.state.Public.homeIndex || 1
    console.log(this.type)
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
  width: 650px;
  height: 280px;
  background-color: #00498d;
}
</style>
