---
to: src/views/apps/<%= h.changeCase.camel(component_name) %>/edit/Edit.js
---
// ** React Imports
import { useState, useEffect } from 'react'

// ** Next Import
import Link from 'next/link'

// ** MUI Imports
import Grid from '@mui/material/Grid'
import Alert from '@mui/material/Alert'

// ** Demo Components Imports
import EditCard from './EditCard'
import axiosClient from "../../../../configs/requestConfig";

const InvoiceEdit = () => {
  // ** State
  const [error, setError] = useState(false)
  const [data, setData] = useState(null)
  const [id, setId] = useState(false)

  useEffect(() => {
    const lastSegment = (window.location.href).split("/")
    setId(lastSegment[lastSegment.length - 2])
    axiosClient
      .get(`/api/v1/<%= h.changeCase.camel(component_name) %>/<%= h.changeCase.camel(component_name) %>/${id}`)
      .then(res => {
        setData(res.data)
        setError(false)
      })
      .catch((error) => {
        setData(null)
        setError(true)
      })
  }, [id])
  if (data) {
    return (
      <><Grid item xl={9} md={8} xs={12}>
        <EditCard data={data} />
      </Grid>
      </>
    )
  } else if (error) {
    return (
      <Grid container spacing={6}>
        <Grid item xs={12}>
          <Alert severity='error'>
            Invoice with the id: {id} does not exist. Please check the list of <%= h.changeCase.camel(component_name) %>:{' '}
            <Link href='/apps/<%= h.changeCase.camel(component_name) %>/list'>Invoice List</Link>
          </Alert>
        </Grid>
      </Grid>
    )
  } else {
    return null
  }
}

export default InvoiceEdit
