% myClass.cls     Created by Martin Domke
% ---------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rn2}
\LoadClass[11pt,a4paper,twoside]{scrartcl}
\usepackage[ngerman]{babel}
\usepackage[utf8]{inputenc}
\usepackage{amssymb}
\usepackage[leqno, fleqn]{amsmath}
\usepackage{graphicx}
\usepackage{subfig}
\usepackage{moreverb}
\usepackage{fancyhdr} 
\usepackage{array}
\usepackage{booktabs}

% -----------------------------------------------------------------------
% Page layout

% -> enlarge page
\setlength{\textwidth}{16cm}
\setlength{\topmargin}{-1cm}
\setlength{\evensidemargin}{0cm}
\setlength{\oddsidemargin}{0cm}
\setlength{\textheight}{24cm}

% -> skip between paragraphs and don't indent
\setlength{\parskip}{1ex}
\setlength{\parindent}{0ex}
 
% -> set pagestyle
\pagestyle{plain}
\thispagestyle{plain}

% -----------------------------------------------------------------------
% Main macros
\renewcommand{\maketitle}[4]
    {\@maketitle{#1}{#2}{#3}{#4}}
\renewcommand\thesection{Aufgabe \arabic{section}}
\newcommand\skipsection{\stepcounter{section}}

% -----------------------------------------------------------------------
% redefine the \maketitle-command
\renewcommand{\@maketitle}[4]
{
    \begin{tabular*}{\textwidth}[t]{lr}
    	\begin{tabular}[t]{l}
			Rechnernetze 2 \hspace{25ex} SoSe 07 \\
			\hspace{0,75\textwidth} \\[1.5ex]
			{\Huge\sf Übungsblatt {#1}} \\[1ex]
			{\Large Abgabe: {#2}} \\[1ex]
		\end{tabular}
		&
		\begin{tabular}[t]{l}
			{#3} \\
			{#4} 
		\end{tabular}
	\end{tabular*}
	\rule{\linewidth}{1pt}
% -----------------------------------------------------------------------
% Create headings 
    \fancyhf{} %clear all header and footer fields
    \fancyhead[LO,RE]{\leftmark}
    \fancyhead[RO,LE]{\rightmark}
    \fancyfoot[C]{\thepage}
}

\endinput
