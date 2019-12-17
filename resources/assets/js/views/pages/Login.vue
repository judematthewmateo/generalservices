<style scoped>

.body {
  margin: 0%;
  overflow: hidden;
}
.sec {
  height: 400%;
  color: #ffffff;
  text-align: justify;
  background-attachment: fixed;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;


}
</style>
<template>
<!-- style="background-image: url(images/login/login.jpg); background-position: center; background-repeat: no-repeat;background-size:contain;" -->
<body class="body">
  <section class="sec" style="background-image: url(images/login/login.jpg);">
  <div class="app flex-row align-items-center">
    <div class="container">
      <div class="row justify-content-center">

      <!-- <div style="background: rgb(0, 0, 0); background: rgba(0, 0, 0, 0.3);color: #f1f1f1; padding: 20px; width: 30%;"> -->
       
       <div class="row" style="background: rgb(0, 0, 0); background: rgba(0, 0, 0, 0.3);color: #f1f1f1;padding: 20px; width: 70%; ">

                <div class="col-6"> 
                <h1>Login</h1>
                 <b-form @submit.prevent="authLogin()" @input="login.success = null">
                <p >Sign In to your account</p>
                <div class="input-group mb-3">
                  <span class="input-group-addon"><i class="icon-user"></i></span>
                <b-form-input
                  ref="username" 
                  v-model="login.username"
                  type="text" 
                  placeholder="Username">
                </b-form-input>
                </div>
                <div class="input-group mb-4">
                    <b-form-invalid-feedback>
                    <i class="fa fa-exclamation-triangle text-danger"></i>
                    <span v-if="login.success==false">
                        Incorrect username or password.
                    </span>
                    </b-form-invalid-feedback>

                  <span class="input-group-addon"><i class="icon-lock"></i></span>
                    <b-form-input 
                  v-model="login.password"
                  type="password" 
                  placeholder="Password">
                </b-form-input>
                </div>
                <div class="row">
                  <div class="col-6">       
                    <b-btn :disabled="login.is_saving" type="submit" variant="primary" px-4>
                    
                    Login
                  </b-btn>
                  </div>
                  <div class="col-6 text-right">
                    <button type="button" class="btn btn-link px-0">Forgot password?</button>
                  </div>  
                </div>
                 </b-form>
                </div>
            
            
    
                <div class="col-6">
                    <div class="card-body text-center">
                  <h2>Sign up</h2>
                  <p>Create your account to enjoy the benefits of this system.</p>
                  <button type="button" class="btn btn-primary active mt-3">Register Now!</button>
                   </div>
                </div>
            </div>
    
       </div>
          </div> 
        </div>
  
    </section>
  
</body>


</template>

<script>
export default {
  name: 'Login',
  data(){
    return{
      login: {
        username: null,
        password: null,
        is_saving: false
      }
    }
  },
  methods: {
    authLogin(){
      this.login.is_saving = true
      this.$http.post('api/auth/login', { 
                    username: this.login.username,
                    password: this.login.password
                }).then(response => {
                    this.$store.commit('loginUser')
                    this.$store.commit('user', response.data.user)
                    localStorage.setItem('token', response.data.access_token)
                    this.$notify({
                      type: 'success',
                      group: 'notification',
                      title: 'Success!',
                      text: 'User Authenticated successfully.'
                    })
                    setTimeout(function(){
                      this.$router.push({ name: 'Dashboard' })
                    }.bind(this), 1000)
                    this.login.is_saving = false
      }).catch(err => {
            this.$notify({
              type: 'error',
              group: 'notification',
              title: 'Error!',
              text: 'Incorrect username or password.'
            })
            this.login.is_saving = false
      });
    }
  },
 
}
</script>

