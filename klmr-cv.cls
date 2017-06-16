\ProvidesClass{klmr-cv}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[fontsize=9pt, a4paper]{scrartcl}

\RequirePackage{xltxtra}
\RequirePackage{etoolbox}
\RequirePackage{array}
\RequirePackage{fontspec}
\RequirePackage[hidelinks,bookmarks=false]{hyperref}
\RequirePackage{geometry}
\RequirePackage{polyglossia}
\RequirePackage[explicit]{titlesec}
\RequirePackage{textcase}
\RequirePackage{enumitem}
\RequirePackage{environ}
\RequirePackage{microtype}
\RequirePackage{xcolor}

\newcommand*\email[1]{\gdef\@email{#1}}
\newcommand*\website[1]{\gdef\@website{#1}}
\newcommand*\last[1]{\textbf{#1}}
\newcommand*\address[1]{\gdef\@address{#1}}

\definecolor{highlight}{HTML}{506984}

\renewcommand*\maketitle{%
    \clearpage%
    \pagestyle{empty}%
    \noindent%
    \hspace{\dimexpr-\marginparwidth-\marginparsep}
    \begingroup%
    \setlength\textwidth{\dimexpr\textwidth+\marginparwidth+\marginparsep}%
    \begin{minipage}[b][3cm][c]{0.5\textwidth}
        {\Huge\sffamily\color{highlight}\@author}%
        \\[0.5\baselineskip]%
        {%
            \small
            \href{http://\@website}{\@website} ·
            \href{mailto:\@email}{\@email}%
        }%
    \end{minipage}%
    \begin{minipage}[b][3cm][c]{0.5\textwidth}
        \begin{flushright}
            \@address
        \end{flushright}
    \end{minipage}%
    \endgroup
    \global\let\maketitle\relax
}

\titleformat\section
    {}% Format
    {}% Label
    {0pt}% Sep
    {{%
        \sffamily%
        \Large%
        \addfontfeature{LetterSpace=10}%
        \color{highlight}
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

\newcommand*\myself[1]{\textcolor{black}{\textit{#1}}}

\renewcommand*\date[1]{%
    % The test is necessary to prevent formatting errors in section titles,
    % where two `\date`s may occur; see above.
    \ifstrempty{#1}{}{\hfill{\rmfamily\normalfont\footnotesize#1}}}

\newcommand*\entry[1]{%
    \begingroup
    \par%
    \setlength\parindent{0ex}
    \setlength\hangindent{1ex}
    #1%
    \par
    \endgroup}

\newenvironment{minilist}{%
    \def\item{%
        \unskip%
        \def\item{\unskip~· }}}{\unskip}

\newcommand\klmr@indentblock[2]{%
    \par%
    \noindent%
    \hfill%
    \begin{minipage}[t]{\dimexpr#1-1ex}
        \par
        #2%
    \end{minipage}}

\newcommand\klmr@details[2]{\klmr@indentblock{#1}{\leavevmode\color[HTML]{666666}{\small#2}}}

\newcommand\details[1]{\klmr@details{\textwidth}{#1}}

\NewEnviron{sidebar}{%
    \renewcommand\details[1]{\klmr@details{\marginparwidth}{##1}}
    \reversemarginpar%
    \marginpar{%
        % Vertical spacing before sidebar equivalent to section title height;
        % but everything is slightly off, so we’ll compensate slightly as
        % needed.
        {\sffamily\Large\vspace{\baselineskip}}%
        \vspace{0.02cm}%
        \BODY}}

\RenewEnviron{bibliography}{%
    \begingroup
    \renewcommand*\bibitem[5]{%
        \klmr@indentblock{\textwidth}{%
            \setlength\parindent{-1ex}
            \small\textcolor[HTML]{666666}{##1\unskip}. “##2.”
            \textcolor[HTML]{666666}{%
                \ifstrempty{##3}{}{\textit{##3} }(##4)%
                \ifstrempty{##5}{}{, ##5}.}}
            \vspace{0.75ex}}
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
    BoldFont={*},
    ItalicFont={* UltraLight Italic},
    BoldItalicFont={* Italic},
]{Helvetica Neue}

\let\old@amp\&
\renewcommand*\&{{\fontspec{Yanone Kaffeesatz Thin}\old@amp}}

\setlist{nosep, leftmargin=*}

% vim:ft=tex
\endinput
