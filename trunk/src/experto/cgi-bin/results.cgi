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

#print "Content-Type: text/html;charset=utf-8\n\n"
import clips
import sys, os, Cookie
import cgi
import cgitb; cgitb.enable()
import random


def main():
	
	 form = cgi.FieldStorage()
	 if(form.has_key("file")):
		f=form["file"]
		clips.Clear()
		clips.Load()
		clips.LoadFact(f)
		clips.Reset()
		clips.Run()
		clips.PrintFacts()
	else:
		print "no tengo el archivo"

main()
