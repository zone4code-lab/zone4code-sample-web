---
to: <%= absPath %>/list/index.js
---
// ** React Imports
import { useState, useEffect, forwardRef } from 'react'

// ** Next Import
import Link from 'next/link'

// ** MUI Imports
import Box from '@mui/material/Box'
import Grid from '@mui/material/Grid'
import Card from '@mui/material/Card'
import Tooltip from '@mui/material/Tooltip'
import { styled } from '@mui/material/styles'
import MenuItem from '@mui/material/MenuItem'
import TextField from '@mui/material/TextField'
import CardHeader from '@mui/material/CardHeader'
import IconButton from '@mui/material/IconButton'
import InputLabel from '@mui/material/InputLabel'
import Typography from '@mui/material/Typography'
import FormControl from '@mui/material/FormControl'
import CardContent from '@mui/material/CardContent'
import { DataGrid } from '@mui/x-data-grid'
import Select from '@mui/material/Select'
import Dialog from '@mui/material/Dialog'
import DialogContent from '@mui/material/DialogContent'
import DialogActions from '@mui/material/DialogActions'
import Button from '@mui/material/Button'

// ** Icon Imports
import Icon from 'src/@core/components/icon'

// ** Third Party Imports
import format from 'date-fns/format'
import DatePicker from 'react-datepicker'

// ** Store & Actions Imports
import { useDispatch, useSelector } from 'react-redux'
import { fetchData, delete<%= h.changeCase.camel(component_name) %> } from 'src/store/apps/<%= h.changeCase.camel(component_name) %>'

// ** Utils Import
import { getInitials } from 'src/@core/utils/get-initials'

// ** Custom Components Imports

import TableHeader from 'src/views/apps/<%= h.changeCase.camel(component_name) %>/list/TableHeader'

// ** Styled Components
import DatePickerWrapper from 'src/@core/styles/libs/react-datepicker'

// ** Styled component for the link in the dataTable
const LinkStyled = styled(Link)(({ theme }) => ({
  fontSize: '1rem',
  textDecoration: 'none',
  color: theme.palette.primary.main
}))



const defaultColumns = [
  {
    flex: 0.1,
    field: 'id',
    minWidth: 100,
    headerName: 'ID <%= h.changeCase.camel(component_name) %>',
    renderCell: ({ row }) => <LinkStyled href={`/apps/<%= h.changeCase.camel(component_name) %>/preview/${row.id}`}>{`${row.id}`}</LinkStyled>
  },
  {
    flex: 0.1,
    minWidth: 100,
    field: 'name',
    headerName: 'name',
    renderCell: ({ row }) => <Typography sx={{ color: 'text.secondary' }}>{`${row.name || ' '}`}</Typography>
  },

  {
    flex: 0.1,
    minWidth: 100,
    field: 'description',
    headerName: 'description',
    renderCell: ({ row }) => <Typography sx={{ color: 'text.secondary' }}>{`${row.description || ' '}`}</Typography>
  },


]
/* eslint-disable */
const CustomInput = forwardRef((props, ref) => {
  const startDate = props.start !== null ? format(props.start, 'MM/dd/yyyy') : ''
  const endDate = props.end !== null ? ` - ${format(props.end, 'MM/dd/yyyy')}` : null
  const value = `${startDate}${endDate !== null ? endDate : ''}`
  props.start === null && props.dates.length && props.setDates ? props.setDates([]) : null
  const updatedProps = { ...props }
  delete updatedProps.setDates
  return <TextField fullWidth inputRef={ref} {...updatedProps} label={props.label || ''} value={value} />
})

/* eslint-enable */
const <%= h.changeCase.camel(component_name) %>List = () => {
  // ** State
  const [dates, setDates] = useState([])
  const [value, setValue] = useState('')
  const [pageSize, setPageSize] = useState(10)
  const [statusValue, setStatusValue] = useState('')
  const [endDateRange, setEndDateRange] = useState(null)
  const [selectedRows, setSelectedRows] = useState([])
  const [startDateRange, setStartDateRange] = useState(null)
  const [open, setOpen] = useState(false)
  const [userInput, setUserInput] = useState('yes')
  const [IdValue, setIdValue] = useState('')
  const [secondDialogOpen, setSecondDialogOpen] = useState(false)

  // ** Hooks


  const handleSecondDialogClose = () => {
    setSecondDialogOpen(false)
  }

  const onSubmit = (id) => {
    setIdValue(id)
    setOpen(true)
  }

  const handleClose = () => setOpen(false)

  const handleConfirmation = value => {
    dispatch(delete<%= h.changeCase.camel(component_name) %>(IdValue))
    handleClose()
    setUserInput(value)
    setSecondDialogOpen(true)
  }

  const handleRevertDelete = value => {
    handleClose()
    setUserInput(value)
    setSecondDialogOpen(true)
  }


  // ** Hooks
  const dispatch = useDispatch()
  const store = useSelector(state => state.invoice)

  console.log('store', store, store.data)

  useEffect(() => {
    dispatch(
      fetchData({
        dates,
        q: value,
        status: statusValue
      })
    )
  }, [dispatch, statusValue, value, dates])

  const handleFilter = val => {
    setValue(val)
  }

  const handleStatusValue = e => {
    setStatusValue(e.target.value)
  }

  const handleOnChangeRange = dates => {
    const [start, end] = dates
    if (start !== null && end !== null) {
      setDates(dates)
    }
    setStartDateRange(start)
    setEndDateRange(end)
  }

  const columns = [
    ...defaultColumns,
    {
      flex: 0.1,
      minWidth: 140,
      sortable: false,
      field: 'actions',
      headerName: 'Actions',
      renderCell: ({ row }) => (
        <Box sx={{ display: 'flex', alignItems: 'center' }}>

          <Tooltip Tooltip title='Delete <%= h.changeCase.camel(component_name) %>' >
            <IconButton size='small' sx={{ color: 'text.secondary' }} onClick={() => onSubmit(row.id)}>
              <Icon icon='tabler:trash' />
            </IconButton>
          </Tooltip >
          <Tooltip title='View'>
            <IconButton
              size='small'
              component={Link}
              sx={{ color: 'text.secondary' }}
              href={`/apps/<%= h.changeCase.camel(component_name) %>/preview/${row.id}`}//
            >
              <Icon icon='tabler:eye' />
            </IconButton>
          </Tooltip>

        </Box >
      )
    }
  ]

  return (
    <DatePickerWrapper>
      <Grid container spacing={6}>
        <Grid item xs={12}>
          <Card>
            <CardHeader title='Filters' />
            <CardContent>
              <Grid container spacing={6}>
                <Grid item xs={12} sm={6}>
                  <FormControl fullWidth>
                    <InputLabel id='invoice-status-select'><%= h.changeCase.camel(component_name) %> Status</InputLabel>

                    <Select
                      fullWidth
                      value={statusValue}
                      sx={{ mr: 4, mb: 2 }}
                      label='<%= h.changeCase.camel(component_name) %> Status'
                      onChange={handleStatusValue}
                      labelId='invoice-status-select'
                    >
                      <MenuItem value=''>none</MenuItem>
                      <MenuItem value='downloaded'>Downloaded</MenuItem>
                      <MenuItem value='draft'>Draft</MenuItem>
                      <MenuItem value='paid'>Paid</MenuItem>
                      <MenuItem value='partial payment'>Partial Payment</MenuItem>
                      <MenuItem value='past due'>Past Due</MenuItem>
                      <MenuItem value='sent'>Sent</MenuItem>
                    </Select>
                  </FormControl>
                </Grid>
                <Grid item xs={12} sm={6}>
                  <DatePicker
                    isClearable
                    selectsRange
                    monthsShown={2}
                    endDate={endDateRange}
                    selected={startDateRange}
                    startDate={startDateRange}
                    shouldCloseOnSelect={false}
                    id='date-range-picker-months'
                    onChange={handleOnChangeRange}
                    customInput={
                      <CustomInput
                        dates={dates}
                        setDates={setDates}
                        label='<%= h.changeCase.camel(component_name) %> Date'
                        end={endDateRange}
                        start={startDateRange}
                      />
                    }
                  />
                </Grid>
              </Grid>
            </CardContent>
          </Card>
        </Grid>
        <Grid item xs={12}> <Dialog fullWidth maxWidth='xs' open={open} onClose={handleClose}>
          <DialogContent
            sx={{
              pb: theme => `${theme.spacing(6)} !important`,
              px: theme => [`${theme.spacing(5)} !important`, `${theme.spacing(15)} !important`],
              pt: theme => [`${theme.spacing(8)} !important`, `${theme.spacing(12.5)} !important`]
            }}
          >
            <Box
              sx={{
                display: 'flex',
                textAlign: 'center',
                alignItems: 'center',
                flexDirection: 'column',
                justifyContent: 'center',
                '& svg': { mb: 6, color: 'warning.main' }
              }}
            >
              <Icon icon='tabler:alert-circle' fontSize='5.5rem' />
              <Typography>Are you sure you would like to delete <%= h.changeCase.camel(component_name) %>?</Typography>
            </Box>
          </DialogContent>
          <DialogActions
            sx={{
              justifyContent: 'center',
              px: theme => [`${theme.spacing(5)} !important`, `${theme.spacing(15)} !important`],
              pb: theme => [`${theme.spacing(8)} !important`, `${theme.spacing(12.5)} !important`]
            }}
          >
            <Button variant='contained' sx={{ mr: 2 }} onClick={() => handleConfirmation('yes')}>
              Yes
            </Button>
            <Button variant='outlined' color='secondary' onClick={() => handleRevertDelete('cancel')}>
              Cancel
            </Button>
          </DialogActions>
        </Dialog>
          <Dialog fullWidth maxWidth='xs' open={secondDialogOpen} onClose={handleSecondDialogClose}>
            <DialogContent
              sx={{
                pb: theme => `${theme.spacing(6)} !important`,
                px: theme => [`${theme.spacing(5)} !important`, `${theme.spacing(15)} !important`],
                pt: theme => [`${theme.spacing(8)} !important`, `${theme.spacing(12.5)} !important`]
              }}
            >
              <Box
                sx={{
                  display: 'flex',
                  alignItems: 'center',
                  flexDirection: 'column',
                  '& svg': {
                    mb: 8,
                    color: userInput === 'yes' ? 'success.main' : 'error.main'
                  }
                }}
              >
                <Icon fontSize='5.5rem' icon={userInput === 'yes' ? 'tabler:circle-check' : 'tabler:circle-x'} />
                <Typography variant='h4' sx={{ mb: 5 }}>
                  {userInput === 'yes' ? 'Deleted!' : 'Cancelled'}
                </Typography>
                <Typography>
                  {userInput === 'yes' ? 'Your <%= h.changeCase.camel(component_name) %> deleted successfully.' : '<%= h.changeCase.camel(component_name) %> not deleted!!'}
                </Typography>
              </Box>
            </DialogContent>
            <DialogActions
              sx={{
                justifyContent: 'center',
                px: theme => [`${theme.spacing(5)} !important`, `${theme.spacing(15)} !important`],
                pb: theme => [`${theme.spacing(8)} !important`, `${theme.spacing(12.5)} !important`]
              }}
            >
              <Button variant='contained' color='success' onClick={handleSecondDialogClose}>
                OK
              </Button>
            </DialogActions>
          </Dialog>
          <Card>
            <TableHeader value={value} selectedRows={selectedRows} handleFilter={handleFilter} />
            <DataGrid
              autoHeight
              pagination
              rowHeight={62}
              rows={store.data}
              columns={columns}
              checkboxSelection
              disableSelectionOnClick
              pageSize={Number(pageSize)}
              rowsPerPageOptions={[10, 25, 50]}
              onSelectionModelChange={rows => setSelectedRows(rows)}
              onPageSizeChange={newPageSize => setPageSize(newPageSize)}
            />
          </Card>
        </Grid>
      </Grid>
    </DatePickerWrapper>
  )
}

export default <%= h.changeCase.camel(component_name) %>List



