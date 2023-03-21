// ** React Imports
import { useEffect, useState } from 'react'

// ** Next Import
import Link from 'next/link'

// ** MUI Imports
import Grid from '@mui/material/Grid'
import Alert from '@mui/material/Alert'
import Table from '@mui/material/Table'
import Divider from '@mui/material/Divider'
import TableRow from '@mui/material/TableRow'
import TableHead from '@mui/material/TableHead'
import TableBody from '@mui/material/TableBody'
import Typography from '@mui/material/Typography'
import Box from '@mui/material/Box'
import { styled, useTheme } from '@mui/material/styles'
import TableCell from '@mui/material/TableCell'

// ** Third Party Components
import axios from 'axios'

// ** Configs
import themeConfig from 'src/configs/themeConfig'

const CalcWrapper = styled(Box)(({ theme }) => ({
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'space-between',
  '&:not(:last-of-type)': {
    marginBottom: theme.spacing(2)
  }
}))

const MUITableCell = styled(TableCell)(({ theme }) => ({
  borderBottom: 0,
  paddingLeft: '0 !important',
  paddingRight: '0 !important',
  paddingTop: `${theme.spacing(1)} !important`,
  paddingBottom: `${theme.spacing(1)} !important`
}))

const InvoicePrint = ({ id }) => {
  // ** State
  const [error, setError] = useState(false)
  const [data, setData] = useState(null)

  // ** Hooks
  const theme = useTheme()
  useEffect(() => {
    setTimeout(() => {
      window.print()
    }, 100)
  }, [])
  useEffect(() => {
    axios
      .get('/apps/invoice/single-invoice', { params: { id } })
      .then(res => {
        setData(res.data)
        setError(false)
      })
      .catch(() => {
        setData(null)
        setError(true)
      })
  }, [id])
  if (data) {
    const { invoice, paymentDetails } = data

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
                  {themeConfig.templateName}
                </Typography>
              </Box>
              <div>
                <Typography variant='body2' sx={{ mb: 1 }}>
                  Office 149, 450 South Brand Brooklyn
                </Typography>
                <Typography variant='body2' sx={{ mb: 1 }}>
                  San Diego County, CA 91905, USA
                </Typography>
                <Typography variant='body2'>+1 (123) 456 7891, +44 (876) 543 2198</Typography>
              </div>
            </Box>
          </Grid>
          <Grid item xs={4}>
            <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: { sm: 'flex-end', xs: 'flex-start' } }}>
              <Typography variant='h6' sx={{ mb: 2 }}>
                {`Invoice #${invoice.id}`}
              </Typography>
              <Box sx={{ mb: 2, display: 'flex' }}>
                <Typography variant='body2' sx={{ mr: 3 }}>
                  Date Issued:
                </Typography>
                <Typography variant='body2' sx={{ fontWeight: 600 }}>
                  {invoice.issuedDate}
                </Typography>
              </Box>
              <Box sx={{ display: 'flex' }}>
                <Typography variant='body2' sx={{ mr: 3 }}>
                  Date Due:
                </Typography>
                <Typography variant='body2' sx={{ fontWeight: 600 }}>
                  {invoice.dueDate}
                </Typography>
              </Box>
            </Box>
          </Grid>
        </Grid>



        <Divider sx={{ my: `${theme.spacing(6)} !important` }} />
        <Typography variant='body2'>
          <strong>Note:</strong> It was a pleasure working with you and your team. We hope you will keep us in mind for
          future freelance projects. Thank You!
        </Typography>
      </Box>
    )
  } else if (error) {
    return (
      <Box sx={{ p: 5 }}>
        <Grid container spacing={6}>
          <Grid item xs={12}>
            <Alert severity='error'>
              Invoice with the id: {id} does not exist. Please check the list of invoices:{' '}
              <Link href='/apps/invoice/list'>Invoice List</Link>
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
