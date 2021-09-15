<!--
 *  指纹录入 指纹识别
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF text-center backsImg">
    <div class="fontSize-32 mars">
      {{ $t('rfi.shouji') }}
    </div>
    <div class="padding-tb-lg marlrAuto margin-bottom regCont">
      <p class="fontSize-28 margin-bottom">{{ $t('rfi.zhiwen') }}</p>
      <p class="fontSize-16 coloC6FF margin-bottom-sm">
        {{ $t('rfi.qinglu') }}
      </p>
      <div>
        <img class="zhiImg" src="../../assets/home/zhiwen.png" />
      </div>
    </div>
    <div class="flex align-center justify-center">
      <el-button
        class="margin-right-sm wodthButton backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
        >{{ $t('rfi.fanhui') }}</el-button
      >
      <el-button
        class="margin-left-sm wodthButton backJianBuls"
        type="primary"
        round
        @click="doSave"
        >{{ $t('rfi.queding') }}</el-button
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
      type: '', //状态
    }
  },
  computed: {},
  methods: {
    doSave() {
      // 导入身份证
      this.$store.commit('DECREMENT_SF')
      if (this.$store.state.Public.homeIndex == 1) {
        this.$router.push({ name: 'regSucss' })
      } else if (
        this.$store.state.Public.homeIndex == 2 ||
        this.$store.state.Public.homeIndex == 3
      ) {
        this.$router.push({ name: 'createWallet' })
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
    },
  },
  created() {},
  mounted() {
    this.type = this.$route.query.type
  },
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
.zhiImg {
  width: 93px;
  height: 95px;
}
</style>
