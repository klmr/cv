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

\newcommand*\email[1]{\gdef\@email{#1}}
\newcommand*\website[1]{\gdef\@website{#1}}

\renewcommand*\maketitle{%
    \clearpage%
    \pagestyle{empty}%
    \hspace{\dimexpr-\marginparwidth-\marginparsep}
    \begin{minipage}[][3cm][c]{\dimexpr\textwidth+\marginparwidth+\marginparsep}
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

\renewcommand*\date[1]{%
    % The test is necessary to prevent formatting errors in section titles,
    % where two `\date`s may occur; see above.
    \ifstrempty{#1}{}{\hfill{\rmfamily\normalfont\footnotesize#1}}}

\newcommand*\entry[1]{\par\noindent{#1}}

\newenvironment{minilist}{\def\item{\def\item{· }}}{}

\newcommand\details[1]{%
    \par%
    \noindent%
    \hfill%
    \begin{minipage}[t]{\dimexpr\textwidth-1ex}
        \small#1
    \end{minipage}}

\NewEnviron{sidebar}{%
    \renewcommand\details[1]{%
        \par%
        \noindent%
        \hfill%
        \begin{minipage}[t]{\dimexpr\marginparwidth-1ex}
            \small##1
        \end{minipage}}
    \reversemarginpar%
    \marginpar{%
        % Vertical spacing before sidebar equivalent to height title;
        % Although I don’t know why the multiplier 0.75 is needed here: a full
        % baselineskip should work, but is too low.
        {\Huge\vspace{1.5\baselineskip}}%
        {\small\vspace{0.75\baselineskip}}%
        \BODY}}

\let\cv@enditemize\enditemize
\renewcommand*\enditemize{\cv@enditemize\vspace{0pt plus 1\baselineskip}}

\let\cv@endenumerate\endenumerate
\renewcommand*\endenumerate{\cv@endenumerate\vspace{0pt plus 1\baselineskip}}

\newcommand\workitem[5]{%
    \par
    \textbf{#3}\hfill {\footnotesize #1--#2}\\
    #4
    \ifstrempty{#5}{}{\\{\mbox{\quad}\small #5}}
    \\[-0.6\baselineskip]}

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
