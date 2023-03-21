import React from 'react'
import { Button } from 'react-md'

import HtmlEditor from './html-editor'

//import './note-education.css'

const NoteEducation = ({ onClose, note, onSendNote, className }) => {
  return (
    <div className={`note-education ${className || ''}`}>
      <div className='note-education-container md-paper--1'>
        <div className='note-education-header'>
          <div className='note-education-header-label'>Note</div>
          <Button icon onClick={() => onClose()} className='note-education-closeButton'>
            <i class='fa fa-times' aria-hidden='true'></i>
          </Button>
        </div>
        <HtmlEditor value={note} onChange={v => onSendNote(v)} className='note-education-HtmlEditor' />
      </div>
    </div>
  )
}

export default NoteEducation
