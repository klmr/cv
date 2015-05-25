\ProvidesClass{klmr-cv}
\NeedsTeXFormat{LaTeX2e}

\LoadClass{scrartcl}

\RequirePackage{fixltx2e}
\RequirePackage{xltxtra}
\RequirePackage{etoolbox}
\RequirePackage{fontspec}
\RequirePackage{hyperref}
\RequirePackage{geometry}
\RequirePackage{polyglossia}
\RequirePackage[explicit]{titlesec}
\RequirePackage{textcase}
\RequirePackage{enumitem}

\newcommand*\email[1]{\gdef\@email{#1}}
\newcommand*\website[1]{\gdef\@website{#1}}

\renewcommand*\maketitle{%
    \clearpage%
    \pagestyle{empty}%
    \begingroup%
    \centering%
    {\Huge\textsf\@author}%
    \\[0.5\baselineskip]
    {%
        \small
        \href{http://\@website}{\@website} ·
        \href{mailto:\@email}{\@email}
    }

    \vspace{\baselineskip}
    \endgroup%
    \global\let\maketitle\relax%
}

\titleformat\section
    {}% Format
    {{%
        \sffamily%
        \Large%
        \addfontfeature{LetterSpace=10}%
        \MakeTextUppercase{#1}%
    }}% Label
    {0pt}% Sep
    {}% Before-code

\titlespacing*\section{0pt}{0pt}{0pt}

\titleformat\subsection
    {}% Format
    {{%
        \bfseries%
        \addfontfeature{LetterSpace=3}%
        \MakeTextUppercase{#1}%
    }}% Label
    {0pt}% Sep
    {}% Before-code

\titlespacing*\subsection{0pt}{0pt}{0pt}

\newcommand*\sidebar{\noindent\begin{minipage}[t][][t]{0.25\textwidth}}

\newcommand*\body{%
    \end{minipage}%
    \hfill%
    \begin{minipage}[t][][t]{0.7\textwidth}}

\AtEndDocument{\vfill\end{minipage}}

\renewcommand*\date[1]{\noindent #1 |}
\let\listitem\item
\renewcommand*\item[1]{#1\\}
\newcommand*\type[1]{\textbf{#1}}

\setmainlanguage[variant=uk]{english}

\geometry{a4paper, vmargin=0.75cm, hmargin=1cm}

\defaultfontfeatures{Mapping=tex-text}

\setmainfont[
    UprightFont={* Light},
    BoldFont={*},
    ItalicFont={* Light Italic},
    BoldItalicFont={* Italic},
]{Helvetica Neue}

\setsansfont[
    UprightFont={* UltraLight},
    BoldFont={* Light},
    ItalicFont={* UltraLight Italic},
    BoldItalicFont={* Light Italic},
]{Helvetica Neue}

\setlist{nosep, leftmargin=*}

% vim:ft=tex
\endinput
