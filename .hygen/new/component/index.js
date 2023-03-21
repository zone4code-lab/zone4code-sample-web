module.exports = {
  prompt: ({ inquirer }) => {
    const questions = [
      {
        type: 'select',
        name: 'category',
        message: 'Which Atomic design level?',
        choices: ['pages']//'atoms', 'molecules', 'organisms', 'templates',
      },
      {
        type: 'input',
        name: 'component_name',
        message: 'What is the component name?'
      },
      {
        type: 'input',
        name: 'dir',
        message: 'Where is the directory(Optional)',
      },
    ]
    return inquirer
      .prompt(questions)
      .then(answers => {
        const { category, component_name, dir } = answers
        const path = `${ dir ? `${dir}/` : `` }${component_name}`
        const absPath = `src/pages/apps/${path}`
        return { ...answers, path, absPath, category }
      })
  }
}
