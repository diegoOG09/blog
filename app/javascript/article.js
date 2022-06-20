const tableOfContent = document.querySelector('.content_table')
const content = document.querySelector('.trix-content')
const headingsArray = document.querySelectorAll('h1')

let i = 1

headingsArray.forEach(heading => {
  if (heading.parentNode == content) {
    console.log(heading)
    heading.setAttribute('id', i)
    i++
  }
})

tocbot.init({
  // Where to render the table of contents.
  tocSelector: '.content_table',
  // Where to grab the headings to build the table of contents.
  contentSelector: '.trix-content',
  // Which headings to grab inside of the contentSelector element.
  headingSelector: 'h1',
  // Headings that match the ignoreSelector will be skipped.
  ignoreSelector: 'strong'
})
