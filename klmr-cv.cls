\ProvidesClass{klmr-cv}
\NeedsTeXFormat{LaTeX2e}

\LoadClass{scrartcl}

\RequirePackage{fixltx2e}
\RequirePackage{xltxtra}
\RequirePackage{etoolbox}
\RequirePackage{fontspec}
\RequirePackage{hyperref}

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

\renewcommand\thesection{}
\renewcommand\thesubsection{}
\def\@seccntformat#1{\csname #1ignore\expandafter\endcsname\csname the#1\endcsname\quad}
\let\sectionignore\@gobbletwo
\let\subsectionignore\@gobbletwo

\renewcommand*\date[1]{\noindent #1 |}
\let\listitem\item
\renewcommand*\item[1]{#1\\}
\newcommand*\type[1]{\textbf{#1}}

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
