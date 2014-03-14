% fresh.cls Vorlage
% von Martin Domke in Anlehung an die typokurz-Präambel 
% von Christoph Bier

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fresh}
\LoadClass[DIV11,
		   abstracton,
		   headinclude]{scrartcl}  
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[english,ngerman]{babel}

\usepackage[ngerman]{varioref}
\usepackage[right]{eurosym}		% \euro{} \EUR{...}
%\usepackage{myriad}				% sf
\renewcommand{\sfdefault}{pmy}
\usepackage[scaled]{beramono} 	% tt
\linespread{1.05}\selectfont
\typearea[current]{current}

\usepackage{
  charter       % Serifenschrift: Bitstream Charter
  ,soul         % Sperren, Unterstreichen, Durchstreichen ...
  ,array        % Erweiterungen für Tabellen
  ,booktabs     %       "        "      "
  ,supertabular % Mehrseitige Tabellen
  ,longtable    %      "          "    
  ,xcolor       % Farben verwenden
  ,colortbl     % Farben in Tabellenzellen
  ,textcomp     % Zusätzliche (Sonder)Zeichen
  ,blindtext    % Automatisch Blindtext erzeugen
  ,natbib       % Formatierung der Zitate
  ,calc         % Rechnen mit LaTeX-Längen und -Zählern
  ,url          % URLs setzen
  ,tocloft      % Verzeichnisse (TOC, LOF, LOT) formatieren
  ,graphicx     % Grafiken einbinden
  ,paralist     % Zusätzliche Listen-Umgebungen (compactitem)
  ,ellipsis     % »Intelligente« \dots
  ,ragged2e     % Bessere Trennung bei Flattersatz
  ,listings     % Syntax-Highlighting für Quelltexte
  ,amsmath      % Verbesserte Mathematikumgebungen
  ,units        % Einheitenbrüche
}

\usepackage[%
  breaklinks               % Links »überstehen« Zeilenumbruch
  ,backref                 % Backlinks im Literaturverzeichnis
  ,colorlinks              % Links erhalten Farben statt Kästen
  ,citecolor=myblue        % Farbe für Zitate
  ,linkcolor=myblue        % beeinflusst Inhaltsverzeichnis und Seitenzahlen
  ,urlcolor=myblue         % Farbe für URLs
  ,bookmarks               % Erzeugung von Bookmarks für PDF-Viewer
  ,bookmarksnumbered       % Nummerierung der Bookmarks
  ,hyperfootnotes=false    % Keine Links auf Fußnoten
  ,pdfpagelabels 
  ,pdftitle={}
  ,pdfcreator={LaTeX, hyperref, KOMA-Script}
  ,pdfproducer={pdfeTeX 1.30.4-2.2}
  ,pdfstartview=FitH,      % Dokument wird »Fit Width« geöffnet
  ,pdfpagemode=UseOutlines % Bookmarks im Viewer anzeigen
  ,bookmarksopenlevel=2    % Gliederungstiefe der Bookmarks
  ] 
  {hyperref}      
\usepackage[figure]{hypcap}          
  
\usepackage[automark,headinclude,footinclude]{scrpage2}
\pagestyle{scrheadings}
\usepackage{caption}
\raggedbottom     		% Variable Seitenhöhen zulassen

\usepackage[expansion=true]{microtype} 

%\usepackage{shortvrb}	% Kurzform für verbatim-Text
%\MakeShortVerb{\§}		% Verbatim mit § <text> § umranden

\usepackage[babel]{csquotes}		% Anführungstriche
\MakeAutoQuote{«}{»}


\usepackage[toc]{multitoc} % TOC in mehreren Spalten setzen

% Seitenzahlen direkt hinter TOC-Eintrag:
% Ebene \section
\renewcommand{\cftsecleader}{}
\renewcommand{\cftsecafterpnum}{\cftparfillskip}
% Ebene \subsection
\renewcommand{\cftsubsecleader}{}
\renewcommand{\cftsubsecafterpnum}{\cftparfillskip}
% Abstände vor Einträgen im TOC verkleinern
\setlength{\cftbeforesecskip}{.4\baselineskip}
\setlength{\cftbeforesubsecskip}{.1\baselineskip}

% Neue Option 'C' für longtable, um Tabellen > \textwidth auf der Seite
% zu zentrieren 
\makeatletter
\let\ORG@LT@array\LT@array
\def\LT@array[#1]{%
  \if C#1%
    \setlength{\@tempdima}{\oddsidemargin}
    \addtolength{\@tempdima}{1in}
    \LTleft=0pt plus 1fill minus \@tempdima
    \LTright=\LTleft
    \expandafter\ORG@LT@array\expandafter[\expandafter x\expandafter]%
  \else
    \@ReturnAfterFi{%
      \ORG@LT@array[{#1}]%
    }%
  \fi
}
\long\def\@ReturnAfterFi#1\fi{\fi#1}
\makeatother

% um Tabellenspalten mit Flattersatz zu setzen, muss \\ vor
% (z.B.) \raggedright geschützt werden:
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}

% Spalten mit Flattersatz:
% Linksbündig:
\newcolumntype{L}[1]{>{\PreserveBackslash\RaggedRight}m{#1}}
\newcolumntype{M}[1]{>{\PreserveBackslash\RaggedRight}p{#1}}
% Rechtsbündig:
\newcolumntype{R}[1]{>{\PreserveBackslash\RaggedLeft}m{#1}}
\newcolumntype{S}[1]{>{\PreserveBackslash\RaggedLeft}p{#1}}
% Zentriert:
\newcolumntype{Z}[1]{>{\PreserveBackslash\Centering}m{#1}}
\newcolumntype{A}[1]{>{\PreserveBackslash\Centering}p{#1}}

% Linksbündig:
\newcolumntype{H}{>{\fontseries{sb}\selectfont%
    \columncolor[gray]{.8}[6pt][0pt]}l}
% Zentriert:
\newcolumntype{I}{>{\fontseries{sb}\selectfont%
    \columncolor[gray]{.8}[6pt][0pt]}c}
% Rechtsbündig:
\newcolumntype{J}{>{\fontseries{sb}\selectfont%
    \columncolor[gray]{.8}[6pt][0pt]}r}
%
\newcommand{\hdrow}[3]{%
  \multicolumn{#1}{#2@{}}{%
    \raisebox{.1mm}{% Ausrichtung der Beschriftung
      #3%
    }\rule{0pt}{4mm}}% unsichtbare Linie, die die Kopfzeile höher macht
} 


\newenvironment{tabelle}[2][c]{%
  \renewcommand{\arraystretch}{1.2} % Größere Abstände zwischen Zeilen
  \sffamily\small                   % Serifenlose und kleine Schrift
  \begin{longtable}[#1]{#2}
  }
  {\end{longtable}\renewcommand{\arraystretch}{1} 
  \normalsize\rmfamily
  }

% Verwendung: In \abbvref{label} ist ein Beispiel dargestellt
\providecommand*{\abbvrefname}{Abbildung}
\newcommand*{\abbvref}[1]{%
  \hyperref[#1]{\abbvrefname}\vref{#1}%
}

%% Seitenstil festlegen:
\chead{\scshape\color{myblue}\headmark} % Zentrierter Kopf leer
\setkomafont{pagenumber}{\sffamily}      % Seitenzahl in Myriad
\addtokomafont{sectioning}{\fontseries{sb}\selectfont\color{myblue}}% 
\captionsetup{labelfont=bf,font={small,sf}}


% Keine hochgestellten Ziffern in der Fußnote (KOMA-Script-spezifisch):
\deffootnote{1.5em}{1em}{\makebox[1.5em][l]{\thefootnotemark}} 

\renewcommand{\footnoterule}{}             % Keine Trennlinie zur Fußnote 
\addtolength{\skip\footins}{\baselineskip} % Abstand Text <-> Fußnote

%% Farbdefinition
\definecolor{myblue}{rgb}{0,.1,.6}  % Farbdefinition
\definecolor{myblue2}{rgb}{0,.4,.6} % Farbdefinition 
                            
%% Makro für Quelltext-Beispiele
\lstnewenvironment{command}{%
  \lstset{columns=flexible,frame=single,backgroundcolor=\color{blue!20},%
    xleftmargin=\fboxsep,xrightmargin=\fboxsep,escapeinside=`',gobble=1}}{}
    
\lstnewenvironment{example}{%
  \lstset{basicstyle=\footnotesize\ttfamily,columns=flexible,frame=single,%
    backgroundcolor=\color{yellow!20},xleftmargin=\fboxsep,%
    xrightmargin=\fboxsep,gobble=1}}{}
    
\let\margin\marginpar
\newcommand\myMargin[1]{\margin{\footnotesize\sffamily #1}}
\renewcommand{\marginpar}[1]{\myMargin{#1}}
