import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  copy(event) {
    event.preventDefault();

    const url = this.element.getAttribute("data-copy-url-value");

    if (url) {
      navigator.clipboard
        .writeText(url)
        .then(() => {
          alert("Copied the link: " + url);
        })
        .catch((err) => {
          console.error("Failed to copy: ", err);
        });
    } else {
      console.error("No URL value found to copy.");
    }
  }
}
