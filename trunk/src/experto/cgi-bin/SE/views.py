from django.shortcuts import render_to_response
from SE.forms import QuestionForm, QuestionForm2

def question(request,preg):
      form = QuestionForm()
      return render_to_response('question_form.html', {'form': form, 'pregunta': preg })


def question2(request, preg):
    form = QuestionForm2()	
    return render_to_response('question_form.html', {'form': form, 'pregunta': preg})

# question_form.html


 

