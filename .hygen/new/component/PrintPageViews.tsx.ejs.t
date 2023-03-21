---
to: src/views/apps/<%= h.changeCase.camel(component_name) %>/print/PrintPage.js
---
// ** React Imports
import { useEffect, useState } from 'react'
import { useTheme } from '@mui/material/styles'

// ** Next Import
import Link from 'next/link'

// ** MUI Imports
import Grid from '@mui/material/Grid'
import Alert from '@mui/material/Alert'
import Divider from '@mui/material/Divider'
import Typography from '@mui/material/Typography'
import Box from '@mui/material/Box'


// ** Third Party Components
import axiosClient from "../../../../configs/requestConfig";


const InvoicePrint = () => {
  // ** State
  const [error, setError] = useState(false)
  const [data, setData] = useState(null)
  const [id, setId] = useState(false)

  // ** Hooks
  const theme = useTheme()
  useEffect(() => {
    setTimeout(() => {
      window.print()
    }, 1000)
  }, [])
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
      <Box sx={{ p: 12, pb: 6 }}>
        <Grid container>
          <Grid item xs={8} sx={{ mb: { sm: 0, xs: 4 } }}>
            <Box sx={{ display: 'flex', flexDirection: 'column' }}>
              <Box sx={{ mb: 6, display: 'flex', alignItems: 'center' }}>
                <Typography
                  variant='h6'
                  sx={{
                    ml: 2.5,
                    fontWeight: 600,
                    lineHeight: '24px',
                    fontSize: '1.375rem !important'
                  }}
                >
                  <%= h.changeCase.camel(component_name) %> Module
                </Typography>
              </Box>

            </Box>
          </Grid>
          <Grid item xs={4}>
            <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: { sm: 'flex-end', xs: 'flex-start' } }}>

              <Box sx={{ mb: 2, display: 'flex' }}>
                <Typography variant='body2' sx={{ mr: 3 }}>
                  Date creation:
                </Typography>
                <Typography variant='body2' sx={{ fontWeight: 600 }}>
                  {data.createdAt}
                </Typography>
              </Box>
              <Box sx={{ display: 'flex' }}>
                <Typography variant='body2' sx={{ mr: 3 }}>
                  Date of update:
                </Typography>
                <Typography variant='body2' sx={{ fontWeight: 600 }}>
                  {data.updatedAt}
                </Typography>
              </Box>
            </Box>
          </Grid>
        </Grid>

        <Divider sx={{ my: `${theme.spacing(6)} !important` }} />
        <Typography variant='body2'>
          <strong>name:</strong> {data.name}
        </Typography>
        <Divider sx={{ my: `${theme.spacing(6)} !important` }} />
        <Typography variant='body2'>
          <strong>description:</strong> {data.description}
        </Typography>
      </Box>
    )
  } else if (error) {
    return (
      <Box sx={{ p: 5 }}>
        <Grid container spacing={6}>
          <Grid item xs={12}>
            <Alert severity='error'>
              <%= h.changeCase.camel(component_name) %> with the id: {id} does not exist. Please check the list of <%= h.changeCase.camel(component_name) %>:{' '}
              <Link href='/apps/<%= h.changeCase.camel(component_name) %>/list'>Invoice List</Link>
            </Alert>
          </Grid>
        </Grid>
      </Box>
    )
  } else {
    return null
  }
}

export default InvoicePrint
