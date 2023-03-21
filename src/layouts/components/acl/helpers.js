export const categories = [
  {
    idCategory: 0,
    title: 'Intro',
    watched: 1,
    category: [
      {
        ContentToDiplay:
          'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        ContentToDiplayurl: 'https://s3.amazonaws.com/codecademy-content/courses/React/react_video-fast.mp4',
        idSubCategory: 0,
        label: 'Intro to project',
        complete: true,
        content: {
          // here put the content with different keys
          type: 'video',
          url: 'http://',
          duration: '3 Min'
        },
        discussions: [
          {
            idChat: 0,
            title: 'salut ca va',
            post: 'lorem ipsum dolerem cavan',
            createDate: '1/1/2020',
            user: {
              name: 'Tamer',
              photo: 'icon'
            },
            replies: [
              {
                post: 'lorem ipsum dolerem cibuti',
                createDate: '1/1/2020',
                user: {
                  name: 'Tamer',
                  photo: 'icon'
                }
              },
              {
                post: 'bloum',
                createDate: '1/1/2020',
                user: {
                  name: 'Tamer',
                  photo: 'icon'
                }
              },
              {
                post: 'blam',
                createDate: '1/1/2020',
                user: {
                  name: 'Samir',
                  photo: 'icon'
                }
              }
            ]
          },
          {
            idChat: 1,
            title: 'salut ca va',
            post: 'lorem ipsum dolerem cavan',
            createDate: '1/1/2020',
            user: {
              name: 'Tamer',
              photo: 'icon'
            },
            replies: [
              {
                post: 'lorem ipsum dolerem cibuti',
                createDate: '1/1/2020',
                user: {
                  name: 'Tamer',
                  photo: 'icon'
                }
              }
            ]
          },
          {
            idChat: 2,
            title: 'salut ca va',
            post: 'lorem ipsum dolerem cavan',
            createDate: '1/1/2020',
            user: {
              name: 'Tamer',
              photo: 'icon'
            },
            replies: [
              {
                post: 'lorem ipsum dolerem cibuti',
                createDate: '1/1/2020',
                user: {
                  name: 'Tamer',
                  photo: 'icon'
                }
              }
            ]
          }
        ],
        note: 'first note'
      }
    ]
  },
  {
    idCategory: 1,
    ContentToDiplay:
      'Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using , making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
    ContentToDiplayurl: 'https://s3.amazonaws.com/codecademy-content/courses/React/react_video-slow.mp4',
    title: 'Installing React Native',
    watched: 2,
    category: [
      {
        idSubCategory: 0,
        ContentToDiplay:
          'Where does it come from?Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
        ContentToDiplayurl: 'https://s3.amazonaws.com/codecademy-content/courses/React/react_video-cute.mp4',

        label: 'Facebook React Native Documentation',
        complete: true,
        content: {
          // here put the content with different keys
          type: 'text'
        },
        discussions: [],
        note: 'second note'
      },
      {
        idSubCategory: 1,
        ContentToDiplay:
          'There are many variations of passages of Lorem  anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        ContentToDiplayurl: 'https://s3.amazonaws.com/codecademy-content/courses/React/react_video-eek.mp4',

        label: 'Installing React Native',
        complete: false,
        content: {
          // here put the content with different keys
          type: 'video',
          url: 'https://s3.amazonaws.com/codecademy-content/courses/React/react_video-cute.mp4',
          duration: '63 Min'
        },
        discussions: [],
        note: 'third note'
      },
      {
        idSubCategory: 2,
        ContentToDiplay: '',
        ContentToDiplayurl: 'https://s3.amazonaws.com/codecademy-content/courses/React/react_video-eek.mp4',

        label: 'Use supported version of React Native for this course!',
        complete: false,
        content: {
          // here put the content with different keys
          type: 'text'
        },
        discussions: [],
        note: 'fourth note'
      }
    ]
  }
]
