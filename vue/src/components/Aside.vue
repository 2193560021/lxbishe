<template>
  <div>
      <el-menu
      style="width:200px;min-height:calc(100vh - 50px)"
        :default-active="path"
        router
        class="el-menu-vertical-demo">
<!--        <el-sub-menu index="1">-->
<!--            <template #title>系统管理</template>-->
<!--          </el-sub-menu>-->

        <el-menu-item index="/man/user">
          <span>用户信息</span>
        </el-menu-item>
        <el-menu-item index="/man/brandman">
          <span>品牌信息</span>
        </el-menu-item>
        <el-menu-item index="/man/carman">
          <span>车型信息</span>
        </el-menu-item>
        <el-menu-item index="/man/carleaseman">
          <span>租赁信息</span>
        </el-menu-item>
        <el-menu-item index="/man/orderman">
          <span>订单管理</span>
        </el-menu-item>
        <el-menu-item index="/man/carblogman">
          <span>汽车资讯</span>
        </el-menu-item>
        <el-menu-item index="/man/carstoreman">
          <span>4S店信息</span>
        </el-menu-item>
        <el-menu-item index="/man/refitbrandman">
          <span>改装品牌</span>
        </el-menu-item>
        <el-menu-item index="/man/refitman">
          <span>改件信息</span>
        </el-menu-item>
        <el-menu-item index="/man/refitcaseman">
          <span>改装文章</span>
        </el-menu-item>


      </el-menu>
  </div>
</template>

<script>
export default {
  name:"Aside",
  data(){
      return{
        path:this.$route.path
      }
  },
    created() {
      console.log(this.$route.path)
    }
}
</script>

<style>

</style>