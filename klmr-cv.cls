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
    \centering%
    {\Huge\textsf\@author}%
    \\
    \href{http://\@website}{\@website}\\
    \href{mailto:\@email}{\@email}

    \global\let\maketitle\relax%
}

% vim:ft=tex
\endinput
