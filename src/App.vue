<template>
  <div>
    <!-- <Ushow v-if="userframe"></Ushow> -->
    <Admin v-if="!onof"></Admin>
    <!-- <Manager v-if="mangerframe"></Manager> -->
    <div class="body1" v-if="userframe || mangerframe"> <router-view></router-view></div>
  </div>

</template>

<script>

import Admin from "./components/admin.vue";

export default {
  name: "App",
  components: {
  
    Admin
  
  },

  data() {
    return {
      onof: false,
      userframe:false,
      mangerframe:false
    };
  },

  mounted() {
    this.$bus.$on("touser", (data) => {
      console.log("收到了数据", data);
       if(data==1){
        this.userframe=!this.onof
        this.onof=!this.onof
       }
    });
    this.$bus.$on("tomanager",(data)=>{
      console.log(data)
      if(data==1){
       this.mangerframe=true
       this.onof=!this.onof
      }

    })
  },
};
</script>

<style scoped>
</style>
