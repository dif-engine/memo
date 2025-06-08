---
documentclass: ltjsarticle
classoption:
  - dvipsnames
title: "pandoc を用いた pdf 文書の作成について"
author: "\\texttt{@dif\\_engine}"
bibliography: reference.bib
header-includes:
  - \bibliographystyle{jplain}
  - \input{preamble.tex}
---

## 導入
次の定理が知られている：
\begin{theorem}[広義積分のアーベル和]
関数$f$は$[a,+\infty)$で区分的連続とする．
もし広義積分$\displaystyle \int_a^\infty \apply{f}{x}\, dx$が存在するならば，次が成立する：
\begin{align}
\lim_{\alpha \to +0} \int_a^\infty\apply{f}{x}\, e^{-\alpha x} \,dx = \int_a^\infty \apply{f}{x} \,dx.
\end{align}
\end{theorem}
\begin{proof}
たとえば文献\cite{Kasahara}, pp. 128--129を見よ．
\end{proof}

\bibliography{reference}

