import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["source"];

  copy() {
    const url = `${window.location.origin}${event.currentTarget.dataset.url}`;

    navigator.clipboard
      .writeText(url)
      .then(() => {
        alert("Copied the link: " + url);
      })
      .catch((err) => {
        console.error("Failed to copy: ", err);
      });
  }
}
