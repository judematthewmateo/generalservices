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
                                Unit List
                                <small class="font-italic">List of all registered catergories       .</small></span>
                        </h5>
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('unit')">
                                        <i class="fa fa-plus-circle"></i> Create New Unit
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.units.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.units.criteria"
                                    :fields="tables.units.fields"
                                    :items.sync="tables.units.items"
                                    :current-page="paginations.units.currentPage"
                                    :per-page="paginations.units.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'units/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.unit.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.unit.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.units.totalRows" :per-page="paginations.units.perPage" v-model="paginations.units.currentPage"
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
                @shown="focusElement('unit_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                Unit Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
                <b-form @keydown="resetFieldStates('unit')" autocomplete="off">
                    <b-form-group>
                        <label for="unit_code">* Unit Code</label>
                        <b-form-input
                            id="unit_code"
                            v-model="forms.unit.fields.unit_code"
                            type="text"
                            placeholder="Unit Code"
                            ref="unit_code">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>* Unit Name</label>
                        <b-form-input
                            ref="unit_name"
                            id="unit_name"
                            v-model="forms.unit.fields.unit_name"
                            type="text"
                            placeholder="Unit Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Unit Desc</label>
                        <b-form-input
                            ref="unit_desc"
                            id="unit_desc"
                            v-model="forms.unit.fields.unit_desc"
                            type="text"
                            placeholder="Unit Desc">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.unit.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.unit.isSaving" variant="primary" @click="onUnitEntry">
                    <icon v-if="forms.unit.isSaving" name="sync" spin></icon>
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
                    Delete unit
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this unit?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.unit.isSaving" variant="primary" @click="onUnitDelete">
                        <icon v-if="forms.unit.isSaving" name="sync" spin></icon>
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
    name: 'units',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            unit : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    unit_id: null,
                    unit_code: null,
                    unit_name: null,
                    unit_desc: null,
                    sort_key: 0
                }
            }
        },
        tables: {
            units: {
                fields: [
                {
                    key: 'unit_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'unit_name',
                    label: 'Unit Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'unit_desc',
                    label: 'Unit Desc',
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
          units: {
            criteria: null
          }
        },
        paginations: {
          units: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        unit_id: null,
        row: []
      }
    },
    methods:{
        onUnitEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('unit', true, 'units')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('unit', 'unit_id', true, this.row)
            }
        },
        onUnitDelete(){
            this.deleteEntity('unit', this.unit_id, true, 'units', 'unit_id')
        },
        async setDelete(data){
            // if(await this.checkIfUsed('unit', data.item.unit_id) == true){
            //     this.$notify({
            //         type: 'error',
            //         group: 'notification',
            //         title: 'Error!',
            //         text: "Unable to delete, this record is being used by other transactions."
            //     })
            //     return
            // }
            this.unit_id = data.item.unit_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('unit')
            this.fillEntityForm('unit', data.item.unit_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('units')
    }
  }
</script>

