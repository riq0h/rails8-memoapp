import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.style.display = "none";
  }

  open() {
    this.element.style.display = "block";
  }

  close() {
    this.element.style.display = "none";
    const frame = document.getElementById("modal");
    frame.removeAttribute("src");
    frame.innerHTML = "";
  }

  clickOutside(event) {
    if (event.target === this.element) {
      this.close();
    }
  }
}
