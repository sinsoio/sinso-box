// 公共数据
const state = {
  homeIndex: 1, //主页从四个框中哪个进入的
  // 身份登记
  identification: {
    password: '', //密码
    siYao: '', //密钥
    name: '', //名称
    preShenFen: '', //预先填好的身份证
    shenfen: '', //身份证号
  },
  // 钱包
  create: [
    {
      //   createId: 1,
      //   name: '钱包1', //钱包名称
      //   password: '123456', // 密码
      //   totalAssets: 3000, //总资产
      //   address: '8q8hyw3t2vsfh*******qx4mzwxdsar', //钱包地址
      //   siYao: 'xch18q8hyw3t2vsfhjkadshkjh4qx4mzwxdsar2f8hdasdfashfkl0',
      //   ssetsList: [
      //     {
      //       id: 1,
      //       name: 'SINSO', //资产名称
      //       imgImg: 'https://www.sinso.io/static/img/phImgs.png', //资产图片
      //       money: 1000.0,
      //       charge: 0.0001, //手续费百分比
      //     },
      //     {
      //       id: 2,
      //       name: 'XCH', //资产名称
      //       // address: '', //钱包地址
      //       imgImg: 'https://www.sinso.io/static/img/phImg.png', //资产图片
      //       money: 2000.0,
      //       charge: 0.0001, //手续费百分比
      //     },
      //   ],
      tranList: [
        // {
        //   id: 1,
        //   dealId: 'xch18w3t2****4mdsar2f8h',
        //   height: 12321,
        //   time: '2021-12-07 19:53:2',
        //   status: 1, //成功
        //   from: 'xch18w3t2****4mdsar2f8h',
        //   to: 'xch18w3t2****4mdsar2f8h',
        //   isJia:'-',
        //   amounto: 125.4,
        //   brand: 'sinso',
        //   gas: 0.04,
        // },
      ],
    },
  ],
}
const mutations = {
  // 主页从四个框中哪个进入的赋值
  DECREMENT_Index(state, { num }) {
    state.homeIndex = num
  },
  //预先填好的身份证
  DECREMENT_preContShenFen(state, { num }) {
    state.identification.preShenFen = num
  },
  //预先填好的密钥 密码 名称
  DECREMENT_miYao(state, { num }) {
    state.identification.siYao = num.siYao
    state.identification.password = num.password
    state.identification.name = num.name
  },
  // 创建成功后的 身份证赋值
  DECREMENT_SF(state) {
    state.identification.shenfen = state.identification.preShenFen
  },
  //钱包总和 包含创建钱包 导入钱包 转账钱包的金额
  DECREMENT_create(state, { num }) {
    state.create = num
  },
  //交易记录 重新赋值
  DECREMENT_brand(state, { num, bigIndex }) {
    state.create[bigIndex].tranList = num
  },
  // 清除缓存
  DECREMENT_clear(state) {
    state.homeIndex = 1
    ;(state.identification = {
      preShenFen: '', //预先填好的身份证
      shenfen: '', //身份证号
    }),
      (state.create = [])
  },
}

const actions = {
  someAsyncTask({ commit }) {
    // do something async
    commit('INCREMENT_MAIN_COUNTER')
  },
}

export default {
  state,
  mutations,
  actions,
}
