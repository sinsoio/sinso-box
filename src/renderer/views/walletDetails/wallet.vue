<!--
 *  钱包主页
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="coloFFF  padding-lr backsImg">
    <div class="fontBlod fontSize-24 text-center margin-tb">
      {{ $t('wwa.qianbao') }}
    </div>
    <div class="flex flex-wrap">
      <div
        v-for="(item, index) in listList"
        :key="item.id"
        class="margin-bottom-sm padding wallBack"
        :class="(index + 1) % 2 != 0 && 'margin-right-sm'"
        @click="handle(item.createId)"
      >
        <div class="margin-bottom-sm fontSize-20 ">
          {{ item.name }}
        </div>
        <div class="flex align-center">
          <div class="flex flexfrow">{{ $t('wwa.dizhi') }}:</div>
          <a class="text-ellipsis-1 margin-left-xs">{{ item.address }}</a>
        </div>
      </div>
    </div>
    <div class="text-center absBott">
      <!-- backJianBuls -->
      <el-button
        class=" buttonWidth widthBigButt backBlus"
        type="primary"
        round
        @click="$router.replace({ name: 'home' })"
      >
        {{ $t('wwa.fanhui') }}
      </el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'wallet',
  components: {},
  props: {},
  data() {
    return {
      listList: [],
    }
  },
  computed: {},
  methods: {
    handle(id) {
      this.$router.push({ name: 'walletDetails', query: { id } })
    },
  },
  created() {
    //查询钱包
    this.listList = this.$store.state.Public.create || []
  },
  mounted() {},
}
</script>
<style scoped>
.backsImg {
  padding-left: 52px;
  padding-right: 52px;
}
.wallBack {
  width: 440px;
  height: 160px;
  background: url(../../assets/home/back8.png) no-repeat;
  background-size: cover;
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
