<template>
    <div><!-- main container -->
        <notifications group="notification" />
        <div class="animated fadeIn"> <!-- main div -->
            <b-row> <!-- main row -->
                <b-col sm="12">
                    <b-card > <!-- main check -->
                        <h5 slot="header">  <!-- table header -->
                            <span class="text-primary">
                                <i class="fa fa-bars"></i> 
                                Check type List
                                <small class="font-italic">List of all registered Check type       .</small></span>
                        </h5>
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('checktype')">
                                        <i class="fa fa-plus-circle"></i> Create New check type.
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.checktypes.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.checktypes.criteria"
                                    :fields="tables.checktypes.fields"
                                    :items.sync="tables.checktypes.items"
                                    :current-page="paginations.checktypes.currentPage"
                                    :per-page="paginations.checktypes.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'categories/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.checktype.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.checktype.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.checktypes.totalRows" :per-page="paginations.checktypes.perPage" v-model="paginations.checktypes.currentPage"
                                     class="my-0" />
                                </b-col>
                        </b-row> <!-- Pagination -->
                        
                    </b-card><!-- main check -->
                </b-col>
            </b-row> <!-- main row -->

        </div><!-- main div -->

        <div> <!-- modal div -->
            <b-modal 
                 v-model="showModalEntry"
               :noCloseOnEsc="true"
                :noCloseOnBackdrop="true"
                @shown="focusElement('check_type_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                Check type Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
                <b-form @keydown="resetFieldStates('checktype')" autocomplete="off">
                    <b-form-group>
                        <label for="check_type_code">* Check type Code</label>
                        <b-form-input
                            id="check_type_code"
                            v-model="forms.checktype.fields.check_type_code"
                            type="text"
                            placeholder="Check type Code"
                            ref="check_type_code">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>* Check type Name</label>
                        <b-form-input
                            ref="check_type_name"
                            id="check_type_name"
                            v-model="forms.checktype.fields.check_type_name"
                            type="text"
                            placeholder="Check type Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Check type Desc</label>
                        <b-form-input
                            ref="check_type_desc"
                            id="check_type_desc"
                            v-model="forms.checktype.fields.check_type_desc"
                            type="text"
                            placeholder="Check type Desc">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.checktype.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.checktype.isSaving" variant="primary" @click="onChecktypeEntry">
                    <icon v-if="forms.checktype.isSaving" name="sync" spin></icon>
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
                    Delete Check type
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this check type?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.checktype.isSaving" variant="primary" @click="onChecktypeDelete">
                        <icon v-if="forms.checktype.isSaving" name="sync" spin></icon>
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
    name: 'checktypes',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            checktype : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    check_type_id: null,
                    check_type_code: null,
                    check_type_name: null,
                    check_type_desc: null,
                    sort_key: 0
                }
            }
        },
        tables: {
            checktypes: {
                fields: [
                {
                    key: 'check_type_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'check_type_name',
                    label: 'Check type Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'check_type_desc',
                    label: 'Check type Desc',
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
          checktypes: {
            criteria: null
          }
        },
        paginations: {
          checktypes: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        check_type_id: null,
        row: []
      }
    },
    methods:{
        onChecktypeEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('checktype', true, 'checktypes')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('checktype', 'check_type_id', true, this.row)
            }
        },
        onChecktypeDelete(){
            this.deleteEntity('checktype', this.check_type_id, true, 'checktypes', 'check_type_id')
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
            this.check_type_id = data.item.check_type_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('checktype')
            this.fillEntityForm('checktype', data.item.check_type_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('checktypes')
    }
  }
</script>

