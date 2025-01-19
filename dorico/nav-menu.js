/*
*   nav-menu.js
*/

export default class NavMenu extends HTMLElement {
  constructor () {
    super();
    this.attachShadow({ mode: 'open' });

    this.shadowRoot.innerHTML = styleElement;
    this.shadowRoot.appendChild(template.content.cloneNode(true));

    // Initialize DOM references
    this.nav = this.shadowRoot.querySelector('nav');
  }

  connectedCallback () {
    const current = this.getAttribute('current');
    const menuItems = this.nav.querySelectorAll('li > a');
    for (let item of menuItems) {
      const filename = item.href.split('/').pop();
      if (filename === current) {
        item.setAttribute('aria-current', 'page');
      }
    }
  }
}

const template = document.createElement('template');
template.innerHTML = `
<nav>
  <ul>
    <li><a href="index.html">Overview</a></li>
    <li><a href="write-mode-1.html">Write Mode – Part 1</a></li>
    <li><a href="write-mode-2.html">Write Mode – Part 2</a></li>
    <li><a href="key-commands.html">Key Commands</a></li>
    <li><a href="lead-sheets.html">Lead Sheets</a></li>
    <li><a href="preferences.html">Preferences</a></li>
  </ul>
</nav>
`;

const styleElement = `
<style>
  nav {
    margin-top: var(--vspacing);
    --light-blue:  #d9e1f9;
    --dark-blue: royalblue;
    --dark-orange: #ff5733;
  }

  nav ul {
    list-style-type: none;

    display: grid;
    grid-template-columns: 33% 33% 33%;
    column-gap: 4px;
    row-gap: 4px;

    padding: 0;
  }

  nav ul > li {
    background-color: var(--light-blue);
  }

  nav ul > li a {
    display: block;
    padding: 0.375rem 0.5rem;
    text-decoration: none;
    color: inherit;
  }

  nav ul > li a:focus {
    outline-offset: -2px;
    outline: 2px solid var(--dark-orange);
  }

  nav ul > li a:hover,
  nav ul > li a[aria-current] {
    background-color: var(--dark-blue);
    color: white;
  }
</style>
`;

customElements.define('nav-menu', NavMenu);
