"use strict";

class QuizViewer {
  constructor(qajsonstr, quizElem) {
    this.qajson = JSON.parse(qajsonstr)
    this.quizElem = quizElem
  }

  //Builds form with QAJSON given an object literal with each question and user selection
  postData(action, inputs) {
    let form = document.createElement('form');
    form.setAttribute('action', action);
    form.setAttribute('method', 'post');
    
    for(var key in inputs) {
      if(inputs.hasOwnProperty(key)) {
        let newi = document.createElement('input');
        newi.setAttribute('name', key);
        newi.setAttribute('value', inputs[key]);
        newi.setAttribute('type', 'hidden');

        form.appendChild(newi);
      }
    }

    document.appendChild(form);

    form.submit();
  }

  buildQAJSONFromForm() {
    let inputNodes = quizElem.children;
    for(var i = 0; i < inputNodes.length; i++) {
      let inputNode = inputNodes[i];
      if(inputNode.getAttribute('type').toLowerCase() === 'radio') {

      }
    }
  }
}