---
title: Assignment 5.2
author: Silvan Mosberger
date: 21.3.2017
classoption: landscape
---

# 1.

\newcommand{\Lab}[2]{
\AxiomC{}
\RightLabel{\scriptsize{#1}}
\UnaryInfC{#2}
}

\begin{prooftree}
	\Lab{Var}{$\Gamma\vdash x :: Int \to Bool \to Int$}
	\Lab{Int}{$\Gamma\vdash 1 :: Int$}
	\Bi{App}{$\Gamma\vdash x\;1 :: Bool \to a$}
	\Lab{True}{$\Gamma\vdash True :: Bool$}
	\Bi{App}{$\Gamma\vdash x\;1\;True :: a$}
			\Lab{Var}{$\Gamma\vdash x :: Int\to Bool\to a$}
			\Lab{Int}{$\Gamma\vdash 0 :: Int$}
			\Bi{App}{$\Gamma\vdash x\;0 :: Bool\to a$}
	\Bi{Tuple}{$\Gamma\coloneqq x:Int\to Bool\to a\vdash (x\;1\;True, x\;0)::(a, Bool\to a)$}
	\Un{Abs}{$\lambda x.\;(x\;1\;True, x\;0) :: (Int \to Bool \to a) \to (a, Bool \to a)$}
\end{prooftree}

# 2.


