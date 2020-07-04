\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bdad}

\LoadClass[a4paper]{book}
\raggedbottom

\RequirePackage[top=35mm,bottom=35mm,left=25mm,right=25mm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{amssymb,graphicx}
\RequirePackage[retain-explicit-plus,retain-zero-exponent]{siunitx}
\RequirePackage{hyperref}
\RequirePackage{longtable}
\RequirePackage{tikz}
\def\checkmark{\tikz\fill[scale=0.4](0,.35) -- (.25,0) -- (1,.7) -- (.25,.15) -- cycle;}
\newcommand\greencheckmark{{\color{green}\checkmark}}

\newcommand\naturaljoin{\bowtie}
% Entire row is bold
\RequirePackage{tabularx}
\newcommand\setrow[1]{\gdef\rowmac{#1}#1\ignorespaces}
\newcommand\clearrow{\global\let\rowmac\relax}
\clearrow
% Listings
\RequirePackage{xcolor}
\RequirePackage{listings}
\renewcommand{\lstlistingname}{File}
\lstset{
    basicstyle=\ttfamily,
    frame=tb, % draw frame at top and bottom of the code
    tabsize=4, % tab space width
    numbers=left, % display line numbers on the left
	showstringspaces=false, % don't mark spaces in strings    
    commentstyle=\color{green}, % comment color
    keywordstyle=\color{blue}, % keyword color
    stringstyle=\color{red} % string color
}
% Answer separator
\newcommand\ansseparator{\noindent\hfil\rule{0.5\textwidth}{.4pt}\hfil}
% Some work
\def\title#1{\gdef\@title{#1}\gdef\@@title{#1}}
\def\author#1{\gdef\@author{#1}\gdef\@@author{#1}}
\let\@@title\@empty
\let\@@author\@empty
% Headers and footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\ifx\@@title\@empty\else\@@title\fi}
\fancyfoot[L]{\ifx\@@author\@empty\else\@@author\fi}
\fancyfoot[R]{\thepage}
