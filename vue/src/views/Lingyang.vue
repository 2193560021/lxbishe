<template>
  <div>

    <div>
      <el-row justify="center">
        <div style="overflow:hidden;height: 500px;">
          <img src="../assets/img/pet/dog/wallhaven-ox3l65_1920x1080.png" style="width: 100%;" alt="">
        </div>
        <div  style="width: 75%;margin: 0 auto">
          <el-button @click="handleFabu" style="float: right;margin:20px 100px 0;font-size: 18px;font-weight: bolder" size="large" type="danger">发布救助信息</el-button>
        </div>
        <div style="width: 85%;margin: 15px auto">

          <h2 style="border-bottom: 5px #ec1111 solid;
                      text-align: center;font-weight: bolder;width: 40%;margin: 20px auto">
            流浪修狗
          </h2>
          <el-table :data="tableData_LG" style="width: 100%">
            <el-table-column  prop="img" label="图片" width="130">
              <template #default="scope">
                <el-image
                    style="width: 150px; height: 100px;border-radius: 10px"
                    :src="scope.row.img"/>
              </template>
            </el-table-column>
            <el-table-column prop="name" label="名称" width="110"/>
            <el-table-column prop="gender" label="性别" width="130"/>
            <el-table-column prop="kind" label="所属品种" width="130"/>
            <el-table-column prop="finder" label="发布人" width="130"/>
            <el-table-column prop="tel" label="发布人电话" width="130"/>
            <el-table-column prop="creatTime" label="发布时间" width="130"/>
            <el-table-column prop="address" label="救助地址" width="130"/>
            <el-table-column prop="note" label="备注" width="180"/>
            <el-table-column  width="184" label="查看详情">
            <template #default="scope">
              <el-button size="large" @click="handleOpen(scope.row.name)">详情页面></el-button>
            </template>
          </el-table-column>>
          </el-table>
        </div>


        <div style="width: 85%;height: 800px;margin: 15px auto">
          <h2 style="border-bottom: 5px #ec1111 solid;
                      text-align: center;font-weight: bolder;width: 40%;margin: 20px auto">
            流浪修咪
          </h2>
          <el-table :data="tableData_SC" style="width: 100%">
            <el-table-column  prop="img" label="图片" width="130">
              <template #default="scope">
                <el-image
                    style="width: 90px; height: 90px;border-radius: 10px"
                    :src="scope.row.img"/>
              </template>
            </el-table-column>
            <el-table-column prop="name" label="名称" width="450" />
            <el-table-column prop="type" label="类型" width="100" />
            <el-table-column prop="brand" label="品牌" width="100" />
            <el-table-column prop="price" label="定价(元)" width="100" />
            <el-table-column prop="salePrice" label="售价(元)" width="100" />
            <el-table-column  width="184" label="查看详情"  >
              <template #default="scope">
                <el-button size="large" @click="handleOpen(scope.row.name)">详情页面></el-button>
              </template>
            </el-table-column>>
          </el-table>
        </div>


        <div style="width: 85%;height: 800px;margin: 15px auto">
          <h2 style="border-bottom: 5px #ec1111 solid;
                      text-align: center;font-weight: bolder;width: 40%;margin: 20px auto">
            其他动物
          </h2>
          <el-table :data="tableData_BZ" style="width: 100%">
            <el-table-column  prop="img" label="图片" width="130">
              <template #default="scope">
                <el-image
                    style="width: 90px; height: 90px;border-radius: 10px"
                    :src="scope.row.img"/>
              </template>
            </el-table-column>
            <el-table-column prop="name" label="名称" width="450" />
            <el-table-column prop="type" label="类型" width="100" />
            <el-table-column prop="brand" label="品牌" width="100" />
            <el-table-column prop="price" label="定价(元)" width="100" />
            <el-table-column prop="salePrice" label="售价(元)" width="100" />
            <el-table-column  width="184" label="查看详情"  >
              <template #default="scope">
                <el-button size="large" @click="handleOpen(scope.row.name)">详情页面></el-button>
              </template>
            </el-table-column>>
          </el-table>
        </div>

      </el-row>

      <el-dialog v-model="dialogVisible"
                 title="发布救助信息"
                 top="4vh"
                 width="35%">
        <el-form :model="form" label-width="120px">

          <el-form-item style="text-align: center" label-width="0">
            <el-upload
                class="avatar-uploader"
                action="http://localhost:8080/files/upload"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
                style="margin: 5px auto;width: 80%"
            >
              <img :src="form.img" width="200" height="150" class="avatar " style="border-radius: 10px;">
            </el-upload>
          </el-form-item>

          <el-form-item label="动物名称">
            <el-input v-model="form.name" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="性别">
            <el-input v-model="form.gander" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="所属品种">
            <el-select v-model="form.kind" placeholder="请选择品种" style="width:80%">
              <el-option label="修狗" value="1" />
              <el-option label="修咪" value="2" />
              <el-option label="其他动物" value="3" />
            </el-select>
          </el-form-item>
          <el-form-item label="救助地址">
            <el-input v-model="form.address" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="备注">
            <el-input v-model="form.note" style="width:80%"></el-input>
          </el-form-item>
          <el-input v-model="form.finder" style="width:80%"></el-input>
          <el-input v-model="form.phone" style="width:80%"></el-input>

        </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="danger" @click="save"
            >确认发布</el-button>
          </span>
        </template>
      </el-dialog>
    </div>




  </div>
</template>

<script>
import { Search } from '@element-plus/icons-vue'
import request from "@/utils/request";
import router from "@/router";


export default {
  name: "RefitSearch",
  data(){
    return{
      path:this.$route.path,
      dialogVisible:false,
      form: {},
      tableData_LG:[
      //     {
      //   img:'',
      //   name:'',
      //   type:'',
      //   country:''
      // },{
      //   img:'',
      //   name:'',
      //   type:'',
      //   country:''
      // },{
      //   img:'',
      //   name:'',
      //   type:'',
      //   country:''
      // },{
      //   img:'',
      //   name:'',
      //   type:'',
      //   country:''
      // },{
      //   img:'',
      //   name:'',
      //   type:'',
      //   country:''
      // },{
      //   img:'',
      //   name:'',
      //   type:'',
      //   country:''
      // }

      ],
      tableData_SC:[],
      tableData_BZ:[],
      logos_img:require("../assets/img/car/car_logo/audi.png"),
      pageNum:1,
      pageSize: 100,
      search:'',
    }
  },
  created() {
    this.load()
  },
  methods:{
    loadPage(){
    },
    load(){
      // this.carName = this.$route.query.chineseName
      request.get("/refit",{
        params:{
          pageNum:1,
          pageSize:1000,
          search:this.search
        }
      }).then(res => {
        console.log(res);
        let lg=0,sc=0
        for(let i = 0;i < res.data.records.length;i++){
          if(res.data.records[i].type === ''){
            this.tableData_LG[lg] = res.data.records[i]
            lg++
          }else if(res.data.records[i].type === ''){
            this.tableData_SC[lg] = res.data.records[i]
            lg++
          }else if(res.data.records[i].type === ''){
            this.tableData_BZ[lg] = res.data.records[i]
            lg++
          }
        }
      })
    },
    handleOpen(name){
      this.$router.push({
        path: '/',
        query: {
          name: name
        }
      })
    },
    handleFabu(){
      this.dialogVisible = true
    },
    handleAvatarSuccess(res) {
      this.form.img = res.data
      this.$message.success("上传成功")
      this.update()
    },
  }
}
</script>

<style scoped>
.header_refit_logo{
  width: 47.5%;
  margin: 5px;
  border-radius: 6px;
}

.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
  text-align: center;
}
.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}


.el-row {
  margin-bottom: 20px;
}
.el-row:last-child {
  margin-bottom: 0;
}
.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}


.demo-image .block {
  padding: 30px 0;
  text-align: center;
  border-right: solid 1px var(--el-border-color);
  display: inline-block;
  width: 20%;
  box-sizing: border-box;
  vertical-align: top;
}
.demo-image .block:last-child {
  border-right: none;
}
.demo-image .demonstration {
  display: block;
  color: var(--el-text-color-secondary);
  font-size: 14px;
  margin-bottom: 20px;
}

.el-row {
  margin-bottom: 20px;
}
.el-row:last-child {
  margin-bottom: 0;
}
.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
</style>




