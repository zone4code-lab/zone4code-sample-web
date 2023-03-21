---
to: <%= absPath %>/add/index.js
---

// ** React Imports
import { useState } from 'react'

// ** MUI Imports
import Grid from '@mui/material/Grid'

// ** Demo Components Imports
import Add<%= h.changeCase.camel(component_name) %> from 'src/views/apps/<%= h.changeCase.camel(component_name) %>/add/Add<%= h.changeCase.camel(component_name) %>'


const <%= h.changeCase.camel(component_name) %>Add = ({ apiClientData, invoiceNumber }) => {
  // ** State
  const [addCustomerOpen, setAddCustomerOpen] = useState(false)
  const [selectedClient, setSelectedClient] = useState(null)
  const [clients, setClients] = useState(apiClientData)
  const toggleAddCustomerDrawer = () => setAddCustomerOpen(!addCustomerOpen)

  return (
    <Grid container spacing={6}>
      <Grid item xl={12} md={12} xs={12}>
        <Add<%= h.changeCase.camel(component_name) %>
          clients={clients}
          invoiceNumber={invoiceNumber}
          selectedClient={selectedClient}
          setSelectedClient={setSelectedClient}
          toggleAddCustomerDrawer={toggleAddCustomerDrawer}
        />
      </Grid>
    </Grid>

  )
}


export default <%= h.changeCase.camel(component_name) %>Add

















