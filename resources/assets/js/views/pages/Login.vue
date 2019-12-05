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
                <p >Sign In to your account</p>
                <div class="input-group mb-3">
                  <span class="input-group-addon"><i class="icon-user"></i></span>
                  <input type="text" class="form-control" placeholder="Username">
                </div>
                <div class="input-group mb-4">
                  <span class="input-group-addon"><i class="icon-lock"></i></span>
                  <input type="password" class="form-control" placeholder="Password">
                </div>
                <div class="row">
                  <div class="col-6">
                    <button type="button" class="btn btn-primary px-4">Login</button>
                  </div>
                  <div class="col-6 text-right">
                    <button type="button" class="btn btn-link px-0">Forgot password?</button>
                  </div>
                </div>
                </div>
            
            
    
                <div class="col-6">
                    <div class="card-body text-center">
                  <h2>Sign up</h2>
                  <p>Create your account to enjoy the benefits of this system.</p>
                  <button type="button" class="btn btn-primary active mt-3" @click="showModalRegister=true">Register Now!</button>
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

   data() {
    return {
   

    }
   }

}
</script>
