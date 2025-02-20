import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.classList.add("opacity-0");
    this.element.classList.add("translate-y-4");

    requestAnimationFrame(() => {
      this.element.classList.remove("opacity-0");
      this.element.classList.remove("translate-y-4");
      this.element.classList.add("transition-all");
      this.element.classList.add("duration-300");
    });
  }
}
