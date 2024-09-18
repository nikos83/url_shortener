import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  copy(event) {
    event.preventDefault();

    const shortUrl = this.element.getAttribute("data-copy-url-value");

    if (shortUrl) {
      // Dodaj przedrostek, np. ROOT_URL
      const fullUrl = `${shortUrl}`;

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
