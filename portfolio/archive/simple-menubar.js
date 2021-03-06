/* simple-menubar.js */

const template = document.createElement('template');
template.innerHTML = `
  <nav>
    <div></div>
  </nav>
`;

const menuMap = new Map([
  [ 'Home', 'index.html' ],
  [ 'AInspector', 'ainspector.html' ],
  [ 'Bookmarklets', 'bookmarklets.html' ],
  [ 'A11yFirst Plugins', 'a11yfirst.html' ],
  [ 'NetBenefits', 'netbenefits.html'],
  // [ 'About', 'about.html' ],
]);

class SimpleMenubar extends HTMLElement {
  constructor () {
    super();
    this.attachShadow({ mode: "open" });

    // Use external CSS stylesheet
    const link = document.createElement('link');
    link.setAttribute('rel', 'stylesheet');
    link.setAttribute('href', 'simple-menubar.css');
    this.shadowRoot.appendChild(link);

    // Add DOM tree from template element
    this.shadowRoot.appendChild(template.content.cloneNode(true));
  }

  createAnchor (text, href) {
    const anchor = document.createElement('a');
    const textNode = document.createTextNode(text);
    anchor.appendChild(textNode);
    anchor.href = href;
    return anchor;
  }

  connectedCallback () {
    const innerHTML = this.innerHTML.trim();

    // Get div container for menu links
    const div = this.shadowRoot.querySelector('nav > div');
    div.style.setProperty('grid-template-columns',
      `repeat(${menuMap.size}, 1fr)`);

    // Add menu items to div
    for (const [key, value] of menuMap) {
      let anchor = this.createAnchor(key, value);
      if (innerHTML === value) {
        anchor.setAttribute('aria-current', 'page');
      }
      div.appendChild(anchor);
    }
  }
}

customElements.define('simple-menubar', SimpleMenubar);
