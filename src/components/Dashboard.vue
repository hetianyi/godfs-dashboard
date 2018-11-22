<template>
  <div>


    <media :query="{minWidth: 801}">
      <mdc-card class="bigger-card">
        <mdc-layout-grid style="width: 100%;">
          <mdc-layout-cell class="cell1" :span="6">
            <table class="sum-table">
              <thead><tr><td width="50%"></td><td></td></tr></thead>
              <tr><td>Up</td><td>{{upTime}}</td></tr>
              <tr><td>Tracker</td><td>{{trackerCount}}</td></tr>
              <tr><td>Storage</td><td>{{storageCount}}</td></tr>
              <tr><td>Files</td><td>{{fileCount}}</td></tr>
              <tr><td>Network I/O IN</td><td>{{networkIOin}}</td></tr>
              <tr><td>Network I/O OUT</td><td>{{networkIOout}}</td></tr>
              <tr><td>Download</td><td>{{downloadCount}}</td></tr>
              <tr><td>Upload</td><td>{{uploadCount}}</td></tr>
            </table>
          </mdc-layout-cell>
          <mdc-layout-cell class="cell2" :span="6">
            <v-chart :options="networkIOTraffic" class="echarts"/>
            <v-chart :options="downloadAndUpload" class="echarts"/>
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
                <thead><tr><td width="50%"></td><td></td></tr></thead>
                <tr><td>Up</td><td>{{upTime}}</td></tr>
                <tr><td>Tracker</td><td>{{trackerCount}}</td></tr>
                <tr><td>Storage</td><td>{{storageCount}}</td></tr>
                <tr><td>Files</td><td>{{fileCount}}</td></tr>
                <tr><td>Network I/O IN</td><td>{{networkIOin}}</td></tr>
                <tr><td>Network I/O OUT</td><td>{{networkIOout}}</td></tr>
                <tr><td>Download</td><td>{{downloadCount}}</td></tr>
                <tr><td>Upload</td><td>{{uploadCount}}</td></tr>
              </table>
            </mdc-layout-cell>
          </mdc-layout-grid>
        </mdc-card>


        <mdc-card class="smaller-card">
          <mdc-layout-grid style="width: 100%;">
            <mdc-layout-cell class="cell2" :span="12">
              <v-chart :options="networkIOTraffic" class="echarts"/>
              <v-chart :options="downloadAndUpload" class="echarts"/>
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
  import axios from 'axios'

  export default {
    name: 'Dashboard',
    components: {
      'media': Media,
      'v-chart': ECharts,
    },

    mounted: function() {
      this.refresh()
      window.setInterval(this.refresh, 10000)
    },

    data () {
      return {

        upTime: '-',
        trackerCount: 0,
        storageCount: 0,
        fileCount: 0,
        networkIOin: '-',
        networkIOout: '-',
        downloadCount: 0,
        uploadCount: 0,


        networkIOTraffic: {
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

              ]
            }
          ]
        },

        downloadAndUpload: {
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

              ]
            }
          ]
        },

      }
    },

    methods: {
      refresh(){
        let that = this
        axios.get('/dashboard/index', {})
          .then(function (response) {
            console.log(response)

            that.upTime = response.data.result.up_time
            that.trackerCount = response.data.result.tracker
            that.storageCount = response.data.result.storage
            that.networkIOin = response.data.result.ioin
            that.networkIOout = response.data.result.ioout
            that.downloadCount = response.data.result.downloads
            that.uploadCount = response.data.result.uploads
            that.fileCount = response.data.result.files


            that.networkIOTraffic.series = [{
              name:'Network I/O Traffic',
              type:'pie',
              radius : '55%',
              center: ['50%', '60%'],
              data:[{value:response.data.result.ioin, name:'Traffic IN'}, {value:response.data.result.ioout, name:'Traffic OUT'}]}]
            that.networkIOTraffic.legend = {
              orient : 'vertical',
              x : 'left',
              y: '60',
              data:['Traffic IN','Traffic OUT']
            }
            that.downloadAndUpload.series = [{
              name:'Download/Upload',
              type:'pie',
              radius : '55%',
              center: ['50%', '60%'],
              data:[{value:response.data.result.downloads, name:'Download'}, {value:response.data.result.uploads, name:'Upload'}]}]
            that.downloadAndUpload.legend = {
              orient : 'vertical',
              x : 'left',
              y: '60',
              data:['Download','Upload']
            }
          })
          .catch(function (error) {
            console.log(error)
          })
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
    font-size: 13px;
    font-weight: bold;
    border-bottom: 1px dashed #e8e8e8;
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
