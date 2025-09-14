document.addEventListener("DOMContentLoaded", (event) => {
  let isToggled = false;
  const navbar = document.getElementById("nav");
  const menuBtn = document.getElementById("hamburger");
  const links = [...navbar.querySelector("#links-group").children];

  function toggleNavLinks() {
    if (isToggled) {
      navbar.dataset.state = "active";
    } else {
      navbar.dataset.state = "";
    }
  }

  menuBtn.addEventListener("click", () => {
    isToggled = !isToggled;
    toggleNavLinks();
  });

  links.forEach((link) => {
    link.addEventListener("click", () => {
      isToggled = !isToggled;
      toggleNavLinks();
    });
  });
});
