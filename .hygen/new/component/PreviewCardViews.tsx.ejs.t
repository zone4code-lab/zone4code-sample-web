---
to: src/views/apps/<%= h.changeCase.camel(component_name) %>/preview/PreviewCard.js
---
// ** MUI Imports
import Grid from '@mui/material/Grid'
import Card from '@mui/material/Card'
import Table from '@mui/material/Table'
import Divider from '@mui/material/Divider'
import TableRow from '@mui/material/TableRow'
import TableBody from '@mui/material/TableBody'
import Typography from '@mui/material/Typography'
import Box from '@mui/material/Box'
import CardContent from '@mui/material/CardContent'
import { styled, useTheme } from '@mui/material/styles'
import TableCell from '@mui/material/TableCell'
import CardActions from '@mui/material/CardActions'
import Button from '@mui/material/Button'

// ** Next Import
import Link from 'next/link'

const MUITableCell = styled(TableCell)(({ theme }) => ({
  borderBottom: 0,
  paddingLeft: '0 !important',
  paddingRight: '0 !important',
  '&:not(:last-child)': {
    paddingRight: `${theme.spacing(2)} !important`
  }
}))

const PreviewCard = ({ data, id }) => {
  // ** Hook
  const theme = useTheme()
  if (data) {
    return (
      <Card>
        <CardContent sx={{ p: [`${theme.spacing(6)} !important`, `${theme.spacing(10)} !important`] }}>
          <Grid container>
            <Grid item sm={6} xs={12} sx={{ mb: { sm: 0, xs: 4 } }}>
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
                    <%= h.changeCase.camel(component_name) %>
                  </Typography>
                </Box>

              </Box>
            </Grid>
            <Grid item sm={12} xs={12}>
              <Box sx={{ display: 'flex', justifyContent: { xs: 'flex-start', sm: 'flex-end' } }}>
                <Table sx={{ maxWidth: '210px' }}>
                  <TableBody sx={{ '& .MuiTableCell-root': { py: `${theme.spacing(1.5)} !important` } }}>
                    <TableRow>

                      <MUITableCell>
                        <Typography variant='h6'>{`#${data._id}`}</Typography>
                      </MUITableCell>
                    </TableRow>
                    <TableRow>



                      <MUITableCell>
                        <Typography sx={{ color: 'text.secondary' }}>Name of <%= h.changeCase.camel(component_name) %>:</Typography>
                      </MUITableCell>
                      <MUITableCell>
                        <Typography sx={{ fontWeight: 500, color: 'text.secondary' }}>
                          {data.name}
                        </Typography>
                      </MUITableCell>
                    </TableRow>
                    <TableRow>



                      <MUITableCell>
                        <Typography sx={{ color: 'text.secondary' }}>Date of creation:</Typography>
                      </MUITableCell>
                      <MUITableCell>
                        <Typography sx={{ fontWeight: 500, color: 'text.secondary' }}>
                          {data.createdAt}
                        </Typography>
                      </MUITableCell>
                    </TableRow>
                    <TableRow>
                      <MUITableCell>
                        <Typography sx={{ color: 'text.secondary' }}>Date of update:</Typography>
                      </MUITableCell>
                      <MUITableCell>
                        <Typography sx={{ fontWeight: 500, color: 'text.secondary' }}>
                          {data.updatedAt}
                        </Typography>
                      </MUITableCell>
                    </TableRow>
                  </TableBody>
                </Table>
              </Box>
            </Grid>
          </Grid>
        </CardContent>

        <Divider />


        <CardContent sx={{ px: [6, 10] }}>
          <Typography sx={{ color: 'text.secondary' }}>
            <Typography component='span' sx={{ mr: 1.5, fontWeight: 500, color: 'inherit' }}>
              Description:
            </Typography>
            {data.description}
          </Typography>
        </CardContent>
        <CardActions>
          <Button
            fullWidth
            sx={{ mb: 2 }}
            target='_blank'
            component={Link}
            color='secondary'
            variant='outlined'
            href={`/apps/<%= h.changeCase.camel(component_name) %>/print/${id}`}
          >
            Print <%= h.changeCase.camel(component_name) %>
          </Button>
          <Button
            fullWidth
            sx={{ mb: 2 }}
            component={Link}
            color='secondary'
            variant='outlined'
            href={`/apps/<%= h.changeCase.camel(component_name) %>/edit/${id}`}//
          >
            Edit <%= h.changeCase.camel(component_name) %>
          </Button>
        </CardActions>
      </Card>

    )
  } else {
    return null
  }
}

export default PreviewCard
