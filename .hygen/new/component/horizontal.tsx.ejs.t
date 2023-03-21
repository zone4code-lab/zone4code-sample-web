---
to: src/navigation/horizontal/index.js
inject: true
append: true
---

{
      title: '<%= h.changeCase.camel(component_name) %> Module',
      icon: 'tabler:file-dollar',
      children: [
        {
          title: '<%= h.changeCase.camel(component_name) %> List',
          path: '/apps/<%= h.changeCase.camel(component_name) %>/list'
        },
        {
          title: '<%= h.changeCase.camel(component_name) %> Add',
          path: '/apps/<%= h.changeCase.camel(component_name) %>/add'
        }
      ]
    },



