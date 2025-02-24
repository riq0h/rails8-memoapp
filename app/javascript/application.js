import "@hotwired/turbo-rails";
import "./controllers";

import { Turbo } from "@hotwired/turbo-rails";
Turbo.StreamActions.redirect = function () {
  const url = this.getAttribute("url");
  Turbo.visit(url, { action: "replace" });
};
