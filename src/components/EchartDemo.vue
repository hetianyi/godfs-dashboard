<template>
  <v-chart :options="polar" class="echarts"/>
</template>

<style>
  .echarts {
    width: 1000px;
    height: 500px;
    display: inline-block;
  }
</style>

<script>
  import ECharts from 'vue-echarts'

  export default {
    components: {
      'v-chart': ECharts
    },
    data: function () {
      let data = [["2000-06-05",116],["2000-06-06",129],["2000-06-07",135],["2000-06-08",86],["2000-06-09",73],["2000-06-10",85],["2000-06-11",73],["2000-06-12",68],["2000-06-13",92],["2000-06-14",130],["2000-06-15",245],["2000-06-16",139],["2000-06-17",115],["2000-06-18",111],["2000-06-19",309],["2000-06-20",206],["2000-06-21",137],["2000-06-22",128],["2000-06-23",85],["2000-06-24",94],["2000-06-25",71],["2000-06-26",106],["2000-06-27",84],["2000-06-28",93],["2000-06-29",85],["2000-06-30",73],["2000-07-01",83],["2000-07-02",125],["2000-07-03",107],["2000-07-04",82],["2000-07-05",44],["2000-07-06",72],["2000-07-07",106],["2000-07-08",107],["2000-07-09",66],["2000-07-10",91],["2000-07-11",92],["2000-07-12",113],["2000-07-13",107],["2000-07-14",131],["2000-07-15",111],["2000-07-16",64],["2000-07-17",69],["2000-07-18",88],["2000-07-19",77],["2000-07-20",83],["2000-07-21",111],["2000-07-22",57],["2000-07-23",55],["2000-07-24",60]];

      var dateList = data.map(function (item) {
        return item[0];
      });
      var valueList = data.map(function (item) {
        return item[1];
      });
      return {
        polar: {
          //标题选项参考：http://echarts.baidu.com/option.html#title
          title: [{
            show: true,//是否显示标题
            text: '实时活动量图',//主标题文本，支持使用 \n 换行。
            link: 'http://www.baidu.com',
            subtext: '你好',//副标题
            left: 200,//标题距离左侧的距离
            top: 0
            //主标题文本超链接。
          }],

          //????????????????????????
          //图例组件。 http://echarts.baidu.com/option.html#legend
          //图例组件展现了不同系列的标记(symbol)，颜色和名字。可以通过点击图例控制哪些系列不显示。
          legend: {
            type : 'plain',//图例的类型
            show : true,
            orient : 'horizontal',
            align : 'right',
            selectedMode : true,//图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
            inactiveColor : '#B1B1B1',
            data: ['系列1']
          },

          //提示框组件。http://echarts.baidu.com/option.html#tooltip
          tooltip: {
            trigger: 'axis',//触发类型。显示起泡提示（跟随鼠标的）
            axisPointer: {//指示器
              type : 'cross',//类型   'line' 直线指示器   'shadow' 阴影指示器    'cross' ：十字准星指示器。其实是种简写，表示启用两个正交的轴的 axisPointer。
              snap : false
            },
            position : ['20%', '30%'],//起泡提示位置
          },
          xAxis: [{
            show: true,
            name: 'X轴',
            data: dateList ,
            splitLine: {show: false}//是否显示水平分割线
          }],
          yAxis: [{
            show: true,
            name: 'Y轴',
            splitLine: {show: true}//是否显示水平分割线
          }],
          grid: [{
            show : false,//是否显示直角坐标系网格。
            left: '10%',//grid 组件离容器左侧的距离
            bottom: '30',//数据网格底部距离画板底部的距离
            containLabel : true,
            backgroundColor : '#F2E4B3',
            borderColor: '#5DCF71',
          }],
          series: [{
            type: 'line',
            showSymbol: true,//是否绘制转折点小圆圈
            data: valueList,
            areaStyle: {}
          }],
          color: ['#2327E2'],//颜色
          backgroundColor: '#F5F5F5',//背景色
          animation: true//绘制时是否显示动画

        }
      }
    }
  }
</script>
