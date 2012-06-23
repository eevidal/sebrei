from django import forms

CHOICES = (
    ('Si', 'Si'),
    ('No', 'No'),

)

class QuestionForm(forms.Form):
 
    Respuesta = forms.CharField(max_length=3,
                widget=forms.Select(choices=CHOICES))
  
    
class QuestionForm2(forms.Form):

    Respuesta = forms.CharField()
