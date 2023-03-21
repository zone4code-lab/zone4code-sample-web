---
to: src/navigation/vertical/index.js
inject: true
append: true
after:   'title: Course progress '


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
