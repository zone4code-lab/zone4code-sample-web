---
to: src/views/apps/<%= h.changeCase.camel(component_name) %>/edit/EditCard.js
---
// ** React Imports
import { useState } from 'react'

// ** MUI Imports
import Card from '@mui/material/Card'
import Button from '@mui/material/Button'
import Divider from '@mui/material/Divider'
import TextField from '@mui/material/TextField'
import Typography from '@mui/material/Typography'
import Grid from '@mui/material/Grid'
import { useTheme } from '@mui/material/styles'
import CardActions from '@mui/material/CardActions'
import CardHeader from '@mui/material/CardHeader'
import CardContent from '@mui/material/CardContent'

// ** Store & Actions Imports
import { useDispatch } from 'react-redux'
import { update<%= h.changeCase.camel(component_name) %> } from 'src/store/apps/<%= h.changeCase.camel(component_name) %>'

// ** Third Party Components
import toast from 'react-hot-toast'

const EditCard = ({ data }) => {

  // ** Hook
  const theme = useTheme()
  const dispatch = useDispatch();


  // ** States
  const [<%= h.changeCase.camel(component_name) %>Info, set<%= h.changeCase.camel(component_name) %>Info] = useState({
    name: data.name,
    description: data.description,
    id: data._id
  });

  const handleChange = (event) => {
    set<%= h.changeCase.camel(component_name) %>Info({ ...<%= h.changeCase.camel(component_name) %>Info, [event.target.name]: event.target.value });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    if (<%= h.changeCase.camel(component_name) %>Info.name === '' || <%= h.changeCase.camel(component_name) %>Info.description === '') {
      toast.success('Incomplete informations', {
        style: {
          padding: '16px',
          color: theme.palette.primary.main,
          border: `1px solid ${theme.palette.primary.main}`
        },
        iconTheme: {
          primary: theme.palette.primary.main,
          secondary: theme.palette.primary.contrastText
        }
      })
    }
    else {
      toast.success('<%= h.changeCase.camel(component_name) %> updated successfully', {
        style: {
          padding: '16px',
          color: theme.palette.primary.main,
          border: `1px solid ${theme.palette.primary.main}`
        },
        iconTheme: {
          primary: theme.palette.primary.main,
          secondary: theme.palette.primary.contrastText
        }
      })
      dispatch(update<%= h.changeCase.camel(component_name) %>(<%= h.changeCase.camel(component_name) %>Info));

    }
  };

  const handleFormReset = () => {
    set<%= h.changeCase.camel(component_name) %>Info({ name: data.name, description: data.description });
  }
  if (data) {
    return (
      <Card>
        <CardHeader title='Edit <%= h.changeCase.camel(component_name) %>' />
        <Divider sx={{ m: '0 !important' }} />
        <form onReset={handleFormReset} onSubmit={handleSubmit}>
          <CardContent>
            <Grid container spacing={5}>
              <Grid item xs={12}>
                <Typography variant='body2' sx={{ fontWeight: 600 }}>
                  1. <%= h.changeCase.camel(component_name) %> details
                </Typography>
              </Grid>
              <Grid item xs={12} sm={12}>
                <TextField fullWidth
                  type="text"
                  name="name"
                  value={<%= h.changeCase.camel(component_name) %>Info.name}
                  onChange={handleChange}
                  id='invoice-note'
                  placeholder='description of <%= h.changeCase.camel(component_name) %>' />
              </Grid>
              <Grid item xs={12} sm={12}>
                <TextField xs={6} fullWidth
                  rows={2}
                  type="text"
                  name="description"
                  value={<%= h.changeCase.camel(component_name) %>Info.description}
                  onChange={handleChange}
                  id='invoice-note'
                  multiline
                  placeholder='description of <%= h.changeCase.camel(component_name) %>' />
              </Grid>
            </Grid>
          </CardContent>
          <Divider sx={{ m: '0 !important' }} />
          <CardActions>
            <Button size='large' type='submit' sx={{ mr: 2 }} variant='contained'>
              Submit
            </Button>
            <Button type='reset' size='large' color='secondary' variant='outlined'>
              Reset
            </Button>
          </CardActions>
        </form>
      </Card>
    )
  } else {
    return null
  }
}

export default EditCard
