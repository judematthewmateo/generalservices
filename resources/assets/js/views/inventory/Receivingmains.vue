<template>
  <div>
    <!-- main container -->
    <notifications group="notification" />
    <div v-show="!showEntry" class="animated fadeIn">
      <!-- main div -->
      <b-row>
        <!-- main row -->
        <b-col sm="12">
          <b-card>
            <!-- main card -->
            <h5 slot="header">
              <!-- table header -->
              <span class="text-primary">
                <i class="fa fa-bars"></i>
                Receiving Order List
                <small
                  class="font-italic"
                >List of all registered receiving.</small>
              </span>
            </h5>

            <!-- row button and search input -->

            <b-row class="mb-2">
              <!-- row button and search input -->
              <b-col sm="4">
                <b-button
                  variant="primary"
                  @click="showEntry=true, entryMode='Add', clearFields('receivingmain'), tables.orderlists.items = [], forms.receivingmain.fields.receiving_datetime = new Date()"               
                >
                  <i class="fa fa-plus-circle"></i> Create New Receiving
                </b-button>
              </b-col>

              <b-col sm="4">
                <span></span>
              </b-col>

              <b-col sm="4">
                <b-form-input
                  v-model="filters.receivingmains.criteria"
                  type="text"
                  placeholder="Search"
                ></b-form-input>
              </b-col>
            </b-row>
            <!-- row button and search input -->

            <b-row>
              <!-- row table -->
              <b-col sm="12">
                <b-table
                  responsive fixed striped hover small bordered show-empty
                  :filter="filters.receivingmains.criteria"
                  :fields="tables.receivingmains.fields"
                  :items.sync="tables.receivingmains.items"
                  :current-page="paginations.receivingmains.currentPage"
                  :per-page="paginations.receivingmains.perPage"
                >
                  <!-- table -->

                  <template slot="action" slot-scope="data">
                    <!-- action slot  :to="{path: 'receivingmainorderlists/' + data.item.id } -->
                    <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                      <i class="fa fa-edit"></i>
                    </b-btn>

                    <b-btn
                      :size="'sm'"
                      :disabled="forms.receivingmain.isDeleting"
                      variant="danger"
                      @click="setDelete(data)"
                    >
                      <icon v-if="forms.receivingmain.isDeleting" name="sync" spin></icon>
                      <i v-else class="fa fa-trash"></i>
                    </b-btn>
                  </template>
                </b-table>
                <!-- table -->
              </b-col>
            </b-row>
            <!-- row table -->

            <b-row>
              <!-- Pagination -->
              <b-col sm="12" class="my-1">
                <b-pagination
                  size="sm"
                  align="right"
                  :total-rows="paginations.receivingmains.totalRows"
                  :per-page="paginations.receivingmains.perPage"
                  v-model="paginations.receivingmains.currentPage"
                  class="my-0"
                />
              </b-col>
            </b-row>
            <!-- Pagination -->
          </b-card>
          <!-- main card -->
        </b-col>
      </b-row>
      <!-- main row -->
    </div>
    <!-- main div -->

    <div v-show="showEntry" class="animated fadeIn">
      <!-- sec div -->
      <b-row>
        <!-- sec row -->
        <b-col sm="12">
          <b-card>
            <!-- sec card -->
            <h5 slot="header">
              <!-- table header -->
              <span class="text-primary">Receiving Order Entry - {{entryMode}}</span>
            </h5>
                        <b-col lg=12> <!-- modal body -->
            
                <b-form @keydown="resetFieldStates('receivingmain')" autocomplete="off">
                   <b-row>
                       <b-col lg="3">
                    <b-form-group>
                        <label for="receiving_no"><i class="icon-required fa fa-exclamation-circle"></i> Receiving Order No</label>
                        <b-form-input
                            enable
                            id="receiving_no"
                            v-model="forms.receivingmain.fields.receiving_no"
                            type="number"
                            placeholder="Receiving no."
                            ref="receiving_no">
                        </b-form-input>
                    </b-form-group>
                   </b-col>

                   <b-col lg="3">
                  <b-form-group>
                        <label>Purchase Order No.</label>
                        <b-form-input
                          disabled
                          id="purchase_order_no"
                          v-model="forms.receivingmain.fields.purchase_order_no"
                          type="text"
                          ref="purchase_order_no"
                        ></b-form-input>
                      </b-form-group>
                     </b-col> 

                      <b-col lg="3">
                      <b-form-group>
                        <label for="purchase_order_id">Select Purchase Order No.</label>
                        <select2
                        @input="getPoInfo"
                          ref="purchase_order_id"
                          :allowClear="false"
                          :placeholder="'Select Purchase Order No.'"
                          v-model="forms.receivingmain.fields.purchase_order_id"
                        >
                          <option
                            v-for="pur in options.purchasemains.items"
                            :key="pur.purchase_order_id"
                            :value="pur.purchase_order_id"
                          >{{pur.purchase_order_no}}</option>
                        </select2>
                      </b-form-group>
                      </b-col>
                    <!-- <b-col lg="3">
                     
                           <b-form-group>
                                <label><i class="icon-required fa fa-exclamation-circle"></i> Purchase Order No.</label>
                                <select2
                                @input="getPoInfo"
                                ref="purchase_order_no"
                                :allowClear="false"
                                :placeholder="'Select Purchase'"
                                v-model="forms.receivingmain.fields.purchase_order_id">
                                    <option v-for="right in options.purchasemains.items"
                                    :key="right.purchase_order_id" 
                                    :value="right.purchase_order_id">
                                    {{right.purchase_order_no}}

                                    </option>
                                </select2>
                    </b-form-group>                
                    </b-col> -->
                   
                   
                       <b-col lg="3">
                     
                           <b-form-group>
                                <label><i class="icon-required fa fa-exclamation-circle"></i> Department</label>
                                <select2
                                ref="department_id"
                                :allowClear="false"
                                :placeholder="'Select Department'"
                                v-model="forms.receivingmain.fields.department_id">
                                    <option v-for="right in options.departments.items"
                                    :key="right.department_id" 
                                    :value="right.department_id">
                                    {{right.department_name}}

                                    </option>
                                </select2>
                    </b-form-group>                
                    </b-col>
                       
                       
                    <b-col lg="3">  
                    <b-form-group>
                                <label><i class="icon-required fa fa-exclamation-circle"></i> Supplier</label>
                                <select2
                                ref="supplier_id"
                                :allowClear="false"
                                :placeholder="'Select Supplier'"
                                v-model="forms.receivingmain.fields.supplier_id">
                                    <option v-for="right in options.suppliers.items"
                                    :key="right.supplier_id" 
                                    :value="right.supplier_id">
                                    {{right.supplier_name}}

                                    </option>
                                </select2>
                    </b-form-group>
                    </b-col>


                    <b-col lg="3">
                    <b-form-group>
                        <label><i class="icon-required fa fa-exclamation-circle"></i> Date</label>
                        <date-picker
                          id="receiving_datetime"
                          format="MMMM/DD/YYYY"
                          v-model="forms.receivingmain.fields.receiving_datetime"
                          type="date"
                          lang="en"
                          input-class="form-control mx-input"
                          ref="receiving_datetime"
                          :clearable="false"
                        ></date-picker>
                      </b-form-group>
                    
                    
                     </b-col>
                   </b-row>
                </b-form>
                        </b-col>
            <div>
              <!-- row table -->
                <b-row class="mb-2">
                    <b-col lg=4>
                        <b-button variant="primary" @click="showModalProducts = true, selectedRow=[]">
                            <i class="fa fa-plus-circle"></i> Add Item
                        </b-button>
                    </b-col>
                    <b-col lg=4></b-col>
                    <b-col lg=4>
                        <b-form-input v-model="filters.orderlists.criteria" placeholder="Search"></b-form-input>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col sm="12">
                        <b-table
                            responsive fixed striped hover small bordered show-empty
                            :filter="filters.orderlists.criteria"
                            :fields="tables.orderlists.fields"
                            :items.sync="tables.orderlists.items"
                        >
                    <!-- table -->
                            <template slot="product_cost" slot-scope="data">
                                <vue-autonumeric
                                    ref="product_cost"
                                    id="product_cost"
                                    v-model="data.item.product_cost"
                                    class="form-control text-right"
                                    :options="{
                                        minimumValue: '0', 
                                        emptyInputBehavior:'0',}"
                                >
                                </vue-autonumeric>
                            </template>

                            <template slot="product_quantity" slot-scope="data">
                                <vue-autonumeric
                                    ref="product_quantity"
                                    id="product_quantity"
                                    v-model="data.item.product_quantity"
                                    class="form-control text-right"
                                    :options="{
                                        minimumValue: '0', 
                                        emptyInputBehavior:'1',}">
                                </vue-autonumeric>
                            </template>

                            <template slot="action" slot-scope="data">
                                <b-btn
                                    :size="'sm'"
                                    variant="danger"
                                    @click="removeProduct(data.index)"
                                >
                                    <i class="fa fa-trash"></i>
                                </b-btn>
                            </template>
                        </b-table>
                  <!-- table -->
                        <b-row>
                          <b-col lg=4>
                                <b-form-textarea
                                    rows=2
                                    placeholder="Remarks"
                                    v-model="forms.receivingmain.fields.receiving_remarks">
                                </b-form-textarea>
                            </b-col>
                    
                            <b-col lg=5></b-col>
                            <b-col lg=3>
                                <b-row>
                                    <b-col lg=5>
                                        <label class="float-right col-form-label">Total Amount :</label>
                                    </b-col>
                                    <b-col lg=7>
                                        <vue-autonumeric
                                            readonly
                                            ref="total_amount"
                                            id="total_amount"
                                            v-model="this.getTotalItems"
                                            class='form-control text-right'
                                            :options="{
                                            minimumValue: '0',  
                                            emptyInputBehavior:'0',}"
                                        >
                                        </vue-autonumeric>
                                    </b-col>
                                </b-row>
                            </b-col>
                        </b-row>
                            
                    </b-col>
                </b-row>
            </div>
            <hr>
            <b-row class="pull-right mt-2">
                <b-col sm="12">
                    <b-button 
                        :disabled="forms.receivingmain.isSaving" 
                        variant="primary" 
                        @click="onReceivingmainEntry()">
                        <icon v-if="forms.receivingmain.isSaving" name="sync" spin></icon>
                        <i class="fa fa-check"></i>
                        Save
                    </b-button>
                    <b-button variant="secondary" @click="showEntry=false">Close</b-button>
                </b-col>
            </b-row>
          </b-card>
          <!-- sec card -->
        </b-col>
      </b-row>
      <!-- sec row -->
    </div>
    <!-- sec div -->

    <div>
      <!-- modal div -->
        <div>
              <!-- modal div -->
            <b-modal
                size="lg"
                v-model="showModalProducts"
                :noCloseOnEsc="true"
                :noCloseOnBackdrop="true"
                :scrollable="true"
            >
            <div slot="modal-title">
                <!-- modal title -->
                Product List
            </div>
            <!-- modal title -->

            <b-row class="mb-2">
                <!-- row button and search input -->
                <b-col sm="4"></b-col>

                <b-col sm="4">
                    <span></span>
                </b-col>

                <b-col sm="4">
                    <b-form-input
                        v-model="filters.products.criteria"
                        type="text"
                        placeholder="Search">
                    </b-form-input>
                </b-col>
            </b-row>
            <!-- row button and search input -->

            <b-table
                selectable select-mode="single"
                responsive fixed striped hover small bordered show-empty
                :filter="filters.products.criteria"
                :fields="tables.products.fields"
                :per-page="paginations.products.perPage"
                :current-page="paginations.products.currentPage"
                :items.sync="tables.products.items"
                @filttered="onFiltered($event, 'products')"
                @row-selected="selectedRow = $event">
            <!-- table -->
            </b-table>
            <b-row>
                <b-col sm="12" class="my-1">
                    <b-pagination
                        size="sm"
                        align="right"
                        v-model="paginations.products.currentPage"
                        :per-page="paginations.products.perPage"
                        :total-rows="paginations.products.totalRows"
                        class="my-0">
                    </b-pagination>
                </b-col>
            </b-row>
            <!-- modal body -->

            <div slot="modal-footer">
                <!-- modal footer buttons -->
                <b-button
                    variant="primary"
                    @click="addProduct"
                >
                    <i class="fa fa-check"></i>
                    Accept
                </b-button>
                <b-button variant="secondary" @click="showModalProducts=false">Close</b-button>
            </div>
            <!-- modal footer buttons -->
        </b-modal>
    </div>
    <b-modal 
        v-model="showModalDelete"
        :noCloseOnEsc="true"
        :noCloseOnBackdrop="true"
    >   
        <div slot="modal-title">
            Delete Receiving
        </div>
        <b-col lg="12">.
            Are you sure you want to delete this Receiving?
        </b-col>
        <div slot="modal-footer">
          <b-button
            :disabled="forms.receivingmain.isSaving"
            variant="primary"
            @click="onReceivingmainDelete"
          >
            <icon v-if="forms.receivingmain.isSaving" name="sync" spin></icon>
            <i class="fa fa-check"></i>
            OK
          </b-button>
          <b-button variant="secondary" @click="showModalDelete=false">Close</b-button>
        </div>
      </b-modal>
    </div>
    <!-- modal div -->
  </div>
  <!-- main container -->
</template>



<script>
export default {
    name: 'receivingmains',
    data () {
      return {
        selectedRow: [],
        entryMode: 'Add',
        showEntry: false, //if true show modal
        showModalProducts: false,
        showModalDelete: false,
        forms:{
            receivingmain : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    receiving_id: null,
                    receiving_datetime: new Date,
                    purchase_order_no: null,
                    total_amount: 0,
                    is_received: 0,
                    
                    

                }
            }
        },
        tables: {
            receivingmains: {
                fields: [
                {
                    key: 'receiving_no',
                    label: 'Receiving No.',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'department_name',
                    label: 'Department',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'supplier_name',
                    label: 'Supplier',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'receiving_datetime',
                    label: 'Date/Time',
                    tdClass: 'align-middle',
                    sortable: true,
                    formatter: (value) => {
                    return this.moment(value, 'MMMM DD, YYYY hh:mm a')
                  }
                },
                {
                    key: "total_amount",
                    label: "Total Amount",
                    thClass: "text-right",
                    tdClass: "align-middle text-right",
                    sortable: true,
                    formatter: (value) => {
                        return this.formatNumber(value)
                    }
                  },
                 
                {   
                    key: 'action',
                    label: '',
                    thStyle: {width: '80px'},
                    tdClass: 'text-center'
                },
                ],
                items: []
            },
            products: {
          fields: [
            {
              key: "product_code",
              label: "Product Code",
              thStyle: { width: "20%" },
              tdClass: "align-middle",
              sortable: true
            },
            {
              key: "product_name",
              label: "Product Name",
              thStyle: { width: "50%" },
              tdClass: "align-middle",
              sortable: true
            },
            {
              key: "unit_name",
              label: "Unit",
              thStyle: { width: "15%" },
              tdClass: "align-middle",
              sortable: true
            },
            {
              key: "product_cost",
              label: "Cost",
              thStyle: { width: "15%" },
              thClass: "text-right",
              tdClass: "align-middle text-right",
              sortable: true,
              formatter: (value) => {
                  return this.formatNumber(value)
              }
            }
          ],
          items: []

            },
            orderlists: {
                fields:[
                 {
                    key: 'product_code',
                    label: 'Product Code',
                    tdClass: 'align-middle',
                    sortable: true
                    },
                    {
                    key: 'product_name',
                    label: 'Product Name',
                    tdClass: 'align-middle',
                    sortable: true
                    },
                    {
                    key: 'unit_name',
                    label: 'Unit',
                    tdClass: 'align-middle',
                    sortable: true
                    },
                    {
                    key: 'product_cost',
                    label: 'Cost',
                    tdClass: 'align-middle',
                    sortable: true
                    },

                    {
                    key:'product_quantity',
                    label:'Quantity',
                    tdClass:'align-middle',
                    sortable: true
                    },
                   {
                    key: "total_cost",                                              
                    label: "Total",
                    thStyle: { width: "15%" },
                    thClass: "text-right",
                    tdClass: "align-middle text-right",
                    sortable: true,
                    formatter: (value, key, item) => {
                      item.total_cost = item.product_cost * item.product_quantity
                      return this.formatNumber(item.total_cost)
                    }
                    },
                    {   
                    key: 'action',
                    label: '',
                    thStyle: {width: '80px'},
                    tdClass: 'text-center'
                    },
                    ],
                   items: []
            
            }
        
            
        },
        filters: {
          receivingmains: {
            criteria: null
          
           },
          orderlists:{
              criteria: null
          },
          products:{
              criteria: null
          }
        },

        paginations: {
          receivingmains: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          },
          products: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },

        options:{
        departments:{
            items: []
        },
        suppliers:{
            items:[]
        },
        purchasemains:{
            items:[]
        },
           },
        purchase_order_id: null,
        row: []
      }
    },
    methods: {
    getPoInfo: function(value,data)  {
      if (data.length > 0) {
        var po = this.options.purchasemains.items[data[0].element.index]
         this.forms.receivingmain.fields.purchase_order_no = po.purchase_order_no
         this.forms.receivingmain.fields.purchase_order_datetime = po.purchase_order_datetime
         this.forms.receivingmain.fields.department_id = po.department_id
         this.forms.receivingmain.fields.supplier_id = po.supplier_id
         this.$http.get("api/getpoitems/"+po.purchase_order_id,{
             headers: {
                    Authorization: 'Bearer ' + localStorage.getItem('token')
                }
          }).then(response => {
            this.tables.orderlists.items = response.data
          })
          .catch(err=>{
            console.log(err)
          })
      }
    },

    onReceivingmainEntry() {
      if(this.tables.orderlists.items.length > 0) {
        this.forms.receivingmain.fields.items = this.tables.orderlists.items
        if (this.entryMode == "Add") {
          this.createEntity("receivingmain", false, "receivingmains")
        } else {
          this.updateEntity("receivingmain", "receiving_id", false, this.row)
        }
      }
      else {
        this.$notify({
          type: 'error',
          group: 'notification',
          title: 'Error!',
          text: 'Please Add an Item'
        })
      }
    },
    onReceivingmainDelete() {
      this.deleteEntity("receivingmain", this.receiving_id, true, "receivingmains", "receiving_id")
    },
    async setDelete(data) {
      if((await this.checkIfUsed("receivingmain", data.item.receiving_id)) == true){
        this.$notify({
          type: "error",
          group: "notification",
          title: "Error!",
          text:
            "Unable to delete, this record is being used by other transactions."
        })
        return
      }
      this.receiving_id = data.item.receiving_id
      this.showModalDelete = true
    },
    setUpdate(data) {
      this.row = data.item
      this.$http.get('api/receivingmain/'+ data.item.receiving_id, {
          headers: {
                Authorization: 'Bearer ' + localStorage.getItem('token')
          }
      }).then(response => {
          this.forms.receivingmain.fields = response.data.receivingmain
          this.tables.orderlists.items = response.data.po_items
          this.showEntry = true
          this.entryMode = "Edit"
      }).catch(err => {
          console.log(err)
      })
    },
    addProduct() {
        if(this.selectedRow.length > 0){
            if(this.tables.orderlists.items.filter(i => i.product_id == this.selectedRow[0].product_id).length > 0){
            this.$notify({
                    type: "error",
                    group: "notification",
                    title: "Error!",
                    text: "Product is already added."
                })
                return
            }
            this.tables.orderlists.items.push({
                product_id: this.selectedRow[0].product_id,
                product_code: this.selectedRow[0].product_code,
                product_name: this.selectedRow[0].product_name,
                unit_name: this.selectedRow[0].unit_name,
                product_cost: this.selectedRow[0].product_cost,
                product_quantity: 1,
                product_total: this.selectedRow[0].product_cost
            })
        }
    },
    removeProduct(index){
        this.tables.orderlists.items.splice(index, 1)
    }
  },
  created() {
    // this.fillTableList("issuances")
    // this.fillOptionsList("departments")
    // // this.fillTableList("products")

    this.$http.get('api/receivingmains', {
        headers: {
            Authorization: 'Bearer ' + localStorage.getItem('token')
        }
    }).then(response => {
        this.tables.receivingmains.items = response.data.receivingmains
        this.paginations.receivingmains.totalRows = response.data.receivingmains.length
        this.tables.products.items = response.data.products
        this.paginations.products.totalRows = response.data.products.length
        this.options.departments.items = response.data.departments
        this.options.suppliers.items = response.data.suppliers
        this.options.purchasemains.items = response.data.purchasemains
    }).catch(error => {
        console.log(error)
    })
  },
  computed: {
    getTotalItems() {
      this.forms.receivingmain.fields.total_amount = 0

      this.tables.orderlists.items.forEach(item => {
            this.forms.receivingmain.fields.total_amount += Number(item.product_cost) * Number(item.product_quantity)
        
      })
      return this.forms.receivingmain.fields.total_amount
    }
  }
}
</script>

