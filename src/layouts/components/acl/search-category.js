import React, { useState, useRef, useEffect } from 'react'
import { FontIcon } from 'react-md'
import { isEmpty } from 'lodash'
import { TextField } from '@mui/material'
import { categories } from './helpers'

//import './search-category.css'

const SearchCategory = ({ loadContent }) => {
  const [openSearchBox, setOpenSearchBox] = useState(false)
  const [searchTitle, setSearchTitle] = useState('')

  useEffect(() => {
    document.addEventListener('mousedown', outSideClick)

    return () => {
      document.removeEventListener('mousedown', outSideClick)
    }
  }, [])

  const searchBoxRef = useRef(null)

  const outSideClick = e => {
    if (searchBoxRef.current && searchBoxRef.current.contains(e.target)) {
      return
    }
    setOpenSearchBox(false)
  }

  const renderSubCategories = (subCategories, idCategory) => {
    return subCategories.map(({ label, idSubCategory }, index) => (
      <li
        className='subCategories-name'
        key={index}
        onClick={() => {
          setOpenSearchBox(false)
          loadContent(idCategory, idSubCategory)
        }}
      >
        {label}
      </li>
    ))
  }

  const filterSearch = () => {
    let newCategories = categories
    if (searchTitle) {
      const expr = new RegExp(searchTitle, 'i')
      newCategories = newCategories.filter(nc => !isEmpty(nc.category.filter(ncSubC => expr.test(ncSubC['label']))))
      newCategories = newCategories.map(nc => ({
        ...nc,
        category: nc.category.filter(cat => expr.test(cat['label']))
      }))
    }

    return newCategories.map(({ title, category, idCategory }, index) => (
      <div key={index}>
        <label className='category-name'>{title}</label>
        <ul className='subCategories-list'>{renderSubCategories(category, idCategory)}</ul>
      </div>
    ))
  }

  return (
    <div className={`search-category ${openSearchBox ? 'active' : ''}`}>
      <div className='input-title-search' onClick={() => setOpenSearchBox(!openSearchBox)}>
        Search by lesson title
        {openSearchBox ? <FontIcon>arrow_drop_up</FontIcon> : <FontIcon>arrow_drop_down</FontIcon>}
      </div>
      {openSearchBox && (
        <div className='search-box' ref={searchBoxRef}>
          <TextField
            id='search-box'
            leftIcon={<FontIcon>search</FontIcon>}
            value={searchTitle}
            onChange={v => setSearchTitle(v)}
            className='search-box-textFiled'
            block
          />
          {filterSearch()}
        </div>
      )}
    </div>
  )
}

export default SearchCategory
