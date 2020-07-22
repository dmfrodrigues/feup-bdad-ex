\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bdad_exam}
\LoadClass{bdad}

\RequirePackage{xkeyval}

\def\type{normal}
\def\year{2000}
\define@key{bdad_exam.cls}{type}[NULL]{%
  \def\type{#1}%
}
\define@key{bdad_exam.cls}{year}[NULL]{%
  \def\year{#1}%
}

\ExecuteOptionsX{type,year}
\ProcessOptionsX%

\RequirePackage{import}
\RequirePackage{hyperref}

\author{Diogo Miguel Ferreira Rodrigues \\ \email{dmfrodrigues2000@gmail.com}}
\title{BDAD - Exame {\type} {\year}}