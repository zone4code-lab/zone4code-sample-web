---
to: src/store/apps/<%= h.changeCase.camel(component_name) %>/apiCalls.js

---

import axiosClient from "../../../configs/requestConfig";

// ** Utils Import
import { getDateRange } from 'src/@core/utils/get-daterange'

const data = {
  invoices: [


  ]
}


// ------------------------------------------------
// GET: RETURN <%= h.changeCase.camel(component_name) %> List
// ------------------------------------------------
/**
* @function getFilter<%= h.changeCase.camel(component_name) %>
 */
export const get<%= h.changeCase.camel(component_name) %>Filter = async (config) => {
  const result = await axiosClient.get('/api/v1/<%= h.changeCase.camel(component_name) %>/<%= h.changeCase.camel(component_name) %>')
    .catch((error) => {
      throw new error({
        name: '<%= h.changeCase.camel(component_name) %>',
        status: 502,
        code: 'cannot_get_<%= h.changeCase.camel(component_name) %>',
        message: 'cannot GET <%= h.changeCase.camel(component_name) %> data',
        debugMessage: `[<%= h.changeCase.camel(component_name) %>] Error in getFilter<%= h.changeCase.camel(component_name) %>. ${error}`,
        error,
      })
    });

  const { q = '', status = '', dates = [] } = config.params ?? ''
  const queryLowered = q.toLowerCase()

  const newArrayOfObj = result.data.<%= h.changeCase.camel(component_name) %>.map(({
    _id: id,
    ...rest
  }) => ({
    id,
    ...rest
  }));

  const filteredData = newArrayOfObj.filter(element => {
    if (dates.length) {
      const [start, end] = dates
      const filtered = []
      const range = getDateRange(start, end)
      const elementDate = new Date(element.createdAt)
      range.filter(date => {
        const rangeDate = new Date(date)
        if (
          elementDate.getFullYear() === rangeDate.getFullYear() &&
          elementDate.getDate() === rangeDate.getDate() &&
          elementDate.getMonth() === rangeDate.getMonth()
        ) {
          filtered.push(element.id)
        }
      })
      if (filtered.length && filtered.includes(element.id)) {
        return (
          (
            element.name.toLowerCase().includes(queryLowered) ||
            element.description.toLowerCase().includes(queryLowered) ||
            String(element.id).toLowerCase().includes(queryLowered)
          )
        )
      }
    } else {
      return (
        (
          element.name.toLowerCase().includes(queryLowered) ||
          element.description.toLowerCase().includes(queryLowered) ||
          String(element.id).toLowerCase().includes(queryLowered)
        )
      )
    }
  })

  return ({
    params: config.params,
    allData: data.invoices,
    invoices: filteredData,
    total: filteredData.length
  })
}

// ------------------------------------------------
// POST: ADD <%= h.changeCase.camel(component_name) %>
// ------------------------------------------------
/**
 * @function Add<%= h.changeCase.camel(component_name) %>
 */
export const Add<%= h.changeCase.camel(component_name) %> = async (<%= h.changeCase.camel(component_name) %>Details) => {
  const result = await axiosClient.post('/api/v1/<%= h.changeCase.camel(component_name) %>/<%= h.changeCase.camel(component_name) %>', <%= h.changeCase.camel(component_name) %>Details)
    .catch((error) => {
      throw new error({
        name: '<%= h.changeCase.camel(component_name) %>',
        status: 502,
        code: 'cannot_add_<%= h.changeCase.camel(component_name) %>',
        message: 'cannot POST <%= h.changeCase.camel(component_name) %> data',
        debugMessage: `[<%= h.changeCase.camel(component_name) %>] Error in Add<%= h.changeCase.camel(component_name) %>.${error}`,
        error,
      })
    });

  return result
};


// ------------------------------------------------
// PUT: UPDATE <%= h.changeCase.camel(component_name) %>
// ------------------------------------------------
/**
 * @function update<%= h.changeCase.camel(component_name) %>
 */
export const Update<%= h.changeCase.camel(component_name) %> = async (<%= h.changeCase.camel(component_name) %>Details) => {
  console.log(<%= h.changeCase.camel(component_name) %>Details, '<%= h.changeCase.camel(component_name) %>Details')

  const result = await axiosClient.put(`/api/v1/<%= h.changeCase.camel(component_name) %>/<%= h.changeCase.camel(component_name) %>/${<%= h.changeCase.camel(component_name) %>Details.id}`,
    {
      name: <%= h.changeCase.camel(component_name) %>Details.name,
      description: <%= h.changeCase.camel(component_name) %>Details.description
    })
    .catch((error) => {
      throw new error({
        name: '<%= h.changeCase.camel(component_name) %>',
        status: 502,
        code: 'cannot_update_<%= h.changeCase.camel(component_name) %>',
        message: 'cannot PUT <%= h.changeCase.camel(component_name) %> data',
        debugMessage: `[<%= h.changeCase.camel(component_name) %>] Error in update<%= h.changeCase.camel(component_name) %>.${error}`,
        error,
      })
    });

  return result
};


// ------------------------------------------------
// DELETE: DELETE <%= h.changeCase.camel(component_name) %>
// ------------------------------------------------
/**
 * @function Delete<%= h.changeCase.camel(component_name) %>
 */
export const Delete<%= h.changeCase.camel(component_name) %> = (id) => {
  return axiosClient.delete(`/api/v1/<%= h.changeCase.camel(component_name) %>/<%= h.changeCase.camel(component_name) %>/${id}`).catch((error) => {
    throw new error({
      name: '<%= h.changeCase.camel(component_name) %>',
      status: 502,
      code: 'cannot_delete_<%= h.changeCase.camel(component_name) %>',
      message: 'cannot DELETE <%= h.changeCase.camel(component_name) %> data',
      debugMessage: `[<%= h.changeCase.camel(component_name) %>] Error in Delete<%= h.changeCase.camel(component_name) %>.${error}`,
      error,
    })
  });
};
