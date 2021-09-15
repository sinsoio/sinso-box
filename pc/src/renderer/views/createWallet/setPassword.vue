<!--
 *  设置密码
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="padding-tb-lg marlrAuto margin-bottom regCont">
      <p class="fontSize-28 margin-bottom">{{ $t('cse.shezhi') }}</p>
      <p class="fontSize-16 coloC6FF margin-bottom-xs padding-lr-xl">
        {{ $t('cse.miaoshu') }}
      </p>
      <p class="fontSize-16 coloC6FF margin-bottom-xl padding-lr-xl">
        {{ $t('cse.miaoshu1') }}
      </p>
      <el-form
        :model="addForm"
        :rules="formRules"
        ref="addForm"
        class="marlrAuto elInput"
      >
        <el-form-item prop="pass">
          <el-input
            v-model.trim="addForm.pass"
            :placeholder="$t('cse.tishi')"
            autocomplete="off"
            show-password
          ></el-input>
        </el-form-item>
        <el-form-item prop="checkPass">
          <el-input
            v-model.trim="addForm.checkPass"
            :placeholder="$t('cse.tishi2')"
            autocomplete="off"
            show-password
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
      >
        {{ $t('cse.fanhui') }}</el-button
      >
      <el-button
        class="margin-left-sm wodthButton backJianBuls"
        type="primary"
        round
        @click="doSave"
      >
        <a> {{ $t('cse.xiayibu') }}</a>
      </el-button>
    </div>
  </div>
</template>

<script>
import { nanoid } from 'nanoid'
export default {
  name: 'setPassword',
  components: {},
  props: {},
  data() {
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error(`${this.$t('cse.mima1')}`))
      } else if (value.length < 8) {
        callback(new Error(`密码不能少于8位`))
      } else {
        if (this.addForm.checkPass !== '') {
          this.$refs.addForm.validateField('checkPass')
        }
        callback()
      }
    }
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error(`${this.$t('cse.mima2')}`))
      } else if (value.length < 8) {
        callback(new Error(`密码不能少于8位`))
      } else if (value !== this.addForm.pass) {
        callback(new Error(`${this.$t('cse.mima3')}`))
      } else {
        callback()
      }
    }
    return {
      minLength: 8, //最小输入长度
      type: '',
      addForm: {
        pass: '',
        checkPass: '',
      },
      formRules: {
        pass: [{ validator: validatePass, trigger: 'blur' }],
        checkPass: [{ validator: validatePass2, trigger: 'blur' }],
      },
    }
  },
  computed: {},
  methods: {
    doSave() {
      this.$refs.addForm.validate((valid) => {
        if (valid) {
          let password = this.addForm.pass || ''
          let siYao = this.$route.query.siYao || ''
          let name = this.$route.query.name || ''
          let create = {}
          let list = []
          if (this.$store.state.Public.homeIndex == 2) {
            create = {
              createId: 1,
              name: name, //钱包名称
              password: password, // 密码
              totalAssets: 0, //总资产
              address: `TXMsg7FpZAqo7Dq87h1F3B7ESrnwsT32CN`, //钱包地址
              siYao: siYao,
              ssetsList: [
                {
                  id: 2,
                  name: 'XCH', //资产名称
                  imgImg: 'https://www.sinso.io/static/img/phImg.png', //资产图片
                  money: 0,
                  charge: 0.0001, //手续费百分比
                },
              ],
              tranList: [],
            }
            list = [create]
            this.$store.commit('DECREMENT_create', { num: list })
            this.$router.push({ name: 'warning' })
          } else if (this.$store.state.Public.homeIndex == 3) {
            list = [
              {
                createId: 1,
                name: name, //钱包名称
                password: password, // 密码
                totalAssets: 0, //总资产
                address: `TPUAb4TTbQ4CBjBk1RdKBSiUrmAetEdpRC`, //钱包地址
                siYao: siYao,
                ssetsList: [
                  {
                    id: 2,
                    name: 'XCH', //资产名称
                    imgImg: 'https://www.sinso.io/static/img/phImg.png', //资产图片
                    money: 0,
                    charge: 0.0001, //手续费百分比
                  },
                ],
                tranList: [],
              },
              {
                createId: 2,
                name: 'My wallet', //钱包名称
                password: password, // 密码
                totalAssets: 3000, //总资产
                address: `TXMsg7FpZAqo7Dq87h1F3B7ESrnwsT32CN`, //钱包地址
                siYao: siYao,
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
                    to: 'xch18w3t2****7skvbt2f62s',
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
                    to: 'xch18w3t2****7skvbsst9r',
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
                password: password, // 密码
                totalAssets: 5000, //总资产
                address: `TVvkXGgJraFJeAt1wDV65d8Vo1CogHdbgt`, //钱包地址
                siYao: siYao,
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
                    to: 'xch18w3t2****7skvbsst9r',
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
                    to: 'xch18w3t2****5edclach9s',
                    isJia: '+',
                    amounto: 1000,
                    brand: 'sinso',
                    gas: 0.04,
                  },
                ],
              },
            ]
            this.$store.commit('DECREMENT_create', { num: list })
            this.$router.push({ name: 'walletDetails' })
          }

          //    获取数据
          // list = this.$store.state.Public.create || []
          // list = [...list, create]
          // this.$store.commit('DECREMENT_create', { num: list })
        }
      })
    },
  },
  created() {},
  mounted() {},
}
</script>
<style scoped>
.regCont {
  margin-top: 70px;
  width: 650px;
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
