import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  process() {
    const elements = document.getElementsByClassName("movie");
    const input = document.getElementById("search").value.toLowerCase();
    //console.log(input);
    Array.from(elements).forEach((card) => {
      card.classList.remove("d-none");
    });
    let count = 0;
    Array.from(elements).forEach((card) => {
      const name = card.getElementsByClassName("name");
      if (!name[0].innerText.toLowerCase().includes(input)){
        card.classList.add("d-none");
      } else {
        count += 1;
      }
    });
    const results = document.getElementById("results_count");
    if(elements.length === count){
      results.classList.add("d-none");
    } else {
    results.classList.remove('d-none');
    results.innerText = `Found ${count} results`;
    }

  }
}
