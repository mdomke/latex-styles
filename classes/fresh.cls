\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fresh}
\LoadClass[
  DIV11,
  abstracton,
	headinclude,
]{scrartcl}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
% \usepackage[english,ngerman]{babel}

%\usepackage[ngerman]{varioref}
\usepackage[right]{eurosym}		% \euro{} \EUR{...}
%\usepackage{myriad}				% sf
%\renewcommand{\sfdefault}{pmy}
\usepackage[scaled]{beramono} 	% tt
\linespread{1.05}\selectfont
\typearea[current]{current}

\usepackage{%
  charter,      % Serif-font: Bitstream Charter
  soul,         % Underline, strikethrough
  array,        % Enhanced tables
  booktabs,     % Enhanced tables
  supertabular, % Multipage tables
  longtable,    % Multipage tables
  xcolor,       % Colors
  colortbl,     % Colors in table cells
  textcomp,     % Additional characters
  blindtext,    % Blind texts
  natbib,       % Cite formatting
  calc,         % Calculate with LaTeX-lenght and counters
  url,          % Set URLs
  tocloft,      % Format table of contents and list of figures
  graphicx,     % Use graphics
  paralist,     % Additional list environments (compactitem)
  ellipsis,     % Intelligent \dots
  ragged2e,     % Bessere Trennung bei Flattersatz
  listings,     % Syntax-highlighting for sourcecode
  mathtools,    % More math
  units,        % Fractions
}

\usepackage{scrjura}

\usepackage[%
  breaklinks,
  backref,
  colorlinks,
  citecolor=myblue,
  linkcolor=myblue,
  urlcolor=myblue,
  bookmarks,
  bookmarksnumbered,
  hyperfootnotes=false,
  pdfpagelabels,
  pdftitle={},
  pdfcreator={LaTeX, hyperref, KOMA-Script},
  pdfstartview=FitH,
  pdfpagemode=UseOutlines,
  bookmarksopenlevel=2,
]{hyperref}
\usepackage[figure]{hypcap}

\usepackage[automark,headinclude,footinclude]{scrpage2}
\pagestyle{scrheadings}
\usepackage{caption}
\raggedbottom{}     		  % Allow variable page height

\usepackage[expansion=true]{microtype}

%\usepackage{shortvrb}
%\MakeShortVerb{\§}

\usepackage[babel]{csquotes}
\MakeAutoQuote{«}{»}


\usepackage[toc]{multitoc} % Multi column toc

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

% 'C' option for longtable to center tables with \textwidth
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

\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{L}[1]{>{\PreserveBackslash\RaggedRight}m{#1}}
\newcolumntype{M}[1]{>{\PreserveBackslash\RaggedRight}p{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\RaggedLeft}m{#1}}
\newcolumntype{S}[1]{>{\PreserveBackslash\RaggedLeft}p{#1}}
\newcolumntype{Z}[1]{>{\PreserveBackslash\Centering}m{#1}}
\newcolumntype{A}[1]{>{\PreserveBackslash\Centering}p{#1}}

\newcolumntype{H}{>{\fontseries{sb}\selectfont%
    \columncolor[gray]{.8}[6pt][0pt]}l}
\newcolumntype{I}{>{\fontseries{sb}\selectfont%
    \columncolor[gray]{.8}[6pt][0pt]}c}
\newcolumntype{J}{>{\fontseries{sb}\selectfont%
    \columncolor[gray]{.8}[6pt][0pt]}r}

\newcommand{\hdrow}[3]{%
  \multicolumn{#1}{#2@{}}{%
    \raisebox{.1mm}{%
      #3%
    }\rule{0pt}{4mm}}%
}


\newenvironment{tabelle}[2][c]
{%
  \renewcommand{\arraystretch}{1.2}
  \sffamily\small
  \begin{longtable}[#1]{#2}
}
{%
  \end{longtable}\renewcommand{\arraystretch}{1}
  \normalsize\rmfamily
}

\providecommand*{\abbvrefname}{Abbildung}
\newcommand*{\abbvref}[1]{%
  \hyperref[#1]{\abbvrefname}\vref{#1}%
}

\chead{\scshape\color{myblue}\headmark}
\setkomafont{pagenumber}{\sffamily}
\addtokomafont{sectioning}{\fontseries{sb}\selectfont\color{myblue}}%
\captionsetup{labelfont=bf,font={small,sf}}


\deffootnote{1.5em}{1em}{\makebox[1.5em][l]{\thefootnotemark}}
\renewcommand{\footnoterule}{}
\addtolength{\skip\footins}{\baselineskip}

%% Colors
\definecolor{myblue}{rgb}{0,0.1,0.6}
\definecolor{myblue2}{rgb}{0,0.4,0.6}

%% Source-code macros
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
