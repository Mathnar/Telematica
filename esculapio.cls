%% All'inizio fu \Ch@pter
%%
%% This is file `esculapio.cls',
%%
%% Copyright 2013
%% Matteo Allegro, Federico Bucciarelli, Esculapio editrice.
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainers of this work are Federico Bucciarelli and Matteo Allegro.
%%
%% This work consists of the files esculapio.cls
%% and the derived files esculapio.tex and esculapio.pdf
%%
%% You can contact the authors at federico.bucciarelli.mail@gmail.com or
%% matteo.allegro@katamail.com for any question related to the work.
%% For any other issue please contact Esculapio editrice.
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}

\NeedsTeXFormat{LaTeX2e}%[2013/06/22]
\ProvidesClass{esculapio}[2013/06/22 v1.01b Customized LaTeX document class -- Esculapio Progetto Leonardo]

%%%%%%%%%%%%%#########################$$$$$$$$$$$$$$$$££££££££££££££££££££££££££££££&&&&&&&&&&&&&&&&&&&&&&&====================D~~~~~~~~~~~~~

\def\@@outputpage{%
\begingroup
  \let \protect \noexpand
  \@resetactivechars
  \global\let\@@if@newlist\if@newlist
  \global\@newlistfalse
  \@parboxrestore
  \shipout \vbox{%
    \set@typeset@protect
    \aftergroup \endgroup
    \aftergroup \set@typeset@protect
  \if@specialpage
    \@nameuse{ps@\@specialstyle}%
  \fi
  \if@twoside
    \ifodd\count\z@ \let\@thehead\@oddhead \let\@thefoot\@oddfoot
         \let\@themargin\oddsidemargin
    \else \let\@thehead\@evenhead
       \let\@thefoot\@evenfoot \let\@themargin\evensidemargin
    \fi
  \fi
  \reset@font
  \normalsize
  \normalsfcodes
  \let\label\@gobble
  \let\index\@gobble
  \let\glossary\@gobble
  \baselineskip\z@skip \lineskip\z@skip \lineskiplimit\z@
    \@begindvi
    \vskip \topmargin
    \moveright\@themargin \vbox {%
      \setbox\@tempboxa \vbox to \headheight{%
        \color@hbox
          \normalcolor
          \hb@xt@\textwidth{\@thehead}%
        \color@endbox
        }%
      \dp\@tempboxa \z@
      \box\@tempboxa
      \if@specialpage\else\kern-5pt\hrulefill\fi\vskip \headsep%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      \global\@specialpagefalse
      \box\@outputbox
      \baselineskip \footskip
      \color@hbox
        \normalcolor
        \hb@xt@\textwidth{\@thefoot}%
      \color@endbox
      }%
    }%
  \global\let\if@newlist\@@if@newlist
  \global \@colht \textheight
  \stepcounter{page}%
  \let\firstmark\botmark
}

\let\@outputpage\@@outputpage

%%%%%%%%%%%%%#########################$$$$$$$$$$$$$$$$££££££££££££££££££££££££££££££&&&&&&&&&&&&&&&&&&&&&&&====================D~~~~~~~~~~~~~

\newif\if@aquattro \@aquattrofalse
\newif\if@auth
\newif\if@titl
\newif\if@noparthdr
\newif\if@partdef \@partdeffalse
\newif\if@bigtit \@bigtittrue
\newif\if@scopt \@scoptfalse

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue

\def\@@author#1{\gdef\@author{#1}\@authtrue}
\def\@@title#1{\gdef\@title{#1}\@titltrue}
\def\@@thanks#1{\gdef\@thanks{#1}}
\def\@@cleardoublepage{\clearpage\ifodd\c@page\else\thispagestyle{empty}
    \hbox{}\newpage\fi}
\def\@@roman#1{%
    \romannumeral #1}%
\def\p@genumbering#1{%
  \gdef\thepage{\csname @#1\endcsname%
   \c@page}}%

\def\restoredefaultfonts{%
\def\@bodyfam{\fontfamily{pnc}}
\def\@sectionfam{\fontfamily{pnc}}
\def\@captionfam{\fontfamily{pag}}
\def\@headerfam{\fontfamily{pag}}
\def\@chapterfam{\fontfamily{pag}}
\def\@partfam{\fontfamily{pag}}
\def\@titlefam{\fontfamily{pag}}
\global\def\sectionfont{\@sectionfam\fontseries{b}\fontshape{n}\if@aquattro\fontsize{12}{14}\else\fontsize{13}{15}\fi\selectfont}
\global\def\subsectionfont{\@sectionfam\fontseries{b}\fontshape{n}\if@aquattro\fontsize{11}{14}\else\fontsize{12}{15}\fi\selectfont}
\global\def\captionfont{\@captionfam\fontseries{m}\fontshape{n}\fontsize{9}{11}\selectfont}
\global\def\headerfont{\@headerfam\fontseries{m}\fontshape{n}\fontsize{9}{6}\selectfont}
\global\def\chapterfont{\@chapterfam\fontseries{m}\fontshape{n}\if@scopt\fontsize{24}{36}\else\fontsize{28}{64}\fi\selectfont}
\global\def\partfont{\@partfam\fontseries{m}\fontshape{n}\fontsize{36}{48}\selectfont}
\global\def\titlefont{\@titlefam\fontseries{b}\fontshape{n}\fontsize{36}{48}\selectfont}
\global\def\thechapterfont{\@chapterfam\fontseries{b}\fontshape{n}\fontsize{48}{64}\selectfont}
\global\def\thepartfont{\@partfam\fontseries{b}\fontshape{n}\fontsize{48}{64}\selectfont}
\renewcommand{\familydefault}{pnc}
	\fontfamily{\familydefault}\selectfont
}%

\def\smallchapter{\@bigtitfalse}

\global\let\pagenumbering\p@genumbering
\global\let\author\@@author
\global\let\title\@@title
\global\let\thanks\@@thanks
\global\let\cleardoublepage\@@cleardoublepage
\global\let\@roman\@@roman

\def\changefont{\secdef\ch@ngefont
\sch@ngefont}%

\def\sch@ngefont[#1]#2#3#4#5#6{%
\def\@temfont{\fontfamily{#2}\fontseries{#3}\fontshape{#4}\fontsize{#5}{#6}\selectfont}%
\global\expandafter\let\csname #1font\endcsname\@temfont
}
\def\ch@ngefont[#1]#2{%
\def\@temfam{\fontfamily{#2}}%
\global\expandafter\let\csname @#1fam\endcsname\@temfam
\@bodyfam\selectfont
}%

\let\@date\@empty

\def\defaultmark{%
\def\leftmark{}%
\def\rightmark{\if@titl\@title\fi}}%

\def\m@rkleft{\def\leftmark{%
        \if@titl
          \@title\fi
        }%
        }%

\newcommand{\ClassE}{Classe \emph{Esculapio} }
\def\comandarg[#1]#2{$\backslash\texttt{#2}\langle\textit{#1}\rangle$}
\def\comand#1{$\backslash\texttt{#1}$}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{smallchapters}{%
      \@scopttrue
	}
\DeclareOption{a4}{%
	\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\selectfont}
	\@aquattrotrue
	}
\DeclareOption{a4paper}{%% copia spudorata
	\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\selectfont}
	\@aquattrotrue
	}
\DeclareOption{noparthdr}
   {\@noparthdrtrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
  \renewcommand\@ptsize{0}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
%\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
%\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{%
\PackageWarning{esculapio}{Unknown option `\CurrentOption'}%
}%

\renewcommand\@ptsize{0}
\@twosidetrue
\@mparswitchtrue
\setlength\overfullrule{0pt}
\@openrighttrue
\@noparthdrfalse
\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\headerfont\thepage\hfil\if@mainmatter\leftmark\fi}
      \def\@oddhead{\headerfont\if@mainmatter\rightmark\fi\hfil\thepage}
      \let\@mkboth\markboth
  \if@noparthdr
    \def\chaptermark##1{%
      \m@rkleft
      \def\rightmark{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
                       \ifnum \thechapter >\z@
            \thechapter.\space\fi ##1%
            \fi
          \fi
        }%
}%
  \else
    \def\chaptermark##1{%
      \m@rkleft
      \def\rightmark{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \if@partdef\P@rthdr\ --\space\fi\ifnum\thechapter >\z@\thechapter.\space\fi{##1}%
          \fi
        \fi
           }%
           }%
\fi
}%

\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\leftmark\hdrrule}%
    \def\@oddhead{{\rightmark}\hfil\thepage\hdrrule}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \begin{center}%
    \if@titl{\titlefont\@title \par}%
    \vskip 3em\fi%
    \if@auth{\titlefont\fontseries{m}\fontsize{24.88}{36}\selectfont
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em\fi%
    {\normalfont\@date \par}%
  \end{center}\par
  \null\vfil\null
  \@thanks\vfil\null
  \end{titlepage}%
      \addcontentsline{toc}{title}{\fontseries{m}\selectfont\@author\newline\Large\fontseries{b}\selectfont\@title}%
  \setcounter{chapter}{0}%
  \setcounter{part}{0}%
  \setcounter{section}{0}%
  \setcounter{footnote}{0}%
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \newpage
      \global\@topnum\z@
      \@maketitle
    \thispagestyle{empty}\@thanks
  \par
  \vskip 1.5em
  \endgroup
      \addcontentsline{toc}{title}{\fontseries{m}\selectfont\@author\newline\Large\fontseries{b}\selectfont\@title}%
  \setcounter{chapter}{0}%
  \setcounter{part}{0}%
  \setcounter{section}{0}%
  \setcounter{footnote}{0}%
}
\def\@maketitle{%
      \if@openright\cleardoublepage\fi
  \newpage
  \null
  \begin{center}%
  \let \footnote \thanks
    \if@titl{\titlefont\fontsize{36}{48}\selectfont\@title\par}%
    \vskip 1.5em\fi%
    \if@auth{\titlefont\fontseries{m}\fontsize{24.88}{36}\selectfont
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em\fi%
    {\normalfont\@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\frontmatter{%
    \clearpage
  \@mainmatterfalse
  \pagenumbering{roman}\@partdeffalse}
\newcommand\mainmatter{%
    \clearpage
\ifodd\c@page\else\thispagestyle{empty}
    \hbox{}\newpage\fi
  \global\c@page\@ne
  \@mainmattertrue
  \pagenumbering{arabic}\defaultmark\@partdeffalse}
\newcommand\backmatter{%
    \clearpage
  \@mainmatterfalse\defaultmark\@partdeffalse}

\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}%
    \@tempswafalse
  \null\vfil
  \secdef\@part\@spart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@part[#1]#2{%
    \thispagestyle{empty}
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \if@noparthdr\else\def\P@rthdr{#1}\@partdeftrue\if@mainmatter\m@rkleft\def\rightmark{#1}\fi\fi%
    {\raggedleft
     \interlinepenalty \@M
     \ifnum \c@secnumdepth >-2\relax
      \partfont\fontseries{b}\fontsize{48}{64}\selectfont\partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi\partfont
     #2\par}%
    \@endpart}

\def\@spart#1{%
    \if@noparthdr\else\def\P@rthdr{#1}\@partdeftrue\if@mainmatter\m@rkleft\def\rightmark{#1}\fi\fi%
    \ifnum \c@secnumdepth >-2\relax
                      \addcontentsline{toc}{part}{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
\fi
    {\raggedleft
     \interlinepenalty \@M
     \partfont
      #1\par}%
    \@endpart}

\def\@endpart{%
\vfil\newpage}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\chapter{\if@openright\cleardoublepage
                    \else\clearpage\fi
                    \thispagestyle{empty}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}%

\def\@chapter[#1]#2{%
                       \ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%                    
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
\chaptermark{#1}%
                      \@makechapterhead{#2}%
                      \@afterheading%
                      \@bigtittrue}%

\def\@schapter#1{
                       \ifnum \c@secnumdepth >\m@ne
			\ifnum \thechapter >\z@
                      \addcontentsline{toc}{chapter}{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
\fi
\fi
                    \chaptermark{#1}%
                    \@makeschapterhead{#1}%
                    \@afterheading
                    \@bigtittrue}%

\def\@makechapterhead#1{%
%   \vspace*{0.05\textheight}
  {\parindent \z@ \raggedleft\thechapterfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \thechapter
        \par\nobreak
      \fi
    \fi
    \interlinepenalty\@M\chapterfont
    \if@bigtit\else\fontsize{24}{36}\selectfont\fi
 #1\par\nobreak
    \vskip 40\p@
  }}

\def\@makeschapterhead#1{%
%   \vspace*{0.05\textheight}
  {\parindent \z@ \raggedleft
    \interlinepenalty\@M\chapterfont
    \if@bigtit\else\fontsize{24}{36}\selectfont\fi
  #1\par\nobreak
    \vskip 40\p@
  }}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\sectionfont}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\subsectionfont}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
  \setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newenvironment{titlepage}
    {%
      \if@openright\cleardoublepage\fi
        \newpage
      \thispagestyle{empty}%
%      \setcounter{page}\@ne
    }%
    {\newpage
    }

\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\captionfont #1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\tableofcontents{%
    \chapter*{\contentsname
        }%
    \if@mainmatter\defaultmark\fi
    \@starttoc{toc}%
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*\l@title[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \titlefont\large #1\hfil \hb@xt@\@pnumwidth{\null}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \vskip 5pt\endgroup
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{1.5em \@plus\p@}%
    \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \vskip 5pt\endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \addvspace{0.7em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \vskip 5pt\endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\listoffigures{%
    \chapter*{\listfigurename}%
      \if@mainmatter\defaultmark\fi%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \chapter*{\listtablename}%
      \if@mainmatter\defaultmark\fi%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \if@mainmatter\defaultmark\fi%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\@makechapterhead{\indexname}%
                \thispagestyle{empty}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \vfil\kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\pagestyle{headings}
\pagenumbering{arabic}
\onecolumn
\defaultmark
\restoredefaultfonts
\setlength{\paperwidth}{170mm}%
\setlength{\paperheight}{240mm}%
\RequirePackage{geometry}%
\if@aquattro
\geometry{top=18mm,left=20mm,a4paper,includeall}
\setlength{\textheight}{252mm}%
\setlength{\textwidth}{170mm}%
\else
\geometry{top=18mm, left=20mm,includeall}
\setlength{\textheight}{195mm}%
\setlength{\textwidth}{130mm}%
\fi
\setlength{\oddsidemargin}{-5mm}%
\setlength{\evensidemargin}{-5mm}%
\setlength{\headheight}{15.0pt}%
\setlength{\headsep}{10.0pt}%
\endinput
%% End of file `esculapio.cls'.