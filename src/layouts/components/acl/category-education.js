import React from 'react'

// import { FontIcon } from 'react-md'
import SearchCategory from './search-category'
import { categories } from './helpers'
import { usePanels,ExpansionList, ExpansionPanel } from '@react-md/expansion-panel'/** ExpansionList, ExpansionPanel, */
import { useChecked } from '@react-md/form'

//import './category-education.css'
import Box from '@mui/material/Box'
import Stepper from '@mui/material/Stepper'
import Step from '@mui/material/Step'
import StepLabel from '@mui/material/StepLabel'
import StepContent from '@mui/material/StepContent'
import Button from '@mui/material/Button'
import Paper from '@mui/material/Paper'
import Typography from '@mui/material/Typography'
import LinearProgress from '@mui/material/LinearProgress'

const CategoryEducation = ({ title, progress, loadContent, lessenCategory, className }) => {
  const renderAdditionalInformation = content => {
    switch (content.type) {
      case 'video':
        return (
          <div>
            {/* <FontIcon>videocam</FontIcon> */}
            <i class='fa fa-video-camera' aria-hidden='true'></i>
            VIDEO.
            {content.duration}
          </div>
        )
      case 'text':
        return (
          <div>
            {/* <FontIcon>menu_book</FontIcon> */}
            <i class='fa fa-file-text-o' aria-hidden='true'></i>
            TEXT
          </div>
        )
    }
  }
  const [activeStep, setActiveStep] = React.useState(0)
  const [multiple, onMultipleChange] = useChecked(false)
  const [expandedIndex, onExpandedIndexChange] = useChecked(false)
  const [preventAllClosed, onPreventAllClosedChange] = useChecked(false)
  let defaultExpandedIndex
  if (expandedIndex) {
    defaultExpandedIndex = multiple ? [1, categories.length] : 0
  }

  const [panels, onKeyDown] = usePanels({
    count: categories.length,
    idPrefix: 'configuring-panels-122',
    multiple,
    preventAllClosed,

    // this will be considered `0` if the `preventAllClosed` option is enabled
    // but still `undefined`
    defaultExpandedIndex
  })

  const handleNext = index => {
    console.log('index', index)
    setActiveStep(index => index + 1)
  }

  const handleBack = () => {
    setActiveStep(prevActiveStep => prevActiveStep - 1)
  }

  const renderSubCategories = (subcategories, idCategory) => {
    return (
      <>
        <Box sx={{ maxWidth: 400 }}>
          <Stepper activeStep={activeStep} orientation='vertical'>
            {subcategories.map((step, index) => (
              <Step key={step.label}>
                <StepLabel onClick={() => loadContent(idCategory, step.idSubCategory)}>{step.label}</StepLabel>
                <StepContent>
                  <div className='infos'>{renderAdditionalInformation(step.content)}</div>
                  <Typography>{step.description}</Typography>
                  <Box sx={{ mb: 2 }}>
                    <div>
                      <Button variant='contained' onClick={() => handleNext(index)} sx={{ mt: 1, mr: 1 }}>
                        {index === subcategories.length - 1 ? 'Finish' : 'Continue'}
                      </Button>
                      <Button disabled={index === 0} onClick={handleBack} sx={{ mt: 1, mr: 1 }}>
                        Back
                      </Button>
                    </div>
                  </Box>
                </StepContent>
              </Step>
            ))}
          </Stepper>
          {/* {activeStep === subcategories.length && (
          <Paper square elevation={0} sx={{ p: 3 }}>
            <Typography>All steps completed - you&apos;re finished</Typography>
            <Button onClick={handleReset} sx={{ mt: 1, mr: 1 }}>
              Reset
            </Button>
          </Paper>
        )} */}
        </Box>
      </>
    )
  }

  // const renderSubCategories = (subcategories, idCategory) => {
  //   return subcategories.map(
  //     ({ label, content, idSubCategory, complete }, index) => (
  //       <div>
  //         <li
  //           key={index}
  //           onClick={() => loadContent(idCategory, idSubCategory)}
  //           className={`subCategories-list-item ${complete ? 'checked' : ''}`}
  //         >
  //           {complete ? (
  //             <div className='checked'>
  //               <i class="fa fa-check-square-o" aria-hidden="true"></i>
  //             </div>
  //           ) : (
  //             <div className='checked'>

  //               <i class="fa fa-square-o" aria-hidden="true"></i>
  //             </div>

  //           )}
  //           <label className="infos-label">{label}</label>
  //           <div className="infos">{renderAdditionalInformation(content)}</div>
  //         </li>
  //       </div>
  //     ),
  //   )
  // }

  const renderCategories = () => {
    return categories.map(({ title, watched, category, idCategory }, index) => {
      return (
        <>
          <ExpansionPanel
            {...panels[index]}
            header={
              <div className='categories-panel-header'>
                <div id='container'>
                  <div id='left'>{title}</div>
                  <div id='center'></div>
                  <div id='right'>{`${watched}/${category.length}`}</div>
                </div>
                {/* <div className="categoriesName">{title}</div>
              <div className="categoriesStatus">{`${watched}/${category.length}`}</div> */}
              </div>
            }
            defaultExpanded
            className='categories-panel'
          >
            <ul className='subCategories-list'>{renderSubCategories(category, idCategory)}</ul>
          </ExpansionPanel>
        </>
      )
    })
  }

  return (
    <div className={`category-education ${className || ''}`}>
      <div className='category-education-header md-paper--1'>
        <div className='category-education-lessenCategory'>{lessenCategory}</div>
        {/* <Button id='category-education-dashboard'>
          <div id='category-education-dashboard-angle-left'>
            <i class='fa fa-angle-left' aria-hidden='true'></i>
          </div>
          Go to Dashboard
        </Button> */}

        <div className='category-education-info'>
          <label className='title'>{title}</label>
          <div className='category-education-progressBar'>
            <LinearProgress
              color='primary'
              variant='determinate'
              sx={{ mb: 3, height: 10 }}
              value={Math.round((60 / 70) * 100)}
            />{' '}
          </div>
          <div className={`progress-value`}>{50}% complete</div>
        </div>
      </div>
      <SearchCategory loadContent={loadContent} />
      <ExpansionList>{renderCategories()}</ExpansionList>
      {/* {renderCategories()} */}
    </div>
  )
}

export default CategoryEducation
