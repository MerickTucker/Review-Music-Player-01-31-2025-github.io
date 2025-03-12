const tagSelectors = [
  {
    tag: 'h1',
    name: 'Title',
    parent: 'header',
    sibling: 0,
    text: 'one'
  },
  {
    tag: 'h2',
    name: 'Name',
    parent: 'div#element-0',
    sibling: 0,
    text: 'two'
  },
  {
    tag: 'h3',
    name: 'Grade',
    parent: 'div#element-0',
    sibling: 1,
    text: 'three'
  },
  {
    tag: 'h4',
    name: '\"Who Am I\" header',
    parent: 'div#element-1',
    sibling: 0,
    text: 'four'
  },
  {
    tag: 'ul',
    name: 'Unordered list tag',
    parent: 'div#element-1',
    sibling: 1,
    text: 'five'
  },
  {
    tag: 'li',
    name: 'Description',
    parent: 'div#element-1 ul',
    sibling: 0,
    text: 'six'
  },
  {
    tag: 'h1',
    name: 'Image',
    parent: 'div#element-2',
    sibling: 0,
    text: 'seven'
  },
  {
    tag: 'li',
    name: 'Description',
    parent: 'div#element-2',
    sibling: 0,
    text: 'if you can read this my website is broken. please contact elon musk about this issue, i am sure he would care about this issue.'
  }
]

document.onload = main();

function main() {
  let isAllTagsPresent = true;
  const isChecklist = window.location.search === '?testing';

  createIds();
  if (isChecklist) {
    createChecklist();
  }
  tagSelectors.map(selector => {
    if (isChecklist) {
      createChecklistItem(selector);
    }

    if (!tagExists(selector)) {
      addElement(selector);
      isAllTagsPresent = false;
    }
  });

  const sections = document.querySelectorAll('section');
  sections.forEach((section, index) => {
    section.setAttribute('class', `bg${index + 1}`);
  });

  if (isChecklist) {
    isAllTagsPresent ?
      document.querySelector('#checklist').setAttribute('id', 'complete') :
      document.querySelector('#checklist').setAttribute('id', 'incomplete');
  }
}

function createIds() {
  const divs = document.querySelectorAll('div');

  divs.forEach((div, index) => div.setAttribute('id', `element-${index}`));
  // Create additional divs if less than 5
  for (let i = divs.length; i < 5; i++) {
    const newDiv = document.createElement('div');
    newDiv.setAttribute('id', `element-${i}`);
    document.body.appendChild(newDiv);
  }
}

function tagExists(selector) {
  const element = document.querySelector(selector.tag);

  return document.body.contains(element);
}

function addElement(selector) {
  const element = document.createElement(selector.tag);
  const elementContent = document.createTextNode(selector.text);
  element.appendChild(elementContent);

  const parent = document.querySelector(selector.parent);
  parent.insertBefore(element, parent.children[selector.sibling]);
}

function createChecklist() {
  const section = document.createElement('section');
  section.setAttribute('id', 'checklist')

  const header = document.querySelector('header');
  const body = document.querySelector('body');
  body.insertBefore(section, header);
}

function createChecklistItem(selector) {
  const section = document.querySelector('section#checklist');
  const checklistItem = document.createElement('i');
  checklistItem.setAttribute('class', tagExists(selector) ? 'fas fa-check' : 'fas fa-times');
  const checklistItemContent = document.createTextNode(selector.name);

  checklistItem.appendChild(checklistItemContent);
  section.appendChild(checklistItem);
}
