---
to: src/views/apps/<%= h.changeCase.camel(component_name) %>/add/Add<%= h.changeCase.camel(component_name) %>.js
---
// ** React Imports
import { useState } from 'react'
import { useTheme } from '@mui/material/styles'

// ** MUI Imports
import Card from '@mui/material/Card'
import Grid from '@mui/material/Grid'
import Button from '@mui/material/Button'
import Divider from '@mui/material/Divider'
import TextField from '@mui/material/TextField'
import CardHeader from '@mui/material/CardHeader'
import Typography from '@mui/material/Typography'
import CardContent from '@mui/material/CardContent'
import CardActions from '@mui/material/CardActions'

// ** Third Party Components
import toast from 'react-hot-toast'

// ** Store & Actions Imports
import { useDispatch, useSelector } from 'react-redux'
import { create<%= h.changeCase.camel(component_name) %> } from 'src/store/apps/<%= h.changeCase.camel(component_name) %>'


const Add<%= h.changeCase.camel(component_name) %> = () => {

  // ** Hook
  const theme = useTheme()
  const dispatch = useDispatch();

  // ** States
  const [<%= h.changeCase.camel(component_name) %>Info, set<%= h.changeCase.camel(component_name) %>Info] = useState({
    name: "",
    description: "",
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
      toast.success('<%= h.changeCase.camel(component_name) %> created successfully', {
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
      dispatch(create<%= h.changeCase.camel(component_name) %>(<%= h.changeCase.camel(component_name) %>Info));

      set<%= h.changeCase.camel(component_name) %>Info({ name: "", description: "" });
    }
  };

  const handleFormReset = () => {
    set<%= h.changeCase.camel(component_name) %>Info({ name: "", description: "" });
  }

  return (<>
    <Card>
      <CardHeader title='Create <%= h.changeCase.camel(component_name) %>' />
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
                label='Name of <%= h.changeCase.camel(component_name) %>'
                placeholder='Name of <%= h.changeCase.camel(component_name) %>' />
            </Grid>
            <Grid item xs={12} sm={12}>
              <TextField fullWidth
                type="text"
                name="description"
                value={<%= h.changeCase.camel(component_name) %>Info.description}
                onChange={handleChange}
                label='description of <%= h.changeCase.camel(component_name) %>'
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
  </>
  )
}

export default Add<%= h.changeCase.camel(component_name) %>

