\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bdad}
\LoadClass{bookauthor}

% Tables with colored cells
\RequirePackage[table,dvipsnames]{xcolor}
\def\checkmark{\tikz\fill[scale=0.4](0,.35) -- (.25,0) -- (1,.7) -- (.25,.15) -- cycle;}
\newcommand\checkbox{$\square$}
\RequirePackage{pifont}% http://ctan.org/pkg/pifont
\newcommand\greencheckmark{{\color{ForestGreen}\ding{52}}}
\newcommand\redcross{{\color{red}\ding{54}}}
\newcommand\boxedgreencheckmark{\makebox[0pt][l]{$\square$}\raisebox{.15ex}{\hspace{0.1em}\greencheckmark}}
\newcommand\boxedredcross{\mbox{\ooalign{\redcross\cr\hidewidth$\square$\hidewidth\cr}}}

\RequirePackage{basiclistings}
\RequirePackage{email}
\RequirePackage{exam}
\RequirePackage{secondpage}

\usepackage{import}
\usepackage{standalone}
\usepackage[yyyymmdd,hhmmss]{datetime}
\renewcommand{\dateseparator}{-}

% Graphics and images
\RequirePackage{tikz}
\RequirePackage{tikz-qtree}
\usetikzlibrary{automata, positioning, arrows}
% Encodings (to render letters with diacritics and special characters)
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}



\lstnewenvironment{blocklisting}{
    \lstset{
        basicstyle=\ttfamily,
        frame=none,
        tabsize=4,
        numbers=none,
        basewidth=0.5em,
        commentstyle=\color{green}, % comment color
        keywordstyle=\color{blue}, % keyword color
        stringstyle=\color{red} % string color
    }
}{}
% Tables with bold rows
\RequirePackage{tabularx}
\newcommand\setrow[1]{\gdef\rowmac{#1}#1\ignorespaces}
\newcommand\clearrow{\global\let\rowmac\relax}
\clearrow
% Tables that can span across multiple pages
\RequirePackage{longtable}
% Math stuff
\RequirePackage{amsmath,amssymb}
\RequirePackage[inline]{enumitem}
\RequirePackage[binary-units=true,retain-explicit-plus,retain-zero-exponent]{siunitx} %SI units

\newcommand\naturaljoin{\bowtie}
\newcommand\select[2]{\sigma_{#1}({#2})}
\newcommand\project[2]{\pi_{#1}({#2})}
\newcommand\rename[2]{\rho_{#1}({#2})}
\newcommand\AND{~\texttt{AND}~}

