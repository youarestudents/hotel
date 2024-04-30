<template>
  <div class="digo">
    <el-form ref="form" label-width="80px">
      <el-form-item label="房子类型">
        <el-select placeholder="请选择活动区域" v-model="form.region">
          <el-option label="大床房" value="大床房"></el-option>
          <el-option label="双人房" value="双人床"></el-option>
          <el-option label="豪华房" value="豪华房"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="租房时间">
        <el-col :span="8">
          <el-date-picker
            type="date"
            placeholder="选择日期"
            v-model="form.date1"
            style="width: 100%"
          ></el-date-picker>
        </el-col>
      </el-form-item>
      <el-form-item label="到期时间">
        <el-col :span="8">
          <el-date-picker
            type="date"
            placeholder="选择日期"
            v-model="form.date2"
            style="width: 100%"
          ></el-date-picker>
        </el-col>
      </el-form-item>
      <el-form-item label="身份证号">
        <el-input v-model="form.id" style="width: 60%"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="dinggou">预约</el-button>
        <el-button>取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      form: {
        region: "",
        date1: "",
        date2: "",
        id: "",
        houseid:0
      },
    };
  },

  methods: {
    dinggou() {
      axios.post("http://localhost:8081/nuseleid",{      
            type1:this.form.region
      }
     ).then(response=>{
         this.houseid=response.data
         console.log(this.houseid)
     })
     setTimeout(()=>{
      axios.post("http://localhost:8081/nhdele",{
        houseid:this.houseid,
        type1:this.form.region
     }).then(response=>{
       console.log(response)
     console.log(this.houseid)
     })
     },1000)
  
setTimeout(()=>{
  axios.post("http://localhost:8081/add", {
          housename: this.form.region,
          cometime: this.form.date1,
          gotime: this.form.date2,
          id: this.form.id,
          houseid:this.houseid
        })
        .then((response) => {
          console.log(response);
          console.log(this.houseid)
        
        
          if (response.status >= 200) {
            alert("预约成功");
            this.form.region=""
            this.form.date1=""
            this.form.date2=""
            this.form.id=""
          }
        });
},2000)
     
    

    },
  },
  mounted() {
    this.form.region = this.$route.query.housename;
    this.form.houseid=this.$route.query.houseid

    
  },
};
</script>

<style scoped>
.digo {
  width: 100%;
  height: 600px;
  margin-left: 2%;
}
</style>