<template>
  <div class="app flex-row align-items-center">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card mx-4">
            <div class="card-body p-4">
              <h1>Register</h1>
              <p class="text-muted">Create your account</p>
              <div class="input-group mb-3">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input v-model="login.name" type="text" class="form-control" placeholder="Username">
              </div>

              <div class="input-group mb-3">
                <span class="input-group-addon">@</span>
                <input v-model="login.email" type="text" class="form-control" placeholder="Email">
              </div>

              <div class="input-group mb-3">
                <span class="input-group-addon"><i class="icon-lock"></i></span>
                <input v-model="login.password" type="password" class="form-control" placeholder="Password">
              </div>

              <div class="input-group mb-4">
                <span class="input-group-addon"><i class="icon-lock"></i></span>
                <input v-model="login.password_confirmation" type="password" class="form-control" placeholder="Repeat password">
              </div>

              <button @click="register()" type="button" class="btn btn-block btn-success">Create Account</button>
            </div>
            <div class="card-footer p-4">
              <div class="row">
                <div class="col-6">
                  <button class="btn btn-block btn-facebook" type="button"><span>facebook</span></button>
                </div>
                <div class="col-6">
                  <button class="btn btn-block btn-twitter" type="button"><span>twitter</span></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Register',
  data(){
    return{
      login: {
        name: null,
        email: null,
        password: null,
        password_confirmation: null,
        success: null,
      }
    }
  },
  methods: {
    register(){
      this.$http.post('register', { 
                    name: this.login.name,
                    email: this.login.email,
                    password: this.login.password,
                    password_confirmation: this.login.password_confirmation
                }).then(response => {
                    // this.$store.commit('loginUser')
                    // this.$store.commit('user', response.data.user.original)
                    // localStorage.setItem('token', response.data.access_token)
                    // this.$router.push({ name: 'Dashboard' })
       }).catch(err => {
            this.login.success = false
       });
    }
  }
}
</script>
