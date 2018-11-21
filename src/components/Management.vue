<template>
  <div>

    <media :query="{minWidth: 801}">
      <mdc-card class="bigger-card">
        <mdc-layout-grid style="width: 100%;">
          <mdc-layout-cell class="cell1" :span="12">

          </mdc-layout-cell>
        </mdc-layout-grid>
      </mdc-card>

    </media>

    <!--=======================================================-->

    <media :query="{maxWidth: 800}">
      <mdc-card class="smaller-card">
        <mdc-layout-grid style="width: 100%;">
          <mdc-layout-cell class="cell1" :span="12">

          </mdc-layout-cell>
        </mdc-layout-grid>
      </mdc-card>
    </media>

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

      }
    },

    methods: {

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

</style>
