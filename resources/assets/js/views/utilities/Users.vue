<template>
    <!--<b-animated fade-in>  main container -->
    <div>
        <notifications group="notification" />
        <div class="animated fadeIn">
            <b-row>
                <b-col sm="12">
                    <b-card >
                        <h5 slot="header">
                            <span class="text-primary">
                                <i class="fa fa-bars"></i> 
                                User List
                                <small class="font-italic">List of all registered user.</small></span>
                        </h5>
                        <b-row class="mb-2">
                            <b-col sm="4">
                                    <b-button variant="primary" @click="showModalEntry = true, entryMode='Add', clearFields('user')">
                                            <i class="fa fa-plus-circle"></i> Create New User
                                    </b-button>
                            </b-col>

                            <b-col  sm="4">
                                <span></span>
                            </b-col>

                            <b-col  sm="4">
                                <b-form-input 
                                            v-model="filters.users.criteria"
                                            type="text" 
                                            placeholder="Search">
                                </b-form-input>
                            </b-col>
                        </b-row>

                        <b-row>
                            <b-col sm="12">
                                <b-table 
                                    responsive
                                    :filter="filters.users.criteria"
                                    :fields="tables.users.fields"
                                    :items.sync="tables.users.items"
                                    :current-page="paginations.users.currentPage"
                                    :per-page="paginations.users.perPage"
                                    striped hover small bordered show-empty
                                >
                                    <template slot="action" slot-scope="data">
                                        <b-btn :size="'sm'" variant="primary" @click="setUpdate(data)">
                                            <i class="fa fa-edit"></i>
                                        </b-btn>

                                        <b-btn :size="'sm'" variant="danger" @click="setDelete(data)">
                                            <i class="fa fa-trash"></i>
                                        </b-btn>
                                    </template>
                                    
                                </b-table>

                                <b-pagination
                                            :align="'right'"
                                            :total-rows="paginations.users.totalRows"
                                            :per-page="paginations.users.perPage"
                                            v-model="paginations.users.currentPage" />
                            </b-col>
                        </b-row>

                    </b-card>
                </b-col>
            </b-row>
        </div>
        <b-modal 
            v-model="showModalEntry"
            :noCloseOnEsc="true"
            :noCloseOnBackdrop="true"
            @shown="focusElement('username')"
        >
            <div slot="modal-title">
                User Entry - {{entryMode}}
            </div>
            <b-col lg=12>
                <b-form @keydown="resetFieldStates('user')" autocomplete="off">
                    <b-row>
                        <b-col sm="6">
                            <b-form-group>
                                <label for="user_code">* Username</label>
                                <b-form-input
                                    ref="username"
                                    id="username"
                                    v-model="forms.user.fields.username"
                                    type="text"
                                    placeholder="Username">
                                </b-form-input>
                            </b-form-group>
                            <b-form-group>
                                <label>* Password</label>
                                <b-form-input
                                    ref="password"
                                    id="password"
                                    v-model="forms.user.fields.password"
                                    type="password"
                                    placeholder="Password">
                                </b-form-input>
                            </b-form-group>
                            <b-form-group>
                                <label>* Confirm Password</label>
                                <b-form-input
                                    ref="confirm_password"
                                    id="confirm_password"
                                    v-model="forms.user.fields.password_confirmation"
                                    type="password"
                                    placeholder="Confirm Password">
                                </b-form-input>
                            </b-form-group>
                            <b-form-group>
                                <label for="user_code">* Email</label>
                                <b-form-input
                                    ref="email"
                                    id="email"
                                    v-model="forms.user.fields.email"
                                    type="text"
                                    placeholder="Email">
                                </b-form-input>
                            </b-form-group>
                        </b-col>
                        <b-col sm="6">
                            <b-form-group>
                                <label>Firstname</label>
                                <b-form-input
                                    id="firstname"
                                    v-model="forms.user.fields.firstname"
                                    type="text"
                                    placeholder="Firstname">
                                </b-form-input>
                            </b-form-group>
                            <b-form-group>
                                <label>Middlename</label>
                                <b-form-input
                                    id="middlename"
                                    v-model="forms.user.fields.middlename"
                                    type="text"
                                    placeholder="Middlename">
                                </b-form-input>
                            </b-form-group>
                            <b-form-group>
                                <label>Lastname</label>
                                <b-form-input
                                    id="lastname"
                                    v-model="forms.user.fields.lastname"
                                    type="text"
                                    placeholder="Lastname">
                                </b-form-input>
                            </b-form-group>
                        </b-col>
                    </b-row>
                </b-form>
            </b-col>
            <div slot="modal-footer">
                <b-button :disabled="forms.user.isSaving" variant="primary" @click="onUserEntry">
                    <icon v-if="forms.user.isSaving" name="sync" spin></icon>
                    <i class="fa fa-check"></i>
                    Save
                </b-button>
                <b-button variant="secondary" @click="showModalEntry=false">Close</b-button>            
            </div>
        </b-modal>
        <b-modal 
            v-model="showModalDelete"
            :noCloseOnEsc="true"
            :noCloseOnBackdrop="true"
        >
            <div slot="modal-title">
                Delete User
            </div>
            <b-col lg=12>
                Are you sure you want to delete this user?
            </b-col>
            <div slot="modal-footer">
                <b-button :disabled="forms.user.isSaving" variant="primary" @click="onUserDelete">
                    <icon v-if="forms.user.isSaving" name="sync" spin></icon>
                    <i class="fa fa-check"></i>
                    OK
                </b-button>
                <b-button variant="secondary" @click="showModalDelete=false">Close</b-button>            
            </div>
        </b-modal>
    </div>
</template>

<script>
export default {
    name: 'users',
    data () {
        return {
            entryMode: 'Add',
            showModalEntry: false, //if true show modal
            showModalDelete: false,
            forms: {
                user : {
                    isSaving: false,
                    fields: {
                        user_id: null,
                        username: null,
                        firstname: null,
                        middlename: null,
                        lastname: null,
                        email: null,
                        password: null,
                        password_confirmation: null,
                    }
                }
            },
            tables: {
                users: {
                    fields:[
                        {
                            key:'username',
                            label: 'Username',
                            tdClass: 'align-middle',
                            sortable: true
                        },
                        {
                            key:'firstname',
                            label: 'Firstname',
                            tdClass: 'align-middle',
                            sortable: true
                        },
                        {
                            key:'middlename',
                            label: 'Middlename',
                            tdClass: 'align-middle',
                        },
                        {
                            key:'lastname',
                            label: 'Lastname',
                            tdClass: 'align-middle',
                            sortable: true
                        },
                        {
                            key:'email',
                            label: 'Email',
                            tdClass: 'align-middle',
                        },
                        {
                            key:'action',
                            label:'',
                            thStyle: {width: '75px'}
                        }
                    ],
                    items: []
                }
            },
            filters: {
                users: {
                    criteria: null
                }
            },
            paginations: {
                users: {
                    totalRows: 0,
                    currentPage: 1,
                    perPage: 10
                }
            },
            id: null,
            row: []
        }
    },
    methods:{
        onUserEntry () {
            if(this.entryMode == 'Add'){
                this.createEntity('user', true, 'users')
            }
            else{
                this.updateEntity('user', 'id', true, this.row)
            }
        },
        onUserDelete(){
            this.deleteEntity('user', this.id, true, 'users', 'id')
        },
        setDelete(data){
            this.showModalDelete=true
            this.id = data.item.id
        },
        setUpdate(data){
            this.row = data.item
            this.fillEntityForm('user', data.item.id)
            this.showModalEntry=true
            this.entryMode='Edit'
        }
    },
    created () {
        this.fillTableList('users');
    },
  }
</script>

