import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["textarea"];

  connect() {
    if (this.hasTextareaTarget) {
      this.textareaTarget.focus();
    }
  }
}
