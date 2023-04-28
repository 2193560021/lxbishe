<template>
  <div>
    <div class="block text-center">
      <el-carousel height="550px">
        <el-carousel-item v-for="item in car_img" >
          <img :src="item" class="small justify-center" style="width: 100%;"/>
        </el-carousel-item>
      </el-carousel>
    </div>



     <el-row gutter="60" justify="center">
    <el-col
      v-for="item in show_img"
      :key="item"
      :span="6"
      style="margin:20px"
    >
      <el-card :body-style="{ padding: '0px' }">
        <img :src="item.path" class="image" />
        <div style="padding: 14px">
          <span class="unit-text">{{item.message}}</span>
          <div class="bottom">
            <time class="time">{{ currentDate }}</time>
            <el-button text class="button" >Details</el-button>
          </div>
        </div>
      </el-card>
    </el-col>
  </el-row>

  </div>
</template>

<script>
import { ref } from 'vue'
export default {
  name: "Index",
  data(){
    return{
      path:this.$route.path,
      car_img:[
        require("../assets/img/pet/dog/wallhaven-1jymqv_2560x1080.png"),
        require("../assets/img/pet/dog/wallhaven-ox3l65_1920x1080.png"),
        require("../assets/img/pet/dog/20140715112356630.jpg.source.jpg"),
        require("../assets/img/pet/dog/20140715112350436.jpg.source.jpg")
      ],
      show_img:[
        {
          path:require("../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg"),
          message:"可爱猫猫",
        },
         {
          path:require("../assets/img/pet/849F2062C68EF85D8B0A6D9896A861CA.jpg"),
          message:"可爱猫猫",
        },
         {
          path:require("../assets/img/pet/812701C8995A48BBBD37E0B9BFBEE971.jpg"),
          message:"可爱猫猫",
        },
        
        {
          path:require("../assets/img/pet/B42AD997A8D159E84CD4299A5829A13C.jpg"),
          message:"可爱猫猫",
        },

         {
          path:require("../assets/img/pet/CC7AB3EC644EB57C92B5FC5A38EAAEE2.jpg"),
          message:"可爱猫猫",
        },
        {
          path:require("../assets/img/pet/E311D57F60CE95DD8A9E3864A6F56250.jpg"),
          message:"可爱猫猫",
        },
        {
          path:require("../assets/img/pet/EE75D9D769474895E409C3C0015ECF41.jpg"),
          message:"可爱猫猫",
        },
      ],
      right_img:require("../assets/img/car/car_img/car_Index/2.webp"),
      left_img:require("../assets/img/car/car_img/car_Index/1.webp"),
      
    }
  },
  created() {
    console.log(this.$route.path)
  },
  setup(){
    const currentDate = ref(new Date());
    return {
      currentDate,
    }
  }
}
</script>

<style scoped>
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
  color:#57A9FB;
  padding:2px 5px;
}

.image {
  width: 100%;
  display: block;
 
}

.unit-text{
  font-size:14px;
  font-weight: 600;
  font-family:Arial, sans-serif;
}

.show-info{
 
}
.text-info-one{
  color:#6b7785;
  font-family:sans-serif;

}
.text-info-two{
  margin:30px 10px;
  color:#6b7785;
  font-family:sans-serif;
}
</style>