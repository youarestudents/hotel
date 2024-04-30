<template>
  <div class="serve">
    <h1 style="text-align: center;">服务策略</h1>
    <div class="serve-1">
  <el-form ref="form" :model="form" label-width="80px">
   <el-form-item label="接待服务">
    <el-checkbox-group v-model="form.type">
      <el-checkbox label="停车位预留" name="type"></el-checkbox>
      <el-checkbox label="行李运送" name="type"></el-checkbox>
      <el-checkbox label="引路服务" name="type"></el-checkbox>
    
    </el-checkbox-group>
    
  </el-form-item>
  <br>
  <el-form-item label="客房服务">
    <el-checkbox-group v-model="form.type">
      <el-checkbox label="冷热水的供应" name="type"></el-checkbox>
      <el-checkbox label="洗衣服务" name="type"></el-checkbox>
      <el-checkbox label="客房酒水" name="type"></el-checkbox>
      <el-checkbox label="叫醒服务" name="type"></el-checkbox>
      <el-checkbox label="换洗客房用品" name="type"></el-checkbox>
    </el-checkbox-group>
    
  </el-form-item>
  <br>
  <el-form-item label="餐饮服务">
    <el-checkbox-group v-model="form.type">
      <el-checkbox label="中餐" name="type"></el-checkbox>
      <el-checkbox label="西餐" name="type"></el-checkbox>
      <el-checkbox label="自助餐" name="type"></el-checkbox>
      <el-checkbox label="咖啡" name="type"></el-checkbox>

    </el-checkbox-group>
    <br>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" >提交</el-button>
    <el-button>取消</el-button>
  </el-form-item>
</el-form>
</div>
</div>
</template>

<script>
export default {
  data() {
    return {
      form:{
        type:[]
      }
    }
  },

}
</script>

<style scoped>
.serve{
    width: 100%;
    height: 600px;
    margin-left:2% ;
    
   }
   .serve-1{
    width: 35%;
    margin-left: 30%;
    /* border: 1px solid black; */
   
   }
</style>