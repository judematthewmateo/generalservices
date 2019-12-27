<template>
  <header class="app-header navbar">
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none" type="button" @click="mobileSidebarToggle">&#9776;</button>
    <b-link class="navbar-brand" to="#"></b-link>
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button" @click="sidebarMinimize">&#9776;</button>
    <!-- <b-navbar-nav class="d-md-down-none">
      <b-nav-item class="px-3">Dashboard</b-nav-item>
      <b-nav-item class="px-3">Users</b-nav-item>
      <b-nav-item class="px-3">Settings</b-nav-item>
    </b-navbar-nav> -->
    <b-navbar-nav is-nav-bar class="ml-auto">
      <!-- <b-nav-item class="d-md-down-none">
        <i class="icon-bell"></i><span class="badge badge-pill badge-danger">5</span>
      </b-nav-item>
      <b-nav-item class="d-md-down-none">
        <i class="icon-list"></i>
      </b-nav-item>
      <b-nav-item class="d-md-down-none">
        <i class="icon-location-pin"></i>
      </b-nav-item> -->
      <b-nav-item-dropdown right>
        <template slot="button-content">
          <!-- image -->
          <span class="d-md-down-none">{{$store.state.user.firstname}}</span>
        </template>
        <b-dropdown-item @click="logOut()"><i class="fa fa-lock"></i>Logout</b-dropdown-item>
      </b-nav-item-dropdown>
    </b-navbar-nav>
    <!-- <button class="navbar-toggler aside-menu-toggler d-md-down-none" type="button" @click="asideToggle">&#9776;</button> -->
  </header>
</template>
<script>
export default {
  name: 'c-header',
  methods: {
    logOut(){
      if(localStorage.token) {
        this.$http.get('api/auth/logout', {
              headers: {
                        Authorization: 'Bearer ' + localStorage.getItem('token')
                    }
              }).then(response => {
              localStorage.removeItem('token')
              this.$store.commit('logoutUser')
              this.$router.push({ name: 'Login' })
        }).catch(err => {
            console.log(err)
        });
      }
    },
    sidebarToggle (e) {
      e.preventDefault()
      document.body.classList.toggle('sidebar-hidden')
    },
    sidebarMinimize (e) {
      e.preventDefault()
      document.body.classList.toggle('sidebar-minimized')
    },
    mobileSidebarToggle (e) {
      e.preventDefault()
      document.body.classList.toggle('sidebar-mobile-show')
    },
    asideToggle (e) {
      e.preventDefault()
      document.body.classList.toggle('aside-menu-hidden')
    }
  }
}
</script>
