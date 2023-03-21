---
to: <%= absPath %>/print/[id].js
---
// ** Third Party Imports
import axios from 'axios'

// ** Layout Import
import BlankLayout from 'src/@core/layouts/BlankLayout'

// ** Demo Components Imports
import PrintPage from 'src/views/apps/<%= h.changeCase.camel(component_name) %>/print/PrintPage'

const InvoicePrint = ({ id }) => {
  return <PrintPage id={id} />
}



InvoicePrint.getLayout = page => <BlankLayout>{page}</BlankLayout>
InvoicePrint.setConfig = () => {
  return {
    mode: 'light'
  }
}

export default InvoicePrint

