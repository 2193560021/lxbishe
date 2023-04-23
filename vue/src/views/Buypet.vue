<template>
  <div style="margin-top:10px">


    <div style="text-align: center;margin: 10px 0 10px">
      <div style="font-size: 35px;font-weight: bolder;margin: 10px auto;width: 20%;border-bottom: #000 solid 5px">猫猫狗狗</div>
    </div>
    <el-row :gutter="24" style="margin:0 130px">
      <el-col :span="6"  style="">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen()">
<!--                    <img src="../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg" class="image" style="width:250px;height:190px"/>-->
          <div style="overflow: hidden;width:250px;height:160px" >
            <img  src="../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg"  class="image" style="width: 100%;height: 100%;"  alt=""/>
          </div>

          <div style="padding: 14px">
            <span> 可爱猫猫1 </span>
            <span style="float: right;color: #f00">￥1000</span>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6"  style="">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen(item.title)">
          <!--                    <img src="../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg" class="image" style="width:250px;height:190px"/>-->
          <div style="overflow: hidden;width:250px;height:160px" >
            <img  src="../assets/img/pet/849F2062C68EF85D8B0A6D9896A861CA.jpg"  class="image" style="width: 100%;height: 100%;"  alt=""/>
          </div>

          <div style="padding: 14px">
            <span> 可爱猫猫2 </span>
            <span style="float: right;color: #f00">￥1000</span>
          </div>
        </el-card>
      </el-col>



      <el-col :span="6"  style="">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen(item.title)">
          <!--                    <img src="../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg" class="image" style="width:250px;height:190px"/>-->
          <div style="overflow: hidden;width:250px;height:160px" >
            <img  src="../assets/img/pet/812701C8995A48BBBD37E0B9BFBEE971.jpg"  class="image" style="width: 100%;height: 100%;"  alt=""/>
          </div>

          <div style="padding: 14px">
            <span> 可爱猫猫3 </span>
            <span style="float: right;color: #f00">￥1000</span>
          </div>
        </el-card>
      </el-col>



      <el-col :span="6"  style="">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen(item.title)">
          <!--                    <img src="../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg" class="image" style="width:250px;height:190px"/>-->
          <div style="overflow: hidden;width:250px;height:160px" >
            <img  src="../assets/img/pet/B42AD997A8D159E84CD4299A5829A13C.jpg"  class="image" style="width: 100%;height: 100%;"  alt=""/>
          </div>

          <div style="padding: 14px">
            <span> 可爱猫猫4 </span>
            <span style="float: right;color: #f00">￥1000</span>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6"  style="">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen(item.title)">
          <!--                    <img src="../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg" class="image" style="width:250px;height:190px"/>-->
          <div style="overflow: hidden;width:250px;height:160px" >
            <img  src="../assets/img/pet/CC7AB3EC644EB57C92B5FC5A38EAAEE2.jpg"  class="image" style="width: 100%;height: 100%;"  alt=""/>
          </div>

          <div style="padding: 14px">
            <span> 可爱猫猫5 </span>
            <span style="float: right;color: #f00">￥1000</span>
          </div>
        </el-card>
      </el-col>



    </el-row>


    <div style="text-align: center;margin: 10px 0 10px">
      <div style="font-size: 35px;font-weight: bolder;margin: 10px auto;width: 20%;border-bottom: #000 solid 5px">其他宠物</div>
    </div>
    <el-row :gutter="24" style="margin:0 130px">

    </el-row>

    <div style="text-align: center;margin: 10px 0 10px">
      <div style="font-size: 35px;font-weight: bolder;margin: 10px auto;width: 20%;border-bottom: #000 solid 5px">宠物用品</div>
    </div>
    <el-row :gutter="24" style="margin:0 130px">

    </el-row>

    <div style="text-align: center;margin: 10px 0 10px">
      <div style="font-size: 35px;font-weight: bolder;margin: 10px auto;width: 20%;border-bottom: #000 solid 5px">医疗用品</div>
    </div>
    <el-row :gutter="24" style="margin:0 130px">

    </el-row>

  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "CarNews",
  data(){
    return{
      path:this.$route.path,
      carCaseLeft_img:[
        require("../assets/img/car/car_img/car_News/CarNews_1.jpg"),
        require("../assets/img/car/car_img/car_News/CarNews_2.png"),
        require("../assets/img/car/car_img/car_News/CarNews_3.jpg"),
        require("../assets/img/car/car_img/car_News/CarNews_4.jpg")
      ],
      carCaseRight_img:[
        require("../assets/img/car/car_img/car_News/CarNews_right_1.jpg"),
        require("../assets/img/car/car_img/car_News/CarNews_right_2.gif"),

      ],
      showCar:[],

    }
  },
  created() {
    this.load()
  },
  methods:{
    load(){
      request.get("/refitcase",{
        params:{
          pageNum:1,
          pageSize:100,
          search:''
        }
      }).then(res => {
        console.log(res);
        this.showCar = res.data.records
        this.total = res.data.total
      })
    },
    handleOpen(){
      this.$router.push({
        path: '/PetPurchase',

      })
    }
  }
}
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.time {
  font-size: 12px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.button {
  padding: 0;
  min-height: auto;
}

.image {
  width: 100%;
  display: block;
}
</style>