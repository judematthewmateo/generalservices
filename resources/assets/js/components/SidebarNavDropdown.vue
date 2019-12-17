<template>
  <router-link tag="li" class="nav-item nav-dropdown" :to="url" disabled>
    <div class="form-control"><i :class="icon"></i> {{name}}</div>
    <ul class="nav-dropdown-items">
      <slot handleClick()></slot>
    </ul>
  </router-link>
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      default: ''
    },
    url: {
      type: String,
      default: ''
    },
    icon: {
      type: String,
      default: ''
    }
  },
  methods: {
    handleClick (e) {
      e.preventDefault()
      e.target.parentElement.classList.toggle('open')
    }
  }
}
</script>
