local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s({trig="hepnames", dscr="Use package hepnames with required workaround"},
    t(
      {
      "\\usepackage{hepnicenames}",
      "\\usepackage{xpatch}",
      "\\makeatletter",
      "\\xpatchcmd\\@HepConStyle",
       "{\\edef\\@upcode{\\updefault}}",
       "{\\ifdefined\\shapedefault\\edef\\@upcode{\\shapedefault}\\else\\edef\\@upcode{\\updefault}\\fi}",
       "{}{}",
      "\\makeatother"
      }
    )
  ),
  s({trig="appendixnumberbeamer", dscr="Use package appendixnumberbeamer with required workaround"},
    t(
      {
        "\\usepackage{hepnicenames}",
        "\\renewcommand{\\appendixname}{\\texorpdfstring{\\translate{Appendix}}{Appendix}}"
      }
    )
  ),
  s({trig="siunitx", dscr="Use package siunitx with my commonly used custom units"},
    t(
      {
        "\\usepackage{siunitx}",
        "\\DeclareSIUnit\\barn{b}",
        "\\DeclareSIUnit\\clight{\\text{\\ensuremath{c}}}",
        "\\sisetup{per-mode=symbol}"
      }
    )
  ),
  s({trig="col", dscr="Divide beamer frame into two equal columns"},
    fmta(
      [[
      \begin{columns}
        \begin{column}{.5\textwidth}
          <>
        \end{column}
        \begin{column}{.5\textwidth}
          <>
        \end{column}
      \end{columns}
    ]],
      {
        i(1, "column1"),
        i(2, "column2"),
      }
    )
  ),
  s({trig="frame", dscr="Create new beamer frame with title"},
    fmta(
      [[
      \begin{frame}
        \frametitle{<>}
      \end{frame}
    ]],
      {
        i(1, "title"),
      }
    )
  ),
  s({trig="\\beg", dscr="New environment"},
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),
  s({trig="\\document", dscr="Preamble for a document"},
    fmta(
      [[
        \documentclass[12pt, a4paper]{article}
        \title{<>}
        \author{Sigurd Nese}
        \date{\today}
        \begin{document}
          \maketitle
          <>
        \end{document}
      ]],
      {
        i(1, "Document title"),
        i(2, "content"),
      }
    )
  ),
  s({trig="\\document", dscr="Preamble for a beamer presentation"},
    fmta(
      [[
        \documentclass[aspectratio=169]{beamer}
        \usetheme{Madrid}
        \usecolortheme{beaver}
        \setbeamerfont{frametitle}{size=\large}
        \beamertemplatenavigationsymbolsempty
        \synctex=1
        \title{<>}
        \author{Sigurd Nese}
        \institute[University of Oslo]{University of Oslo\\\vspace{5mm} Context}
        \date{\today}

        \begin{document}

        \frame{\titlepage}

        \begin{frame}
          \frametitle{<>}
        \end{frame}

        \end{document}
      ]],
      {
        i(1, "Presentation title"),
        i(2, "Title of 1st slide"),
      }
    )
  ),
  s({trig="annotated", dscr="Add an image with annotation"},
    fmta(
      [[
        \begin{tikzpicture}
          \draw (0, 0) node[inner sep=0] {\includegraphics[width=\textwidth]{./figures/<>}};
          \draw (1, 1) node {<>};
        \end{tikzpicture}
      ]],
      {
        i(1),
        i(2, "node text"),
      }
    )
  ),
  s({trig="figure", dscr="Add an image"},
    fmta(
      [[
        \begin{figure}
          \begin{center}
            \includegraphics[width=0.95\textwidth]{./figures/<>}
          \end{center}
        \end{figure}
      ]],
      {
        i(1),
      }
    )
  ),
  s({trig="definept", dscr="Define command for writing transverse momentum"},
    t(
      {
        "\\newcommand{\\pt}{\\ensuremath{p_\\text{T}^{}}\\xspace}"
      }
    )
  ),
  s({trig="quotes", dscr="Quotes"},
    fmta(
      [[
        ``<>''
      ]],
      {
        i(1),
      }
    )
  )
}

