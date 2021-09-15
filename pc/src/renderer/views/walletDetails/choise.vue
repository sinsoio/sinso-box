<!--
 *  选择通证
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="walletDetails">
    <div class="flex align-center margin-bottom-sm">
      <el-input
        v-model="text"
        type="text"
        class="margin-right-xs inputs"
      ></el-input>
      <el-button type="primary" class="wodthButton">{{
        $t('wch.chaxun')
      }}</el-button>
    </div>
    <div
      v-for="item in listList"
      :key="item.id"
      class="flex justify-between margin-bottom-sm"
    >
      <div class="flex align-center ">
        <img class="margin-right-xs phImg" :src="item.imgImg" />
        <div class="fontSize-24">{{ item.name }}</div>
      </div>
      <div class="flex align-center">
        <!-- <div class="fontSize-22 margin-right-xs blueness">48.5659662</div> -->
        <el-checkbox-group v-model="checkList" @change="handleCheckAllChange">
          <el-checkbox
            :key="item.id"
            :label="item"
            :value="item"
            class="checks"
            text-color="#2778ff"
          >
            {{ item.money || 0 }}
          </el-checkbox>
        </el-checkbox-group>
      </div>
    </div>
    <div class="flex justify-center absBott">
      <!-- backJianBuls -->
      <el-button
        class=" buttonWidth margin-right-sm backBlus"
        type="primary"
        round
        @click="$router.go(-1)"
      >
        {{ $t('wch.fanhui') }}
      </el-button>
      <el-button
        class=" buttonWidth margin-left-sm backJianBuls"
        type="primary"
        round
        @click="doSave"
      >
        {{ $t('wch.queding') }}
      </el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'choise',
  components: {},
  props: {},
  data() {
    return {
      text: '',
      // list: [25.56, 48.5659662, 23.97, 44, 5, 6],
      checkList: [], //选中的数据
      listList: [], //通证数组数据
      type: '',
    }
  },
  computed: {},
  methods: {
    doSave() {
      let { id, checkList = [], text1 } = this
      if (this.type) {
        let list = this.$store.state.Public.create || []
        if (checkList[0].id) {
          list[this.bigIndex].ssetsList = [
            ...list[this.bigIndex].ssetsList,
            ...this.listList,
          ]
          this.$store.commit('DECREMENT_create', { num: list })
        }
        console.log(list)
        this.$router.replace({ name: 'walletDetails', query: { id: this.id } })
      } else {
        //跳转到上一个页面
        this.$router.replace({
          name: 'transfer',
          query: { id, text1, selectId: checkList[0].id || '' },
        })
      }
    },
    // 多选转化为单选
    handleCheckAllChange() {
      if (this.checkList.length >= 2) {
        this.checkList = [this.checkList[this.checkList.length - 1]]
      }
    },
  },
  created() {
    this.id = this.$route.query.id || 1
    this.text1 = this.$route.query.text1 || 1
    // 详情里面进入的
    this.type = this.$route.query.type || ''
    let list = this.$store.state.Public.create || []
    if (this.type) {
      for (let i = 0; i < list.length; i++) {
        if (list[i].createId == this.id && list[i].ssetsList.length < 2) {
          this.bigIndex = i
          this.listList = [
            {
              id: 1,
              name: 'SINSO', //资产名称
              imgImg: 'https://www.sinso.io/static/img/phImgs.png', //资产图片
              money: 0,
              charge: 0.0001, //手续费百分比
            },
          ]
        }
      }
    } else {
      //    获取数据
      for (let i = 0; i < list.length; i++) {
        if (list[i].createId == this.id) {
          this.bigIndex = i
          this.listList = list[i].ssetsList
          return
        }
      }
    }
  },
  mounted() {},
}
</script>
<style scoped>
.walletDetails {
  padding: 30px 60px 60px 60px;
  width: 100vw;
  height: 100vh;
  overflow: scroll;
}
.blueness {
  color: #2778ff;
}
.underline {
  border-bottom: 1px solid #e6e6e6;
}
.phImg {
  width: 40px;
  height: 40px;
}
.buttonWidth {
  width: 160px;
}
.absBott {
  width: calc(100vw - 120px);
  position: fixed;
  z-index: 100;
  left: 60px;
  bottom: 40px;
}
.inputs {
  width: 420px;
}
.checks {
  display: flex;
  align-items: center;
  flex-direction: row-reverse;
}
::v-deep .checks .el-checkbox__label {
  font-size: 24px;

  margin-right: 10px;
}
::v-deep .select {
  color: #2778ff;
}
</style>
