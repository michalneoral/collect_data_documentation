#!/bin/bash

function napoveda (){
	echo "Script printsh";
	echo "Vytvoreni PDF bakalarske prace";
	echo "-h   tento help";
	echo "-b   exportuje reference"
	echo "-p   vytvori pdf"
	echo "-r   odstrani docasne a \"vyrobni\" soubory"
	echo "-a   all"
	exit
}

function all (){
	rm ref.aux ref.bbl ref.blg ref.log;
	rm bachelor_neoral.log;
	rm bachelor_neoral.ref;
	csplain ref;
	csplain ref;
	bibtex ref;
	bibtex ref;
	pdfcsplain bachelor_neoral;
	pdfcsplain bachelor_neoral;
	exit
}

function bib (){
	csplain ref;
	csplain ref;
	bibtex ref;
	bibtex ref;
	exit
}

function rem (){
	rm ref.aux ref.bbl ref.blg ref.log;
	rm bachelor_neoral.log;
	rm bachelor_neoral.ref;
	exit
}

function pdf (){
	pdfcsplain bachelor_neoral;
	pdfcsplain bachelor_neoral;
	exit
}
#	
h_par=false;
b_par=false;
a_par=false;
p_par=false;
r_par=false;

#zpracovani parametru
while getopts 'hbaprf:' Option; do
	case ${Option} in
		h)	h_par=true;;
		b)	b_par=true;;
		a)	a_par=true;;
		p)	p_par=true;;
		r)	r_par=true;;
		f)	p_par=true;;
	esac
done

if $h_par; then
  napoveda 
fi

if $b_par; then
  bib
fi

if $a_par; then
  all 
fi

if $p_par; then
  pdf 
fi

if $r_par; then
  rem 
fi

napoveda