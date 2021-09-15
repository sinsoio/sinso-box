<!--
 *  转账
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="text-center padding-top">
    <el-form
      :model="addForm"
      :rules="formRules"
      ref="addForm"
      class="marlrAuto inputCont"
    >
      <el-form-item :label="$t('wfe.jieshou')" prop="text1" class="saoCont">
        <el-input v-model="addForm.text1" type="text" placeholder="">
          <img
            slot="suffix"
            class="saoImg"
            src="../../assets/home/saoMiao.png"
          />
        </el-input>
      </el-form-item>
      <div class="text-left miaText"><a>*</a>{{ $t('wfe.xuanze') }}</div>
      <div
        class="padding-lr-xs flex align-center justify-between input"
        @click="goChoise"
      >
        <div>
          <div class="flex align-center" v-show="smallObj.id">
            <img class="margin-right-xs phImgs" :src="smallObj.imgImg" />
            <div>{{ smallObj.name }}</div>
          </div>
        </div>
        <i class="el-icon-arrow-right"></i>
      </div>
      <!-- <el-form-item label="选择通行证" prop="text2">
        <el-select v-model="addForm.text2" placeholder="请选择通行证">
          <el-option label="siso" :value="null"></el-option>
          <el-option label="正常" :value="1"></el-option>
          <el-option label="封禁" :value="0"></el-option>
        </el-select>
      </el-form-item> -->
      <el-form-item :label="$t('wfe.zhuanzhang')" prop="text3">
        <el-input
          v-model="addForm.text3"
          type="text"
          placeholder=""
          @input="resultIng"
        >
          <div
            slot="suffix"
            class="coloBls fontSize-16 fontBlod currPointer"
            @click="allCli"
          >
            {{ $t('wfe.all') }}
          </div>
        </el-input>
        <div class="text-left ">
          {{ $t('wfe.yuer') }}：{{ smallObj.money || 0 }}
        </div>
      </el-form-item>
    </el-form>
    <div
      class="flex align-cetner justify-between marlrAuto margin-top margin-bottom-xl backFer"
    >
      <div class="colo999">{{ $t('wfe.shouxu') }}</div>
      <div class="fontSize-20 coloBls">
        <!-- {{ smallObj.name || '' }} -->
        {{ addForm.text4 || 0 }}<a>xch</a>
      </div>
    </div>
    <el-button
      class="margin-left-sm widthBigButt backJianBuls"
      type="primary"
      round
      @click="doSave('sub')"
    >
      取消
    </el-button>
    <el-button
      class="margin-left-sm widthBigButt backJianBuls"
      type="primary"
      round
      @click="doSave"
    >
      {{ $t('wfe.queren') }}
    </el-button>
    <!-- 密码弹框 -->
    <el-dialog
      :title="$t('wfe.ismima')"
      :visible.sync="isShow"
      width="580px"
      :show-close="false"
    >
      <el-input
        v-model.trim="text5"
        :placeholder="$t('wfe.tishi')"
        autocomplete="off"
        show-password
        style="width:420px"
      ></el-input>
      <div slot="footer" class="text-center margin-bottom-sm">
        <el-button
          class="margin-right-sm wodthButton backBlus"
          type="primary"
          round
          @click="isShow = false"
          >{{ $t('wfe.quxiao') }}</el-button
        >
        <el-button
          class="margin-left-sm wodthButton backJianBuls"
          type="primary"
          round
          @click="goPlay"
        >
          {{ $t('wfe.queding') }}
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { nanoid } from 'nanoid'
export default {
  name: 'transfer',
  components: {},
  props: {},
  data() {
    var validatePass = (rule, value, callback) => {
      if (!this.smallObj.name) {
        callback(new Error('请选择通证'))
      } else {
        callback()
      }
    }
    return {
      isShow: false, //密码弹框
      bigIndex: 0,
      addForm: {
        text1: '', // 地址
        text3: '', //转账数据
        text4: 0, //手续费
      },
      text5: '', //密码
      formRules: {
        text1: [
          {
            required: true,
            message: `${this.$t('wfe.text1')}`,
            trigger: 'blur',
          },
        ],
        text3: [
          {
            required: true,
            message: `${this.$t('wfe.text3')}`,
            trigger: 'blur',
          },
          { required: true, validator: validatePass, trigger: 'blur' },
        ],
      },
      // 大索引和小索引
      indexObj: {
        bigIndex: '',
        smallIndex: '',
      },
      smallObj: {}, //通行证数据
    }
  },
  computed: {},
  methods: {
    doSave(type) {
      if (type == 'sub') {
        this.$router.replace({ name: 'walletDetails', query: { id: this.id } })
      } else {
        this.$refs.addForm.validate((valid) => {
          if (valid) {
            let { bigIndex, smallIndex } = this.indexObj
            let moneyAll =
              parseFloat(this.addForm.text3) + parseFloat(this.addForm.text4)
            let money = this.$store.state.Public.create[bigIndex].ssetsList[
              smallIndex
            ].money
            if (moneyAll > money) {
              this.$message.error(`转账金额大于钱包余额!`)
              return
            }
            this.isShow = true
          }
        })
      }
    },

    //转账成功
    goPlay() {
      let { create: list } = this.$store.state.Public
      // let { tranList } = this.$store.state.Public.create[this.bigIndex]
      // if (list[this.indexObj.bigIndex].password != this.text5) {
      //   this.$message.error(`密码不正确`)
      //   return
      // }
      let { bigIndex, smallIndex } = this.indexObj
      // 总金额 - 转账金额 -手续费 = 剩余
      let { text3, text4 = 0 } = this.addForm
      let monAll = list[bigIndex].ssetsList[smallIndex].money
      let totalAssets = list[bigIndex].totalAssets
      list[bigIndex].ssetsList[smallIndex].money = monAll - text3 - text4
      list[bigIndex].totalAssets = totalAssets - text3 - text4

      // 交易记录加数据 能交易的肯定是有数据的
      let tranList = list[bigIndex].tranList || []
      let arr = {
        id: `f6068d33ea789e3fb5e2b2601152b593d7eeb875e6d32${nanoid()}`,
        dealId: 'xch18w3t2****4mdsar2f8h',
        height: this.random(),
        time: this.getDate(new Date()),
        status: 1,
        from: tranList[0].from || 'xch18w3t2****4mdsar2f8h',
        to: this.addForm.text1,
        amounto: this.addForm.text3,
        brand: this.smallObj.name,
        gas: this.addForm.text4,
      }

      tranList = [...tranList, arr]
      list[bigIndex].tranList = tranList
      this.$store.commit('DECREMENT_create', { num: list })

      // this.$store.commit('DECREMENT_brand', {
      //   num: tranList,
      //   bigIndex: this.bigIndex,
      // })
      this.isShow = false
      this.$message.success(`转账成功`)
      this.$router.replace({ name: 'walletDetails', query: { id: this.id } })
      // this.$router.push({ name: 'collection' })
    },
    // 获取当前年月日
    getDate(dt) {
      //获取年
      var year = dt.getFullYear()
      //获取月
      var month = dt.getMonth() + 1
      //获取日
      var day = dt.getDate()
      //获取小时
      var hour = dt.getHours()
      //获取分钟
      var minute = dt.getMinutes()
      //获取秒
      var second = dt.getSeconds()
      month = month < 10 ? '0' + month : month
      day = day < 10 ? '0' + day : day
      hour = hour < 10 ? '0' + hour : hour
      minute = minute < 10 ? '0' + minute : minute
      second = second < 10 ? '0' + second : second
      return (
        year +
        '-' +
        month +
        '-' +
        day +
        ' ' +
        hour +
        ':' +
        minute +
        ':' +
        second
      )
    },
    // 随机5个数字
    random() {
      var Num = ''
      for (var i = 0; i < 6; i++) {
        Num += Math.floor(Math.random() * 10)
      }
      return Num
    },
    // 选择通证 不用keep-alice 传参式回显text1数据
    goChoise() {
      let text1 = this.addForm.text1
      this.$router.push({ name: 'choise', query: { id: this.id, text1 } })
    },
    //输入结果 来算手续费
    resultIng() {
      let { charge } = this.smallObj
      let text3 = parseFloat(this.addForm.text3)
      let text4 = charge * parseFloat(text3.toFixed(4))

      this.addForm.text4 = text4.toFixed(4)
    },
    // 转账全部 还要减手续费
    allCli() {
      if (this.smallObj.id) {
        this.smallObj
        let { money, charge } = this.smallObj
        let sheng = 1 - parseFloat(charge)
        this.addForm.text3 = sheng * money
        this.addForm.text4 = charge * money
      }
    },
    // 防抖
    debounce(fn, delay) {
      let timer = null
      return () => {
        clearTimeout(timer)
        timer = setTimeout(fn, delay)
      }
    },
  },
  created() {
    // 初始化防抖
    this.init = this.debounce(() => {
      this.resultIng()
    }, 500)
    let bigIndex = this.$route.query.bigIndex || 0
    this.bigIndex = parseInt(bigIndex)
    this.id = this.$route.query.id || 1
    this.selectId = this.$route.query.selectId || ''
    this.addForm.text1 = this.$route.query.text1 || ''
    //获取数据里的数据
    let list = this.$store.state.Public.create || []
    for (let i = 0; i < list.length; i++) {
      if (list[i].createId == this.id) {
        this.listObj = list[i]
        this.indexObj.bigIndex = i
        //通行证的一条数据
        for (let i = 0; i < this.listObj.ssetsList.length; i++) {
          if (this.listObj.ssetsList[i].id == this.selectId) {
            this.smallObj = this.listObj.ssetsList[i]
            this.indexObj.smallIndex = i
            return
          }
        }
      }
    }
  },
  mounted() {
    console.log(this)
  },
}
</script>
<style scoped>
.inputCont {
  width: 420px;
}
.input {
  border: 1px solid #dcdfe6;
  height: 40px;
  border-radius: 4px;
}
.inputCont .el-select {
  width: 420px;
}
.miaText {
  font-size: 14px;
  color: #606266;
  line-height: 40px;
}
.miaText a {
  color: #f56c6c;
  margin-right: 4px;
}
.backFer {
  width: 420px;
  padding: 14px;
  background: #f1f1f1;
}
.saoImg {
  width: 20px;
  height: 20px;
}
::v-deep .saoCont .el-input__suffix {
  top: calc(50% - 16px);
  right: -30px;
  cursor: pointer;
}
::v-deep .el-input__suffix {
  right: 10px;
}
.phImgs {
  width: 32px;
  height: 32px;
}
</style>
