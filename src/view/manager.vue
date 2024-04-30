<template>
  <div>
    <div
      style="
        width: 100%;
        height: 50px;
        background: linear-gradient(#545c64, gray);
      "
    >
      <span
        style="
          text-align: left;
          font-size: 25px;
          color: #fff;
          line-height: 200%;
        "
        >酒店管理系统</span
      >
    </div>
    <div style="width: 30%; display: inline-block">
      <el-row class="tac">
        <el-col :span="12">
          <el-menu
            style="height: 830px"
            :default-active="key"
            class="el-menu-vertical-demo"
            @open="handleOpen"
            @close="handleClose"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
          >
           <router-link to="/mshow" style="text-decoration: none">
            <el-menu-item index="1">
              <template slot="title">
                <i class="el-icon-location"></i>
                <span>首页</span>
              </template>
            </el-menu-item>
          </router-link>
         
        
           
            
            <el-submenu index="4">
        <template slot="title">
          <i class="el-icon-location"></i>
          <span>住房管理</span>
        </template>
        <el-menu-item-group>
          <router-link to="/shuju"  style="text-decoration: none">
            <el-menu-item index="2">
              <i class="el-icon-menu"></i>
              <span slot="title" >查看空房</span>
            </el-menu-item>
          </router-link>
          <router-link to="/showu" style="text-decoration: none">
            <el-menu-item index="3">
              <i class="el-icon-document"></i>
              <span slot="title">查看住户</span>
            </el-menu-item>
          </router-link>
        </el-menu-item-group>
       
       
      </el-submenu>
      
          <router-link to="/ad" style="text-decoration: none;">
            <el-menu-item index="4">
              <i class="el-icon-setting"></i>
              <span slot="title">广告</span>

            </el-menu-item>
          </router-link>
     
          </el-menu>
          
        </el-col>
      </el-row>
    </div>
    <div class="menu">
         <router-view></router-view>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
       key:"1"
    }
  },
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
      this.key=key
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
  },
};
</script>

<style scoped>
.menu {
  display: inline-block;
  width: 70%;

  position: relative;
  top: -750px;
  left: -15%;
}
</style>