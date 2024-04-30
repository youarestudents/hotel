<template>
  <div class="body1" style="margin-top: 100px">
    <div>
      <br />
      <br />
      <br />
      <br />
      <div class="option2">
        <div id="main2" style="width: 650px; height: 550px"></div>
      </div>

      <div class="option1">
        <div id="main1" style="width: 300px; height: 300px"></div>
      </div>
      <div class="option3">
        <div id="main3" style="width: 300px; height: 300px"></div>
      </div>
    </div>

    <div class="header">
      <div style="text-align: center;background: rgba(255,0,0,0.75);" >
        <span> <b>本周销售</b></span> <br />
        <span style="float: left">净赚：8010元</span><br />
        <span style="float: left">支出：3490元</span>
      </div>
      <div style="text-align: center; background: rgba(0,0,255,0.5)">
        <span> <b>本月销售</b></span> <br />
        <span style="float: left">净赚：8010元</span><br />
        <span style="float: left">支出：3490元</span>
      </div>
      <div style="text-align: center;  ">
        <span> <b>季度销售</b></span> <br />
        <span style="float: left">净赚：8010元</span><br />
        <span style="float: left">支出：3490元</span>
      </div>
      <div style="text-align: center;  background: rgba(255,255,0,0.75)">
        <span> <b>年度销售</b></span> <br />
        <span style="float: left">净赚：8010元</span><br />
        <span style="float: left">支出：3490元</span>
      </div>
    </div>

    <div></div>
  </div>
</template>

<script>
import * as echarts from "echarts";
export default {
  data() {
    return {
     
      option1: {
        tooltip: {
          trigger: "item",
        },
        legend: {
          top: "5%",
          left: "center",
        },
        series: [
          {
            name: "Access From",
            type: "pie",
            radius: ["40%", "70%"],
            avoidLabelOverlap: false,
            label: {
              show: false,
              position: "center",
            },
            emphasis: {
              label: {
                show: true,
                fontSize: 40,
                fontWeight: "bold",
              },
            },
            labelLine: {
              show: false,
            },
            data: [
              { value: 1048, name: "网上住店人数" },
              { value: 735, name: "线下住店" },
              { value: 580, name: "当地住店" },
              { value: 484, name: "外地住店" },
            ],
          },
        ],
      },
      option2: {
        xAxis: {
          type: "category",
          data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            data: [150, 230, 224, 218, 135, 147, 260],
            type: "line",
          },
        ],
      },
      option3: {
        title: {
          subtext: "Fake Data",
          left: "center",
        },
        tooltip: {
          trigger: "item",
        },
        legend: {
          orient: "vertical",
          left: "left",
        },
        series: [
          {
            name: "Access From",
            type: "pie",
            radius: "50%",
            data: [
              { value: 1048, name: "外地销售额" },
              { value: 735, name: "本地销售额" },
              { value: 580, name: "Vip" },
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
              },
            },
          },
        ],
      },
    };
  },
  mounted() {
    var chartDom1 = document.getElementById("main1");
    var myChart1 = echarts.init(chartDom1);

    this.option1 && myChart1.setOption(this.option1);
    var chartDom2 = document.getElementById("main2");
    var myChart2 = echarts.init(chartDom2);
    this.option2 && myChart2.setOption(this.option2);

    var chartDom3 = document.getElementById("main3");
    var myChart3 = echarts.init(chartDom3);
    this.option3 && myChart3.setOption(this.option3);
  },
};
</script>

<style scoped>
.option1 {
  position: relative;
  top: 700px;
  left: 300px;
  display: inline-block;
}
.option2 {
  display: inline-block;
  position: relative;
  top: 650px;
  left: 100px;
}
.option3 {
  display: inline-block;
  position: relative;
  top: 430px;
  /* left:100px; */
}
.header {
  width: 100%;
  /* margin-top: 5%; */
  margin-left: 5%;
  position: relative;
  top: 0px;
}
.header div {
  width: 19%;
  height: 98px;
  /* background: ; */
  display: inline-block;
  margin-left: 5%;
  box-shadow: 5px 5px 5px 0px rgba(0, 0, 0, 0.3);
  /* border: 1px solid black; */
}
</style>