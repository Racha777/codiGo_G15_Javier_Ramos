from dataclasses import field
from django import forms

from .models import Autor

class RecetaForm(forms.Form):
    titulo=forms.CharField(label='Titulo',max_length=100,required=True)
    ingredientes=forms.CharField(label='Ingredientes',widget=forms.Textarea)
    preparacion=forms.CharField(label='Preparacion',widget=forms.Textarea)
    #autor=forms.CharField(label='Autor',max_length=200,required=True)
    autor=forms.ModelChoiceField(queryset=Autor.objects.all())

class AutorForm(forms.ModelForm):
    class Meta:
        model=Autor
        fields='__all__'