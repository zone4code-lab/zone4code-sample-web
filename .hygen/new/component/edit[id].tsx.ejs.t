---
to: <%= absPath %>/edit/[id].js
---

// ** Third Party Imports
import axios from 'axios'

// ** Demo Components Imports
import Edit from 'src/views/apps/<%= h.changeCase.camel(component_name) %>/edit/Edit'

// ** Styled Component
import DatePickerWrapper from 'src/@core/styles/libs/react-datepicker'

const InvoiceEdit = ({ id }) => {
  return (
    <DatePickerWrapper sx={{ '& .react-datepicker-wrapper': { width: 'auto' } }}>
      <Edit id={id} />
    </DatePickerWrapper>
  )
}


export default InvoiceEdit


















