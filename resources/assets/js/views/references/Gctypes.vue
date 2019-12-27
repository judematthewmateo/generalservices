<template>
    <div><!-- main container -->
        <notifications group="notification" />
        <div class="animated fadeIn"> <!-- main div -->
            <b-row> <!-- main row -->
                <b-col sm="12">
                    <b-card > <!-- main gc -->
                        <h5 slot="header">  <!-- table header -->
                            <span class="text-primary">
                                <i class="fa fa-bars"></i> 
                                GC type List
                                <small class="font-italic">List of all registered GC type       .</small></span>
                        </h5>
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('gctype')">
                                        <i class="fa fa-plus-circle"></i> Create New gc type.
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.gctypes.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.gctypes.criteria"
                                    :fields="tables.gctypes.fields"
                                    :items.sync="tables.gctypes.items"
                                    :current-page="paginations.gctypes.currentPage"
                                    :per-page="paginations.gctypes.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'categories/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.gctype.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.gctype.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.gctypes.totalRows" :per-page="paginations.gctypes.perPage" v-model="paginations.gctypes.currentPage"
                                     class="my-0" />
                                </b-col>
                        </b-row> <!-- Pagination -->
                        
                    </b-card><!-- main gc -->
                </b-col>
            </b-row> <!-- main row -->

        </div><!-- main div -->

        <div> <!-- modal div -->
            <b-modal 
                v-model="showModalEntry"
                :noCloseOnEsc="true"
                :noCloseOnBackdrop="true"
                @shown="focusElement('gc_type_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                GC type Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
                <b-form @keydown="resetFieldStates('gctype')" autocomplete="off">
                    <b-form-group>
                        <label for="gc_type_code">* GC type Code</label>
                        <b-form-input
                            id="gc_type_code"
                            v-model="forms.gctype.fields.gc_type_code"
                            type="text"
                            placeholder="GC type Code"
                            ref="gc_type_code">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>* GC type Name</label>
                        <b-form-input
                            ref="gc_type_name"
                            id="gc_type_name"
                            v-model="forms.gctype.fields.gc_type_name"
                            type="text"
                            placeholder="GC type Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>GC type Desc</label>
                        <b-form-input
                            ref="gc_type_desc"
                            id="gc_type_desc"
                            v-model="forms.gctype.fields.gc_type_desc"
                            type="text"
                            placeholder="GC type Desc">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.gctype.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.gctype.isSaving" variant="primary" @click="onGCtypeEntry">
                    <icon v-if="forms.gctype.isSaving" name="sync" spin></icon>
                    <i class="fa fa-gc"></i>
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
                    Delete GC type
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this gc type?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.gctype.isSaving" variant="primary" @click="onGCtypeDelete">
                        <icon v-if="forms.gctype.isSaving" name="sync" spin></icon>
                        <i class="fa fa-gc"></i>
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
    name: 'gctypes',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            gctype : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    gc_type_id: null,
                    gc_type_code: null,
                    gc_type_name: null,
                    gc_type_desc: null,
                    sort_key: 0
                }
            }
        },
        tables: {
            gctypes: {
                fields: [
                {
                    key: 'gc_type_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'gc_type_name',
                    label: 'GC type Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'gc_type_desc',
                    label: 'GC type Desc',
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
          gctypes: {
            criteria: null
          }
        },
        paginations: {
          gctypes: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        gc_type_id: null,
        row: []
      }
    },
    methods:{
        onGCtypeEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('gctype', true, 'gctypes')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('gctype', 'gc_type_id', true, this.row)
            }
        },
        onGCtypeDelete(){
            this.deleteEntity('gctype', this.gc_type_id, true, 'gctypes', 'gc_type_id')
        },
        async setDelete(data){
            // if(await this.gcIfUsed('category', data.item.category_id) == true){
            //     this.$notify({
            //         type: 'error',
            //         group: 'notification',
            //         title: 'Error!',
            //         text: "Unable to delete, this record is being used by other transactions."
            //     })
            //     return
            // }
            this.gc_type_id = data.item.gc_type_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('gctype')
            this.fillEntityForm('gctype', data.item.gc_type_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('gctypes')
    }
  }
</script>

