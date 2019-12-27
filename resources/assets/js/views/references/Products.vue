<template>
    <div><!-- main container -->
        <notifications group="notification" />
        <div class="animated fadeIn"> <!-- main div -->
            <b-row> <!-- main row -->
                <b-col sm="12">
                    <b-card > <!-- main card -->
                        <h5 slot="header">  <!-- table header -->
                            <span class="text-primary">
                                <i class="fa fa-bars"></i> 
                                Product List
                                <small class="font-italic">List of all registered Products       .</small></span>
                        </h5>   
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('product')">
                                        <i class="fa fa-plus-circle"></i> Create New Product
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.products.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.products.criteria"
                                    :fields="tables.products.fields"
                                    :items.sync="tables.products.items"
                                    :current-page="paginations.products.currentPage"
                                    :per-page="paginations.products.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'products/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.product.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.product.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.products.totalRows" :per-page="paginations.products.perPage" v-model="paginations.products.currentPage"
                                     class="my-0" />
                                </b-col>
                        </b-row> <!-- Pagination -->
                        
                    </b-card><!-- main card -->
                </b-col>
            </b-row> <!-- main row -->

        </div><!-- main div -->

        <div> <!-- modal div -->

            <b-modal 
                size='lg'
                v-model="showModalEntry"
                :noCloseOnEsc="true"
                :noCloseOnBackdrop="true"
                @shown="focusElement('product_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                Product Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->

                <b-form @keydown="resetFieldStates('product')" autocomplete="off">
                    <b-row>
                        <b-col lg="4">
                            <b-form-group>
                                <label for="product_code"><i class="icon-required fa fa-exclamation-circle"></i> Product Code</label>
                                <b-form-input
                                    id="product_code"
                                    v-model="forms.product.fields.product_code"
                                    type="text"
                                    placeholder="Product Code"
                                    ref="product_code">
                                </b-form-input>
                            </b-form-group>
                        
                            <b-form-group>
                                <label><i class="icon-required fa fa-exclamation-circle"></i> Product Name</label>
                                <b-form-input
                                    ref="product_name"
                                    id="product_name"
                                    v-model="forms.product.fields.product_name"
                                    type="text"
                                    placeholder="Product Name">
                                </b-form-input>
                            </b-form-group>
                            <b-form-group>
                                <label>Product Desc</label>
                                <b-form-input
                                    ref="product_desc"
                                    id="product_desc"
                                    v-model="forms.product.fields.product_desc"
                                    type="text"
                                    placeholder="Product Desc">
                                </b-form-input>
                            </b-form-group>
                            <b-form-group>
                                <label>Cost Price</label>
                                <vue-autonumeric
                                :disabled="forms.product.fields.is_manual_pricing == 1" 
                                    ref="product_cost"
                                    id="product_cost"
                                    v-model="forms.product.fields.product_cost"
                                    class='form-control text-right'
                                :options="{
                                        minimumValue: '0', 
                                        
                                        decimalCharacter: '.', 
                                        emptyInputBehavior:'0',}"
                                >
                                </vue-autonumeric>
                            </b-form-group>
                            <b-form-group>
                                <label>Retail Price</label>
                            
                                <vue-autonumeric
                                :disabled="forms.product.fields.is_manual_pricing == 1" 
                                    ref="product_rate"
                                    id="product_rate"
                                    v-model="forms.product.fields.product_rate"
                                    class='form-control text-right'
                                    
                                :options="{
                                        minimumValue: '0', 

                                        decimalCharacter: '.', 
                                        emptyInputBehavior:'0',}"
                                        
                                >
                                </vue-autonumeric>

                            </b-form-group>
                            <b-form-group>
                                <b-form-checkbox
                                id="is_manual_pricing"
                                v-model="forms.product.fields.is_manual_pricing"
                                value=1
                                unchecked-value=0
                                @input="forms.product.fields.is_manual_pricing==1? (forms.product.fields.product_cost = 0,forms.product.fields.product_rate = 0 ): ''"
                                >
                                Is Manual Price?
                                </b-form-checkbox>
                            </b-form-group>
                        </b-col>
                        <b-col lg="4">
                            <b-form-group>
                                <label>VAT Percent</label>
                                <vue-autonumeric
                                :disabled="forms.product.fields.is_vatable == 0" 
                                    ref="vat_percent"
                                    id="vat_percent"
                                    v-model="forms.product.fields.vat_percent"
                                    class='form-control text-right'
                                :options="{
                                        minimumValue: '0', 
                                        maximumValue: '100', 
                                        decimalCharacter: '.', 
                                        emptyInputBehavior:'0',}"
                            ></vue-autonumeric>
                            </b-form-group>

                            <b-form-group>
                                <b-form-checkbox
                                id="is_vatable"
                                v-model="forms.product.fields.is_vatable"
                                value=1
                                unchecked-value=0
                                @input="forms.product.fields.is_vatable==0? (forms.product.fields.vat_percent = 0 ): ''"
                                >
                                Is Vatable?
                                </b-form-checkbox>
                            </b-form-group>


                            <b-form-group>
                                <label><i class="icon-required fa fa-exclamation-circle"></i> Category</label>
                                <select2
                                ref="category_id"
                                :allowClear="false"
                                :placeholder="'Select Category'"
                                v-model="forms.product.fields.category_id">
                                    <option v-for="right in options.categories.items"
                                    :key="right.category_id" 
                                    :value="right.category_id">
                                    {{right.category_name}}

                                    </option>
                                </select2>
                            </b-form-group>
                                <b-form-group>
                                    <label><i class="icon-required fa fa-exclamation-circle"></i> Menu</label>
                                    <select2
                                    ref="menu_id"
                                    :allowClear="false"
                                    :placeholder="'Select Menu'"
                                    v-model="forms.product.fields.menu_id">
                                        <option v-for="right in options.menus.items"
                                        :key="right.menu_id" 
                                        :value="right.menu_id">
                                        {{right.menu_name}}

                                        </option>
                                    </select2>

                                </b-form-group>

                                <b-form-group>
                                    <label><i class="icon-required fa fa-exclamation-circle"></i> Inventory Type</label>
                                    <select2
                                    ref="inventory_type_id"
                                    :allowClear="false"
                                    :placeholder="'Select Inventory Type'"
                                    v-model="forms.product.fields.inventory_type_id">
                                        <option v-for="right in options.inventorytypes.items"
                                        :key="right.inventory_type_id" 
                                        :value="right.inventory_type_id">
                                        {{right.inventory_type_name}}

                                        </option>
                                    </select2>
                                </b-form-group>

                            <b-form-group>
                                <label><i class="icon-required fa fa-exclamation-circle"></i> Supplier</label>
                                <select2
                                ref="supplier_id"
                                :allowClear="false"
                                :placeholder="'Select Supplier'"
                                v-model="forms.product.fields.supplier_id">
                                        <option v-for="right in options.suppliers.items"
                                        :key="right.supplier_id" 
                                        :value="right.supplier_id">
                                        {{right.supplier_name}}

                                        </option>
                                </select2>

                            </b-form-group>
                            <b-form-group>
                            <label><i class="icon-required fa fa-exclamation-circle"></i> Unit</label>
                                <select2
                                ref="unit_id"
                                :allowClear="false"
                                :placeholder="'Select Unit'"
                                v-model="forms.product.fields.unit_id">
                                    <option v-for="right in options.units.items"
                                    :key="right.unit_id" 
                                    :value="right.unit_id">
                                    {{right.unit_name}}

                                </option>
                                </select2>

                             </b-form-group>

                        </b-col>
                        <b-col lg="4">
                            <!-- <b-form-group>              
                        <label>Minimum Stock</label>
                    
                         <vue-autonumeric
                         
                            ref="minimum_stock"
                            id="minimum_stock"
                            v-model="forms.product.fields.minimum_stock"
                            class='form-control text-right'
                            
                        :options="{
                                 minimumValue: '0', 
                                 decimalCharacter: '.', 
                                 emptyInputBehavior:'0',}"
                                 
                    ></vue-autonumeric>

                            </b-form-group>
                                 <b-form-group>              
                        <label>Maximum Stock</label>
                    
                         <vue-autonumeric
                         
                            ref="maximum_stock"
                            id="maximum_stock"
                            v-model="forms.product.fields.maximum_stock"
                            class='form-control text-right'
                            
                        :options="{
                                 minimumValue: '0', 
                                 decimalCharacter: '.', 
                                 emptyInputBehavior:'0',}"
                                 
                    ></vue-autonumeric>

                            </b-form-group> -->
                           <b-form-group>
                                <label for="product_backcolor">Back Color</label>
                                <b-form-input
                                    id="product_backcolor"
                                    v-model="forms.product.fields.product_backcolor"
                                    type="color"
                                    placeholder="Back Color"
                                    ref="product_backcolor">
                                </b-form-input>
                            </b-form-group>
                            <b-form-group>
                                <label for="product_forecolor">Fore Color</label>
                                <b-form-input
                                    id="product_forecolor"
                                    v-model="forms.product.fields.product_forecolor"
                                    type="color"
                                    placeholder="Fore Color"
                                    ref="product_forecolor">
                                </b-form-input>
                            </b-form-group>
                        </b-col>
                    </b-row>
                </b-form>

            </b-col> <!-- modal body -->
 
            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.product.isSaving" variant="primary" @click="onProductEntry">
                    <icon v-if="forms.product.isSaving" name="sync" spin></icon>
                    <i class="fa fa-check"></i>
                    Save
                </b-button>
                <b-button variant="secondary" @click="showModalEntry=false">Close</b-button>
            </div> <!-- modal footer buttons -->
            </b-modal>
            <b-modal 
                v-model="showModalDelete"
                :noCloseOnEsc="true"
                :noCloseOnBackdrop="true"
            >
                <div slot="modal-title">
                    Delete product
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this product?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.product.isSaving" variant="primary" @click="onProductDelete">
                        <icon v-if="forms.product.isSaving" name="sync" spin></icon>
                        <i class="fa fa-check"></i>
                        OK
                    </b-button>
                    <b-button variant="secondary" @click="showModalDelete=false">Close</b-button>            
                </div>
            </b-modal>
        </div> <!-- modal div -->
    </div> <!-- main container -->

   
</template>

<script>
export default {
    name: 'products',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            product : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    product_id: null,
                    product_code: null,
                    product_name: null,
                    product_desc: null,
                    procut_rate: 0,
                    product_cost: 0,
                    is_manual_pricing: 0,
                    is_vatable: 0,
                    product_backcolor: null,
                    product_forecolor: null
                    
                }
            }
        },
        tables: {
            products: {
                fields: [
                {
                    key: 'product_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
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
                    key: 'product_desc',
                    label: 'Product Desc',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'product_cost',
                    label: 'Product Cost',
                    tdClass: 'align-middle',
                    sortable: true
                },
                  {
                    key: 'product_rate',
                    label: 'Product Rate',
                    tdClass: 'align-middle',
                    sortable: true
                },
                  {
                    key: 'vat_percent',
                    label: 'VAT Percent',
                    tdClass: 'align-middle',
                    sortable: true
                },
                 {
                    key: 'is_vatable',
                    label: 'Is Vatable',
                    tdClass: 'align-middle',
                    sortable: true
                },
                  {
                    key: 'is_manual_pricing',
                    label: 'Is Manual Pricing?',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'minimum_stock',
                    label: 'Minimum Stock',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'maximum_stock',
                    label: 'Maximum Stock',
                    tdClass: 'align-middle',
                    sortable: true
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
          products: {
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
    options:{
        categories:{
            items: []
        },
        menus:{
            items:[]
        },
        suppliers:{
            items:[]
        },
        units:{
            items:[]
        },
         inventorytypes:{
            items:[]
        }
        },
        product_id: null,
        row: []
      
      }
    },
    methods:{
        onProductEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('product', true, 'products')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('product', 'product_id', true, this.row)
            }
        },
        onProductDelete(){
            this.deleteEntity('product', this.product_id, true, 'products', 'product_id')
        },
        async setDelete(data){
            // if(await this.checkIfUsed('product', data.item.product_id) == true){
            //     this.$notify({
            //         type: 'error',
            //         group: 'notification',
            //         title: 'Error!',
            //         text: "Unable to delete, this record is being used by other transactions."
            //     })
            //     return
            // }
            this.product_id = data.item.product_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('product')
            this.fillEntityForm('product', data.item.product_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
    this.fillOptionsList('inventorytypes')
    this.fillOptionsList('categories')
    this.fillOptionsList('menus')
    this.fillOptionsList('suppliers')
    this.fillOptionsList('units')
    this.fillTableList('products')
    
    }
  }
</script>

