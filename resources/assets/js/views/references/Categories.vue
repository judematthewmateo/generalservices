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
                                Category List
                                <small class="font-italic">List of all registered catergories       .</small></span>
                        </h5>
                        
                        <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('category')">
                                        <i class="fa fa-plus-circle"></i> Create New Categories
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                    v-model="filters.categories.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->
                    
                        <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.categories.criteria"
                                    :fields="tables.categories.fields"
                                    :items.sync="tables.categories.items"
                                    :current-page="paginations.categories.currentPage"
                                    :per-page="paginations.categories.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'categories/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.category.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.category.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->

                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="right" :total-rows="paginations.categories.totalRows" :per-page="paginations.categories.perPage" v-model="paginations.categories.currentPage"
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
                @shown="focusElement('category_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                Category Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
                <b-form @keydown="resetFieldStates('category')" autocomplete="off">
                    <b-form-group>
                        <label for="category_code">* Category Code</label>
                        <b-form-input
                            id="category_code"
                            v-model="forms.category.fields.category_code"
                            type="text"
                            placeholder="Category Code"
                            ref="category_code">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>* Category Name</label>
                        <b-form-input
                            ref="category_name"
                            id="category_name"
                            v-model="forms.category.fields.category_name"
                            type="text"
                            placeholder="Category Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Category Desc</label>
                        <b-form-input
                            ref="category_desc"
                            id="category_desc"
                            v-model="forms.category.fields.category_desc"
                            type="text"
                            placeholder="Category Desc">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.category.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.category.isSaving" variant="primary" @click="onCategoryEntry">
                    <icon v-if="forms.category.isSaving" name="sync" spin></icon>
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
                    Delete Category
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this category?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.category.isSaving" variant="primary" @click="onCategoryDelete">
                        <icon v-if="forms.category.isSaving" name="sync" spin></icon>
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
    name: 'categories',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            category : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    category_id: null,
                    category_code: null,
                    category_name: null,
                    category_desc: null,
                    sort_key: 0
                }
            }
        },
        tables: {
            categories: {
                fields: [
                {
                    key: 'category_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'category_name',
                    label: 'Category Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'category_desc',
                    label: 'Category Desc',
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
          categories: {
            criteria: null
          }
        },
        paginations: {
          categories: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        category_id: null,
        row: []
      }
    },
    methods:{
        onCategoryEntry () {0
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('category', true, 'categories')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('category', 'category_id', true, this.row)
            }
        },
        onCategoryDelete(){
            this.deleteEntity('category', this.category_id, true, 'categories', 'category_id')
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
            this.category_id = data.item.category_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('category')
            this.fillEntityForm('category', data.item.category_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('categories')
    }
  }
</script>

