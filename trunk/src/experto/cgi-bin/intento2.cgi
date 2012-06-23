#!/usr/bin/python
print "Content-Type: text/html;charset=utf-8\n\n"
import clips
import sys, os, Cookie
import cgi
import cgitb; cgitb.enable()
import random

def get_history_file():
	r=random.random()*123456789
	r=str(r)
	path = "../history/"+r
	sfile = open(path, 'w')	
	return sfile,path



def generate_form(quest,slot,facts,b,sfile):
        print "<html>\n<head>\n<title>Preguntas</title></head>"
        print "<h4>Necesito saber si</h4>"
       	print " <h4> "
        print quest
	print sfile
 	print " </h4>"
       	print "<form action=\"intento1.cgi\" method=\"get\">"
       	print "<select name=\"respuesta\">"
       	print "<option value=\"si\">Si</option>"
       	print "<option value=\"No\">No</option>"
       	print "</select>"
	print "<input type=\"hidden\" name=\"facts\" value=",facts,">"
	print "<input type=\"hidden\" name=\"file\" value=",sfile,">"
	print "<input type=\"hidden\" name=\"slot\" value=",slot,">"
	print "<input type=\"hidden\" name=\"action\" value=\"preg\">"

       	print "<input type=\"submit\" name=\"submit\"/>"
   	print "</form></boby></html>"

def generate_form2(quest,slot,facts,b,sfile):
	print "<html>\n<head>\n<title>Preguntas</title></head>"
        print "<h4>Necesito saber si</h4><p></p>"
        print " <h4> "
	print quest
	print sfile
        print " </h4>"
        print "<form action=\"intento1.cgi\" method=\"get\">"
        print "<input type=\"text\" name=\"respuesta\"/>"
	print "<input type=\"hidden\" name=\"facts\" value=",facts,">"
	print "<input type=\"hidden\" name=\"file\" value=",sfile,">"
	print "<input type=\"hidden\" name=\"slot\" value=",slot,">"
	print "<input type=\"hidden\" name=\"action\" value=\"preg\">"

        print "<input type=\"submit\" name=\"submit\"/>"
        print "</form></boby></html>"



def calcula_slot(f):  			#el slot al que debo hacer el accert
	a=f.PPForm()
        b=a.split('(')
        if (b[1] == 'questions '):
        	slot = b[3].split('atribute')
        	slot = slot[1].split(')')
        	slot = slot[0]
		return slot
                        
def calcula_pregunta(f):		#la pregunta
	a=f.PPForm()
       	b=a.split('(')
        if (b[1] == 'questions '):
        	pregunta = b[2].split('question')
                pregunta = pregunta[1].split(')')
                pregunta = pregunta[0]
		return pregunta
	else: 
		return ""

def calcula_type(f):   #calculo el tipo de una pregunta
        a=f.PPForm()
        b=a.split('(')
        if (b[1] == 'questions '):
        	tipo = b[4].split('type')
                tipo = tipo[1].split(')')
                tipo = tipo[0]
		tipo = tipo.strip(' ')
                return tipo
	else: 
		return ""

def prepara_assert(slot,att):
	slot = slot.split(' ')
	slot.append(att)
	slot.append(')')
        respuesta = ['('] + slot
        respuesta = " ".join(respuesta)
        return respuesta
	
			
def cambia_base(index,s,res,fil):  #ref de fact, slot y respuesta usuario
	clips.Clear()
	clips.BatchStar(fil)
	clips.Run()
	facts = clips.FactList()
	i=int(index)
	if (len(facts)>=i ):
		f = facts[i-1]
		fact = prepara_assert(s,res)
		clips.Assert(fact)
		f.Retract()
		sfile = open(fil, 'a')
		sentencia =  "(assert " + fact + ")"
		sfile.write(sentencia + "\n")
		sfile.write("(run)\n")
		sentencia = "(retract "+ index + ")"
		sfile.write(sentencia + "\n")
		sfile.write("(run)\n")
		sfile.close()
	else:
		print facts 
		print clips.ClipsError()
		print fil	


def find_question(f):
	l = len(f)
        for i in range(l):
              	q=calcula_pregunta(f[i-1])
		t=calcula_type(f[i-1])
                if (len(q)>0):
			s=calcula_slot(f[i-1])
			print s
			return 1,q,s,t,f[i-1].Index
			break
		
	return 0,0		


               
			
			                       


def iterate(sfile):
	clips.BatchStar(sfile)
	clips.Run()
	f=clips.FactList()
	result = find_question(f)
	
	if(result[0]):
        	if(result[3]=='bool'):
        		generate_form(result[1],result[2],result[4],result[3],sfile) # formulario de si o no
                else:
                	generate_form2(result[1],result[2],result[4],result[3],sfile)  # formularion con texto
        else:
 		generate_result(f,sfile)



def generate_result(f):
	print f	
	

def main():
	form = cgi.FieldStorage()
	if(form.has_key("action")):
#		if (form.has_key("respuesta")):
			hechos = form["facts"].value
			#print hechos
			slot = form["slot"].value
			#print slot
			respuesta = form["respuesta"].value
			#print respuesta
			result = cambia_base(hechos,slot,respuesta, form["file"].value) #guardo las respuestas
			iterate(form["file"].value )
#		else:	
#			iterate( )
				
			
	else:	#primer llamado
		sfile1 = get_history_file()
		sfile = sfile1[0]
		clips.Clear()
		clips.Load("../../SE_FC3.CLP")
		clips.Reset()
		clips.Run()
		sfile.write("(clear)\n")
		sfile.write("(load \"../../SE_FC3.CLP\")\n")
		sfile.write("(reset)\n")
		sfile.write("(run)\n")
		sfile.close()
		f=clips.FactList()
		result = find_question(f)
		if(result[0]):
			if(result[3]=='bool'):
				
				generate_form(result[1],result[2],result[4],result[3], sfile1[1] ) # formulario de si o no
			else:
				generate_form2(result[1],result[2],result[4],result[3],sfile1[1]  )  # formularion con texto

		else:	
			generate_result(f,sfile[1])	
			#		clips.Run() 
			


main()



