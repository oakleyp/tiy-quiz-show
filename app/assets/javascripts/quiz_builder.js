"use strict";

class QuizBuilder {
  constructor(qajsonstr=null, qwrapperid='qa-wrapper') {
    //JSON structure to parse into editable HTML form
    this.qajson = (qajsonstr==null ? null : JSON.parse(qajsonstr));
    this.questionWrapper = document.getElementById(qwrapperid);
  }

  //Creates editable forms from saved qajson
  createFormsFromJSON() {
    if(this.qajson) {
      let jsonarr = this.qajson;
      for(var i = 0; i < jsonarr.length; i++) {
        let qdata = jsonarr[i];
        let newform = this.createQuestionForm(qdata["question"], qdata["answers"], qdata["correct"]);
        this.questionWrapper.appendChild(newform);
      }
    }
  }

  //Returns an editable form given a question, array of answers, and correct answer
  createQuestionForm(question, answersarr, correctanswer) {
    if(answersarr.length >= 4) {
      let newq = document.createElement('li');
      newq.className = 'question';

      newq.innerHTML = `<div class="question-input-wrapper"> \
                        <span>Question: </span> \
                        <input class="question-input" value="${question}"> \
                      </div> \
                      <div class="answers-input-wrapper"> \
                        <p>Choices: </p> \
                        <ul class="answer-list"> \
                          <li><input class="answer" value="${answersarr[0]}"></li> \
                          <li><input class="answer" value="${answersarr[1]}"></li> \
                          <li><input class="answer" value="${answersarr[2]}"></li> \
                          <li><input class="answer" value="${answersarr[3]}"></li> \
                        </ul> \
                      </div> \
                      <div class="correct-answer-wrapper"> \
                          <span>Correct Answer: </span> \
                          <input class="answer-input" value="${correctanswer}"> \
                      </div>`;

      return newq;
    }
  }

  //Appends a blank question form to the questionWrapper element
  appendBlankForm() {
    let newQuestionForm = document.createElement('li');

    newQuestionForm.className = "question";
    newQuestionForm.innerHTML = '<div class="question-input-wrapper"> \
                          <span>Question: </span> \
                          <input class="question-input"> \
                        </div> \
                        <div class="answers-input-wrapper"> \
                          <p>Choices: </p> \
                          <ul class="answer-list"> \
                            <li><input class="answer"></li> \
                            <li><input class="answer"></li> \
                            <li><input class="answer"></li> \
                            <li><input class="answer"></li> \
                          </ul> \
                        </div> \
                        <div class="correct-answer-wrapper"> \
                            <span>Correct Answer: </span> \
                            <input class="answer-input"> \
                        </div>';

    this.questionWrapper.appendChild(newQuestionForm);
  }

  appendForm(formelem) {
    this.questionWrapper.appendChild(newQuestionForm);
  }

  //Returns title input of form
  getQuizTitle() {
    return document.getElementById('quiz_title').value;
  }

  createJSONStrFromForms() {
    let qNodes = this.questionWrapper.children;

    let qa_objects = [];

    //Loop through each question form, and add each one that is valid to the qa_object
    for(var i = 0; i < qNodes.length; i++) {
      let node = qNodes[i];
      let valid = true;

      let question = node.getElementsByClassName("question-input")[0].value,
          answers = node.getElementsByClassName("answer"),
          correct = node.getElementsByClassName("answer-input")[0].value;

      //Stores array of answers
      let cleananswers = [];

      if(question.length > 5 && correct.length >= 1) {
        //Check each answer
        for(var x = 0; x < answers.length; x++) {
          let answer = answers[x];
          if(answer.value == '') valid = false;
          else {
            cleananswers.push(answer.value.replace(/[&<>"'`=\/]/g, ''));
          }
        }
      }

      //Add cleaned question, answers, and correct to qa_object array as json obj
      if(valid) {
        let newobj = {
          "question": question.replace(/[&<>"'`=\/]/g, ''),
          "answers": cleananswers,
          "correct": correct.replace(/[&<>"'`=\/]/g, '')
        }

        qa_objects.push(newobj);

      } else {
        alert(`Error saving question #${i+1}, one or more fields were invalid or blank.`);
      }

    }

    console.log("Created JSON string from forms: ");
    console.log(JSON.stringify(qa_objects));
    return JSON.stringify(qa_objects);
  }





}