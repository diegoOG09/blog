// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"


const spansNode = document.querySelectorAll('.icon')

const icons = [
  `<i class="fa-brands fa-linux icon"></i>`,
  `<i class="fa-solid fa-eye"></i>`,
  `<i class="fa-solid fa-server icon"></i>`,
  `<i class="fa-solid fa-gear icon"></i>`,
  `<i class="fa-solid fa-gem icon"></i>`
]

for (let i = 0; i < spansNode.length; i++) {
  for (let j = 0; j < icons.length; j++) {
    const element = spansNode[i];
    element.innerHTML = icons[i]
  }
}

