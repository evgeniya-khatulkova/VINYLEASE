import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!"
    console.log("hello")
  }

  accept() {
    console.log("accepted")
  }

  cancel() {
    console.log("cancelled")
  }
}
