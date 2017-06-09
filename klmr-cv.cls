\ProvidesClass{klmr-cv}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[fontsize=9pt, paper=a4]{scrartcl}

\RequirePackage{fixltx2e}
\RequirePackage{xltxtra}
\RequirePackage{etoolbox}
\RequirePackage{array}
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
    \begin{minipage}[][3cm][c]{\textwidth}
        \centering%
        {\Huge\textsf\@author}%
        \\[0.5\baselineskip]
        {%
            \small
            \href{http://\@website}{\@website} ·
            \href{mailto:\@email}{\@email}
        }
    \end{minipage}%
    \global\let\maketitle\relax%
}

\titleformat\section
    {}% Format
    {}% Label
    {0pt}% Sep
    {{%
        \sffamily%
        \Large%
        \addfontfeature{LetterSpace=10}%
        \MakeTextUppercase{#1}%
    }}% Before-code

\titlespacing*\section{0pt}{\baselineskip}{0.5\baselineskip}

\titleformat\subsection
    {}% Format
    {}% Label
    {0pt}% Sep
    {{%
        \bfseries%
        \addfontfeature{LetterSpace=3}%
        \MakeTextUppercase{#1}%
    }}% Before-code

\titlespacing*\subsection{0pt}{0pt}{0pt}

\newcommand*\sidebar{\noindent\begin{minipage}[t][][t]{0.3\textwidth}}

\newcommand*\body{%
    \end{minipage}%
    \hfill%
    \begin{minipage}[t][][t]{0.66\textwidth}}

\AtEndDocument{\vfill\end{minipage}}

\let\cv@enditemize\enditemize
\renewcommand*\enditemize{\cv@enditemize\vspace{0pt plus 1\baselineskip}}

\let\cv@endenumerate\endenumerate
\renewcommand*\endenumerate{\cv@endenumerate\vspace{0pt plus 1\baselineskip}}

\renewcommand*\date[1]{\noindent #1\mbox{ }|\mbox{ }\ignorespaces}
\let\listitem\item
\renewcommand*\item[1]{#1\\}
\newcommand*\type[1]{\textbf{#1}}

\newcommand\workitem[5]{%
    \par
    \textbf{#3}\hfill {\footnotesize #1--#2}\\
    #4
    \ifstrempty{#5}{}{\\{\mbox{\quad}\small #5}}
    \\[-0.6\baselineskip]}

\setmainlanguage[variant=uk]{english}

\geometry{a4paper, vmargin=0.75cm, hmargin=1cm}

\defaultfontfeatures{Mapping=tex-text}

\setmainfont[
    UprightFont={* Light},
    BoldFont={* Medium},
    ItalicFont={* Light Italic},
    BoldItalicFont={* Medium Italic},
]{Helvetica Neue}

\setsansfont[
    UprightFont={* UltraLight},
    BoldFont={* Light},
    ItalicFont={* UltraLight Italic},
    BoldItalicFont={* Light Italic},
]{Helvetica Neue}

\let\old@amp\&
\renewcommand*\&{{\fontspec{Yanone Kaffeesatz Thin}\old@amp}}

\setlist{nosep, leftmargin=*}

% vim:ft=tex
\endinput
