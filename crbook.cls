\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{crbook}[LaTeX template for Competitive Rust Book]

\LoadClass[
    fontset=custom,
    linespread=1.5
]{ctexart}

\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{expl3}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage[
    a4paper,
    top=1in, bottom=1in, left=.75in, right=.75in
]{geometry}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{lastpage}
\RequirePackage[newfloat=true]{minted}
\RequirePackage[svgnames]{xcolor}

\ExplSyntaxOn

\setmonofont{LigalexMono}[
    Extension = .ttf,
    Path = fonts/,
    UprightFont = *,
    ItalicFont = *-Italic
]
\graphicspath{ {images/} }
\ctexset{
    today=old,
    section/format=\Large\bfseries
}
% Fancyhdr style for the first page
% See: https://tex.stackexchange.com/a/30229
\fancypagestyle{firststyle}
{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt} % removes horizontal header line
}
% Set fancyhdr style after the first page.
\fancyhead[R]{\thepage\ /\ \begin{NoHyper}\pageref{LastPage}\end{NoHyper}}
\fancyfoot{}
% Set page style after the first page.
\pagestyle{fancy}
% Remove the horizontal bar of footer.
% \renewcommand{\headrulewidth}{0pt}
% Resolve fancyhdr head height too small
% See: https://tex.stackexchange.com/a/327298
\setlength{\headheight}{13pt}
% Hyperref
\definecolor{transpink} {HTML}{F5AAB9}
\definecolor{transblue} {HTML}{5BCEFA}
\hypersetup{
    colorlinks=true,
    linkcolor=transblue,
    filecolor=magenta,
    urlcolor=transpink
}
\urlstyle{same}
% minted
\SetupFloatingEnvironment{listing}{placement=htp}
% \newminted{rs}{linenos, breaklines, frame=lines, gobble=8}

\makeatletter
% See: https://tex.stackexchange.com/a/216121
\tl_gset:Nn \g_crb_maketitle {
    \makeatletter
    \newpage
    \null
    \vskip 2em
    \begin{center}
        \let\footnote\thanks
        {
            \LARGE\@title
            \par
        }
        \vskip 1.5em
            {
                \large\lineskip .5em
                \begin{tabular}[t]{c}
                    \@author
                \end{tabular}
                \par
            }
        \vskip 1em
            {
                \large\textrm{最后更改：}\ \c_crb_datemodified_str
            }
    \end{center}
    \par
    \vskip 1.5em
    \makeatother
    \thispagestyle{firststyle}
    \tableofcontents
    \newpage
}
\makeatother

\tl_set:Nn \c_crb_datemodified_str {\today}
\cs_set:Npn \l_crb_datemodified:n #1 {%
    \tl_set:Nn \c_crb_datemodified_str {#1}%
}

\ExplSyntaxOff
