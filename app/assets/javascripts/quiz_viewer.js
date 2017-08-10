"use strict";

class QuizViewer {
  constructor(qajsonstr, quizElem) {
    this.qajson = JSON.parse(qajsonstr)
    this.quizElem = quizElem
  }

  //Builds form with QAJSON given an object literal with each question and user selection
  postForm(action, inputs, rails_auth_key) {
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

    //Add some required rails fields
    form.innerHTML += '<input name="utf8" type="hidden" value="✓">';
    form.innerHTML += '<input type="hidden" name="_method" value="patch">';
    form.innerHTML += rails_auth_key;

    this.quizElem.appendChild(form);

    form.submit();
  }

  buildQAJSONFromForm() {
    let inputNodes = this.quizElem.getElementsByTagName('input');

    //Stores qajson after adding user selection
    let newqajson = this.qajson;
    let questionct = 0;
    //Assume there is at least one question, index for naming inputs starts at 0
    //and that there are 4 answers per question
    for(var i = 0; i <= inputNodes.length-4; i+=4) {
      for(var x = i; x < i+4; x++) {
        if(inputNodes[x].checked) {
          newqajson[questionct]["selection"] = inputNodes[x].value;
          break;
        } else if(x == i+3) {
          newqajson[questionct]["selection"] = "";
        }
      }

      questionct++;
    }

    return newqajson;

  }

  //Returns number of questions in quiz
  countQuestions() {
    return this.qajson.length;
  }

  //Returns number of questions for which no answer has been selected
  countEmptyAnswers(answerjson) {
    let count = 0;

    //Loop through json obj array
    for(var i = 0; i < answerjson.length; i++) {
      if(answerjson[i]["selection"] == "") count++;
    }

    return count;
  }

  submitQuiz(path, quizid, rails_auth_key) {
    let qajson = this.buildQAJSONFromForm();

    //Make sure no answers are left blank
    if(!this.countEmptyAnswers(qajson)) {
      //Define the data to be sent in the final form to submissions#update
      let formdata = {
        'submission[qajson]': JSON.stringify(qajson),
        'submission[complete]': true,
        'submission[quiz_id]': quizid
      }

      this.postForm(path, formdata, rails_auth_key);

    } else {
      if (confirm('Note: One more questions were left unanswered. Press OK to submit anyway.')) {
        let formdata = {
          'submission[qajson]': JSON.stringify(qajson),
          'submission[complete]': true,
          'submission[quiz_id]': quizid
        }

        this.postForm(path, formdata, rails_auth_key);
      }
    }
  }

  saveQuiz(path, quizid, rails_auth_key) {
    let qajson = this.buildQAJSONFromForm();

    //Make sure at least one question is filled out, so it can be distinguished from uninitiated quizzes later
    //Possibly can be used as an automatic background function later
    if(this.countQuestions() != this.countEmptyAnswers(qajson)) {
      let formdata = {
        'submission[qajson]': JSON.stringify(qajson),
        'submission[complete]': false,
        'submission[quiz_id]': quizid
      }

      this.postForm(path, formdata, rails_auth_key);

    } else {
      console.log("No answers to save.");
    }
  }
}