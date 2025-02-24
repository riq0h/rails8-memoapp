import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  search() {
    if (this.element) {
      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        this.element.requestSubmit();
      }, 300);
    }
  }
}
