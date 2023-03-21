import React from 'react'

//import './content-education.css'
import Button from '@mui/material/Button'
import Icon from 'src/@core/components/icon'

const ContentEducation = ({
  label,
  idCategory,
  idSubCategory,
  type,
  ContentToDiplayurl,
  ContentToDiplay,
  complete,
  newIdCategory,
  newIdSubCategory,
  discussionsNumber,
  openDiscussion,
  maximize,
  download,
  openNote,
  onComplete,
  onUnComplete,
  OnContinue,
  className
}) => {
  const renderContent = () => {
    switch (type) {
      case 'video':
        return <video>Video</video>
      case 'text':
        return <div>Text</div>
    }
  }
  console.log(
    'test1',
    label,
    ContentToDiplay,
    idCategory,
    idSubCategory,
    type,
    complete,
    newIdCategory,
    newIdSubCategory,
    discussionsNumber,

    className
  )

  const renderNavigation = () => {
    if (complete) {
      return (
        <div>
          {' '}
          <Button
            flat
            onClick={() => onUnComplete()}
            variant='outlined'
            size='medium'
            className='actionButtonMarkIncomplete'
          >
            Mark Incomplete
            {/* test1 */}
          </Button>
          {newIdSubCategory !== null && (
            <Button
              flat
              onClick={() => OnContinue(newIdCategory, newIdSubCategory)}
              primary
              swapTheming
              variant='contained'
              size='medium'
              className='actionButtonContinue'
            >
              Continue
              <div className='arrow-right'>
                {' '}
                <i class='fa fa-arrow-right' aria-hidden='true'></i>
              </div>
              {/* test2 */}
              <i aria-hidden='true' class='toga-icon toga-icon-arrow-right'></i>
            </Button>
          )}
        </div>
      )
    } else {
      return (
        <Button
          flat
          onClick={() => onComplete(newIdCategory, newIdSubCategory)}
          primary
          swapTheming
          className='actionButtonContinue'
        >
          Complete {newIdSubCategory !== null ? '& Continue' : ''}
        </Button>
      )
    }
  }

  return (
    <div className={`content-education md-paper--1 ${className || ''}`}>
      <div className='content-education-header'>
        <label className='content-education-title'>{label}</label>
        <div className='content-education-actions'>
          <Button
            flat
            onClick={() => openDiscussion(idCategory, idSubCategory)}
            variant='contained'
            size='medium'
            swapTheming
            className='actionButtonDiscussion'
          >
            <i class='fa fa-comments-o' aria-hidden='true'></i>
            {discussionsNumber} DISCUSSION
            {/* test4 */}
          </Button>
          <Button flat onClick={() => openNote(idCategory, idSubCategory)} primary className='actionButton'>
            {/* <i class='fa fa-sticky-note' aria-hidden='true'></i> */}
            <Icon icon={'material-symbols:note-alt'} fontSize='1.625rem' />

            {/* Note */}
          </Button>
          {type === 'video' && (
            <Button icon onClick={() => download(idCategory, idSubCategory)}>
              save_alt test5
            </Button>
          )}

          <Button icon onClick={() => maximize()}>
            <Icon icon={'mdi:arrow-expand-all'} fontSize='1.625rem' />

            {/* test6 */}
          </Button>
        </div>
      </div>

      {ContentToDiplay}

      {ContentToDiplayurl}

      <video controls src={ContentToDiplayurl} />
      <div className='content-education-container'>{renderContent()}</div>
      {/* test8 */}
      <div className='content-education-footer'>{renderNavigation()}</div>
    </div>
  )
}

export default ContentEducation
