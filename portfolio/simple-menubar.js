/* simple-menubar.js */

const menuMap = new Map([
  [ 'Home', 'index.html' ],
  [ 'AInspector for Firefox', 'ainspector.html' ],
  [ 'Bookmarklets', 'bookmarklets.html' ],
  [ 'A11yFirst Plugins', 'a11yfirst.html' ],
  [ 'NetBenefits', 'netbenefits.html'],
  // [ 'About', 'about.html' ],
]);

class SimpleMenubar extends HTMLElement {
  constructor () {
    super();
    this.attachShadow({ mode: "open" });
    this.shadowRoot.appendChild(style);
    this.shadowRoot.appendChild(template.content.cloneNode(true));

    // Save reference to menu container
    this.container = this.shadowRoot.querySelector('nav > ul');
  }

  createMenuLink (text, href) {
    const link = document.createElement('a');
    link.href = href;

    const textNode = document.createTextNode(text);
    link.appendChild(textNode);

    return link;
  }

  connectedCallback () {
    // Get current page URL
    const pageUrl = this.textContent.trim();

    // Add menu items to container
    for (const [key, value] of menuMap) {
      let link = this.createMenuLink(key, value);
      if (pageUrl === value) {
        link.setAttribute('aria-current', 'page');
      }
      const item = document.createElement('li');
      item.appendChild(link);
      this.container.appendChild(item);
    }
  }
}

/* TEMPLATE AND STYLE ELEMENTS */

const template = document.createElement('template');
template.innerHTML = `
  <nav>
    <ul></ul>
  </nav>
`;

const style = document.createElement('style');
style.innerHTML = `
  ul, li {
    margin: 0;
    padding: 0;
  }
  nav ul {
    list-style: none;
    margin: 1.125rem 0;
  }
  nav ul li {
    display: inline-block;
    margin: 0 1rem;
  }
  nav ul li a {
    color: var(--link-color);
    text-decoration: none;
    padding: 0.25rem 0;
    border-bottom: 2px solid transparent;
  }
  nav ul li a:hover {
    color: var(--default-color);
    background-color: var(--light-blue);
    border-bottom: 2px solid var(--illini-orange);
  }
  nav ul li a[aria-current] {
    border-bottom: 2px solid var(--illini-orange);
  }
`;

customElements.define('simple-menubar', SimpleMenubar);
