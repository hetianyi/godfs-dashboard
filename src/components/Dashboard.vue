<template>
  <div>




    <media :query="{minWidth: 801}">
      <mdc-card class="bigger-card">
        <mdc-layout-grid style="width: 100%;">
          <mdc-layout-cell class="cell1" :span="6">
            <table class="sum-table">
              <thead><tr><td></td><td></td></tr></thead>
              <tr><td>Running</td><td>3d</td></tr>
              <tr><td>Trackers</td><td>3</td></tr>
              <tr><td>Files</td><td>113001</td></tr>
              <tr><td>Network I/O IN</td><td>34GB</td></tr>
              <tr><td>Network I/O OUT</td><td>56GB</td></tr>
              <tr><td>Download</td><td>25010</td></tr>
              <tr><td>Upload</td><td>25010</td></tr>
            </table>
          </mdc-layout-cell>
          <mdc-layout-cell class="cell2" :span="6">
            <v-chart :options="data1" class="echarts"/>
            <v-chart :options="data2" class="echarts"/>
          </mdc-layout-cell>
        </mdc-layout-grid>
      </mdc-card>

    </media>

    <!--=======================================================-->


    <media :query="{maxWidth: 800}">
      <div>
        <mdc-card class="smaller-card">
          <mdc-layout-grid style="width: 100%;">
            <mdc-layout-cell class="cell1" :span="12">
              <table class="sum-table">
                <thead><tr><td></td><td></td></tr></thead>
                <tr><td>Running</td><td>3d</td></tr>
                <tr><td>Trackers</td><td>3</td></tr>
                <tr><td>Files</td><td>113001</td></tr>
                <tr><td>Network I/O IN</td><td>34GB</td></tr>
                <tr><td>Network I/O OUT</td><td>56GB</td></tr>
                <tr><td>Download</td><td>25010</td></tr>
                <tr><td>Upload</td><td>25010</td></tr>
              </table>
            </mdc-layout-cell>
          </mdc-layout-grid>
        </mdc-card>


        <mdc-card class="smaller-card">
          <mdc-layout-grid style="width: 100%;">
            <mdc-layout-cell class="cell2" :span="12">
              <v-chart :options="data1" class="echarts"/>
              <v-chart :options="data2" class="echarts"/>
            </mdc-layout-cell>
          </mdc-layout-grid>
        </mdc-card>
      </div>

    </media>



  </div>
</template>

<script>
  import Media from 'vue-media'
  import ECharts from 'vue-echarts'

  export default {
    name: 'Dashboard',
    components: {
      'media': Media,
      'v-chart': ECharts,
    },
    data () {
      return {
        data1: {
          title : {
            text: 'Network traffic I/O',
            subtext: 'Beta',
            x:'center'
          },
          tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
          },
          legend: {
            orient : 'vertical',
            x : 'left',
            y: '60',
            data:['Traffic IN','Traffic OUT']
          },
          toolbox: {
            show : false,
            feature : {
              mark : {show: true},
              dataView : {show: true, readOnly: false},
              magicType : {
                show: true,
                type: ['pie', 'funnel'],
                option: {
                  funnel: {
                    x: '25%',
                    width: '50%',
                    funnelAlign: 'left',
                    max: 1548
                  }
                }
              },
              restore : {show: true},
              saveAsImage : {show: true}
            }
          },
          calculable : true,
          series : [
            {
              name:'Network I/O Traffic',
              type:'pie',
              radius : '55%',
              center: ['50%', '60%'],
              data:[
                {value:335, name:'Traffic IN'},
                {value:310, name:'Traffic OUT'},
              ]
            }
          ]
        },

        data2: {
          title : {
            text: 'Download/Upload',
            subtext: 'Beta',
            x:'center'
          },
          tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
          },
          legend: {
            orient : 'vertical',
            x : 'left',
            y: '60',
            data:['Download','Upload']
          },
          toolbox: {
            show : false,
            feature : {
              mark : {show: true},
              dataView : {show: true, readOnly: false},
              magicType : {
                show: true,
                type: ['pie', 'funnel'],
                option: {
                  funnel: {
                    x: '25%',
                    width: '50%',
                    funnelAlign: 'left',
                    max: 1548
                  }
                }
              },
              restore : {show: true},
              saveAsImage : {show: true}
            }
          },
          calculable : true,
          series : [
            {
              name:'Download/Upload',
              type:'pie',
              radius : '55%',
              center: ['50%', '60%'],
              data:[
                {value:335, name:'Download'},
                {value:310, name:'Upload'},
              ]
            }
          ]
        },

      }
    }
  }
</script>

<style scoped>
  .bigger-card {
    width: 780px;
    margin: 0 auto;
    margin-top: 20px;
  }
  .smaller-card {
    width: auto;
  }

  .sum-table {
    width: 100%;
  }
  .sum-table td {
    text-align: left;
    line-height: 50px;
    border-bottom: 1px dashed #000;
  }

  .cell1 {
    text-align: left;
    /*border: 1px dashed;*/
  }
  .cell2 {
    text-align: right;
    /*border: 1px dashed;*/
  }
  .echarts {
    width: 100%;
    height: 350px;
    display: inline-block;
  }
</style>
