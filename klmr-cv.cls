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
\RequirePackage{environ}
\RequirePackage{microtype}

\newcommand*\email[1]{\gdef\@email{#1}}
\newcommand*\website[1]{\gdef\@website{#1}}

\renewcommand*\maketitle{%
    \clearpage%
    \pagestyle{empty}%
    \hspace{\dimexpr-\marginparwidth-\marginparsep}
    \begin{minipage}[][3cm][c]{\dimexpr\textwidth+\marginparwidth+\marginparsep}
        \centering%
        {\Huge\textsf\@author}%
        \\[0.5\baselineskip]%
        {%
            \small
            \href{http://\@website}{\@website} ·
            \href{mailto:\@email}{\@email}%
        }%
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

% This workaround is necessary to avoid dates in subsection titles being typeset
% in all uppercase; using `\NoCaseChange` inside the macros unfortunately
% doesn’t work, so we just make everything before the (optional) date uppercase.
\def\klmr@title@ucase#1\date{\MakeTextUppercase{#1}\date}

\titleformat\subsection
    {}% Format
    {}% Label
    {0pt}% Sep
    {{%
        \bfseries%
        \addfontfeature{LetterSpace=3}%
        % Since the date is optional, we need to add it here as a guard.
        \klmr@title@ucase#1\date{}%
    }}% Before-code

\titlespacing*\subsection{0pt}{0.25\baselineskip}{0pt}

\renewcommand*\subsubsection[1]{\textit{#1}}

\newcommand*\myself[1]{\textit{#1}}

\renewcommand*\date[1]{%
    % The test is necessary to prevent formatting errors in section titles,
    % where two `\date`s may occur; see above.
    \ifstrempty{#1}{}{\hfill{\rmfamily\normalfont\footnotesize#1}}}

\newcommand*\entry[1]{%
    \begingroup
    \setlength\parindent{0ex}
    \setlength\hangindent{1ex}
    \par#1%
    \endgroup}

\newenvironment{minilist}{\def\item{\def\item{· }}}{}

\newcommand\klmr@indentblock[2]{%
    \par%
    \noindent%
    \hfill%
    \begin{minipage}[t]{\dimexpr#1-1ex}
        #2%
    \end{minipage}}

\newcommand\klmr@details[2]{\klmr@indentblock{#1}{{\small#2}}}

\newcommand\details[1]{\klmr@details{\textwidth}{#1}}

\NewEnviron{sidebar}{%
    \renewcommand\details[1]{\klmr@details{\marginparwidth}{##1}}
    \reversemarginpar%
    \marginpar{%
        % Vertical spacing before sidebar equivalent to height title;
        % Although I don’t know why the additional space at the end is  needed
        % here: everything is slightly off, so I’m adding it to compensate.
        {\Huge\sffamily\vspace{\baselineskip}}%
        \vspace{1.5\baselineskip}%
        {\small\vspace{\baselineskip}}%
        {\vspace{0.5\baselineskip}}%
        \BODY}}

\RenewEnviron{bibliography}{%
    \begingroup
    \renewcommand*\bibitem[5]{%
        \klmr@indentblock{\textwidth}{%
            \setlength\parindent{-1ex}
            \setlength\parskip{0.5ex}
            \small##1\unskip. “##2.” \textit{##3}, ##4, ##5.}}
    \BODY
    \endgroup}

\let\cv@enditemize\enditemize
\renewcommand*\enditemize{\cv@enditemize\vspace{0pt plus 1\baselineskip}}

\let\cv@endenumerate\endenumerate
\renewcommand*\endenumerate{\cv@endenumerate\vspace{0pt plus 1\baselineskip}}

\setmainlanguage[variant=uk]{english}

\geometry{a4paper, vmargin=0.75cm, left=7.5cm, right=0.75cm, marginparwidth=6cm,
marginparsep=0.75cm}

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
