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
                                        Inventory type List
                                <small class="font-italic">List of all registered inventory type.</small></span>
                        </h5>
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('inventorytype')">
                                        <i class="fa fa-plus-circle"></i> Create New inventory type.
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.inventorytypes.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.inventorytypes.criteria"
                                    :fields="tables.inventorytypes.fields"
                                    :items.sync="tables.inventorytypes.items"
                                    :current-page="paginations.inventorytypes.currentPage"
                                    :per-page="paginations.inventorytypes.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'inventoryies/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.inventorytype.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.inventorytype.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.inventorytypes.totalRows" :per-page="paginations.inventorytypes.perPage" v-model="paginations.inventorytypes.currentPage"
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
                @shown="focusElement('inventory_type_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                Inventory type Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
                <b-form @keydown="resetFieldStates('inventorytype')" autocomplete="off">
                    <b-form-group>
                        <label for="inventory_type_code">* Inventory type Code</label>
                        <b-form-input
                            id="inventory_type_code"
                            v-model="forms.inventorytype.fields.inventory_type_code"
                            type="text"
                            placeholder="Inventory type Code"
                            ref="inventory_type_code">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>* Inventory type Name</label>
                        <b-form-input
                            ref="in_type_name"
                            id="inventory_type_name"
                            v-model="forms.inventorytype.fields.inventory_type_name"
                            type="text"
                            placeholder="Inventory type Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Inventory type Desc</label>
                        <b-form-input
                            ref="inventory_type_desc"
                            id="inventory_type_desc"
                            v-model="forms.inventorytype.fields.inventory_type_desc"
                            type="text"
                            placeholder="Inventory type Desc">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.inventorytype.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.inventorytype.isSaving" variant="primary" @click="onInventorytypeEntry">
                    <icon v-if="forms.inventorytype.isSaving" name="sync" spin></icon>
                    <i class="fa fa-inventory"></i>
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
                    Delete Inventory type
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this inventory type?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.inventorytype.isSaving" variant="primary" @click="onInventorytypeDelete">
                        <icon v-if="forms.inventorytype.isSaving" name="sync" spin></icon>
                        <i class="fa fa-inventory"></i>
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
    name: 'inventorytypes',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            inventorytype : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    inventory_type_id: null,
                    inventory_type_code: null,
                    inventory_type_name: null,
                    inventory_type_desc: null,
                    sort_key: 0
                }
            }
        },
        tables: {
            inventorytypes: {
                fields: [
                {
                    key: 'inventory_type_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'inventory_type_name',
                    label: 'Inventory type Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'inventory_type_desc',
                    label: 'Inventory type Desc',
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
          inventorytypes: {
            criteria: null
          }
        },
        paginations: {
          inventorytypes: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        inventory_type_id: null,
        row: []
      }
    },
    methods:{
        onInventorytypeEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('inventorytype', true, 'inventorytypes')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('inventorytype', 'inventory_type_id', true, this.row)
            }
        },
        onInventorytypeDelete(){
            this.deleteEntity('inventorytype', this.inventory_type_id, true, 'inventorytypes', 'inventory_type_id')
        },
        async setDelete(data){
            // if(await this.inventoryIfUsed('category', data.item.category_id) == true){
            //     this.$notify({
            //         type: 'error',
            //         group: 'notification',
            //         title: 'Error!',
            //         text: "Unable to delete, this record is being used by other transactions."
            //     })
            //     return
            // }
            this.inventory_type_id = data.item.inventory_type_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('inventorytype')
            this.fillEntityForm('inventorytype', data.item.inventory_type_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('inventorytypes')
    }
  }
</script>

