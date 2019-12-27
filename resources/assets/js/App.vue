<template>
    <router-view></router-view>
</template>

<script>
export default {
  name: 'app',
    created() {
        if(localStorage.token) {
            this.$http.get('/api/auth/me', {
                headers: {
                    Authorization: 'Bearer ' + localStorage.getItem('token')
                }
            },
            ).then(response => {
                this.$store.commit('loginUser')
                this.$store.commit('user', response.data)
            }).catch(error => {
                if (error.response.status === 401 || error.response.status === 403) {
                    this.$store.commit('logoutUser')
                    localStorage.setItem('token', '')
                    this.$router.push({name: 'Login'})
                }
            });
            // this.$http.get('/api/session/rights', {
            //     headers: {
            //         Authorization: 'Bearer ' + localStorage.getItem('token')
            //     }
            // }).then( response => {
            //     this.$store.commit('rights', response.data.data)
            // }).catch(error => {
            //     console.log(error)
            // })
        }
    },
}
</script>
<style>
    .mx-datepicker {
        width: 100%;
    }
</style>
<style  lang="sass">
  $fa-font-path: "~font-awesome/fonts/";
  @import "~font-awesome/css/font-awesome.min.css";
  $simple-line-font-path: "~simple-line-icons/fonts/";
  @import "~simple-line-icons/css/simple-line-icons.css";
  @import "~select2/src/scss/core.scss";
  @import "~bootstrap-vue/dist/bootstrap-vue.css";
  @import '~bootstrap/scss/bootstrap.scss';
  @import "~select2-bootstrap4-theme/src/select2-bootstrap4.scss";
</style>
<style lang="scss">
  // Import Main styles for this application
  @import "../scss/style";
</style>
