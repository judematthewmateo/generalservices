<template>
                <div>
                 <notifications group="notification" />
                  <div class="animated fadeIn"> <!-- main div -->

                   <b-row> <!-- main row -->
                <b-col sm="12">
                    <b-card > <!-- main card -->
                   <h5 slot="header">  <!-- table header -->
                              <span class="text-primary">
                                <i class="fa fa-bars"></i> 
                                Departments List 
                                <small class="font-italic">List of all registered Departments       .</small></span>
                        </h5>
                             <b-row class="mb-2"> <!-- row button and search input -->
                            <b-col sm="4">
                                <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('department')">
                                        <i class="fa fa-plus-circle"></i> Create New Departments
                                </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                   v-model="filters.departments.criteria"
                                    type="text" 
                                    placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row> <!-- row button and search input -->

                    <b-row> <!-- row table -->
                            <b-col sm="12">
                                <b-table 
                                    responsive striped hover small bordered show-empty
                                    :filter="filters.departments.criteria"
                                    :fields="tables.departments.fields"
                                    :items.sync="tables.departments.items"
                                    :current-page="paginations.departments.currentPage"
                                    :per-page="paginations.departments.perPage"
                                > <!-- table -->

                                    <template slot="action" slot-scope="data"> <!-- action slot  :to="{path: 'departments/' + data.item.id } -->
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" :disabled="forms.department.isDeleting" variant="danger" @click="setDelete(data)">
                                            <icon v-if="forms.department.isDeleting" name="sync" spin></icon>
                                            <i v-else class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>

                                </b-table> <!-- table -->
                            </b-col>
                        </b-row> <!-- row table -->


                        <b-row >  <!-- Pagination -->
                                <b-col sm="12" class="my-1">
                                    <b-pagination size="sm" align="center" :total-rows="paginations.departments.totalRows" :per-page="paginations.departments.perPage" v-model="paginations.departments.currentPage"
                                     class="my-0" />
                                </b-col>
                        </b-row> <!-- Pagination -->


                    </b-card><!-- main card -->
                </b-col>
            </b-row> <!-- main row -->
                  </div>
                  
        <div> <!-- modal div -->
            <b-modal 
                v-model="showModalEntry"
                :noCloseOnEsc="true"
                :noCloseOnBackdrop="true"
                @shown="focusElement('department_code')"
            >
            
            <div slot="modal-title"> <!-- modal title -->
                department Entry - {{entryMode}}
            </div> <!-- modal title -->

            <b-col lg=12> <!-- modal body -->
                <b-form @keydown="resetFieldStates('department')" autocomplete="off">
                    <b-form-group>
                        <label for="department_code">* Department Code</label>
                        <b-form-input
                            id="department_code"
                            v-model="forms.department.fields.department_code"
                            type="text"
                            placeholder="Department Code"
                            ref="department_code">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>* Department Name</label>
                        <b-form-input
                            ref="department_name"
                            id="department_name"
                            v-model="forms.department.fields.department_name"
                            type="text"
                            placeholder="Department Name">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Department Desc</label>
                        <b-form-input
                            ref="department_desc"
                            id="department_desc"
                            v-model="forms.department.fields.department_desc"
                            type="text"
                            placeholder="Department Desc">
                        </b-form-input>
                    </b-form-group>
                    <b-form-group>
                        <label>Sort</label>
                        <b-form-input
                            ref="sort_key"
                            id="sort_key"
                            v-model="forms.department.fields.sort_key"
                            type="number"
                            placeholder="Sort Key">
                        </b-form-input>
                    </b-form-group>
                </b-form>
            </b-col> <!-- modal body -->

            <div slot="modal-footer"><!-- modal footer buttons -->
                <b-button :disabled="forms.department.isSaving" variant="primary" @click="onDepartmentEntry">
                    <icon v-if="forms.department.isSaving" name="sync" spin></icon>
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
                    Delete department
                </div>
                <b-col lg=12>
                    Are you sure you want to delete this department?
                </b-col>
                <div slot="modal-footer">
                    <b-button :disabled="forms.department.isSaving" variant="primary" @click="onDepartmentDelete">
                        <icon v-if="forms.department.isSaving" name="sync" spin></icon>
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
    name: 'departments',
    data () {
      return {
        entryMode: 'Add',
        showModalEntry: false, //if true show modal
        showModalDelete: false,
        forms:{
            department : {
                isSaving: false,
                isDeleting: false,
                fields: {
                    department_id: null,
                    department_code: null,
                    department_name: null,
                    department_desc: null,
                    sort_key: 0
                }
            }
        },
        tables: {
            departments: {
                fields: [
                {
                    key: 'department_code',
                    label: 'Code',
                    thStyle: {width: '150px'},
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'department_name',
                    label: 'Department Name',
                    tdClass: 'align-middle',
                    sortable: true
                },
                {
                    key: 'department_desc',
                    label: 'Department Desc',
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
          departments: {
            criteria: null
          }
        },
        paginations: {
          departments: {
            totalRows: 0,
            currentPage: 1,
            perPage: 10
          }
        },
        department_id: null,
        row: []
      }
    },
    methods:{
        onDepartmentEntry () {
            if(this.entryMode == 'Add'){
                //name of form
                //if from a modal?
                //name of table to be inserted
                this.createEntity('department', true, 'departments')
            }
            else{
                //name of form
                //name of primary key
                //if from a modal?
                //row to be edited
                this.updateEntity('department', 'department_id', true, this.row)
            }
        },
        onDepartmentDelete(){
            this.deleteEntity('department', this.department_id, true, 'departments', 'department_id')
        },
        async setDelete(data){
            // if(await this.checkIfUsed('department', data.item.department_id) == true){
            //     this.$notify({
            //         type: 'error',
            //         group: 'notification',
            //         title: 'Error!',
            //         text: "Unable to delete, this record is being used by other transactions."
            //     })
            //     return
            // }
            this.department_id = data.item.department_id
            this.showModalDelete = true
        },
        setUpdate(data){
            this.row = data.item
            this.resetFieldStates('department')
            this.fillEntityForm('department', data.item.department_id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
      //name of table
      this.fillTableList('departments')
    }
  }
</script>

