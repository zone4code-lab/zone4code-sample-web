import React, { useState } from 'react'

// import CategoryEducation from './category-education'
// import ContentEducation from './content-education'
// import ChatEducation from './chat-education'
// import NoteEducation from './note-education'
import Button from '@mui/material/Button'

import { categories } from './helpers'
import CategoryEducation from './category-education'
import ContentEducation from './content-education'
import ChatEducation from './chat-education'
import NoteEducation from './note-education'

const Education = () => {
  const [activeContent, setActiveContent] = useState({
    idCategory: 0,
    idSubCategory: 0
  })
  const [openChat, setOpenChat] = useState(false)
  const [openNote, setOpenNote] = useState(false)
  const [maximized, setMaximized] = useState(false)

  const renderActiveContent = () => {
    console.log('testhhhh', categories[0].category[0].content)

    return {
      ...categories[activeContent.idCategory].category[activeContent.idSubCategory],
      ...renderNextActiveContent()
    }
  }

  const renderNextActiveContent = () => {
    const findCategory = categories[activeContent.idCategory]
    let newIdCategory = activeContent.idCategory
    let newIdSubCategory = null
    if (findCategory.category.length > activeContent.idSubCategory + 1) {
      newIdSubCategory = activeContent.idSubCategory + 1
    } else if (
      categories.length > activeContent.idCategory + 1 &&
      findCategory.category.length === activeContent.idSubCategory + 1
    ) {
      newIdCategory = activeContent.idCategory + 1
      newIdSubCategory = 0
    }

    return { newIdCategory, newIdSubCategory }
  }

  const onComplete = (newIdCategory, newIdSubCategory) => {
    console.log('testnewIdSubCategor', newIdCategory)

    // use activeContent to set complete params to true
    if (newIdSubCategory !== null) {
      setActiveContent({
        idCategory: newIdCategory,
        idSubCategory: newIdSubCategory
      })
    }
  }

  const onUnComplete = () => {
    // use activeContent to set complete params to false
  }

  const OnContinue = (newIdCategory, newIdSubCategory) => {
    setActiveContent({
      idCategory: newIdCategory,
      idSubCategory: newIdSubCategory
    })
  }

  const onCloseChat = () => {
    setOpenChat(false)
  }

  const onCloseNote = () => {
    setOpenNote(false)
  }

  const onCreatePost = (title, post) => {
    console.log('post', post)

    // use this to call api to send message
  }

  const onSendNote = note => {
    // use this to call api to send note
  }

  const renderDiscussionForActiveContent = () => {
    const findCategory = categories.find(c => c.idCategory === activeContent.idCategory)
    const findSubCategory = findCategory.category.find(sub => sub.idSubCategory === activeContent.idSubCategory)

    return findSubCategory.discussions
  }

  const renderNoteForActiveContent = () => {
    const findCategory = categories.find(c => c.idCategory === activeContent.idCategory)
    const findSubCategory = findCategory.category.find(sub => sub.idSubCategory === activeContent.idSubCategory)

    return findSubCategory.note
  }

  return (
    <div className='education'>
      <CategoryEducation
        title={'Title goes here'}
        lessenCategory={'Lesson title goes here'}
        progress={60}
        loadContent={(idCategory, idSubCategory) => setActiveContent({ idCategory, idSubCategory })}
        className={openChat || maximized || openNote ? 'closed' : ''}
      />

      <ContentEducation
        {...renderActiveContent()}
        openDiscussion={() => {
          setOpenChat(!openChat)
          setOpenNote(false)
        }}
        maximize={() => setMaximized(!maximized)}
        openNote={() => {
          setOpenNote(!openNote)
          setOpenChat(false)
        }}
        onComplete={onComplete}
        onUnComplete={onUnComplete}
        OnContinue={OnContinue}
        discussionsNumber={renderDiscussionForActiveContent().length}
        className={maximized ? 'maximized' : ''}
      />
      <ChatEducation
        discussions={renderDiscussionForActiveContent()}
        onClose={onCloseChat}
        onCreatePost={onCreatePost}
        className={openChat && !maximized && !openNote ? '' : 'closed'}
      />

      <NoteEducation
        note={renderNoteForActiveContent()}
        onClose={onCloseNote}
        onSendNote={onSendNote}
        className={openNote && !openChat && !maximized ? '' : 'closed'}
      />
    </div>
  )
}

export default Education
