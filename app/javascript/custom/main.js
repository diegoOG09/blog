const tableOfContent = document.querySelector('.content_table')
const content = document.querySelector('.trix-content')
const headingsArr = document.querySelectorAll('h1')
const linksArr = document.querySelectorAll('a')
const title = document.querySelector('#title').textContent

let i = 1

function changeTabTitle(title) {
  document.title = title
}

changeTabTitle(title)

headingsArr.forEach(heading => {
  if (heading.parentNode == content) {
    console.log(heading)
    heading.setAttribute('id', i)
    i++
    linksArr.forEach(link => {
      if (link.parentNode == heading) {
        link.setAttribute('target', '_blank')
      }
    })
  }
})

tocbot.init({
  tocSelector: '.content_table',
  contentSelector: '.trix-content',
  headingSelector: 'h1',
  ignoreSelector: 'strong'
})
