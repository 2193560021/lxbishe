<template>
  <div class="home" style="padding:10px;width: 79%">
    <!-- 功能区域 -->


<!-- 搜索区域 -->
    <div style="margin:10px 0">
      <el-input v-model="name" placeholder="" style="width:20%" clearable />
      <el-button type="danger" style="margin:0 10px" @click="load">搜索</el-button>
      <el-button type="danger" @click="add">新增</el-button>
    </div>

    <el-table :data="tableData" border stripe style="width: 99%">
      <el-empty description="description" />
      <el-table-column prop="img" label="图片" width="160">
        <!--        <img :src="userImg" alt="" width="90" height="90" style="border-radius: 10px">-->

        <template #default="scope">
          <el-image
              style="width: 130px;border-radius: 10px"
              :src="scope.row.img"
          />
        </template>
      </el-table-column>
      <el-table-column prop="name" label="名称" width="180"/>
      <el-table-column prop="date" label="生产日期" width="180"/>
      <el-table-column prop="ddl" label="保质期" width="120"/>
      <el-table-column prop="price" label="价格" width="120"/>
      <el-table-column prop="sale" label="销量" width="120"/>
      <el-table-column prop="stock" label="库存" width="120"/>
      <el-table-column prop="note" label="备注" width="150"/>
      <el-table-column fixed="right" label="操作" width="" >
        <template #default="scope">
          <el-button @click="handleEdit(scope.row)"
            >编辑</el-button
          >
          <!-- <el-button
            size="small"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button> -->
          <el-popconfirm title="确认删除?" type="danger" @confirm="handleDelete(scope.row.id)">
            <template #reference>
              <el-button type="danger">删除</el-button> 
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <div style="margin:10px 0">
      <el-pagination
      v-model:currentPage="currentPage4"
      v-model:page-size="pageSize4"
      :page-sizes="[5,10, 20, 30, 40]"
      :small="small"
      :disabled="disabled"
      :background="background"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    />


      <el-dialog v-model="dialogVisible"
        title="数据"
        width="30%"
      >
      <el-form :model="form" label-width="120px">

        <el-form-item style="text-align: center" label-width="0">
          <el-upload
              class="avatar-uploader"
              action="http://localhost:8080/files/upload"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              style="margin: 5px auto;width: 80%"
          >
            <img :src="form.img" width="90" height="90" class="avatar " style="border-radius: 10px">
          </el-upload>
        </el-form-item>


        <el-form-item label="用户名">
          <el-input v-model="form.name" style="width:80%"></el-input>
        </el-form-item>
        <el-form-item label="手机号码">
          <el-input v-model="form.phone" style="width:80%"></el-input>
        </el-form-item>
        <el-form-item label="身份证">
          <el-input v-model="form.idCard" style="width:80%"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="form.email" style="width:80%"></el-input>
        </el-form-item>
      </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="primary" @click="save"
              >确认</el-button
            >
          </span>
        </template>
      </el-dialog>

    </div>
  </div>
</template>

<script>
import { assertExpressionStatement } from '@babel/types'
import  request  from '@/utils/request'



export default {
  name: 'OrderMan',
  components: {
    
  },
  data() {
    return {
      form:{},
      dialogVisible: false,
      name:'',
      currentPage4:1,
      pageSize4:5,
      total:0,
      tableData:[
        
      ],
      userImg:require("@/assets/img/800014267.jpg")
    }
  },
  created() {
    this.load()
    this.checkLogin()
  },
  methods: {
    load(){
      request.get("/goods",{
        params:{
          pageNumber:this.currentPage4,
          pageSize:this.pageSize4,
          search:this.name
        }
      }).then(res => {
        console.log(res);
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    add(){
      this.dialogVisible = true
      this.form = {}
    },
    save(){
      if(this.form.id){
        request.put("/goods",this.form).then(res => {
          console.log(res)
          if(res.code == 0 ){
            this.$message.success("更新成功")
          }else{
            this.$message.error(res.msg)
          }
          this.load()
        this.dialogVisible = false
        })
      } else{
        request.post("/goods",this.form).then(res => {
          console.log(res)
          if(res.code == 0 ){
            this.$message.success("新增成功")
          }else{
            this.$message.error(res.msg)
          }
          this.load()
        this.dialogVisible = false
        })
      }
    },
    handleEdit(row){
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogVisible = true

    },
    handleDelete(id){
      console.log(id);
      request.delete("/goods/" + id).then(res => {
        if(res.code == 0 ){
            this.$message.success("删除成功")
          }else{
            this.$message.error(res.msg)
          }
        this.load()
      })

    },
    handleSizeChange(pageSize){     //改变每页数量触发
      this.pageSize4 = pageSize
      this.load()
    },
    handleCurrentChange(pageNum){  //改变当前页码触发
      this.currentPage4 = pageNum
      this.load()
    },
    pageSize4(){

    },
    handleAvatarSuccess(res) {
      this.form.img = res.data
      this.$message.success("上传成功")
      this.update()
    },
    update() {
      request.put("/goods", this.form).then(res => {
        console.log(res)
        if (res.code === '0') {
          this.$message({
            type: "success",
            message: "更新成功"
          })
          sessionStorage.setItem("user", JSON.stringify(this.form))
          // 触发Layout更新用户信息
          this.$emit("userInfo")
        } else {
          this.$message({
            type: "error",
            message: res.msg
          })
        }
      })
    },
    checkLogin(){
      request.get("/order",{}).then(res => {
        if(res.code === '-1'){
          this.$router.push("/man/login")
        }
      })
    }
  },
}
</script>
