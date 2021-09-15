<!--
 *  交易记录
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="transaction">
    <div class="flex align-center padding-bottom-sm margin-bottom-sm borders">
      <p class="margin-right">{{ $t('wtr.riqi') }}:</p>
      <el-date-picker
        v-model="value1"
        type="daterange"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        @change="hhPick"
      >
      </el-date-picker>
    </div>

    <div
      v-for="item in tranList"
      :key="item.id"
      class="margin-bottom radius_10 padding-sm borE6E6"
      @click="goDetail(item)"
    >
      <div class="flex align-center justify-between">
        <div>
          <div class="margin-bottom-sm">
            {{ $t('wtr.jiaoyi') }}：<a class="fontBlod fontSize-20">{{
              item.id
            }}</a>
          </div>
          <div class="flex align-center ">
            <p class="margin-right">
              <a class="margin-right-xs colo999">{{ $t('wtr.zhuangtai') }}:</a
              ><a v-if="item.status == 1" class="succ">{{
                $t('wtr.chenggong')
              }}</a>
              <a v-else class="err">{{ $t('wtr.shibai') }}</a>
            </p>
            <p class="margin-right">
              <a class="colo999">{{ $t('wtr.qukuai') }}：</a
              ><a>{{ item.time }}</a>
            </p>
            <p class="fontSize-18 coloBls">
              amounto：<a class="margin-left-xs"
                >{{ item.isJia || '-' }}{{ item.amounto }} {{ item.brand }}</a
              >
            </p>
          </div>
        </div>
        <i class="el-icon-arrow-right fontSize-18"></i>
      </div>
    </div>
    <div
      v-if="!this.tranList.length && showShow"
      class="colo999 fontSize-12 margin-top text-center"
    >
      暂无交易记录~
    </div>
    <div class="text-center absBott">
      <!-- backJianBuls -->
      <el-button
        class=" buttonWidth widthBigButt backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
      >
        {{ $t('wtr.fanhui') }}
      </el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'transaction',
  components: {},
  props: {},
  data() {
    return {
      value1: '',
      tranList: [],
      bigIndex: 0,
      start: '',
      end: '',
      showShow: false,
    }
  },
  computed: {},
  methods: {
    goDetail(item) {
      this.$router.push({ name: 'transactionDeetail', query: { ...item } })
    },
    hhPick(e) {
      console.log(e)
    },
  },
  created() {
    let bigIndex = this.$route.query.bigIndex || 0
    this.bigIndex = parseInt(bigIndex)
    //获取交易记录数据
    this.tranList =
      this.$store.state.Public.create[this.bigIndex].tranList || []
    this.showShow = true
    // 半个月
    const end = new Date()
    const start = new Date()
    start.setTime(start.getTime() - 3600 * 1000 * 24 * 15)
    this.value1 = [start, end]
  },
  mounted() {},
}
</script>
<style scoped>
.transaction {
  padding: 30px 60px 60px 60px;
  width: 100vw;
  height: 100vh;
  overflow: scroll;
}
.borders {
  border-bottom: 1px solid #e6e6e6;
}

.absBott {
  width: calc(100vw - 120px);
  position: fixed;
  z-index: 100;
  left: 60px;
  bottom: 40px;
  /* background-color: #ffffff; */
}
</style>
