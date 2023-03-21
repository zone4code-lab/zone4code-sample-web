import React, { Component } from 'react'

import { Editor } from 'react-draft-wysiwyg'
import draftToHtml from 'draftjs-to-html'
import { stateFromHTML } from 'draft-js-import-html'
import { convertToRaw, EditorState } from 'draft-js'

import 'react-draft-wysiwyg/dist/react-draft-wysiwyg.css'

//import './html-editor.css'

class HtmlEditor extends Component {
  constructor(props) {
    super(props)
    const { value } = this.props
    this.state = {
      value: EditorState.createWithContent(stateFromHTML(value))
    }
  }

  static getDerivedStateFromProps(nextProps, prevState) {
    return {
      ...prevState,
      editorState: EditorState.createWithContent(stateFromHTML(nextProps.value))
    }
  }

  static defaultProps = {
    value: '',
    editorLabel: '',
    editorLabelClassName: '',
    readOnly: false,
    toolbarClassName: '',
    wrapperClassName: '',
    editorClassName: ''
  }
  onEditorStateChange = value => {
    const { onChange } = this.props
    this.setState({ value })
    const htmlValue = draftToHtml(convertToRaw(value.getCurrentContent()))
    if (typeof onChange === 'function') {
      // onChange is not required
      onChange(htmlValue)
    }
  }

  render() {
    const {
      readOnly,
      editorLabel,

      // value,
      editorLabelClassName,
      toolbarClassName,
      wrapperClassName,
      editorClassName,
      className,
      onFocus,
      disableInput,
      toolbox,
      id
    } = this.props

    const { value } = this.state

    const toolbarOption = {
      options: ['inline', 'image', 'link'],
      inline: {
        options: ['bold', 'italic', 'underline']
      }
    }

    const readOnlyClassname = readOnly ? 'readOnlyClassname' : 'editModeClassname'

    return (
      <div id={`${id}`} className={`HtmlEditor ${className}`}>
        {editorLabel && <label className={`editorLabel ${editorLabelClassName}`}>{editorLabel}</label>}
        <Editor
          toolbarClassName={`editorToolbar ${readOnlyClassname} ${toolbarClassName}`}
          wrapperClassName={`editorWrapper ${wrapperClassName}`}
          editorClassName={`editorContent ${readOnlyClassname} ${editorClassName}`}
          editorState={!disableInput ? value : ''}
          onFocus={() => onFocus && onFocus('long_text')}
          onEditorStateChange={disableInput ? () => {} : this.onEditorStateChange}
          readOnly={readOnly}
          toolbarHidden={toolbox || false}
          toolbar={toolbarOption}
        />
      </div>
    )
  }
}

export default HtmlEditor
