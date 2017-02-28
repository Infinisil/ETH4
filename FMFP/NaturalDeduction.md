# Propositional Logic

\begin{center}
	\AxiomC{$\Gamma\vdash A$}
	\AxiomC{$\Gamma\vdash B$}
	\Bi{$\wedge I$}{$\Gamma\vdash A\wedge B$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash A\wedge B$}
	\Un{$\wedge EL$}{$\Gamma\vdash A$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash A\wedge B$}
	\Un{$\wedge ER$}{$\Gamma\vdash B$}
	\DisplayProof
\end{center}

\begin{center}
	\AxiomC{$\Gamma,A\vdash B$}
	\Un{$\to I$}{$\Gamma\vdash A\to B$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash A\to B$}
	\AxiomC{$\Gamma\vdash A$}
	\Bi{$\to E$}{$\Gamma\vdash B$}
	\DisplayProof
\end{center}

\begin{center}
	\AxiomC{$\Gamma\vdash A$}
	\Un{$\vee IL$}{$\Gamma\vdash A\vee B$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash B$}
	\Un{$\vee IR$}{$\Gamma\vdash A\vee B$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash A\vee B$}
	\AxiomC{$\Gamma,A\vdash C$}
	\AxiomC{$\Gamma,B\vdash C$}
	\Tr{$\vee E$}{$\Gamma\vdash C$}
	\DisplayProof
\end{center}

\begin{center}
	\AxiomC{$\Gamma\vdash\bot$}
	\Un{$\bot E$}{$\Gamma\vdash A$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash\neg A$}
	\AxiomC{$\Gamma\vdash A$}
	\Bi{$\neg E$}{$\Gamma\vdash B$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma,\neg A\vdash\bot$}
	\Un{$RAA$}{$\Gamma\vdash A$}
\end{center}

# First-order Logic

### Universal Quantification

\begin{center}
	\AxiomC{$\Gamma\vdash A(x)$}
	\Un{$\forall I^*$}{$\Gamma\vdash\forall x.A(x)$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash\forall x.A(x)$}
	\Un{$\forall E$}{$\Gamma\vdash A(t)$}
	\DisplayProof
\end{center}

$*$ Side condition: $x$ not free in any assumption in $\Gamma$.

### Existential Quantification

\begin{center}
	\AxiomC{$\Gamma\vdash A(t)$}
	\Un{$\exists I$}{$\Gamma\vdash\exists x.A(x)$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash\exists x.A(x)$}
	\AxiomC{$\Gamma,A(x)\vdash B$}
	\Bi{$\exists E^*$}{$\Gamma\vdash B$}
	\DisplayProof
\end{center}

$*$ Side condition: $x$ is neither free in $B$ not free in $\Gamma$.

# First-order Logic with Equality

\begin{center}
	\AxiomC{}
	\RightLabel{\scriptsize{$ref$}}
	\UnaryInfC{$\Gamma\vdash t=t$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash t=s$}
	\Un{$sym$}{$\Gamma\vdash s=t$}
	\DisplayProof
	\hskip 1.5em
	\AxiomC{$\Gamma\vdash t=s$}
	\AxiomC{$\Gamma\vdash s=r$}
	\Bi{$trans$}{$\Gamma\vdash t=r$}
	\DisplayProof
\end{center}

Congruence
