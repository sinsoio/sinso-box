<!--
 *  验证助记词
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="text-center padding-top-lg verificationWords">
    <p class="font800 fontSize-22 margin-bottom-sm">
      {{ $t('cve.beifen') }}
    </p>
    <p class="margin-bottom">
      {{ $t('cve.miaoshu') }}
    </p>
    <div class="flex flex-wrap">
      <div
        v-for="(item, index) in fillList"
        :key="item.id"
        class="flex align-center margin-bottom-sm padding-left-xs words "
        :class="{
          marginRights: (index + 1) % 3 != 0,
          inptReds: item.b == true,
        }"
      >
        {{ item.a }}
        <img
          v-if="item.b == true"
          class="currPointer removeImg"
          src="../../assets/home/removeRed.png"
          @click="delCli(index)"
        />
      </div>
    </div>
    <div
      class="flex  align-center padding-left-sm margin-bottom-sm backC"
      v-if="isFlag"
    >
      <img
        class="margin-right-xs smallImg"
        src="../../assets/home/redWarn.png"
      />
      <p>
        {{ $t('cve.cuowu') }}
      </p>
    </div>
    <div class="flex flex-wrap">
      <div
        v-for="(item, index) in confusionList"
        :key="item.id"
        class="flex align-center margin-bottom-sm currPointer nams "
        :class="{
          marginRights: (index + 1) % 4 != 0,
          backRed: item.b == true,
        }"
        @click="voluation(item, index)"
      >
        {{ item.a }}
      </div>
    </div>
    <el-button
      class="margin-bottom-sm  backJianBuls"
      type="primary"
      round
      @click="doSave"
    >
      <a>{{ $t('cve.queren') }}</a>
    </el-button>
  </div>
</template>

<script>
export default {
  name: 'verificationWords',
  components: {},
  props: {},
  data() {
    return {
      text: '',
      indexIn: 0, //模拟
      isFlag: false, // 是否显示错误
      // list: [
      //   { id: 1, a: '1trimethylhexane', b: false },
      //   { id: 2, a: '2trimethylhexane', b: false },
      //   { id: 3, a: '3trimethylhexane', b: false },
      //   { id: 4, a: '4trimethylhexane', b: false },
      //   { id: 5, a: '5trimethylhexane', b: false },
      //   { id: 6, a: '6trimethylhexane', b: false },
      //   { id: 7, a: '7trimethylhexane', b: false },
      //   { id: 8, a: '8trimethylhexane', b: false },
      //   { id: 9, a: '9trimethylhexane', b: false },
      //   { id: 10, a: '10trimethylhexane', b: false },
      //   { id: 11, a: '11trimethylhexane', b: false },
      //   { id: 12, a: '12trimethylhexane', b: false },
      // ], //正式list
      list: [
        { id: 1, a: 'lecture', b: false },
        { id: 2, a: 'cinnamon', b: false },
        { id: 3, a: 'owner', b: false },
        { id: 4, a: 'seminar', b: false },
        { id: 5, a: 'hover', b: false },
        { id: 6, a: 'zero', b: false },
        { id: 7, a: 'humble', b: false },
        { id: 8, a: 'supply', b: false },
        { id: 9, a: 'satoshi', b: false },
        { id: 10, a: 'arm', b: false },
        { id: 11, a: 'galaxy', b: false },
        { id: 12, a: 'love', b: false },
      ], //正式list
      confusionList: [], //混乱list b用于是否选择它
      fillList: [
        { id: 1, a: '', b: false },
        { id: 2, a: '', b: false },
        { id: 3, a: '', b: false },
        { id: 4, a: '', b: false },
        { id: 5, a: '', b: false },
        { id: 6, a: '', b: false },
        { id: 7, a: '', b: false },
        { id: 8, a: '', b: false },
        { id: 9, a: '', b: false },
        { id: 10, a: '', b: false },
        { id: 11, a: '', b: false },
        { id: 12, a: '', b: false },
      ], //要填写的数据 b用于是否爆红
    }
  },
  computed: {},
  methods: {
    //赋值
    voluation(item, index) {
      if (this.confusionList[index].b) {
        for (let i = 0; i < this.fillList.length; i++) {
          if (this.fillList[i].a == item.a) {
            this.fillList[i].a = ''
            this.fillList[i].b = false
            this.confusionList[index].b = false
            this.isFlag = false
            return
          }
        }
      } else {
        for (let i = 0; i < this.fillList.length; i++) {
          if (this.fillList[i].a == '') {
            this.fillList[i].a = this.confusionList[index].a
            this.confusionList[index].b = true
            //赋值时就报错了没有
            if (this.fillList[i].a != this.list[i].a) {
              this.isFlag = true
              this.fillList[i].b = true
            }
            return
          }
        }
      }
    },
    //打乱数据
    randomArr(arr) {
      var len = arr.length
      for (var i = 0; i < len; i++) {
        var randomIndex = Math.floor(Math.random() * (len - i))
        var item = arr[randomIndex]
        arr[randomIndex] = arr[i]
        arr[i] = item
      }
      return arr
    },
    //确认
    doSave() {
      // this.$router.push({ name: 'walletDetails' })
      for (let i = 0; i < this.fillList.length; i++) {
        if (!this.fillList[i].a) {
          this.$message.error(`请全部填写完成!`)
          return
        }
      }
      for (let i = 0; i < this.fillList.length; i++) {
        if (this.fillList[i].a != this.list[i].a) {
          this.fillList[i].b = true
          if (!this.isFlag) {
            this.isFlag = true
          }
        }
        if (i == this.fillList.length - 1 && !this.isFlag) {
          this.$message.success(`验证成功`)
          // 只要有值就去跳转 因为进去home页面全部清空了
          let id = this.$store.state.Public.identification.preShenFen
          this.$router.push({ name: 'walletDetails', query: { id } })
        }
      }
    },
    // 删除x号
    delCli(index) {
      for (let i = 0; i < this.confusionList.length; i++) {
        if (this.confusionList[i].a == this.fillList[index].a) {
          if (this.isFlag) {
            this.isFlag = false
          }

          this.fillList[index].a = ''
          this.fillList[index].b = false
          this.confusionList[i].b = false
        }
      }
    },
  },
  created() {
    let list = [...this.list]
    this.confusionList = this.randomArr(list)
  },
  mounted() {},
}
</script>
<style scoped>
.verificationWords {
  padding-left: 88px;
  padding-right: 88px;
}
.words {
  width: 254px;
  height: 50px;
  border-radius: 10px;
  position: relative;
  border-radius: 4px;
  border: 1px solid #dcdfe6;
}
.removeImg {
  position: absolute;
  width: 50px;
  height: 50px;
  padding: 10px;
  right: -25px;
  top: -25px;
}
::v-deep .inputs input {
  height: 50px;
}
/* ::v-deep .inptReds input {
  border: 1px solid #ff4343;
  border-radius: 4px;
} */
.inptReds {
  border: 1px solid #ff4343;
}
.nams {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 190px;
  height: 44px;
  background: #e7e7e7;
  border-radius: 28px;
}
.backJianBuls {
  width: 180px;
}
.backC {
  background: #f1f1f1;
  color: #ff4343;
  height: 40px;
}
.smallImg {
  width: 24px;
  height: 24px;
}
.backRed {
  background-color: #c3e2ff;
}
.marginRights {
  margin-right: 20px;
}
</style>
