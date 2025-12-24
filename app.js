const iframe = document.querySelector("iframe");
const loader = document.getElementById("loader");

iframe.addEventListener("load", () => {
  loader.classList.add("hidden");
});
