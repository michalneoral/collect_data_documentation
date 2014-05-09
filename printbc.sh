#!/bin/bash

function napoveda (){
	echo "Script printsh";
	echo "Vytvoreni PDF bakalarske prace";
	echo "-h   tento help";
	echo "-b   exportuje reference"
	echo "-p   vytvori pdf"
	echo "-r   odstrani docasne a \"vyrobni\" soubory"
	echo "-a   all"
	echo ""
	echo ""
	echo "-m   move"
	echo "-z   spocita vsechny znaky"
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
}

function move (){
	mv ~/ros_catkin_ws/src/clopema_cvut/clopema_collect_model_data/matlab/*.pdf ./pictures/;	
	
}

function bib (){
	csplain ref;
	csplain ref;
	bibtex ref;
	bibtex ref;
	exit
}

function znaky (){
    pdftotext bachelor_neoral.pdf - | wc -m;
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
z_par=false;
m_par=false;

#zpracovani parametru
while getopts 'hbapzmrf:' Option; do
	case ${Option} in
		h)	h_par=true;;
		b)	b_par=true;;
		a)	a_par=true;;
		p)	p_par=true;;
		z)	z_par=true;;
		m)	m_par=true;;
		r)	r_par=true;;
		f)	p_par=true;;
	esac
done

if $h_par; then
  napoveda 
fi

if $m_par; then
  move 
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

if $z_par; then
  znaky 
fi

if $r_par; then
  rem 
fi

exit
