% Formal Methods and Functional Programming - Series 1
% Silvan Mosberger
% 26.2.2017

# Assignment 4

## 1. Parenthesizing Formulas

1. $(A \vee B) \to (C \to ((A \wedge C) \vee (B \wedge C)))$
2. $(A \to (B \to C)) \to ((A \wedge B) \to C)$

## 2. Proving Formulas

### Proof for $(A\vee B)\to(C\to (A\wedge C)\vee(B\wedge C))$

\begin{prooftree}

	\Ax{$\Gamma\vdash A\vee B$}
				\Ax{$\Gamma,A\vdash A$}
							\Ax{$\Gamma,A\vdash C$}
				\Bi{$\wedge I$}{$\Gamma,A\vdash A\wedge C$}
				\Un{$\vee IR$}{$\Gamma,A\vdash (A\wedge C)\vee(B\wedge C)$}
												\Ax{$\Gamma,B\vdash B$}
															\Ax{$\Gamma,B\vdash C$}
												\Bi{$\wedge I$}{$\Gamma,B\vdash B\wedge C$}
												\Un{$\vee IL$}{$\Gamma,B\vdash (A\wedge C)\vee(B\wedge C)$}
	\Tr{$\vee E$}{$\Gamma\coloneqq A\vee B,C\vdash (A\wedge C)\vee(B\wedge C)$}
	\Un{$\to I$}{$A\vee B\vdash C\to (A\wedge C)\vee(B\wedge C)$}
	\Un{$\to I$}{$(A\vee B)\to(C\to (A\wedge C)\vee(B\wedge C))$}
\end{prooftree}

### Proof for $(A\to(B\to C))\to((A\wedge B)\to C)$

\begin{prooftree}
	\AxiomC{}
	\RightLabel{\scriptsize{axiom}}
	\UnaryInfC{$\Gamma\vdash A\to(B\to C)$}
									\AxiomC{}
									\RightLabel{\scriptsize{axiom}}
									\UnaryInfC{$\Gamma\vdash A\wedge B$}

									\RightLabel{\scriptsize{$\wedge EL$}}
									\UnaryInfC{$\Gamma\vdash A$}
					\RightLabel{\scriptsize{$\to E$}}
					\BinaryInfC{$\Gamma\vdash B\to C$}
																		\AxiomC{}
																		\RightLabel{\scriptsize{axiom}}
																		\UnaryInfC{$\Gamma\vdash A\wedge B$}

																		\RightLabel{\scriptsize{$\wedge ER$}}
																		\UnaryInfC{$\Gamma\vdash B$}
											\RightLabel{\scriptsize{$\to E$}}
											\BinaryInfC{$\Gamma\coloneqq A\to(B\to C), A\wedge B\vdash C$}

											\RightLabel{\scriptsize{$\to I$}}
											\UnaryInfC{$A\to(B\to C)\vdash(A\wedge B)\to C$}

											\RightLabel{\scriptsize{$\to I$}}
											\UnaryInfC{$(A\to(B\to C))\to((A\wedge B)\to C)$}

	
	
\end{prooftree}

## 3. Elimination and Introduction Rules for $\leftrightarrow$

\begin{prooftree}
	\AxiomC{$\Gamma\vdash A\to B$}
	\AxiomC{$\Gamma\vdash B\to A$}
	\RightLabel{\scriptsize{$\leftrightarrow I$}}
	\BinaryInfC{$\Gamma\vdash A\leftrightarrow B$}
\end{prooftree}
\begin{prooftree}
	\AxiomC{$\Gamma\vdash A\leftrightarrow B$}
	\RightLabel{\scriptsize{$\leftrightarrow EL$}}
	\UnaryInfC{$\Gamma\vdash A\to B$}
\end{prooftree}
\begin{prooftree}
	\AxiomC{$\Gamma\vdash A\leftrightarrow B$}
	\RightLabel{\scriptsize{$\leftrightarrow ER$}}
	\UnaryInfC{$\Gamma\vdash B\to A$}
\end{prooftree}
