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
  [ 'A11yFirst', 'a11yfirst.html' ],
  [ 'Bookmarklets', 'bookmarklets.html' ],
  // [ 'NetBenefits', 'netbenefits.html']
]);

class SimpleMenubar extends HTMLElement {
  constructor () {
    super();
    // After the following call to attachShadow, the 'shadowRoot'
    // element is retrievable as 'this.shadowRoot'
    this.attachShadow({ mode: "open" });

    // Use external CSS stylesheet
    const link = document.createElement('link');
    link.setAttribute('rel', 'stylesheet');
    link.setAttribute('href', 'simple-menubar.css');
    this.shadowRoot.appendChild(link);

    // Add DOM tree from template
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

    // Get div container
    const div = this.shadowRoot.querySelector('nav > div');

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
