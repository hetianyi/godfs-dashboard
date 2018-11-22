<template>
  <div>

    <media :query="{minWidth: 801}">
      <mdc-card class="bigger-card">
        <mdc-layout-grid style="width: 100%;">
          <mdc-layout-cell class="cell1" :span="12">

            <mdc-fab icon="favorite" @click="openAddTrackerDialog=!openAddTrackerDialog" class="add-tracker-btn"></mdc-fab>
          </mdc-layout-cell>
        </mdc-layout-grid>
      </mdc-card>
    </media>

    <!--=======================================================-->

    <media :query="{maxWidth: 800}">
      <mdc-card class="smaller-card">
        <mdc-layout-grid style="width: 100%;">
          <mdc-layout-cell class="cell1" :span="12">

            <mdc-fab icon="favorite" @click="openAddTrackerDialog=!openAddTrackerDialog" class="add-tracker-btn"></mdc-fab>
          </mdc-layout-cell>
        </mdc-layout-grid>
      </mdc-card>
    </media>


    <mdc-dialog v-model="openAddTrackerDialog"
                title="Add Tracker Server" accept="Ok" cancel="Cancel"
                @accept="doAddTracker" @validate="validateNewTrackerData" :accept-disabled="isThisNotAcceptable">
      <mdc-textfield v-model="newTrackerHost" label="Tracker Host"></mdc-textfield>
      <mdc-textfield v-model="newTrackerPort" label="Tracker Port"></mdc-textfield>
      <mdc-textfield v-model="newTrackerSecret" label="Tracker Secret"></mdc-textfield>
      <mdc-textfield v-model="newTrackerRemark" label="Tracker Remark"></mdc-textfield>
      <br>
      <mdc-radio v-model="newTrackerEnableState" name="newTrackerEnable" label="Enabled" checked></mdc-radio>
      <mdc-radio v-model="newTrackerEnableState" name="newTrackerEnable" label="Disabled"></mdc-radio>
    </mdc-dialog>

  </div>
</template>

<script>
  import Media from 'vue-media'
  import ECharts from 'vue-echarts'
  import axios from 'axios'

  export default {
    name: 'Management',
    components: {
      'media': Media,
      'v-chart': ECharts,
    },

    mounted: function() {

    },

    data () {
      return {
        openAddTrackerDialog: false,

        newTrackerEnableState: "Enabled",
        newTrackerHost: "",
        newTrackerPort: "1024",
        newTrackerSecret: "",
        newTrackerRemark: "",
        isThisNotAcceptable: false,
      }
    },

    methods: {
      validateNewTrackerData({ accept }) {
        let that = this
        if (that.newTrackerHost === '') {
          alert('Please input host')
          return
        }
        if (that.newTrackerPort === '') {
          alert('Please input port')
          return
        }
        if (that.newTrackerSecret === '') {
          alert('Please input secret')
          return
        }
        that.isThisNotAcceptable = true
        axios.post('/dashboard/webtracker/add', {
          host: that.newTrackerHost,
          port: new Number(that.newTrackerPort),
          secret: that.newTrackerSecret,
          remark: that.newTrackerRemark,
          status: that.newTrackerEnableState === 'Enabled' ? 1 : 0,
        })
        .then(function (response) {
          console.log(response)
          if (response.status == 200) {
            if (response.data.code == 200) {
              alert(response.data.message)
              accept()
            } else {
              alert(response.data.message)
            }
          } else {
            alert('add tracker error')
          }
        })
        .catch(function (error) {
          console.log(error)
        })

      },

      doAddTracker() {
        this.isThisNotAcceptable = false
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

  .sum-table td {
    text-align: left;
    line-height: 50px;
    font-size: 13px;
    font-weight: bold;
    border-bottom: 1px dashed #e8e8e8;
  }

  .cell1 {
    text-align: left;
  }

  .add-tracker-btn {
    position: fixed;
    right: 5%;
    bottom: 5%;
  }

</style>
