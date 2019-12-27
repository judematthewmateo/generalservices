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
                Adjustment List
                <small
                  class="font-italic"
                >List of all registered Adjustment List.</small>
              </span>
            </h5>

            <!-- row button and search input -->

            <b-row class="mb-2">
              <!-- row button and search input -->
              <b-col sm="4">
                <b-button
                  variant="primary"
                  @click="showEntry=true, entryMode='Add', clearFields('adjustmentmain'), tables.adjustmentlists.items = [], forms.adjustmentmain.fields.adjustment_datetime = new Date()"               
                >
                  <i class="fa fa-plus-circle"></i> Create New Adjustment
                </b-button>
              </b-col>

              <b-col sm="4">
                <span></span>
              </b-col>

              <b-col sm="4">
                <b-form-input
                  v-model="filters.adjustmentmains.criteria"
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
                  :filter="filters.adjustmentmains.criteria"
                  :fields="tables.adjustmentmains.fields"
                  :items.sync="tables.adjustmentmains.items"
                  :current-page="paginations.adjustmentmains.currentPage"
                  :per-page="paginations.adjustmentmains.perPage"
                >
                  <!-- table -->

                  <template slot="action" slot-scope="data">
                    <!-- action slot  :to="{path: 'purchaseorderlists/' + data.item.id } -->
                    <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                      <i class="fa fa-edit"></i>
                    </b-btn>

                    <b-btn
                      :size="'sm'"
                      :disabled="forms.adjustmentmain.isDeleting"
                      variant="danger"
                      @click="setDelete(data)"
                    >
                      <icon v-if="forms.adjustmentmain.isDeleting" name="sync" spin></icon>
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
                  :total-rows="paginations.adjustmentmains.totalRows"
                  :per-page="paginations.adjustmentmains.perPage"
                  v-model="paginations.adjustmentmains.currentPage"
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
              <span class="text-primary">Adjustment Entry - {{entryMode}}</span>
            </h5>
                        <b-col lg=12> <!-- modal body -->
            
                <b-form @keydown="resetFieldStates('adjustmentmain')" autocomplete="off">
                   <b-row>
                      <b-col lg = "3">
                    <b-form-group>
                        <label for="adjustment_no"><i class="icon-required fa fa-exclamation-circle">  Adjustment No</i></label>
                        <b-form-input
                            disabled
                            id="adjustment_no"
                            v-model="forms.adjustmentmain.fields.adjustment_no"
                            type="text"
                            placeholder="Auto Generate"
                            ref="adjustment_no">
                        </b-form-input>
                    </b-form-group>
                      </b-col>
                      <b-col lg = "3">
                           <b-form-group>
                                <label><i class="icon-required fa fa-exclamation-circle"></i> Department</label>
                                <select2
                                ref="department_id"
                                :allowClear="false"
                                :placeholder="'Select Department'"
                                v-model="forms.adjustmentmain.fields.department_id">
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
                    <label> <i class="icon-required fa fa-exclamation-circle"></i> Date</label>
                    <date-picker
                        id="adjustment_datetime"
                        format="MMMM DD, YYYY"
                        v-model="forms.adjustmentmain.fields.adjustment_datetime"
                        lang="en"
                        input-class="form-control mx-input"
                        ref="adjustment_datetime"
                        :clearable="false"
                    ></date-picker>
                    </b-form-group>
                </b-col>

                    <b-col lg = "3">
                        <b-form-group>
                          <label><i class="icon-required fa fa-exclamation-circle"></i> Adjustment Type</label>
                          <b-form-radio-group
                          v-model="forms.adjustmentmain.fields.adjustment_type"
                          name="radio-sub-component">
                          <b-form-radio value="0"> Adjustment In</b-form-radio>
                          <b-form-radio value="1"> Adjustment Out</b-form-radio>
                           </b-form-radio-group>
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
                        <b-form-input v-model="filters.adjustmentlists.criteria" placeholder="Search"></b-form-input>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col sm="12">
                        <b-table
                            responsive fixed striped hover small bordered show-empty
                            :filter="filters.adjustmentlists.criteria"
                            :fields="tables.adjustmentlists.fields"
                            :items.sync="tables.adjustmentlists.items"
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
                              <template slot="product_remarks" slot-scope="data">
                                <b-form-input
                                    ref="product_remarks"
                                    id="product_remarks"
                                    v-model="data.item.product_remarks">
                                </b-form-input>
                                
                            </template>
                        </b-table>
                  <!-- table -->
                        <b-row>
                            <b-col lg=4>
                                <b-form-textarea
                                    rows=2
                                    placeholder="Remarks"
                                    v-model="forms.adjustmentmain.fields.adjustment_remarks">
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
                        :disabled="forms.adjustmentmain.isSaving" 
                        variant="primary" 
                        @click="onAdjustmentmainEntry()">
                        <icon v-if="forms.adjustmentmain.isSaving" name="sync" spin></icon>
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
            Delete Issuance
        </div>
        <b-col lg="12">.
            Are you sure you want to delete this Issuance?
        </b-col>
        <div slot="modal-footer">
          <b-button
            :disabled="forms.adjustmentmain.isSaving"
            variant="primary"
            @click="onAdjustmentmainDelete"
          >
            <icon v-if="forms.adjustmentmain.isSaving" name="sync" spin></icon>
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
    name: 'adjustmentmains',
    data () {
      return {
        selectedRow: [],
        entryMode: 'Add',
        showEntry: false, //if true show modal
        showModalProducts: false,
        showModalDelete: false,
        forms:{
            adjustmentmain : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    adjustment_id: null,
                    adjustment_datetime: new Date,
                    adjustment_no: null,
                    total_amount: 0,
                    adjustment_remarks: null
                    

                }
            }
        },
        tables: {
            adjustmentmains: {
                fields: [
                {
                    key: 'adjustment_no',
                    label: 'Adjustment No.',
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
                    key: 'adjustment_datetime',
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
                    key: "adjustment_type",
                    label: "Adjustment Type",
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
            adjustmentlists: {
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
                    thClass: "text-right",
                    sortable: true
                    },

                    {
                    key:'product_quantity',
                    label:'Quantity',
                    thClass: "text-right",
                    sortable: true
                    },
                    {
                    key:'product_remarks',
                    label:'Remarks',
                    thClass: "text-right",
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
          adjustmentmains: {
            criteria: null
          
           },
          adjustmentlists:{
              criteria: null
          },
          products:{
              criteria: null
          }
        },

        paginations: {
          adjustmentmains: {
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
           },
        adjustment_id: null,
        row: []
      }
    },
    methods:{
        
    onAdjustmentmainEntry() {
      if(this.tables.adjustmentlists.items.length > 0) {
        this.forms.adjustmentmain.fields.items = this.tables.adjustmentlists.items
        if (this.entryMode == "Add") {
          this.createEntity("adjustmentmain", false, "adjustmentmains")
        } else {
          this.updateEntity("adjustmentmain", "adjustment_id", false, this.row)
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
    onAdjustmentmainDelete() {
      this.deleteEntity("adjustmentmain", this.adjustment_id, true, "adjustmentmains", "adjustment_id")
    },
    async setDelete(data) {
      if((await this.checkIfUsed("adjustmentmain", data.item.adjustment_id)) == true){
        this.$notify({
          type: "error",
          group: "notification",
          title: "Error!",
          text:
            "Unable to delete, this record is being used by other transactions."
        })
        return
      }
      this.adjustment_id = data.item.adjustment_id
      this.showModalDelete = true
    },
    setUpdate(data) {
      this.row = data.item
      this.$http.get('api/adjustmentmain/'+ data.item.adjustment_id, {
          headers: {
                Authorization: 'Bearer ' + localStorage.getItem('token')
          }
      }).then(response => {
          this.forms.adjustmentmain.fields = response.data.adjustmentmain
          this.tables.adjustmentlists.items = response.data.po_items
          this.showEntry = true
          this.entryMode = "Edit"
      }).catch(err => {
          console.log(err)
      })
    },
    addProduct() {
        if(this.selectedRow.length > 0){
            if(this.tables.adjustmentlists.items.filter(i => i.product_id == this.selectedRow[0].product_id).length > 0){
            this.$notify({
                    type: "error",
                    group: "notification",
                    title: "Error!",
                    text: "Product is already added."
                })
                return
            }
            this.tables.adjustmentlists.items.push({
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
        this.tables.adjustmentlists.items.splice(index, 1)
    }
  },
  created() {
    // this.fillTableList("issuances")
    // this.fillOptionsList("departments")
    // this.fillTableList("products")

    this.$http.get('api/adjustmentmains', {
        headers: {
            Authorization: 'Bearer ' + localStorage.getItem('token')
        }
    }).then(response => {
        this.tables.adjustmentmains.items = response.data.adjustmentmains
        this.paginations.adjustmentmains.totalRows = response.data.adjustmentmains.length
        this.tables.products.items = response.data.products
        this.paginations.products.totalRows = response.data.products.length
        this.options.departments.items = response.data.departments
        this.options.suppliers.items = response.data.suppliers
    }).catch(error => {
        console.log(error)
    })
  },
  computed: {
    getTotalItems() {
      this.forms.adjustmentmain.fields.total_amount = 0

      this.tables.adjustmentlists.items.forEach(item => {
            this.forms.adjustmentmain.fields.total_amount += Number(item.product_cost) * Number(item.product_quantity)
        
      })
      return this.forms.adjustmentmain.fields.total_amount
    }
  }
}
</script>

