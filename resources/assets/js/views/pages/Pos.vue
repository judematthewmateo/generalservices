<style scoped>
.select2-container--bootstrap4 .select2-selection {
      width: 65%!important;
      margin-left: 7%!important;
  }

.wrapper > div {
  background: #eee;
  padding: 1em;
}

.wrapper {
  display: grid;
  grid-template-columns: 2fr 2fr;
  grid-auto-rows: minmax(50px, auto);
  grid-gap: 1em;
  justify-items: auto;
  align-items: auto;
  align-self: auto;
  overflow: hidden;
}

/* grid for select order button */
.box1 {
  grid-column: 1/2;
  grid-row: 1/4;
  height: 90%;
  border: 1px solid gray;
  width: 101%;
  margin-left: 1px;
  margin-top: 1px;
}
/* grid for Scan/Plu Barcode section */
.box2 {
  grid-column: 2/4;
  height: 103%;
  margin-bottom: -2%;
  margin-left: 0%;
  margin-right: 0.4%;
  border: 1px solid green;
  margin-top: 1px;
  /* width: 96%; */
}

/* grid for placeholder,view table, and amount due section */
.box3 {
  grid-column: 2/4;
  /* grid-row: 1/2; */
  border: 2px solid gray;
  height: 98.8%;
  /* margin-top: -3px; */
  margin-bottom: -2px;
  border: 0.5px solid gray;
  margin-right: 0.5%;
}

/* grid for menu and transaction button section */
.box4 {
  grid-column: 1/4;
  grid-row: 1 span;
  /* height: 184111%; */
  width: 99.7%;
  border: 1px solid gray;
  margin-top: -5.5%;
  margin-left: 1px;
  margin-right: 0.1px;
  height: 180%;
  padding-left: 0%;
}

/* button for select order */
.b {
  white-space: normal;
  height: 113px;
  width: 124.5px;
  border: 1px solid black;
  color: black;
  font-size: 16px;
  cursor: pointer;
  margin-left: 3px;
  margin-bottom: 3px;
  white-space: normal;
}
.b:hover {
  background-color: #999999;
}

.b:disabled,
.b[disabled] {
  border: 1px solid #999999;
  background-color: lightgray;
  white-space: normal;
  color: black;
}

/* for item table */
.tableorder {
  width: 98.5%;
  height: 160px;
  margin-left: 0.6%;
  margin-top: 0.3%;
  margin-bottom: 0%;
  overflow: auto;
}

/*  placeholder button and view botton css */
.placeholderbtn {
  width: 110%;
  height: 20%;
  background-color: blue;
  float: left;
  margin-top: 0px;
  color: black;
}
.placeholderbtn:hover {
  background-color: lightgrey;
  color: black;
}
/* amount transaction ccs*/
/* .amount {
  width: 200%;
  height: 135%;
} */

/* menu button css */
.menubtn {
  background-color: darkolivegreen;
  width: 14.07%;
  height: 45px;
  border: 2px solid gray;
  color: white;
  margin-bottom: 0.5%;
  margin-top: -0.5%;
  white-space: normal;
}
.menubtn-red {
  background-color: red;
  width: 14.07%;
  height: 45px;
  border: 2px solid gray;
  color: white;
  margin-bottom: 0.5%;
  margin-top: -0.5%;
  white-space: normal;
}

.menubtn:disabled,
.menubtn[disabled] {
  border: 1px solid #999999;
  background-color: lightgray;
  white-space: normal;
  color: black;
}
.menubtn-red:disabled,
.menubtn-red[disabled] {
  border: 1px solid #999999;
  background-color: lightgray;
  color: black;
  white-space: normal;
}
.menubtn:hover {
  background-color: lightgray;
  color: black;
}
.menubtn-red:hover {
  background-color: lightgray;
  color: black;
}

/* transaction button css */
.transbtn {
  width: 92px;
  height: 90px;
  margin-left: 0.2%;
  background-color: lightgrey;

  white-space: normal;
}
.transbtn:hover {
  background-color: lightgray;
  color: black;
}

/* Scan PLU/Barcode css */
.barcode {
  margin-left: 10px;
}

/* Text area css */
#textarea {
  width: 110%;
  height: 60%;
  border: 2px solid pink;
}

/* Button images css */
.imgsize {
  height: 35px;
  width: 35px;
}

.input:focus {
  background-color: yellow;
}
.tableamount {
  width: 100%;
  padding: 1px;
}
.border {
  border-bottom: 200px solid white;
}
.row {
  margin-top: 1px;
}
.btnqty {
  width: 70px;
  height: 60px;
  border: 1px solid black;
  color: black;
  background: aqua;
  margin-bottom: 1%;
  /* margin-left: 2%; */
}
.btnqty:hover {
  color: black;
  background: aqua;
  /* margin: 0.5%; */
  /* margin-left: 2%; */
  margin-bottom: 1%;
}
.btnenter {
  width: 217px;
  height: 62px;
  border: 1px solid black;
  color: black;
  background: aqua;
  margin: 0.5%;
  margin-left: 4%;
}
.btnenter:hover {
  color: black;
  background: aqua;
  margin: 0.5%;
  margin-left: 4%;
}
.btnqty1 {
  width: 70px;
  height: 60px;
  border: 1px solid black;
  color: black;
  background: aqua;
  margin-left: 4%;
}
.btnqty1:hover {
  color: black;
  background: aqua;
  margin-left: 4%;
}

.textinput {
  background-color: #eee;
  color: black;
}
.quantity:focus {
  background-color: yellow;
}
.quantity {
  text-align: center;
  width: 100%;
}

.hr {
  border: 0.5px solid black;
  margin-top: -2%;
}
.types {
  margin-left: 5%;
  margin-top: -2%;
}

.typebox {
  margin-top: -2%;
  margin-bottom: 3%;
  text-align: right;
}
.typebox:focus {
  background-color: yellow;
}
.paybtn {
  background-color: aqua;
  border-radius: 0px;
  height: 70.5px;
  width: 31.6%;
  margin-left: 1%;
  margin-top: 1%;
  text-align: center;
  color: red;
  font-family: "Times New Roman", Times, serif;
  font-size: 220%;
  text-shadow: 0.5px 0.5px black;
  font-weight: bold;
}
.enter {
  background-color: aqua;
  border-radius: 0px;
  height: 90px;
  width: 97%;
  margin-left: 3%;
  margin-top: 1%;
  padding: 0%;
  font-family: "Times New Roman", Times, serif;
  font-size: 240%;
  color: red;
  text-shadow: 0.5px 0.5px black;
  font-weight: bold;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  transition: 0.3s;
  border-radius: 0px;
  margin-left: -4%;
  margin-top: 0.5%;
  margin-bottom: 0%;
  height: 37%;
  width: 108%;
}

.cardtype-card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  transition: 0.3s;
  border-radius: 0px;
  padding: 1%;
  margin: 0%;

  width: 108%;
}
.titlelabel {
  font-size: 11px;
  margin-left: 3%;
}
.iconcard {
  background-color: lightgrey;
  margin-top: -2%;
  width: 99%;
  margin-left: 0.1%;
  height: 43px;
  grid-column: 2/4;
}

.checkbox {
  margin-top: 2%;
  margin-left: 86%;
}
.btnplus {
  border: none;
  padding: initial;
  margin-top: -2%;
  background: none;
  margin-left: 3%;
  width: 6%;
  height: 5%;
  transform: rotate(360deg);
}
.btnplus:active::after {
  border: none;
  background: none;
  transform: rotate(360deg);
}
.cardtypelabel {
  margin-left: 3%;
  font-size: 14 px;
  font-family: Arial, Helvetica, sans-serif;
}


</style>

<template>
  <div>
    <notifications group="notification" />
    <div class="wrapper">
      <!--  main div -->
      <div class="box1">
      <b-button-group>
          <!--order select button-->
          <tr>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[0] != undefined ? product_menu[0].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[0])"
              :disabled="product_menu[0]==undefined"
            >{{product_menu[0] != undefined ? product_menu[0].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[1] != undefined ? product_menu[1].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[1])"
              :disabled="product_menu[1]==undefined"
            >{{product_menu[1] != undefined ? product_menu[1].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[2] != undefined ? product_menu[2].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[2])"
              :disabled="product_menu[2]==undefined"
            >{{product_menu[2] != undefined ? product_menu[2].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[3] != undefined ? product_menu[3].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[3])"
              :disabled="product_menu[3]==undefined"
            >{{product_menu[3] != undefined ? product_menu[3].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[4] != undefined ? product_menu[4].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[4])"
              :disabled="product_menu[4]==undefined"
            >{{product_menu[4] != undefined ? product_menu[4].product_name:'N/A'}}</b-button>
            <br />
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[5] != undefined ? product_menu[5].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[5])"
              :disabled="product_menu[5]==undefined"
            >{{product_menu[5] != undefined ? product_menu[5].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[6] != undefined ? product_menu[6].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[6])"
              :disabled="product_menu[6]==undefined"
            >{{product_menu[6] != undefined ? product_menu[6].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[7] != undefined ? product_menu[7].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[7])"
              :disabled="product_menu[7]==undefined"
            >{{product_menu[7] != undefined ? product_menu[7].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[8] != undefined ? product_menu[8].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[8])"
              :disabled="product_menu[8]==undefined"
            >{{product_menu[8] != undefined ? product_menu[8].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[9] != undefined ? product_menu[9].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[9])"
              :disabled="product_menu[9]==undefined"
            >{{product_menu[9] != undefined ? product_menu[9].product_name:'N/A'}}</b-button>
            <br />
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[10] != undefined ? product_menu[10].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[10])"
              :disabled="product_menu[10]==undefined"
            >{{product_menu[10] != undefined ? product_menu[10].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[11] != undefined ? product_menu[11].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[11])"
              :disabled="product_menu[11]==undefined"
            >{{product_menu[11] != undefined ? product_menu[11].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[12] != undefined ? product_menu[12].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[12])"
              :disabled="product_menu[12]==undefined"
            >{{product_menu[12] != undefined ? product_menu[12].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[13] != undefined ? product_menu[13].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[13])"
              :disabled="product_menu[13]==undefined"
            >{{product_menu[13] != undefined ? product_menu[13].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[14] != undefined ? product_menu[14].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[14])"
              :disabled="product_menu[14]==undefined"
            >{{product_menu[14] != undefined ? product_menu[14].product_name:'N/A'}}</b-button>
            <br />
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[15] != undefined ? product_menu[15].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[15])"
              :disabled="product_menu[15]==undefined"
            >{{product_menu[15] != undefined ? product_menu[15].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[16] != undefined ? product_menu[16].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[16])"
              :disabled="product_menu[16]==undefined"
            >{{product_menu[16] != undefined ? product_menu[16].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[17] != undefined ? product_menu[17].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[17])"
              :disabled="product_menu[17]==undefined"
            >{{product_menu[17] != undefined ? product_menu[17].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[18] != undefined ? product_menu[18].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[18])"
              :disabled="product_menu[18]==undefined"
            >{{product_menu[18] != undefined ? product_menu[18].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[19] != undefined ? product_menu[19].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[19])"
              :disabled="product_menu[19]==undefined"
            >{{product_menu[19] != undefined ? product_menu[19].product_name:'N/A'}}</b-button>
            <br />
            <b-button
              v-bind:style="{backgroundColor: product_menu.length != 0 && product_menu[20] != undefined ? product_menu[20].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[20])"
              :disabled="product_menu[20]==undefined"
            >{{product_menu[20] != undefined ? product_menu[20].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[21] != undefined ? product_menu[21].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[21])"
              :disabled="product_menu[21]==undefined"
            >{{product_menu[21] != undefined ? product_menu[21].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[22] != undefined ? product_menu[22].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[22])"
              :disabled="product_menu[22]==undefined"
            >{{product_menu[22] != undefined ? product_menu[22].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[23] != undefined ? product_menu[23].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[23])"
              :disabled="product_menu[23]==undefined"
            >{{product_menu[23] != undefined ? product_menu[23].product_name:'N/A'}}</b-button>
            <b-button
              v-bind:style="{backgroundColor: + product_menu.length != 0 && product_menu[24] != undefined ? product_menu[24].product_backcolor:''}"
              squared
              variant="outline-light"
              class="b"
              @click="menuProduct(product_menu[24])"
              :disabled="product_menu[24]==undefined"
            >{{product_menu[24] != undefined ? product_menu[24].product_name:'N/A'}}</b-button>
          </tr>
     </b-button-group>
      </div>
      <div class="box2">
        <!--Scan PLU/Barcode-->
        <b-row>
          <h5 class="barcode">Scan PLU/Barcode Here:</h5>

          <b-form-input
            id="product_code"
            class="input"
            v-model="filters.products.criteria"
            type="text"
            ref="barcode"
          ></b-form-input>

          <!-- item list -->

          <b-table
            class="tableorder"
            selectable
            select-mode="single"
            responsive
            fixed
            striped
            hover
            smallf
            bordered
            show-empty
            :filter="filters.orderlists.criteria"
            :fields="tables.orderlists.fields"
            :items.sync="tables.orderlists.items"
            @filttered="onFiltered($event, 'products')"
            @row-selected="selectedRow = $event" 
          ></b-table>
        </b-row>
      </div>
      <div class="box3">
        <b-row lg="12">
          <!-- no image data row -->
          <b-col cols="5">
            <b-button squared variant="outline-light" class="placeholderbtn">PLACEHOLDER</b-button>
            <br />
            <b-button squared variant="outline-light" class="placeholderbtn">VIEW TABLE</b-button>

            <img src="images/pos/logo.png" height="200" width="260" />
          </b-col>
          <!--transaction cost-->
          <b-col cols="7">
            <table class="tableamount">
              <tr bgcolor="#000" class="border">
                <td valign="top">
                  <label style="color: white">
                    <b>AMOUNT DUE:</b>
                  </label>
                  <br />
                  <label
                    type="number"
                    style="font-size: 50px; color:yellow"
                    class="float-right"
                  >{{formatNumber(this.getTotalItems)}}</label>
                </td>
              </tr>

              <!-- <th bgcolor="#fff"></th> -->
              <tr bgcolor="#000" class="border">
                <td valign="top">
                  <label style="color: white">
                    <b>TENDERED:</b>
                  </label>
                  <br />
                  <label style="font-size: 50px; color:yellow" class="float-right">0.00</label>
                </td>
              </tr>

              <tr bgcolor="#000" class="border">
                <td valign="top">
                  <label style="color: white">
                    <b>CHANGE:</b>
                  </label>
                  <br />
                  <label style="font-size: 50px; color:yellow" class="float-right">0.00</label>
                </td>
              </tr>
            </table>
          </b-col>
        </b-row>
      </div>
      <div class="box4">
        <!--Menu Button-->
        <b-button
          squared
          variant="outline-light"
          @click="getProduct(menu[0].menu_id)"
          :class="btnprevnext%2 ? 'menubtn':'menubtn-red'"
          :disabled="menu[0]==undefined"
        >{{menu[0]!=undefined?menu[0].menu_name:'N/A'}}</b-button>
        <b-button
          @click="getProduct(menu[1].menu_id)"
          squared
          variant="outline-light"
          :class="btnprevnext%2 ? 'menubtn':'menubtn-red'"
          :disabled="menu[1]==undefined"
        >{{menu[1]!=undefined?menu[1].menu_name:'N/A'}}</b-button>
        <b-button
          @click="getProduct(menu[2].menu_id)"
          squared
          variant="outline-light"
          :class="btnprevnext%2 ? 'menubtn':'menubtn-red'"
          :disabled="menu[2]==undefined"
        >{{menu[2]!=undefined?menu[2].menu_name:'N/A'}}</b-button>
        <b-button
          @click="getProduct(menu[3].menu_id)"
          squared
          variant="outline-light"
          :class="btnprevnext%2 ? 'menubtn':'menubtn-red'"
          :disabled="menu[3]==undefined"
        >{{menu[3]!=undefined?menu[3].menu_name:'N/A'}}</b-button>
        <b-button
          @click="getProduct(menu[4].menu_id)"
          squared
          variant="outline-light"
          :class="btnprevnext%2 ? 'menubtn':'menubtn-red'"
          :disabled="menu[4]==undefined"
        >{{menu[4]!=undefined?menu[4].menu_name:'N/A'}}</b-button>
        <b-button
          @click="getProduct(menu[5].menu_id)"
          squared
          variant="outline-light"
          :class="btnprevnext%2 ? 'menubtn':'menubtn-red'"
          :disabled="menu[5]==undefined"
        >{{menu[5]!=undefined?menu[5].menu_name:'N/A'}}</b-button>
        <b-button
          @click="getProduct(menu[6].menu_id)"
          squared
          variant="outline-light"
          :class="btnprevnext%2 ? 'menubtn':'menubtn-red'"
          :disabled="menu[6]==undefined"
        >{{menu[6]!=undefined?menu[6].menu_name:'N/A'}}</b-button>

        <!--Transaction Button-->
        <b-row>
          <b-button class="transbtn" style="font-size: 10px; color:black; margin-left: 1%;">
            <h3>
              <img src="images/pos/f1.png" class="imgsize" />
            </h3>F1-FOCUS GRID
          </b-button>
          <b-button
            class="transbtn"
            style="font-size: 10px; color:black"
            @click="focusElement('barcode')"
          >
            <h6>
              <img src="images/pos/f2.png" class="imgsize" />
            </h6>F2-SCAN
            <br />BARCODE
          </b-button>
          <b-button
            class="transbtn"
            style="font-size: 10px; color:black"
            @click="showModalProduct=true, selectedRow=[]"
          >
            <h3>
              <img src="images/pos/f3.png" class="imgsize" />
            </h3>F3-BROWSE
            <br />ITEM
          </b-button>
          <b-button class="transbtn" style="font-size: 10px; color:black" @click="removeProduct()">
            <h3>
              <img src="images/pos/f4.png" class="imgsize" />
            </h3>F4-VOID
          </b-button>
          <b-button
            class="transbtn"
            style="font-size: 10px; color:black"
            @click="showModalJournal = true"
          >
            <h3>
              <img src="images/pos/f5.png" class="imgsize" />
            </h3>F5-JOURNAL
          </b-button>
          <b-button
            class="transbtn"
            style="font-size: 10px; color:black"
            @click="showModalPayment = true"
          >
            <h3>
              <img src="images/pos/f6.png" class="imgsize" @click="clearFields('payment'), focusElement('cash')" />
            </h3>F6-PAYMENT
          </b-button>
          <b-button class="transbtn" style="font-size: 10px; color:black">
            <h3>
              <img src="images/pos/f7.png" class="imgsize" />
            </h3>F7-OPEN CASH
            DRAWER
          </b-button>
          <b-button class="transbtn" style="font-size: 10px; color:black">
            <h3>
              <img src="images/pos/f8.png" class="imgsize" />
            </h3>F8-CANCEL
          </b-button>
          <b-button class="transbtn" style="font-size: 10px; color:black">
            <h3>
              <img src="images/pos/f9.png" class="imgsize" />
            </h3>F9-HOLD
            <br />TRANSACTION
          </b-button>
          <b-button class="transbtn" style="font-size: 10px; color:black">
            <h3>
              <img src="images/pos/f10.png" class="imgsize" />
            </h3>F10-DISCOUNT
          </b-button>
          <b-button
            class="transbtn"
            style="font-size: 10px; color:black"
            @click="showModalQuantity=true"
          >
            <h3>
              <img src="images/pos/f11.png" class="imgsize" />
            </h3>F11-QUANTITY
          </b-button>
          <b-button class="transbtn" style="font-size: 10px; color:black">
            <h3>
              <img src="images/pos/f12.png" class="imgsize" />
            </h3>F12-X READING
          </b-button>
          <b-button
            class="transbtn"
            @click="btnprevnext!=1?getMenu(false):''"
            style="font-size: 10px; color:black"
          >
            <h3>
              <i class="fa fa-backward"></i>
            </h3>PREVIOUS
          </b-button>
          <b-button class="transbtn" @click="getMenu(true)" style="font-size: 10px; color:black">
            <h3>
              <i class="fa fa-forward"></i>
            </h3>NEXT
          </b-button>
        </b-row>
      </div>
    </div>
    <div>
      <!-- modal F3 Products -->
      <b-modal size="lg" v-model="showModalProduct" :noCloseOnEsc="true" :noCloseOnBackdrop="true">
        <div slot="modal-title">Product List</div>
        <b-row class="mb-2">
          <!-- row button and search input -->
          <b-col sm="4"></b-col>

          <b-col sm="4">
            <span></span>
          </b-col>

          <b-col sm="4">
            <b-form-input v-model="filters.products.criteria" type="text" placeholder="Search"></b-form-input>
          </b-col>
        </b-row>
        <b-table
          selectable
          select-mode="single"
          responsive
          fixed
          striped
          hover
          small
          bordered
          show-empty
          :filter="filters.products.criteria"
          :fields="tables.products.fields"
          :per-page="paginations.products.perPage"
          :current-page="paginations.products.currentPage"
          :items.sync="tables.products.items"
          @filttered="onFiltered($event, 'products')"
          @row-dblclicked="$refs.quantityaccept.click()"
          @row-selected="selectedRow = $event"
        >
          <!-- table modal products -->
        </b-table>
        <b-row>
          <b-col sm="12" class="my-1">
            <b-pagination
              size="sm"
              align="right"
              v-model="paginations.products.currentPage"
              :per-page="paginations.products.perPage"
              :total-rows="paginations.products.totalRows"
              class="my-0"
            ></b-pagination>
          </b-col>
        </b-row>
        <div slot="modal-footer">
          <!-- <b-button :disabled="forms.department.isSaving" variant="primary" @click="onDepartmentDelete">
                <icon v-if="forms.department.isSaving" name="sync" spin></icon>
                <i class="fa fa-check"></i>
                OK
          </b-button>-->
          <b-button ref="quantityaccept" variant="primary" @click="addProduct">
            <i class="fa fa-check"></i>
            Accept
          </b-button>
          <b-button variant="secondary" @click="showModalProduct=false">Close</b-button>
        </div>
      </b-modal>

      <b-modal
        size="lg"
        id="modal-center"
        centered
        v-model="showModalPayment"
        :noCloseOnEsc="true"
        :noCloseOnBackdrop="true"
        @shown="focusElement('cash')"
      >
        <div slot="modal-title">
          Payment
        
        </div>
        <div>
          <div class="iconcard">
         
            <b-row class="my-1">
              <b-checkbox class="checkbox">Print Receipt</b-checkbox>
            </b-row>
          </div>

          <b-col lg="12">
            <b-row>
              <b-col lg="6">
                <div class="card">
                  <p class="card-header">
                    <center>
                      <b>Type of Payments</b>
                    </center>
                  </p>
                  <div class="card-body">
                    <hr class="hr" />

                    <b-row class="my-1">
                      <b-button class="btnplus" @click="showModalCardtype = true">
                        <img src="images/pos/plus.png" height="20px" width="20px" />
                      </b-button>
                      <label class="types" for="input-small">F1 - Card</label>

                      <vue-autonumeric
                        readonly
                        ref="card_type_id"
                        id="card_type_id"
                    
                        class="typebox"
                        style="margin-left: 34%"
                        :options="{
                                        minimumValue: '0',
                                        maximumValue: '999999999',
                                        emptyInputBehavior:'0',}"
                      ></vue-autonumeric>
                    </b-row>

                    <hr class="hr" />

                    <b-row class="my-1">
                      <b-button class="btnplus" @click="showModalChecktype = true">
                        <img src="images/pos/plus.png" height="20px" width="20px" />
                      </b-button>

                      <label class="types" for="input-small">F2 - Check</label>
                      <vue-autonumeric
                        readonly
                        v-model="forms.payment.fields.check_type_id"
                        class="typebox"
                        style="margin-left: 32%"
                        :options="{
                                        minimumValue: '0', 
                                        maximumValue: '999999',
                                        emptyInputBehavior:'0',}"
                      ></vue-autonumeric>
                    </b-row>
                    <hr class="hr" />

                    <b-row class="my-1">
                      <b-button class="btnplus">
                        <img src="images/pos/plus.png" height="20px" width="20px" />
                      </b-button>
                      <label class="types" for="input-small">F3 - Gift Check</label>

                      <vue-autonumeric
                        readonly
                        v-model="forms.payment.fields.gc_type_id"
                        class="typebox"
                        style="margin-left: 26%"
                        :options="{
                                        minimumValue: '0', 
                                        maximumValue: '999999',
                                        emptyInputBehavior:'0',}"
                      ></vue-autonumeric>
                    </b-row>
                    <hr class="hr" />

                    <b-row class="my-1">
                      <b-button class="btnplus" @click="focusElement('cash')">
                        <img src="images/pos/plus.png" height="20px" width="20px" />
                      </b-button>
                      <label class="types" for="input-small">F4 - Cash</label>

                      <vue-autonumeric
                        v-model="forms.payment.fields.cash"
                        ref="cash"
                        class="typebox"
                        style="margin-left: 33.5%"
                        :options="{
                                        minimumValue: '0', 
                                        maximumValue: '999999999',
                                        emptyInputBehavior:'0',}"
                      ></vue-autonumeric>
                    </b-row>
                    <hr class="hr" />
                  </div>
                </div>
                <div>
                  <b-row>
                    <table class="tableamount">
                      <tr bgcolor="#000" class="border">
                        <td valign="top">
                          <label style="color: white; font-size: 12px">
                            <b>AMOUNT DUE:</b>
                          </label>
                          <br />
                          <label
                            ref="total_amount"
                            id="total_amount"
                            style="font-size: 52px; color:yellow"
                            class="float-right"
                          >{{formatNumber(this.getTotalItems)}}</label>
                        </td>
                      </tr>

                      <!-- <th bgcolor="#fff"></th> -->
                      <tr bgcolor="#000" class="border">
                        <td valign="top">
                          <label style="color: white; font-size: 12px">
                            <b>TENDERED:</b>
                          </label>
                          <br />

                          <label
                            style="font-size: 52px; color:yellow"
                            class="float-right"
                          >{{formatNumber(forms.payment.fields.cash)}}</label>
                        </td>
                      </tr>

                      <tr bgcolor="#000" class="border">
                        <td valign="top">
                          <label style="color: white; font-size: 12px">
                            <b>CHANGE:</b>
                          </label>
                          <br />
                          <label
                            style="font-size: 52px; color:yellow;"
                            class="float-right"
                          >{{formatNumber(forms.payment.fields.cash - getTotalItems)}}</label>
                        </td>
                      </tr>
                    </table>
                  </b-row>
                </div>
              </b-col>

              <b-col lg="6">
                <div>
                  <b-row>
                    <table>
                      <b-button
                        style="margin-left: 3%; margin-top: 0.2%;"
                        class="paybtn"
                        @click="addPayment2(100)"
                      >100</b-button>
                      <b-button style="margin-top: 0.2%;" class="paybtn" @click="addPayment2(50)">50</b-button>
                      <b-button style="margin-top: 0.2%;" class="paybtn" @click="addPayment2(20)">20</b-button>

                      <b-button
                        style="margin-left: 3%;"
                        class="paybtn"
                        @click="addPayment2(1000)"
                      >1,000</b-button>
                      <b-button class="paybtn" @click="addPayment2(500)">500</b-button>
                      <b-button class="paybtn" @click="addPayment2(200)">200</b-button>
                    </table>
                  </b-row>
                  <br />
                  <br />
                  <b-row>
                    <table> 
                      <b-button style="margin-left: 3%;" class="paybtn" @click="addPayment1(7)">7</b-button>
                      <b-button class="paybtn" @click="addPayment1(8)">8</b-button>
                      <b-button class="paybtn" @click="addPayment1(9)">9</b-button>

                      <b-button style="margin-left: 3%;" class="paybtn" @click="addPayment1(4)">4</b-button>
                      <b-button class="paybtn" @click="addPayment1(5)">5</b-button>
                      <b-button class="paybtn" @click="addPayment1(6)">6</b-button>

                      <b-button style="margin-left: 3%;" class="paybtn" @click="addPayment1(1)">1</b-button>
                      <b-button class="paybtn" @click="addPayment1(2)">2</b-button>
                      <b-button class="paybtn" @click="addPayment1(3)">3</b-button>

                      <b-button style="margin-left: 3%;" class="paybtn" @click="addPayment1(0)">0</b-button>
                      <b-button class="paybtn" @click="forms.payment.fields.cash = 0">CLEAR</b-button>
                      <b-button class="paybtn" @click="showModalPayment=false">CANCEL</b-button>

                      <b-button class="enter">ENTER</b-button>
                    </table>
                  </b-row>
                </div>
              </b-col>
            </b-row>
          </b-col>
        </div>
        <div slot="modal-footer"></div>
      </b-modal>

      <!-- modal Product Quantity -->
      <b-modal

        id="modal-center"
        centered
        v-model="showModalQuantity"
        :noCloseOnEsc="true"
        :noCloseOnBackdrop="true"
        @shown="focusElement('product_quantity')"
        @keyup.enter.native="acceptQuantity()"
      >
        <div slot="modal-title">
          <h6>Product Quantity</h6>
        </div>
        <b-row>
          <b-col lg="12">
            <div>
              <b-row no-gutters>
                <b-col lg="6 ">
                  <br />

                  <h5>
                    <center>{{forms.quantity.fields.product_name}}</center>
                  </h5>
                  <hr class="hr" />
                  <br />

                  <label>Product Code :</label>

                  <b-form-input
                    class="textinput"
                    size="default"
                    readonly
                    style="text-align:right"
                    ref="product_code"
                    id="product_code"
                    v-model="forms.quantity.fields.product_code"
                  ></b-form-input>

                  <label for="input-deafult">Prev.Quantity :</label>
                  <b-form-input
                    class="textinput"
                    id="input-default"
                    style="text-align:right"
                    readonly
                    v-model="forms.quantity.fields.prev_quantity"
                  ></b-form-input>
                  <label>Product Cost :</label>
                  <b-form-input
                    class="textinput"
                    style="text-align:right"
                    readonly
                    ref="product_rate"
                    id="product_rate"
                    v-model="forms.quantity.fields.product_rate"
                  ></b-form-input>
                  <h6>
                    <br />
                    <center>Please input quantity :</center>
                  </h6>

                  <vue-autonumeric
                    class="quantity"
                    ref="product_quantity"
                    id="product_quantity"
                    v-model="forms.quantity.fields.product_quantity"
                    style="height:49px; font-size:49px; width:97.5%; margin-left: 1%;"
                    :options="{
                          minimumValue: '0',
                          maximumValue: '999999',
                          emptyInputBehavior:'0',
                          decimalPlaces: 0}"
                  ></vue-autonumeric>
                </b-col>

                <b-col lg="6">
                  <b-button
                    squared
                    variant="outline-light"
                    class="btnqty1"
                    @click="addQuantity(7)"
                  >7</b-button>
                  <b-button squared variant="outline-light" class="btnqty" @click="addQuantity(8)">8</b-button>
                  <b-button squared variant="outline-light" class="btnqty" @click="addQuantity(9)">9</b-button>
                  <b-button
                    squared
                    variant="outline-light"
                    class="btnqty1"
                    @click="addQuantity(4)"
                  >4</b-button>
                  <b-button squared variant="outline-light" class="btnqty" @click="addQuantity(5)">5</b-button>
                  <b-button squared variant="outline-light" class="btnqty" @click="addQuantity(6)">6</b-button>
                  <b-button
                    squared
                    variant="outline-light"
                    class="btnqty1"
                    @click="addQuantity(1)"
                  >1</b-button>
                  <b-button squared variant="outline-light" class="btnqty" @click="addQuantity(2)">2</b-button>
                  <b-button squared variant="outline-light" class="btnqty" @click="addQuantity(3)">3</b-button>
                  <b-button
                    squared
                    variant="outline-light"
                    class="btnqty1"
                    @click="addQuantity(0)"
                  >0</b-button>
                  <b-button
                    squared
                    variant="outline-light"
                    class="btnqty"
                    @click="forms.quantity.fields.product_quantity = 0"
                  >CLEAR</b-button>
                  <b-button
                    squared
                    variant="outline-light"
                    class="btnqty"
                    @click="showModalQuantity = false"
                  >CANCEL</b-button>
                  <b-button
                    squared
                    variant="outline-light"
                    ref="quantity_enter"
                    class="btnenter"
                    @click="acceptQuantity"
                  >ENTER</b-button>
                </b-col>
              </b-row>
            </div>
          </b-col>
        </b-row>

        <div slot="modal-footer">
          <!-- <b-button variant="primary" @click="acceptQuantity">
            <i class="fa fa-check"></i>
            Accept
          </b-button>
          <b-button variant="secondary" @click="showModalQuantity = false">Close</b-button>-->
        </div>
      </b-modal>

      <!-- modal F5 Journal -->
      <b-modal v-model="showModalJournal" :noCloseOnEsc="true" :noCloseOnBackdrop="true">
        <div slot="modal-title">JOURNAL</div>

        <div slot="modal-footer">
          <!-- <b-button :disabled="forms.department.isSaving" variant="primary" @click="onDepartmentDelete">
                <icon v-if="forms.department.isSaving" name="sync" spin></icon>
                <i class="fa fa-check"></i>
                OK
          </b-button>-->
          <b-button variant="secondary" @click="showModalJournal=false">Close</b-button>
        </div>
      </b-modal>
      <b-modal id="modal-center" 
     
      centered 
      v-model="showModalCardtype" 
      :noCloseOnEsc="true" 
      :noCloseOnBackdrop="true">
        <div slot="modal-title">
          <h6>Add/Edit Card Payment</h6>
        </div>
        <b-row>
         
              
                <div class="cardtype-card">
                  <p class="card-header">
                    <center>
                      <b>Payment Information</b>
                    </center>
                  </p>
                  <br>
                  <b-form-group>
                    <label for="input-deafult" class="cardtypelabel">
                      <b>Card Holder Name :</b>
                    </label>
                    <b-row>
                      <b-col lg=1></b-col>
                      <b-col lg=10>
                        <b-form-input id="input-default"></b-form-input>
                      </b-col>
                      <b-col lg=1></b-col>
                    </b-row>
                  </b-form-group>
                 
                  <b-form-group>
                    <label class="cardtypelabel">
                      <b>Card Type :</b>
                    </label>
                    <b-row>
                      <b-col lg=1></b-col>
                      <b-col lg=9>
                         <select2
                                style="width: 55%; margin-left: 7%;"
                                ref="card_type_id"
                                :allowClear="false"
                                :placeholder="'Select Card Type'"
                                v-model="forms.payment.fields.card_type_id">
                                    <option v-for="right in options.cardtypes.items"
                                    :key="right.card_type_id" 
                                    :value="right.card_type_id">
                                    {{right.card_type_name}}

                                    </option>
                                </select2>
                      </b-col>
                      <b-col lg=2></b-col>
                      
                    </b-row>
                    
                    </b-form-group>
                 
                  <b-form-group>
                    <label for="input-deafult" class="cardtypelabel">
                      <b>Card No. :</b>
                    </label>
                    <b-row>
                      <b-col lg=1></b-col>
                      <b-col lg=9>
                        <b-form-input></b-form-input>
                      </b-col>
                      <b-col lg=2></b-col>
                    </b-row>
                  </b-form-group>
                  <b-form-group>
                
                    <label for="input-deafult" class="cardtypelabel">
                      <b>Approval No. :</b>
                    </label>
                    <b-row>
                      <b-col lg=1></b-col>
                      <b-col lg=9>
                        <b-form-input></b-form-input>
                      </b-col>
                      <b-col lg=2></b-col>
                    </b-row>
                  </b-form-group>
                  <b-form-group>
                    <label for="input-deafult" class="cardtypelabel">
                      <b>Amount :</b>
                    </label>
                    <b-row>
                      <b-col lg=1></b-col>
                      <b-col lg=9>
                        <vue-autonumeric
                        style="width: 50%;"
                          class="form-control text-right"
                          :options="{
                                            minimumValue: '0',
                                            maximumValue: '999999999',
                                            emptyInputBehavior:'0',}"
                        ></vue-autonumeric>
                      </b-col>
                      <b-col lg=2></b-col>
                    </b-row>
                  </b-form-group>
                </div>
             
            
        </b-row>
        <div slot="modal-footer">
          <b-button variant="primary" @click="acceptQuantity">
            <i class="fa fa-check"></i>
            Accept
          </b-button>
          <b-button variant="secondary" @click="showModalCardtype = false">Close</b-button>
        </div>
      </b-modal>

    <!-- <b-modal
      id="modal-center" 
      centered 
      v-model="showModalCardtype" 
      :noCloseOnEsc="true" 
      :noCloseOnBackdrop="true">
        <div slot="modal-title">
          <h6>Add/Edit Check Payment</h6>
        </div>

          <div class="cardtype-card">
                  <p class="card-header">
                    <center>
                      <b>Payment Information</b>
                    </center>
                  </p>
                  <br>
          </div>

        <div slot="modal-footer">
          <b-button variant="primary" @click="acceptQuantity">
            <i class="fa fa-check"></i>
            Accept
          </b-button>
          <b-button variant="secondary" @click="showModalCardtype = false">Close</b-button>
        </div>

    </b-modal> -->

    </div>
  </div>
  <!-- <div class="button5">button5</div> -->
</template>	
<script>
export default {
  data() {
    return {
      selectedRow: [],
      btnprevnext: 1,
      showModalPayment: false,
      showModalJournal: false,
      showModalProduct: false,
      showModalQuantity: false,
      showModalCardtype: false,
      showModalChecktype: false,

      // showModalMenu: false,

      forms: {
        pos: {
          fields: {
            product_code: null,
            total_amount_due: 0
          }
        },
        quantity: {
          fields: {
            product_code: null,
            product_rate: null,
            prev_quantity: null,
            product_quantity: null,
            product_name: null
          }
        },
        payment: {
          fields: {
            cash: 0
          }
        }
      },

      tables: {
        orderlists: {
          fields: [
            {
              key: "product_name",
              label: "Item Name",
              thStyle: { width: "200px" },
              tdClass: "align-left",
              sortable: true
            },
            {
              key: "unit_name",
              label: "Unit",
              tdClass: "align-left",
              thStyle: { width: "70px" },
              sortable: true
            },

            {
              key: "product_rate",
              label: "Unit Price",
              tdClass: "text-right",
              thClass: "text-right",
              sortable: true,
              formatter: value => {
                return this.formatNumber(value);
              }
            },

            {
              key: "product_quantity",
              label: "Quantity",
              thClass: "text-right",
              tdClass: "text-right",
              sortable: true
            },
            {
              key: "discount_type_id",
              label: "Discount",
              thClass: "text-right",
              tdClass: "text-right",
              sortable: true
            },
            {
              key: "item_total",
              label: "Total",
              thClass: "text-right",
              tdClass: "text-right",
              sortable: true,
              formatter: value => {
                return this.formatNumber(value);
              }
            }
          ],
          items: []
        },
        products: {
          fields: [
            {
              key: "product_code",
              label: "Product Code",
              tdClass: "align-left",
              thClass: "text-left",
              sortable: true
            },
            {
              key: "unit_name",
              label: "Unit",
              tdClass: "align-left",
              thClass: "text-left",
              sortable: true
            },
            {
              key: "product_rate",
              label: "Cost",
              tdClass: "text-right",
              thClass: "text-right",
              sortable: true,
              formatter: value => {
                return this.formatNumber(value);
              }
            }
          ],
          items: []
        }
      },
      filters: {
        products: {
          criteria: null
        },
        orderlists: {
          criteria: null
        }
      },
      paginations: {
        products: {
          totalRows: 0,
          currentPage: 1,
          perPage: 10
        }
      },
      options: {
        cardtypes: {
          items: []
        }
      },
      menu: [],
      product_menu: []
    };
  },
  methods: {
    
    addPayment2(number) {
      this.forms.payment.fields.cash = number;
      this.is_first = false;
    },

    addPayment1(number) {
      if (!this.is_first) {
        this.forms.payment.fields.cash = 0;
        this.forms.payment.fields.cash = number;
        this.is_first = true;
      } else {
        if (this.forms.payment.fields.cash + "" + number < 999999999.99) {
          this.forms.payment.fields.cash =
            this.forms.payment.fields.cash + "" + number;
        }
      }
    },

    addQuantity(number) {
      if (!this.is_first) {
        this.forms.quantity.fields.product_quantity = number;
        this.is_first = true;
      } else {
        this.forms.quantity.fields.product_quantity =
          this.forms.quantity.fields.product_quantity + '' + number;
      }
    },

    getProduct(menu_id) {
      this.product_menu = [];
      this.$http
        .get("api/getproduct/" + menu_id, {
          headers: {
            Authorization: "Bearer " + localStorage.getItem("token")
          }
        })
        .then(response => {
          this.product_menu = response.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getMenu(process) {
      var cls;
      if (process) {
        cls = this.btnprevnext + 1;
      } else {
        cls = this.btnprevnext - 1;
      }
      this.$http
        .get("api/getmenu/" + cls, {
          headers: {
            Authorization: "Bearer " + localStorage.getItem("token")
          }
        })
        .then(response => {
          this.menu = response.data;
          this.btnprevnext = cls;
        })
        .catch(err => {
          console.log(err);
        });
    },

    addProduct() {
      // console.log(this.selectedRow)
      if (this.selectedRow.length == 0) {
        console.log("notify");
        this.$notify({
          type: "error",
          group: "notification",
          title: "Error!",
          text: "Please select a product."
        });
        return;
      }
      this.forms.quantity.fields.unit_name = this.selectedRow[0].unit_name;
      this.forms.quantity.fields.product_id = this.selectedRow[0].product_id;
      this.forms.quantity.fields.product_code = this.selectedRow[0].product_code;
      this.forms.quantity.fields.product_name = this.selectedRow[0].product_name;
      this.forms.quantity.fields.product_rate = this.selectedRow[0].product_rate;
      this.forms.quantity.fields.prev_quantity = 1;
      this.forms.quantity.fields.product_quantity = 1;
      this.forms.quantity.fields.product_total = this.selectedRow[0].product_rate;
      this.showModalQuantity = true;
    },
    menuProduct(row) {
      this.selectedRow[0] = row;
      this.addProduct();
    },
    //   this.forms.quantity.items.push({
    //   product_id: this.selectedRow[0].product_id,
    //   product_code: this.selectedRow[0].product_code,
    //   product_name: this.selectedRow[0].product_name,
    //   product_cost: this.selectedRow[0].product_cost,
    //   product_quantity: 1,
    //   product_total: this.selectedRow[0].product_cost,
    // });
    // },
    acceptQuantity() {
      if (this.forms.quantity.fields.product_quantity == 0) {
        console.log("notify");
        this.$notify({
          type: "error",
          group: "notification",
          title: "Error!",
          text: "Please enter quantity."
        });
        return;
      }

      this.tables.orderlists.items.push({
        product_id: this.forms.quantity.fields.product_id,
        product_code: this.forms.quantity.fields.product_code,
        product_name: this.forms.quantity.fields.product_name,
        product_rate: this.forms.quantity.fields.product_rate,
        product_quantity: this.forms.quantity.fields.product_quantity,
        item_total:
          this.forms.quantity.fields.product_rate *
          this.forms.quantity.fields.product_quantity,
        unit_name: this.forms.quantity.fields.unit_name
      });
      this.showModalQuantity = false;
      ``;
      this.showModalProduct = false;
    },

    removeProduct() {
      this.selectedRow = [1].splice(0, 1);
    }
  },

  created() {

    this.$http
      .get("api/pos", {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("token")
        }
      })
      .then(response => {
        this.paginations.products.totalRows = response.data.products.length;
        this.tables.products.items = response.data.products;
        this.paginations.products.totalRows = response.data.products.length;
        this.options.cardtypes.items = response.data.cardtypes
        
      })
      .catch(error => {
        console.log(error);
      });
    this.$http
      .get("api/getmenu/" + this.btnprevnext, {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("token")
        }
      })
      .then(response => {
        this.menu = response.data;
        this.getProduct(this.menu[0].menu_id);
      })
      .catch(err => {
        console.log(err);
      });
  },

  computed: {
    getTotalItems() {
      this.forms.pos.fields.total_amount_due = 0;

      this.tables.orderlists.items.forEach(item => {
        this.forms.pos.fields.total_amount_due +=
          Number(item.product_rate) * Number(item.product_quantity);
      });
      return this.forms.pos.fields.total_amount_due;
    }
  }
};
</script>

