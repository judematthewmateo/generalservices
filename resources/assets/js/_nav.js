export default {
  items: [
    {
      name: 'Dashboard',
      url: '/dashboard',
      icon: 'icon-speedometer'
    },
    {
      name: 'References',
      url: '/references',
      icon: 'icon-book-open',
      children:[
        {
          name: 'Categories',
          url: '/references/categories',
          icon: 'icon-list'
        },
        {
          name: 'Departments',
          url: '/references/departments',
          icon: 'icon-list'
        },
        {
          name: 'Units',
          url: '/references/units',
          icon: 'icon-list'
        },
        {
          name: 'Card types',
          url: '/references/cardtypes',
          icon: 'icon-list'
        },
        {
          name: 'Check types',
          url: '/references/checktypes',
          icon: 'icon-list'
        },
        {
          name: 'GC types',
          url: '/references/gctypes',
          icon: 'icon-list'
        },
        {
          name: 'Menus',
          url: '/references/menus',
          icon: 'icon-list'
        },
        // {
        //   name: 'Inventory Types',
        //   url: '/references/inventorytypes',
        //   icon: 'icon-list'
        // },
        {
          name: 'Suppliers',
          url: '/references/suppliers',
          icon: 'icon-list'
        },
        {
        name: 'Discounts',
        url: '/references/discounttypes',
        icon: 'icon-list'
        },  
        {
        name: 'Products',
        url: '/references/products',
        icon: 'icon-list'
        },
      ]
    },
    
  
        {
          name: 'Inventory',
          url: '/inventory',
          icon: 'icon-book-open',
          children:[
            {
              name: 'Purchase Order List',
              url: '/inventory/purchasemains',
              icon: 'icon-list'
            },
            {
              name: 'Receiving List',
              url: '/inventory/receivingmains',
              icon: 'icon-list'
            },
            {
              name: 'Issuance List',
              url: '/inventory/issuance',
              icon: 'icon-list'
            },
            {
              name: 'Adjustment List',
              url: '/inventory/adjustmentmains',
              icon: 'icon-list'
            },
            
         ]
            }
  ]
        }

            // {
            //   name: 'Accounts',
            //   url: '/accounts',
            //   icon: 'icon-wrench',
            //   children:[
            // {
            //   name: 'Users',
            //   url: '/accounts/users',
              
            //   icon: 'icon-user'
            // },
            // {
            //   name: 'User Group',
            //   url: '/accounts/user_groups',
            //   icon: 'icon-people'
            // },
            // {
            //   name: 'Company Settings',
            //   url: '/accounts/company_settings',
            //   icon: 'icon-settings'
            // }
     
     // ]
//}