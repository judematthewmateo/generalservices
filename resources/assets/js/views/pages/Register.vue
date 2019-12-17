<style>
input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  margin: 0;
}
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

.span {
  border: 0px solid red;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.3);
  box-sizing: border-box;
  color: white;
  display: inline-block;
  padding: 0 30px 0 10px;
  width: 40%;
  margin: 3%;
  height: 30px;
  justify-content: center;
  font-family: Sans-serif;
}
</style>
<template>
  <div class="body">
    <section class="sec" style="background-image: url(images/login/login.jpg);">
      <div class="app flex-row align-items-center">
        <div class="container">
          <div class="row justify-content-center">
            <div
              class="row"
              style="background: rgb(0, 0, 0); background: rgba(0, 0, 0, 0.3);color: #f1f1f1;padding: 20px; width: 50%; "
            >
              <div class="row-1">
                <div class="col">
                  <h1>Register</h1>
                  <p>It’s quick and easy. Enjoy!</p>
                </div>
              </div>
              <div class="row">
                <div class="col-6">
                  <div class="input-group mb-3">
                    <span class="input-group-addon" placeholder="ID NO.">
                      <i class="icon-user-follow"></i>
                    </span>
                    <input
                      disabled
                      class="form-control"
                      placeholder="OLFU - XXXX-XXXX-XXXX"
                      hover
                      title="Auto Generate"
                    />
                  </div>
                  <div class="input-group mb-3">
                    <span class="input-group-addon">#</span>
                    <!-- <input type="number" class="form-control" placeholder="ID NO."> -->
                    <input type="number" class="form-control" placeholder="ID NO." />
                  </div>
                  <div class="input-group mb-3">
                    <span class="input-group-addon">
                      <i class="icon-user"></i>
                    </span>
                    <input type="text" class="form-control" placeholder="First Name" />
                  </div>

                  <div class="input-group mb-3">
                    <span class="input-group-addon">
                      <i class="icon-user"></i>
                    </span>
                    <input type="text" class="form-control" placeholder="Last Name" />
                  </div>

                  <div class="input-group mb-3" style="justify-content: center">
                    <span class="span">
                      <b-form-radio name="some-radios" value="A" style="margin: 3px;">FEMALE</b-form-radio>
                    </span>
                    <span class="span">
                      <b-form-radio name="some-radios" value="B" style="margin: 3px;">MALE</b-form-radio>
                    </span>
                  </div>
                </div>

                <div class="col-6">
                  <div class="input-group mb-3">
                    <span class="input-group-addon">
                      <i class="icon-phone"></i>
                    </span>
                    <input type="number" class="form-control" placeholder="Contact No." />
                  </div>
                  <div class="input-group mb-3">
                    <span class="input-group-addon">
                      <i class="icon-home"></i>
                    </span>
                    <b-form-select


                      placeholder="Department"
                    >
                      <option selected disabled>Please Select Department</option>
                      <option value>A</option>
                      <option value>B</option>
                      <option value>C</option>
                    </b-form-select>
                    <!-- <input type="text" class="form-control" placeholder="Department" /> -->
                  </div>

                  <div class="input-group mb-3">
                    <span class="input-group-addon">
                      <i class="icon-user"></i>
                    </span>
                    <input type="text" class="form-control" placeholder="Username" />
                  </div>

                  <div class="input-group mb-3">
                    <span class="input-group-addon">
                      <i class="icon-lock"></i>
                    </span>
                    <input type="password" class="form-control" placeholder="Password" />
                  </div>

                  <div class="input-group mb-3">
                    <span class="input-group-addon">
                      <i class="icon-lock"></i>
                    </span>
                    <input type="password" class="form-control" placeholder="Repeat password" />
                  </div>
                </div>

                <button type="button" class="btn btn-block btn-success">Create Account</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: "Register"
};
</script>
