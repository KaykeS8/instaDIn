import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log('Hello world')
    }

    handleModal(){
        const modal = document.querySelector('.modal')
        modal.classList.toggle('hidden')
    }
}