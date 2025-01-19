/*
*   dorico.js
*/

import NavMenu from './nav-menu.js';
import SkipTo from './skip-to.js';

(function () {
  const skipTo = document.createElement('skip-to');
  skipTo.target = document.querySelector('main').firstElementChild;

  // Insert skip-to element as first child element of body
  if (document.body) {
    const reference = document.body.firstElementChild;
    document.body.insertBefore(skipTo, reference);
  }
  else {
    console.error('Error: Unable to insert skip-to element!');
  }
})();

function closeAllOthers (event) {
  if (event.target.open) {
    document.querySelectorAll('details').forEach(details => {
      if (details != event.target) {
        details.removeAttribute('open');
      }
    });
  }
}

document.addEventListener('DOMContentLoaded', event => {
  // Add toggle event listeners
  const detailsList = document.querySelectorAll('details');
  detailsList.forEach(item => item.addEventListener('toggle', closeAllOthers));

  // Deal with FOUC
  document.body.classList.remove('hidden');
});
