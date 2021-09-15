<!--
 *  钱包详情
 * @author （cgt）
 * @date 2020/7/30
 -->
<template>
  <div class="walletDetails">
    <div class="flex align-center justify-between margin-bottom-sm">
      <div class="fontSize-24 font800">{{ listObj.name }}</div>
      <el-select
        v-model="value"
        :placeholder="$t('wad.shezhi')"
        @change="onChange"
      >
        <el-option
          v-for="item in options"
          :key="item.value"
          :label="item.label"
          :value="item.value"
        >
        </el-option>
      </el-select>
    </div>
    <div class="flex align-center margin-bottom-sm">
      <div class="flexWid margin-right-xs">{{ $t('wad.dizhi') }}:</div>
      <div class="text-ellipsis-1 fontSize-20 wallWidhs">
        {{ listObj.address }}
      </div>
    </div>
    <div class="padding-sm margin-bottom wallBack ">
      <div class="margin-bottom-xs fontSize-14">
        {{ $t('wad.allzichan') }}($)
      </div>
      <div class="fontSize-30 fontBlod blueness">{{ listObj.totalAssets }}</div>
    </div>
    <div
      class="padding-bottom-xs flex justify-between align-cennter margin-bottom-sm  underline"
    >
      <div>{{ $t('wad.zichan') }}</div>
      <el-button
        class=" buttonWidth backJianBuls"
        type="primary"
        round
        @click="ciCli"
        style="width:120px"
      >
        添加
      </el-button>
    </div>
    <div
      v-for="item in listObj.ssetsList"
      :key="item.id"
      class="flex justify-between margin-bottom-sm"
    >
      <div class="flex align-center ">
        <img class="margin-right-xs phImg" :src="item.imgImg" />
        <div class="fontSize-24">{{ item.name }}</div>
      </div>
      <div class="fontSize-22 blueness">{{ item.money }}</div>
    </div>
    <!-- 底部tabBar -->
    <div class="flex justify-between absBott">
      <el-button
        v-for="(item, index) in buttList"
        :key="index"
        class=" buttonWidth "
        :class="index === 0 ? 'backBlus' : 'backJianBuls'"
        type="primary"
        round
        @click="doSave(index)"
      >
        {{ item }}
      </el-button>
    </div>
    <!-- 密码弹框 -->
    <el-dialog
      :title="$t('wad.ismima')"
      :visible.sync="isShow"
      width="580px"
      :show-close="false"
      center
    >
      <el-input
        v-model.trim="password"
        :placeholder="$t('wad.tishi')"
        autocomplete="off"
        show-password
        style="width:420px;"
      ></el-input>
      <div slot="footer" class="text-center margin-bottom-sm">
        <el-button
          class="margin-right-sm wodthButton backBlus"
          type="primary"
          round
          @click="isShow = false"
          >{{ $t('wad.quxiao') }}</el-button
        >
        <el-button
          class="margin-left-sm wodthButton backJianBuls"
          type="primary"
          round
          @click="goPlay"
        >
          {{ $t('wad.queding') }}
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'walletDetails',
  components: {},
  props: {},
  data() {
    return {
      listObj: {}, //总数据
      bigIndex: 0, // 总数据索引值
      isShow: false,
      password: '',
      buttList: [
        `${this.$t('wad.fanhuihome')}`,
        `${this.$t('wad.zhuangzhang')}`,
        `${this.$t('wad.shoukuan')}`,
        `${this.$t('wad.jiaoyi')}`,
      ],
      options: [
        // {
        //   value: '1',
        //   label: '设置',
        // },
        {
          value: '2',
          label: `${this.$t('wad.daochu1')}`,
        },
        {
          value: '3',
          label: `${this.$t('wad.daochu2')}`,
        },
      ],
      value: '',
    }
  },
  computed: {},
  methods: {
    doSave(index) {
      if (index === 0) {
        this.$router.replace({ name: 'wallet' })
      } else if (index === 1) {
        this.$router.push({
          name: 'transfer',
          query: { id: this.id, bigIndex: this.bigIndex },
        })
      } else if (index === 2) {
        this.$router.push({
          name: 'collection',
          query: { address: this.listObj.address },
        })
      } else if (index === 3) {
        this.$router.push({
          name: 'transaction',
          query: { bigIndex: this.bigIndex },
        })
      }
    },
    //选项
    onChange() {
      if (this.value == 2 || this.value == 3) {
        this.isShow = true
      }
    },
    // 密码输入完成
    goPlay() {
      if (!this.password) {
        this.$message.error(`${this.$t('wad.tishi')}`)
        return
      }
      this.$store.commit('DECREMENT_preContShenFen', { num: this.id })
      console.log(this.value)
      this.$router.push({ name: 'warning', query: { value: this.value } })
    },
    // 添加通证
    ciCli() {
      this.$router.push({ name: 'choise', query: { type: 1, id: this.id } })
    },
  },
  created() {
    this.id = this.$route.query.id || 1
    //获取数据
    let list = this.$store.state.Public.create || []
    console.log(list)
    for (let i = 0; i < list.length; i++) {
      if (list[i].createId == this.id) {
        this.listObj = list[i]
        console.log(this.listObj)
        this.bigIndex = i
        return
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
.wallWidhs {
  width: calc(100vw - 160px);
}
.wallBack {
  background-color: #eaf8fd;
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
::v-deep .el-dialog--center .el-dialog__body {
  text-align: center;
}
</style>
