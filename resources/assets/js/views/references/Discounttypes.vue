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
                                Discount type List
                                <small class="font-italic">List of all registered Discount type       .</small></span>
                        </h5>
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('discounttype')">
                                        <i class="fa fa-plus-circle"></i> Create New discount type.
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.discounttypes.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty  
                                    :filter="filters.discounttypes.criteria"
                                    :fields="tables.discounttypes.fields"
                                    :items.sync="tables.discounttypes.items"
                                    :current-page="paginations.discounttypes.currentPage"
                                    :per-page="paginations.discounttypes.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'categories/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.discounttype.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.discounttype.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.discounttypes.totalRows" :per-page="paginations.discounttypes.perPage" v-model="paginations.discounttypes.currentPage"
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
                @shown="focusElement('discount_type_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                Discount type Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
                <b-form @keydown="resetFieldStates('discounttype')" autocomplete="off">
                    <b-form-group>
                        <label for="discount_type_code">* Discount type Code</label>
                        <b-form-input
                            id="discount_type_code"
                            v-model="forms.discounttype.fields.discount_type_code"
                            type="text"
                            placeholder="Discount type Code"
                            ref="discount_type_code">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>* Discount type Name</label>
                        <b-form-input
                            ref="discount_type_name"
                            id="discount_type_name"
                            v-model="forms.discounttype.fields.discount_type_name"
                            type="text"
                            placeholder="Discount type Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Discount type Desc</label>
                        <b-form-input
                            ref="discount_type_desc"
                            id="discount_type_desc"
                            v-model="forms.discounttype.fields.discount_type_desc"
                            type="text"
                            placeholder="Discount type Desc">
                        </b-form-input>
                    </b-form-group>
                     <b-form-group>
                        <label>* Discount Percent</label>
                        <vue-autonumeric
                            ref="discount_percent"
                            id="discount_percent"
                            v-model="forms.discounttype.fields.discount_percent"
                            class='form-control text-right'
                        :options="{
                                 minimumValue: '0', 
                                 maximumValue: '100', 
                                 decimalCharacter: '.', 
                                 emptyInputBehavior:'0.00',}"
                    ></vue-autonumeric>
                 
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.discounttype.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.discounttype.isSaving" variant="primary" @click="onDiscounttypeEntry">
                    <icon v-if="forms.discounttype.isSaving" name="sync" spin></icon>
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
                    Delete Discount type
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this discount type?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.discounttype.isSaving" variant="primary" @click="onDiscounttypeDelete">
                        <icon v-if="forms.discounttype.isSaving" name="sync" spin></icon>
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
    name: 'discounttypes',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            discounttype : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    discount_type_id: null,
                    discount_type_code: null,
                    discount_type_name: null,
                    discount_type_desc: null,
    
                    sort_key: 0
                }
            }
        },
        tables: {
            discounttypes: {
                fields: [
                {
                    key: 'discount_type_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'discount_type_name',
                    label: 'Discount type Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'discount_type_desc',
                    label: 'Discount type Desc',
                    tdClass: 'align-middle',
                    sortable: true
                },
                 
                {
                    key: 'discount_percent',
                    label: 'Discount Percent',
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
          discounttypes: {
            criteria: null
          }
        },
        paginations: {
          discounttypes: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        discount_type_id: null,
        row: []
      }
    },
    methods:{
        onDiscounttypeEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('discounttype', true, 'discounttypes')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('discounttype', 'discount_type_id', true, this.row)
            }
        },
        onDiscounttypeDelete(){
            this.deleteEntity('discounttype', this.discount_type_id, true, 'discounttypes', 'discount_type_id')
        },
        async setDelete(data){
            // if(await this.checkIfUsed('category', data.item.category_id) == true){
            //     this.$notify({
            //         type: 'error',
            //         group: 'notification',
            //         title: 'Error!',
            //         text: "Unable to delete, this record is being used by other transactions."
            //     })
            //     return
            // }
            this.discount_type_id = data.item.discount_type_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('discounttype')
            this.fillEntityForm('discounttype', data.item.discount_type_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('discounttypes')
    }
  }
</script>

