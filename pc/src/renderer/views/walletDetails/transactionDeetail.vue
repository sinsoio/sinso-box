<!--
 *  记录详情
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="transaction">
    <div
      class="text-center padding-tb margin-bottom bor_bottomE6E6 fontSize-28 fontBlod"
    >
      {{ $t('wrd.jiaoyi') }}
    </div>
    <div class="margin-bottom-sm">
      <a class="texts">{{ $t('wrd.jiaoyiId') }}：</a>
      <a class="fontSize-20 fontBlod">{{ item.id }}</a>
    </div>
    <div class="margin-bottom-sm">
      <a class="texts">{{ $t('wrd.qukuai') }}：</a>
      <a class="fontSize-20 ">{{ item.height }}</a>
    </div>
    <div class="margin-bottom-sm">
      <a class="texts">{{ $t('wrd.time') }}：</a>
      <a class="fontSize-20 ">{{ item.time }}</a>
    </div>
    <div class="margin-bottom-sm">
      <a class="texts">{{ $t('wrd.zhuangtai') }}：</a>
      <a class="fontSize-20  succ" v-if="item.status == 1">{{
        $t('wrd.chenggong')
      }}</a>
      <a class="fontSize-20  err" v-else>{{ $t('wrd.shibai') }}</a>
    </div>
    <div class="margin-bottom-sm">
      <a class="texts">from：</a>
      <a class="fontSize-20 ">{{ item.from }}</a>
    </div>
    <div class="margin-bottom-sm">
      <a class="texts">to：</a>
      <a class="fontSize-20 ">{{ item.to }}</a>
    </div>
    <div class="margin-bottom-sm">
      <a class="texts">amounto：</a>
      <a class="fontSize-20 coloBls">{{ item.amounto }} {{ item.brand }}</a>
    </div>
    <div class="margin-bottom-lg">
      <a class="texts">gas：</a>
      <a class="fontSize-20 coloBls">{{ item.gas }} xch</a>
    </div>
    <div class="text-center">
      <el-button
        class=" buttonWidth widthBigButt backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
      >
        {{ $t('wrd.fanhui') }}
      </el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'transactionDeetail',
  components: {},
  props: {},
  data() {
    return {
      item: {},
    }
  },
  computed: {},
  methods: {},
  created() {
    this.item = this.$route.query || {}
  },
  mounted() {},
}
</script>
<style scoped>
.transaction {
  padding: 0px 60px 30px 60px;
}
.texts {
  color: #999999;
  text-align: right;
  display: inline-block;
  width: 100px;
  margin-right: 20px;
}
</style>
