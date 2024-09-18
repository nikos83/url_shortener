import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  copy(event) {
    event.preventDefault();

    // Pobrany zostaje pełny URL przekazany w data-copy-url-value
    const fullUrl = this.element.getAttribute("data-copy-url-value");

    if (fullUrl) {
      navigator.clipboard
        .writeText(fullUrl)
        .then(() => {
          alert("Copied the link: " + fullUrl);
        })
        .catch((err) => {
          console.error("Failed to copy: ", err);
        });
    } else {
      console.error("No URL value found to copy.");
    }
  }
}
