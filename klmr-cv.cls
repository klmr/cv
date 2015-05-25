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

\newcommand*\email[1]{\gdef\@email{#1}}
\newcommand*\website[1]{\gdef\@website{#1}}

\renewcommand*\maketitle{%
    \clearpage%
    \pagestyle{empty}%
    \begingroup%
    \centering%
    {\Huge\textsf\@author}%
    \\
    \href{http://\@website}{\@website}\\
    \href{mailto:\@email}{\@email}

    \global\let\maketitle\relax%
    \endgroup%
}

\titleformat\section
    {}% Format
    {{%
        \bfseries%
        \large%
        \addfontfeature{LetterSpace=10}%
        \MakeTextUppercase{#1}%
    }}% Label
    {0pt}% Sep
    {}% Before-code

\titleformat\subsection
    {}% Format
    {{%
        \addfontfeature{LetterSpace=10}%
        \MakeTextUppercase{#1}%
    }}% Label
    {0pt}% Sep
    {}% Before-code

\renewcommand*\date[1]{\noindent #1 |}
\let\listitem\item
\renewcommand*\item[1]{#1\\}
\newcommand*\type[1]{\textbf{#1}}

\setmainlanguage[variant=uk]{english}

\geometry{a4paper, vmargin=0.75cm, hmargin=1.25cm}

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

% vim:ft=tex
\endinput
