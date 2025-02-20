import { Turbo } from "@hotwired/turbo-rails";
import "controllers";

Turbo.StreamActions.redirect = function () {
  const url = this.getAttribute("url") || "/";
  Turbo.visit(url, { frame: "_top", action: "advance" });
};
