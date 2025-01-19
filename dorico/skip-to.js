/*
*   skip-to.js
*/

export default class SkipTo extends HTMLElement {
  constructor () {
    super();
    this.attachShadow({ mode: 'open' });
    this.shadowRoot.appendChild(style);
    this.shadowRoot.appendChild(template.content.cloneNode(true));
    this.targetElement = null;
  }

  set target (element) {
    this.targetElement = element;
  }

  connectedCallback () {
    if (this.targetElement) {
      this.addEventListener('click', event => {
        const target = this.targetElement;
        if (target.tabIndex === -1) {
          target.setAttribute('tabindex', '0');
        }
        target.focus();
      });
    }
  }
}

const template = document.createElement('template');
template.innerHTML = `
<div>
  <a href="#">Skip to main content</a>
</div>
`;

const style = document.createElement('style');
style.textContent = `
  div a {
    position: relative;
    top: 4px;
    left: -100rem;
    font-size: 0.875rem;
    color: inherit;
    padding: 4px;
  }
  div a:focus {
    left: 2px;
    outline-offset: -2px;
    outline: 2px solid #ff5733;
  }
`;

customElements.define('skip-to', SkipTo);
