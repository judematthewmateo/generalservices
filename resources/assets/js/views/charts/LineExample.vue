<script>
import { Line } from 'vue-chartjs'

export default Line.extend({
  props: ['data', 'label'],
  mounted () {
    this.renderChart({
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
      datasets: [
        {
          label: this.label,
          backgroundColor: '#f87979',
          data: this.data
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  },
  watch: {
    data: function (data) {
      this._chart.destroy()
      this.renderChart({
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        datasets: [
          {
            label: this.label,
            backgroundColor: '#f87979',
            data: this.data
          }
        ]
      }, {responsive: true, maintainAspectRatio: false})
    }
  },
})
</script>
