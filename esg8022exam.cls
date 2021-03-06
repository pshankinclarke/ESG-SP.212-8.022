%%
%% This is file `esg8022exam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% esg8022exam.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2010 by Jason Gross
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{esg8022exam}
 [2010/10/08 v0.1 ESG Exam Template]
\LoadClass[notitlepage,11pt,twoside,letterpaper]{article}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xifthen}
\RequirePackage{verbatim}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{etoolbox,etextools}
\RequirePackage[T1]{fontenc}
\RequirePackage{sectsty}
\RequirePackage{rerunfilecheck}
\sectionfont{\large}
\newboolean{esg8022exam@solutions}\newboolean{esg8022exam@problems}
\newboolean{esg8022exam@coversheet}\newboolean{esg8022exam@coversheet@set}
\setboolean{esg8022exam@coversheet}{true}
\DeclareOption{problems}{
  \setboolean{esg8022exam@problems}{true}\setboolean{esg8022exam@solutions}{false}
  \ifthenelse{\boolean{esg8022exam@coversheet@set}}{}{\setboolean{esg8022exam@coversheet}{true}}
}
\DeclareOption{solutions}{
  \setboolean{esg8022exam@problems}{false}\setboolean{esg8022exam@solutions}{true}
  \ifthenelse{\boolean{esg8022exam@coversheet@set}}{}{\setboolean{esg8022exam@coversheet}{false}}
}
\DeclareOption{coversheet}{\setboolean{esg8022exam@coversheet}{true}\setboolean{esg8022exam@coversheet@set}{true}}
\DeclareOption{nocoversheet}{\setboolean{esg8022exam@coversheet}{false}\setboolean{esg8022exam@coversheet@set}{true}}
\ProcessOptions\relax
\ifthenelse{\boolean{esg8022exam@problems} \OR \boolean{esg8022exam@solutions}}{
}{
  \expandnext{\renewcommand{\end}[1]}{\end{#1}\ifcsname end#1@hook\endcsname\csname end#1@hook\endcsname\else\fi}
  \newcommand{\AfterEnvironment}[2]{%
    \ifcsname end#1@hook\endcsname
    \else
      \csdef{end#1@hook}{}%
    \fi
    \csappto{end#1@hook}{#2}%
  }

  \newwrite\esgexam@problemsout
  \newwrite\esgexam@solutionsout
  \newwrite\esgexam@tempout
  \newcommand{\esgexam@compilefile}[1]{\write18{pdflatex "#1.tex"}}
  \edef\esgexam@problemsfilename{\jobname\string_Problems.tex}
  \edef\esgexam@solutionsfilename{\jobname\string_Solutions.tex}
  \edef\esgexam@tempfilename{\jobname.tmp}
  \newcommand{\writetoboth}[1]{\writetoproblems{#1}%
    \writetosolutions{#1}}
  \newcommand{\writetoall}[1]{\writetoboth{#1}\writetothis{#1}}
  \newcommand{\writetoproblems}[1]{\immediate\write\esgexam@problemsout{#1}}
  \newcommand{\writetosolutions}[1]{\immediate\write\esgexam@solutionsout{#1}}
  \newcommand{\writetothis}[1]{{\edef\temp{#1}\expandafter}\expandafter\scantokens\expandafter{\temp}}
  \newcommand{\writetocoversheet}[1]{\immediate\write\@auxout{\unexpanded{\AfterEndPreamble{#1}}}
    \immediate\write\@auxout{\unexpanded{\AfterEndPreamble{\writetoproblems{\unexpanded{#1}}}}}}

  \immediate\openout\esgexam@problemsout\esgexam@problemsfilename\relax
  \immediate\openout\esgexam@solutionsout\esgexam@solutionsfilename\relax

  \newtoks\esgexam@coversheet@toks
  \AtEndDocument{
    \writetoboth{\string\end{document}}
    \immediate\closeout\esgexam@problemsout
    \immediate\closeout\esgexam@solutionsout
  }

  \begingroup
    \writetosolutions{%
      \string\documentclass[solutions]{esg8022exam}
    }
    \writetoproblems{%
      \string\documentclass[problems]{esg8022exam}
    }
  \endgroup

  \newenvironment{preamble}{%
    \begingroup% Lets Keep the Changes Local
      \immediate\openout\esgexam@tempout\esgexam@tempfilename\relax
      \@bsphack
      \let\do\@makeother\dospecials\catcode`\^^M\active
      \def\verbatim@processline{\writetoboth{\the\verbatim@line}\immediate\write\esgexam@tempout{\the\verbatim@line}}
      \verbatim@start
    }{\@esphack\immediate\closeout\esgexam@tempout\endgroup}
  \AfterEnvironment{preamble}{\input{\esgexam@tempfilename}}

  \AtBeginDocument{
    \begingroup
      \writetoboth{%
        \string\classname{\expandafter\unexpanded\expandafter{\@classname}}
      }
      \writetoboth{%
        \string\semester{\expandafter\unexpanded\expandafter{\@semester}}
      }
      \writetoboth{%
        \string\examnumber{\expandafter\unexpanded\expandafter{\@examnumber}}
      }
      \writetoboth{%
        \string\date{\expandafter\unexpanded\expandafter{\@date}}
      }
      \writetoboth{\string\begin{document}}
    \endgroup
  }
}

\pagestyle{fancy}
\headheight 14.5pt
\fancyhead{}
\fancyfoot{}
\cfoot{\thepage\space of \pageref{LastPage}}

\let\@seccntformat\@gobble

\AtBeginDocument{
  \begingroup
    \ifthenelse{\boolean{esg8022exam@problems}}{%
      \edef\@cheader{Exam \@examnumber\space}
    }{
      \ifthenelse{\boolean{esg8022exam@solutions}}{
        \edef\@cheader{Exam \@examnumber\space - Solutions}
      }{
        \edef\@cheader{Exam \@examnumber\space}
      }
    }
  \expandafter\endgroup
  \expandafter\chead\expandafter{\@cheader}
  \begingroup
    \bf
    \begin{center}%
      {\noindent  \textsc{Massachusetts Institute of Technology} \par}%
      {\noindent  Experimental Study Group \par}%
    \end{center}%
    {\noindent  \@classname \hfill \@semester \par}%
    \begin{center}%
      {\noindent \Large
        Exam \@examnumber
        \ifthenelse{\boolean{esg8022exam@solutions}}{% \OR \NOT \boolean{esg8022exam@problems}{%
          \space Solutions%
        }{}%
      \par}%
    \end{center}%
  \endgroup
  \global\let\examnumber\relax
  \global\let\semester\relax
  \global\let\classname\relax
  \global\let\@examnumber\relax
  \global\let\@semester\relax
  \global\let\@classname\relax
}
\newcounter{esg8022exam@totalproblemcount}
\AfterEndPreamble{%
  \ifthenelse{\boolean{esg8022exam@coversheet}}{%
    \ifthenelse{\boolean{esg8022exam@problems} \OR \boolean{esg8022exam@solutions}}{%
    }{%
      \AtEndDocument{
        \writetocoversheet{\\ \\}
        \ExpandNext{\esgexam@makecoversheetproblem[Total]}{\arabic{esg8022exam@totalpointcount}}
        \writetocoversheet{\end{tabular}}
        \writetocoversheet{\cleardoublepage\relax}
      }
      \writetocoversheet{\bigskip}
      \writetocoversheet{\noindent \textbf{Name}\qquad\underline{\hspace{0.5\textwidth}}}
      \writetocoversheet{\par}
      \writetocoversheet{\bigskip}
      \writetocoversheet{\noindent}
      \AtEndDocument{
        \ExpandNext{\immediate\write\@auxout}
          {\ExpandNext{\relax\unexpanded}
            {\ExpandNext{\relax\setcounter{esg8022exam@totalproblemcount}}{\thesection}}}
      }
      {\edef\@temp{\noexpand\writetocoversheet{%
        \noexpand\textbf{The following exam consists of \ifcase\value{esg8022exam@totalproblemcount} zero problems\or one problem\or two problems\or three problems\or four problems\or five problems\or six problems\or seven problems\or eight problems\or nine problems\or ten problems\or eleven problems\or twelve problems\or thirteen problems\or fourteen problems\or fifteen problems\fi.  Answers without work shown will not be given any credit. Good luck!}}
        \noexpand\writetocoversheet{\noexpand\par}
        \noexpand\writetocoversheet{\noexpand\bigskip}
        \noexpand\writetocoversheet{\noexpand\bigskip}
        \noexpand\writetocoversheet{\noexpand\bigskip}
      }\expandafter}%
      \@temp
      \writetocoversheet{\noindent \begin{tabular}{l@{\hspace{2em}}l@{\hspace{3em}}l}}
    }{}%
  }{}%
}
\newcounter{esg8022exam@totalpointcount}
\setcounter{esg8022exam@totalpointcount}{0}
\newcommand{\esgexam@makecoversheetproblem}[2][Problem \thesection]{%
  \addtocounter{esg8022exam@totalpointcount}{\number #2\relax}%
  {\edef\@temp{%
    \noexpand\writetocoversheet{\noexpand\textbf{#1} & \noexpand\textbf{(#2\noexpand\space Points)} & \noexpand\underline{\noexpand\hspace{10em}} \noexpand\\ \noexpand\\ \noexpand\\}%
  }\expandafter}\@temp
}
\newcommand*{\examnumber}[1]{\gdef\@examnumber{#1}}
\newcommand*{\semester}[1]{\gdef\@semester{#1}}
\newcommand*{\classname}[1]{\gdef\@classname{#1}}
\newenvironment{problem}[2][\relax]{%
  \ifthenelse{\equal{#1}{\relax}}{%
    \ifstrnum{#2}{
      \writetoall{\string\section{Problem \string\thesection \string\space (#2\noexpand\space points)}}%
      \ifthenelse{\boolean{esg8022exam@coversheet}}{
        \esgexam@makecoversheetproblem{#2}
      }{}
    }{
      \writetoall{\string\section{Problem \string\thesection \string\space #2}}%
    }
  }{%
    \writetoall{\string\section*{Problem #1: #2}}%
  }%
  \writetosolutions{\string\subsection{Problem}}%
  \begingroup% Lets Keep the Changes Local
    \@bsphack
    \immediate\openout\esgexam@tempout\esgexam@tempfilename
    \let\do\@makeother\dospecials\catcode`\^^M\active
    \def\verbatim@processline{\writetoboth{\the\verbatim@line}\immediate\write\esgexam@tempout{\the\verbatim@line}}%
    \verbatim@start
}{\@esphack\immediate\closeout\esgexam@tempout\endgroup
  \input{\esgexam@tempfilename}%
}
\newenvironment{solution}{%
  \writetosolutions{\string\subsection{Solution}}%
  \begingroup% Lets Keep the Changes Local
    \@bsphack
    \let\do\@makeother\dospecials\catcode`\^^M\active
    \def\verbatim@processline{\writetosolutions{\the\verbatim@line}}%
    \verbatim@start
}{\@esphack\endgroup\writetosolutions{\string\clearpage}}%
\endinput
%%
%% End of file `esg8022exam.cls'.
