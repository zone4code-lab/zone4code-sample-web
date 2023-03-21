---
to: <%= absPath %>/preview/index.js
---
// ** Demo Components Imports
import Preview from 'src/views/apps/<%= h.changeCase.camel(component_name) %>/preview/Preview'

const InvoicePreview = () => {
  return <Preview id='4987' />
}

export default InvoicePreview
