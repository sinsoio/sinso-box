import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: require('../views/home.vue').default,
    },
    {
      path: '/registration',
      name: 'registration',
      component: require('../views/registration/registration.vue').default,
    },
    {
      path: '/fingerprint',
      name: 'fingerprint',
      component: require('../views/registration/fingerprint.vue').default,
    },
    {
      path: '/distinguish',
      name: 'distinguish',
      component: require('../views/registration/distinguish.vue').default,
    },
    {
      path: '/regSucss',
      name: 'regSucss',
      component: require('../views/registration/regSucss.vue').default,
    },
    {
      path: '/daoWords',
      name: 'daoWords',
      component: require('../views/registration/daoWords.vue').default,
    },
    {
      path: '/daoMoney',
      name: 'daoMoney',
      component: require('../views/registration/daoMoney.vue').default,
    },
    {
      path: '/daoKeys',
      name: 'daoKeys',
      component: require('../views/registration/daoKeys.vue').default,
    },
    // --
    {
      path: '/createWallet',
      name: 'createWallet',
      component: require('../views/createWallet/createWallet.vue').default,
    },
    {
      path: '/jiWords',
      name: 'jiWords',
      component: require('../views/createWallet/jiWords.vue').default,
    },
    {
      path: '/setPassword',
      name: 'setPassword',
      component: require('../views/createWallet/setPassword.vue').default,
    },
    {
      path: '/verificationWords',
      name: 'verificationWords',
      component: require('../views/createWallet/verificationWords.vue').default,
    },
    {
      path: '/warning',
      name: 'warning',
      component: require('../views/createWallet/warning.vue').default,
    },
    // 钱包详情--
    {
      path: '/wallet',
      name: 'wallet',
      component: require('../views/walletDetails/wallet.vue').default,
    },
    {
      path: '/walletDetails',
      name: 'walletDetails',
      component: require('../views/walletDetails/walletDetails.vue').default,
    },
    {
      path: '/choise',
      name: 'choise',
      component: require('../views/walletDetails/choise.vue').default,
    },
    {
      path: '/collection',
      name: 'collection',
      component: require('../views/walletDetails/collection.vue').default,
    },
    {
      path: '/piivateKey',
      name: 'piivateKey',
      component: require('../views/walletDetails/piivateKey.vue').default,
    },
    {
      path: '/transaction',
      name: 'transaction',
      component: require('../views/walletDetails/transaction.vue').default,
    },
    {
      path: '/transactionDeetail',
      name: 'transactionDeetail',
      component: require('../views/walletDetails/transactionDeetail.vue')
        .default,
    },
    {
      path: '/transfer',
      name: 'transfer',
      component: require('../views/walletDetails/transfer.vue').default,
    },

    {
      path: '*',
      redirect: '/',
    },
    {
      path: '/landing-page',
      name: 'landing-page',
      component: require('@/components/LandingPage').default,
    },
  ],
})
