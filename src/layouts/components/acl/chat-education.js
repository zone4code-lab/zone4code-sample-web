import React, { useState } from 'react'
import { FontIcon, Avatar } from 'react-md'
import { isEmpty } from 'lodash'
import Button from '@mui/material/Button'

import HtmlEditor from './html-editor'
import TextField from '@mui/material/TextField'
import Icon from 'src/@core/components/icon'

//import './chat-education.css'

const ChatEducation = ({ discussions, onClose, onCreatePost, sendReply, className }) => {
  const [title, setTitle] = useState('')
  const [post, setPost] = useState('')
  const [openChatForm, setOpenChatForm] = useState(false)
  const [currentChat, setCurrentChat] = useState(null)
  const [openReply, setOpenReply] = useState(false)
  const [reply, setReply] = useState('')
  const [minimizeReply, setMinimizeReply] = useState(true)

  const onCreate = () => {
    console.log('test222', post)
    onCreatePost(title, post)
  }

  const onCancel = () => {
    console.log('test222', post)
    setOpenChatForm(false)
  }

  const openCurrentChat = idChat => {
    setCurrentChat(idChat)
  }

  const renderMainChatDiscussion = () => {
    return discussions.map(({ idChat, title, replies, user, createDate }, index) => {
      return (
        <div className='chat-education-item' key={index} onClick={() => openCurrentChat(idChat)}>
          <div className='chat-education-item-info'>
            <div className='chat-education-item-msg'>{title}</div>
            <div className='chat-education-item-user'>
              {isEmpty(replies) && (
                <div>
                  <strong>{user.name}</strong> CREATED {createDate}
                </div>
              )}
              {!isEmpty(replies) && (
                <div>
                  <strong>{replies[replies.length - 1].user.name}</strong> REPLIED{' '}
                  {replies[replies.length - 1].createDate}
                </div>
              )}
            </div>
          </div>
          <div className='chat-education-item-cont'>{replies.length}</div>
        </div>
      )
    })
  }

  const renderRepliesDetails = () => {
    const findReplies = discussions.find(dc => dc.idChat === currentChat)
    if (findReplies) {
      return (
        <div>
          <div className='replies-title'>
            {findReplies.replies.length} {findReplies.replies.length === 1 ? 'Reply' : 'Replies'}
          </div>
          {findReplies.replies.map(({ user, createDate, post }, index) => {
            return (
              <div className='reply-content' key={index}>
                <div className='reply-header'>
                  <Avatar className='reply-avatar'>{user.name.charAt(0)}</Avatar>
                  <div className='reply-userName'>{user.name}</div>
                  <div className='reply-createDate'>{createDate}</div>
                </div>
                <div className='reply-post'>{post}</div>
              </div>
            )
          })}
        </div>
      )
    }

    return []
  }

  const renderCurrentChatDetails = () => {
    const currentPost = discussions.find(ds => ds.idChat === currentChat)

    return (
      <div className='replies'>
        <div className='main-post md-paper--1'>
          <div className='main-post-header'>
            <div className='main-post-title'>{currentPost.title}</div>
            <div className='main-post-createDate'>{currentPost.createDate}</div>
          </div>
          <div className='main-post-msg'>{currentPost.post}</div>
          <div className='main-post-footer'>
            <Avatar className='main-post-avatar'>{currentPost.user.name.charAt(0)}</Avatar>
            <div className='main-post-userName'>{currentPost.user.name}</div>
            <Button
              flat
              onClick={() => {
                setOpenReply(true)
              }}
              primary
              swapTheming
              className='main-post-replyButton'
            >
              Reply
            </Button>
          </div>
        </div>
        {renderRepliesDetails()}
      </div>
    )
  }

  const renderTitleOfCurrentChat = () => {
    const currentPost = discussions.find(ds => ds.idChat === currentChat)

    return currentPost.title
  }

  return (
    <div className={`chat-education ${className || ''}`}>
      <div className='chat-education-header'>
        {(openChatForm || currentChat !== null) && (
          <Button
            icon
            onClick={() => {
              setOpenReply(false)
              setOpenChatForm(false)
              setCurrentChat(null)
            }}
          >
            <Icon icon={'ic:baseline-keyboard-return'} fontSize='1.625rem' />
          </Button>
        )}
        {!openChatForm && currentChat === null && (
          <label className='chat-education-header-label'>{discussions.length} Discussions</label>
        )}
        {openChatForm && currentChat === null && <label className='chat-education-header-label'>Create new post</label>}
        {currentChat !== null && <label className='chat-education-header-label'>{renderTitleOfCurrentChat()}</label>}
        <Button icon onClick={() => onClose()} className='chat-education-header-closeButton'>
          <Icon icon={'ic:round-close'} fontSize='1.625rem' />
        </Button>
      </div>

      {!openChatForm && currentChat === null && (
        <Button
          variant='contained'
          size='medium'
          onClick={() => setOpenChatForm(true)}
          className='chat-education-newPost'
        >
          CREATE NEW POST
        </Button>
      )}
      {openChatForm && (
        <div className='chat-form md-paper--1'>
          <label className='chat-form-label'>Title</label>
          <TextField value={title} onChange={v => setTitle(v)} placeholder='Title' />
          <label className='chat-form-label'>Post</label>
          <HtmlEditor value={post} onChange={v => setPost(v)} />
          <div className='chat-form-footer'>
            <Button
              variant='outlined'
              size='medium'
              onClick={() => onCancel()}
              className='chat-form-footer-button-cancel'
            >
              CANCEL
            </Button>
            <Button
              variant='contained'
              size='medium'
              onClick={() => onCreate()}
              primary
              swapTheming
              className='chat-form-footer-button'
            >
              CREATE
            </Button>
          </div>
        </div>
      )}
      {!openChatForm && currentChat === null && (
        <div className='chat-education-content'>{renderMainChatDiscussion()}</div>
      )}
      {currentChat !== null && renderCurrentChatDetails()}
      {currentChat !== null && !openReply && (
        <Button
          raised
          onClick={() => {
            setOpenReply(true)
          }}
          iconChildren='reply'
          className='replyButton'
        >
          Write a reply...
        </Button>
      )}
      {currentChat !== null && openReply && (
        <div className={`float-reply md-paper--1 ${minimizeReply ? 'up' : 'down'}`}>
          <div className='float-reply-header'>
            <FontIcon>reply</FontIcon>
            <div className='float-reply-header-title'>Reply</div>
            <Button icon onClick={() => setMinimizeReply(!minimizeReply)} className='float-reply-navButton'>
              <i class='fa fa-window-minimize ' aria-hidden='true'></i>
            </Button>
            <Button icon onClick={() => setOpenReply(false)} className='float-reply-navButton'>
              <i class='fa fa-times' aria-hidden='true'></i>
            </Button>
          </div>

          <HtmlEditor value={reply} onChange={v => setReply(v)} />
          <div className='float-reply-footer'>
            <Button
              variant='outlined'
              size='medium'
              onClick={() => setOpenReply(false)}
              className='float-reply-footer-button'
            >
              CANCEL
            </Button>
            <Button
              variant='contained'
              size='medium'
              onClick={() => sendReply(currentChat, reply)}
              primary
              swapTheming
              className='float-reply-footer-button'
            >
              CREATE
            </Button>
          </div>
        </div>
      )}
    </div>
  )
}

export default ChatEducation
