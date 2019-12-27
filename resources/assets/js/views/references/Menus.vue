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
                                Menu List
                                <small class="font-italic">List of all registered catergories       .</small></span>
                        </h5>
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('menu')">
                                        <i class="fa fa-plus-circle"></i> Create New Menu
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.menus.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.menus.criteria"
                                    :fields="tables.menus.fields"
                                    :items.sync="tables.menus.items"
                                    :current-page="paginations.menus.currentPage"
                                    :per-page="paginations.menus.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'menus/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.menu.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.menu.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.menus.totalRows" :per-page="paginations.menus.perPage" v-model="paginations.menus.currentPage"
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
                @shown="focusElement('menu_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                Menu Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
                <b-form @keydown="resetFieldStates('menu')" autocomplete="off">
                    <b-form-group>
                        <label for="menu_code">* Menu Code</label>
                        <b-form-input
                            id="menu_code"
                            v-model="forms.menu.fields.menu_code"
                            type="text"
                            placeholder="Menu Code"
                            ref="menu_code">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>* Menu Name</label>
                        <b-form-input
                            ref="menu_name"
                            id="menu_name"
                            v-model="forms.menu.fields.menu_name"
                            type="text"
                            placeholder="Menu Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Menu Desc</label>
                        <b-form-input
                            ref="menu_desc"
                            id="menu_desc"
                            v-model="forms.menu.fields.menu_desc"
                            type="text"
                            placeholder="Menu Desc">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.menu.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.menu.isSaving" variant="primary" @click="onMenuEntry">
                    <icon v-if="forms.menu.isSaving" name="sync" spin></icon>
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
                    Delete menu
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this menu?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.menu.isSaving" variant="primary" @click="onMenuDelete">
                        <icon v-if="forms.menu.isSaving" name="sync" spin></icon>
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
    name: 'menus',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            menu : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    menu_id: null,
                    menu_code: null,
                    menu_name: null,
                    menu_desc: null,
                    sort_key: 0
                }
            }
        },
        tables: {
            menus: {
                fields: [
                {
                    key: 'menu_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'menu_name',
                    label: 'Menu Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'menu_desc',
                    label: 'Menu Desc',
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
          menus: {
            criteria: null
          }
        },
        paginations: {
          menus: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        menu_id: null,
        row: []
      }
    },
    methods:{
        onMenuEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('menu', true, 'menus')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('menu', 'menu_id', true, this.row)
            }
        },
        onMenuDelete(){
            this.deleteEntity('menu', this.menu_id, true, 'menus', 'menu_id')
        },
        async setDelete(data){
            // if(await this.checkIfUsed('menu', data.item.menu_id) == true){
            //     this.$notify({
            //         type: 'error',
            //         group: 'notification',
            //         title: 'Error!',
            //         text: "Unable to delete, this record is being used by other transactions."
            //     })
            //     return
            // }
            this.menu_id = data.item.menu_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('menu')
            this.fillEntityForm('menu', data.item.menu_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('menus')
    }
  }
</script>

