#!/usr/bin/python

##   											
##    SEBREI Project: Web Interface  
##    
##    Copyright (C) 2012  Erica Vidal (https://sourceforge.net/users/ericavidal)
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.
##
##

print "Content-Type: text/html;charset=utf-8\n\n"
import clips
import sys, os, Cookie
import cgi
import cgitb; cgitb.enable()
import random
import urllib2, httplib
import psycopg2
import string


def get_history_file():
	r=random.random()*123456789
	r=str(r)
	path = "../history/prueba"
	sfile = open(path, 'w')	
	return sfile,path

def database_connect():
	conection =psycopg2.connect(database = "sebrei",user = "sebrei",password = "sebrei159",host = "localhost")

#	except Exception, e:
#	         print str( e )
#	         exit
	return (conection)

def database_adddata(query):
	db = database_connect()
	cur = db.cursor()
	cur.execute(query)
	db.commit()
	database_close(db,cur)

def database_consult(query):
        db = database_connect()
        cur = db.cursor()
        cur.execute(query)
#	process_results(cur)
	return (db,cur)

def database_close(db,cur): 
        cur.close()
        db.close()

def generate_form(quest,slot,facts,b,sfile):
        print "<html>\n<head>\n<title>Preguntas</title>"
	print "<link rel=StyleSheet href=\"style.css\"> "
	print "</head><body><div id=\"page\">"
	print "<div id=\"header\" ><img src=\"../images/printers.png\"   height=50/></div>"
        print "<h4><img src=\"../images/happy.png\"  width=50 height=50/>  Necesito saber:</h4>"
       	print " <h5> "
        print quest
 	print " </h5>"
	print "<table><tr><td>"
#	print "<img src=\"../images/happy.png\"  width=50 height=50/>"
	print"</td></tr><tr><td>"
       	print "<form action=\"index.cgi\" method=\"get\">"
       	print "<select name=\"respuesta\">"
       	print "<option value=\"si\">Si</option>"
       	print "<option value=\"no\">No</option>"
       	print "</select>"
	print "<input type=\"hidden\" name=\"facts\" value=",facts,">"
	print "<input type=\"hidden\" name=\"file\" value=",sfile,">"
	print "<input type=\"hidden\" name=\"slot\" value=",slot,">"
	print "<input type=\"hidden\" name=\"action\" value=\"preg\">"
       	print "<input type=\"submit\" name=\"submit\"/>"
   	print "</form></td></tr></table><div id=\"footer\">"
	print "<p>Desarrollado por Erica Vidal.</p></div></div></boby></html>"

def generate_form2(quest,slot,facts,b,sfile):
	print "<html>\n<head>\n<title>Preguntas</title>"
        print "<link rel=StyleSheet href=\"style.css\"> "
        print "</head><body><div id=\"page\">"
	print "<img =\"../images/prinnters.png\"\>"
        print "<h4> <img src=\"../images/happy.png\"  width=50 height=50/> Necesito saber:</h4>"
        print " <h5> "
	print quest
        print " </h5>"
	print "<table><tr><td>"
#	print "<img src=\"../images/happy.png\"  width=50 height=50/>"
	print "</td></tr><tr><td>"
        print "<form action=\"index.cgi\" method=\"get\">"
        print "<input type=\"text\" name=\"respuesta\"/>"
	print "<input type=\"hidden\" name=\"facts\" value=",facts,">"
	print "<input type=\"hidden\" name=\"file\" value=",sfile,">"
	print "<input type=\"hidden\" name=\"slot\" value=",slot,">"
	print "<input type=\"hidden\" name=\"action\" value=\"preg\">"
        print "<input type=\"submit\" name=\"submit\"/>"
	print "</form></td></tr></table></div></boby></html>"







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


def calcula_modelo(f):                
        a=f.PPForm()
        b=a.split('(')
#	print b
	if (b[1] == 'models '):
		mod = b[2].split('model')

		mod = mod[1].split(')')
		
		mod = mod[0] 
                return 1,mod
        else:
                return 0,""

def calcula_id(f):
        a=f.PPForm()
        b=a.split('(')
#       print b
        if (b[1] == 'ids '):
                ids = b[2].split('id')

                ids = ids[1].split(')')

                ids = ids[0]
                return 1,ids
        else:
                return 0,""




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
#	if (len(facts)>=i ):
	fact = prepara_assert(s,res)
	clips.Assert(fact)
	for j in range(len(facts)):
		if  (facts[j-1].Index == i):
			facts[j-1].Retract()

	sfile = open(fil, 'a')
	sentencia =  "(assert " + fact + ")"
	sfile.write(sentencia + "\n")
	sentencia = "(retract "+ index + ")"
	sfile.write(sentencia + "\n")
	sfile.write("(run)\n")
	sfile.close()


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
	clips.Clear()
	clips.BatchStar(sfile)
	clips.Run()
	f=clips.FactList()
#	print clips.PrintFacts()
	result = find_question(f)
	
	if(result[0]):
        	if(result[3]=='bool'):
        		generate_form(result[1],result[2],result[4],result[3],sfile) # formulario de si o no
                else:
                	generate_form2(result[1],result[2],result[4],result[3],sfile)  # formularion con texto
        else:
	 	generate_result(f,sfile)
		print_result(sfile)


def generate_result(f,sfile):
	clips.BatchStar(sfile)
        clips.Run()
#	print clips.PrintFacts()
#	clips.Clear()
	ffile=sfile+"facts"
	clips.SaveFacts(ffile)
	clfile=open(ffile+".clp", 'w')
	ofile = open(ffile, 'r')
	for line in ofile:
		clfile.write("(assert "+line+")\n")	
	
	clfile.close()
	ofile.close()

def print_result(sfile):
	clips.Clear()
	clips.Load("../../ClipsFiles/printers.clp") 
	clips.Reset()
	clips.BatchStar(sfile+"facts.clp")
	clips.Run()
#	print clips.PrintFacts()
	f = clips.FactList()
	l= len (f)
	ids=[]	
	for i in range(l):
                m=calcula_id(f[i-1])
                if (m[0]==1): 
         		ids.append(m[1])
	
	rows=[]
	
	while (len (ids)):
#		widths.append([])
		query = "SELECT printer_model, printer_description, printer_link,vendor_id  FROM printer where printer_id=" + ids.pop()
		res = database_consult(query)
		rows.append(res[1].fetchall())
		database_close(res[0],res[1])


	print "<html>\n<head>\n<title>Preguntas</title>"
        print "<link rel=StyleSheet href=\"style.css\"> "
        print "</head><body><div id=\"page\">"
        print "<div id=\"header\" ><img src=\"../images/printers.png\"   height=50/></div>"
	if (len(rows)>0):
	        print "<h5><img src=\"../images/happy.png\"  width=50 height=50/>Mi recomendacion es:</h5>"
   		
		for row in rows:
			print "<fieldset>"
			query = "SELECT vendor_name FROM vendor WHERE vendor_id="+ str(row[0][3])
	                res = database_consult(query)
        	        marcas=(res[1].fetchall())
               		database_close(res[0],res[1])
        		print "<p> "+ marcas[0][0] + " "+ row[0][0] + "</p>"
			if  row[0][1] is None:
				print " "
			else:
				print "<p> ", row[0][1] , "</p>"
			if  row[0][2] is None:
				print " "
			else: 
				print "<a href=\"",row[0][2],"\">link al folleto</a>"
			
			print "</fieldset><br><br>"
	else:
		 print "<h5><img src=\"../images/happy.png\"  width=50 height=50/>Lo siento, no puedo ofrecerte nada acorde a tus espectativas.</h5>" 
		
        print "<div id=\"footer\">"
	print "<p>Desarrollado por Erica Vidal.</p></div></div></boby></html>"


	
#	httplib.HTTPConnection.debuglevel = 1	
#	print ids	
		

def main():
	form = cgi.FieldStorage()
	if(form.has_key("action")):
		hechos = form["facts"].value
		slot = form["slot"].value
		respuesta = form["respuesta"].value			#print respuesta
		result = cambia_base(hechos,slot,respuesta, form["file"].value) #guardo las respuestas
		iterate(form["file"].value )
				
			
	else:	#primer llamado
		sfile1 = get_history_file()
		sfile = sfile1[0]
		clips.Clear()
		clips.Load("../../ClipsFiles/main.clp")
		clips.Load("../../ClipsFiles/regla_uso.clp")
		clips.Load("../../ClipsFiles/regla_precio.clp")
		clips.Load("../../ClipsFiles/adicionales.clp")

		clips.Reset()
		clips.Assert("(browser)")
		clips.Run()
		sfile.write("(clear)\n")
		sfile.write("(load \"../../ClipsFiles/main.clp\")\n")
		sfile.write("(load \"../../ClipsFiles/regla_uso.clp\")\n")
		sfile.write("(load \"../../ClipsFiles/regla_precio.clp\")\n")
		sfile.write("(load \"../../ClipsFiles/adicionales.clp\")\n")
		sfile.write("(reset)\n")
		sfile.write("(assert (browser))\n")
		sfile.write("(run)\n")
		sfile.close()
		f=clips.FactList()
	#	print clips.PrintFacts()
		result = find_question(f)
		if(result[0]):
			if(result[3]=='bool'):
				
				generate_form(result[1],result[2],result[4],result[3], sfile1[1] ) # formulario de si o no
			else:
				generate_form2(result[1],result[2],result[4],result[3],sfile1[1]  )  # formularion con texto

		else:	
			generate_result(f,sfile1[1])	
			#		clips.Run() 
			


main()



