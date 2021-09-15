<!--
 *  备份助记词
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="text-center padding-top-lg jiWords">
    <p class="font800 fontSize-22 margin-bottom-sm">{{ $t('cji.beizhu') }}</p>
    <p class="margin-bottom">
      {{ $t('cji.miaoshu') }}
    </p>
    <div class="flex flex-wrap">
      <div
        v-for="(item, index) in list"
        :key="index"
        class="flex align-center padding-left-sm margin-bottom-sm words "
        :class="(index + 1) % 3 != 0 && 'margin-right'"
      >
        {{ item }}
      </div>
    </div>
    <div class="flex  align-center padding-left-sm margin-bottom-sm backC">
      <img
        class="margin-right-xs smallImg"
        src="../../assets/home/smallWar.png"
      />
      <p class="fontSize-12">
        {{ $t('cji.jinggao') }}
      </p>
    </div>
    <el-button
      class="margin-left-sm backJianBuls"
      type="primary"
      round
      @click="doSave"
    >
      <a> {{ $t('cji.wancheng') }}</a>
    </el-button>
  </div>
</template>

<script>
export default {
  name: 'jiWords',
  components: {},
  props: {},
  data() {
    return {
      list: [
        'lecture',
        'cinnamon',
        'owner',
        'seminar',
        'hover',
        'zero',
        'humble',
        'supply',
        'satoshi',
        'arm',
        'galaxy',
        'love',
      ],
    }
  },
  computed: {},
  methods: {
    doSave() {
      this.$router.push({ name: 'verificationWords' })
    },
  },
  created() {},
  mounted() {},
}
</script>
<style scoped>
.jiWords {
  padding-left: 88px;
  padding-right: 88px;
}
.words {
  width: 254px;
  height: 64px;
  border-radius: 10px;
  border: 1px solid #dadada;
}
.backC {
  background: #f1f1f1;
  color: #ffa800;
  height: 40px;
}
.smallImg {
  width: 24px;
  height: 24px;
}
.backJianBuls {
  width: 280px;
}
</style>
