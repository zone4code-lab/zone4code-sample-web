---
to: src/store/apps/<%= h.changeCase.camel(component_name) %>/index.js

---
import { createSlice, createAsyncThunk } from '@reduxjs/toolkit'
import { Add<%= h.changeCase.camel(component_name) %>, Delete<%= h.changeCase.camel(component_name) %>, get<%= h.changeCase.camel(component_name) %>Filter, Update<%= h.changeCase.camel(component_name) %> } from './apiCalls'


/**
 * GET ALL FILTER APPLAYED <%= h.changeCase.camel(component_name) %>
 */

export const fetchData = createAsyncThunk('appInvoice/fetchData', async params => {
  const response = await get<%= h.changeCase.camel(component_name) %>Filter({ params })

  return response
})


/**
 * CREATE <%= h.changeCase.camel(component_name) %>
 */
export const create<%= h.changeCase.camel(component_name) %> = createAsyncThunk('<%= h.changeCase.camel(component_name) %>/create', async (taskDetails) => {

  const res = await Add<%= h.changeCase.camel(component_name) %>(taskDetails)

  return res.data;
});


/**
 * UPDATE <%= h.changeCase.camel(component_name) %>
 */
export const update<%= h.changeCase.camel(component_name) %> = createAsyncThunk('update/create', async (taskDetails) => {


  const res = await Update<%= h.changeCase.camel(component_name) %>(taskDetails)

  return res.data;
});

/**
 * DELETE <%= h.changeCase.camel(component_name) %>
 */
export const delete<%= h.changeCase.camel(component_name) %> = createAsyncThunk('appInvoice/deleteData', async (id, { getState, dispatch }) => {
  const res = await Delete<%= h.changeCase.camel(component_name) %>(id);

  return res.data;
})

export const appInvoiceSlice = createSlice({
  name: 'appInvoice',
  initialState: {
    data: [],
    total: 1,
    params: {},
    allData: []
  },
  reducers: {},
  extraReducers: builder => {
    builder.addCase(fetchData.fulfilled, (state, action) => {
      state.data = action.payload.invoices
      state.params = action.payload.params
      state.allData = action.payload.allData
      state.total = action.payload.total
    })
  }
})

export default appInvoiceSlice.reducer
