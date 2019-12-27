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
                                Supplier List
                                <small class="font-italic">List of all registered catergories       .</small></span>
                        </h5>
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('supplier')">
                                        <i class="fa fa-plus-circle"></i> Create New Supplier
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.suppliers.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.suppliers.criteria"
                                    :fields="tables.suppliers.fields"
                                    :items.sync="tables.suppliers.items"
                                    :current-page="paginations.suppliers.currentPage"
                                    :per-page="paginations.suppliers.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'suppliers/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.supplier.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.supplier.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.suppliers.totalRows" :per-page="paginations.suppliers.perPage" v-model="paginations.suppliers.currentPage"
                                     class="my-0" />
                                </b-col>
                        </b-row> <!-- Pagination -->
                        
                    </b-card><!-- main card -->
                </b-col>
            </b-row> <!-- main row -->

        </div><!-- main div -->

        <div> <!-- modal div -->
            <b-modal 
                v-model="showModalEntry"
                :noCloseOnEsc="true"
                :noCloseOnBackdrop="true"
                @shown="focusElement('supplier_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                Supplier Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
            
                <b-form @keydown="resetFieldStates('supplier')" autocomplete="off">
                   
                    <b-form-group>
                        <label for="supplier_code">* Supplier Code</label>
                        <b-form-input
                            id="supplier_code"
                            v-model="forms.supplier.fields.supplier_code"
                            type="text"
                            placeholder="Supplier Code"
                            ref="supplier_code">
                        </b-form-input>
                    </b-form-group>
                   
                    <b-form-group>
                        <label>* Supplier Name</label>
                        <b-form-input
                            ref="supplier_name"
                            id="supplier_name"
                            v-model="forms.supplier.fields.supplier_name"
                            type="text"
                            placeholder="Supplier Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Address</label>
                        <b-form-input
                            ref="address"
                            id="address"
                            v-model="forms.supplier.fields.address"
                            type="text"
                            placeholder="Address">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Contact Person</label>
                        <b-form-input
                            ref="contact_person"
                            id="contact_person"
                            v-model="forms.supplier.fields.contact_person"
                            type="text"
                            placeholder="Contact Person">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Contact Number</label>
                        <b-form-input
                            ref="contact_number"
                            id="contact_number"
                            v-model="forms.supplier.fields.contact_number"
                            type="number"
                            placeholder="Contact Number">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Email Address</label>
                        <b-form-input
                            ref="email_address"
                            id="email_address"
                            v-model="forms.supplier.fields.email_address"
                            type="text"
                            placeholder="Email Address">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Supplier Desc</label>
                        <b-form-input
                            ref="supplier_desc"
                            id="supplier_desc"
                            v-model="forms.supplier.fields.supplier_desc"
                            type="text"
                            placeholder="Supplier Desc">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.supplier.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.supplier.isSaving" variant="primary" @click="onSupplierEntry">
                    <icon v-if="forms.supplier.isSaving" name="sync" spin></icon>
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
                    Delete supplier
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this supplier?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.supplier.isSaving" variant="primary" @click="onSupplierDelete">
                        <icon v-if="forms.supplier.isSaving" name="sync" spin></icon>
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
    name: 'suppliers',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            supplier : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    supplier_id: null,
                    supplier_code: null,
                    supplier_name: null,
                    address_name: null,
                    contact_person: null,
                    conatact_number: null,
                    email_address: null,
                    supplier_desc: null,

                    sort_key: 0
                }
            }
        },
        tables: {
            suppliers: {
                fields: [
                {
                    key: 'supplier_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'supplier_name',
                    label: 'Supplier Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'supplier_desc',
                    label: 'Supplier Desc',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'address',
                    label: 'Address',
                    tdClass: 'align-middle',
                    sortable: true
                },
                    {
                    key: 'contact_person',
                    label: 'Contact Person',
                    tdClass: 'align-middle',
                    sortable: true
                },
                    {
                    key: 'contact_number',
                    label: 'Contact Number',
                    tdClass: 'align-middle',
                    sortable: true
                },
                    {
                    key: 'email_address',
                    label: 'Email Address',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'sort_key',
                    label: 'Sort',
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
          suppliers: {
            criteria: null
          }
        },
        paginations: {
          suppliers: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        supplier_id: null,
        row: []
      }
    },
    methods:{
        onSupplierEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('supplier', true, 'suppliers')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('supplier', 'supplier_id', true, this.row)
            }
        },
        onSupplierDelete(){
            this.deleteEntity('supplier', this.supplier_id, true, 'suppliers', 'supplier_id')
        },
        async setDelete(data){
            // if(await this.checkIfUsed('supplier', data.item.supplier_id) == true){
            //     this.$notify({
            //         type: 'error',
            //         group: 'notification',
            //         title: 'Error!',
            //         text: "Unable to delete, this record is being used by other transactions."
            //     })
            //     return
            // }
            this.supplier_id = data.item.supplier_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('supplier')
            this.fillEntityForm('supplier', data.item.supplier_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('suppliers')
    }
  }
</script>

