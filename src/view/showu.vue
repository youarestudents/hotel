<template>
  <div class="body1">
    <div class="header">
      <input type="text" v-model="text" @change="find" />
      <el-button type="primary" icon="el-icon-search" @click="find"
        >搜索</el-button
      >
    </div>
<div class="table">
  <el-table
    :data="data1"
    style="width: 100%">

    <el-table-column
      label="id"
      width="180">
      <template slot-scope="scope">
        <span>
          {{ scope.row.id }}
        </span>
    
      </template>
    </el-table-column>
    <el-table-column
      label="房间类型"
      width="180">
      <template slot-scope="scope">
       
        <span style="margin-left: 10px">{{ scope.row.housename  }}</span>
      </template>
    </el-table-column>

    <el-table-column
      label="房间号"
      width="180">
      <template slot-scope="scope">
       
        <span style="margin-left: 10px">{{ scope.row.houseid  }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="租房日期"
      width="180">
      <template slot-scope="scope">
        <i class="el-icon-time"></i>
        <span style="margin-left: 10px">{{ scope.row.cometime|datefmt('YYYY-MM-DD')  }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="到期日期"
      width="180">
      <template slot-scope="scope">
        <i class="el-icon-time"></i>
        <span style="margin-left: 10px">{{ scope.row.gotime|datefmt('YYYY-MM-DD')  }}</span>
      </template>
    </el-table-column>
    
    <el-table-column label="操作">
      <template slot-scope="scope">
        <el-button
          size="mini"
          @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
        <el-button
          size="mini"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
</div>
  
  </div>
</template>
  
  <script>
import axios from "axios";
export default {
  data() {
    return {
      data1: [],
      datax: [],
      count: 0,
      text: "",
    };
  },
  methods: {
    load() {
      this.count = this.data1.length;
    },
    find() {
      var data2 = [];
      var n = 0;
      for (var i = 0; i < this.datax.length; i++) {
        if (
          this.datax[i].houseid == this.text ||
          this.datax[i].housename == this.text || this.datax[i].cometime==this.text || this.datax[i].id==this.text
        ) {
          data2[n] = this.datax[i];
          n++;
        }
      }
      this.data1 = data2;
      if (this.text == "") {
        this.data1 = this.datax;
      }
    },
    handleDelete(index,row){

      axios.post("http://localhost:8081/housedele",{
        houseid:row.houseid
      }
    
    ).then(response=>{
     
      this.data1.splice(index,1)
    })
    }

   
  },
  created() {
    axios.get("http://localhost:8081/houseAll").then((response) => {
      this.data1 = response.data;
      this.datax = response.data;

    });
  },
};
</script>
  
  <style scoped>
.body1 {
  width: 100%;
}
.header {

width: 100%;
height: 100px;
position: relative;
top: 300px;
right: -10%;
}
.table{
  position: relative;
  top: 400px;
  left: 100px;
}


.header input {
  width: 500px;
  height: 35px;
  margin-right: 6px;
  margin-left: 600px;
}
</style>