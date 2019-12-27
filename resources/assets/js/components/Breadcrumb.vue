<template>
  <ol class="breadcrumb">
    <li class="breadcrumb-item" v-for="(item, index) in filter(list)">
      <span class="active">{{ showName(item) }}</span>
      <!-- <router-link :to="item.path" v-else>{{ showName(item) }}</router-link> -->
    </li>
  </ol>
</template>

<script>
export default {
  props: {
    list: {
      type: Array,
      required: true,
      default: () => []
    }
  },
  methods: {
    isLast (index) {
      return index === this.filter(this.list).length - 1
    },
    showName (item) {
      if (item.meta && item.meta.label) {
        console.log(item.meta.label)
        item = item.meta && item.meta.label
      }
      if (item.name) {
        item = item.name
      }
      return item
    },
    filter (list){
      return list.filter(l => 
        l.name != 'Home'
      )
    }
  }
}
</script>
