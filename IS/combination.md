Assuming $A$ wants to send a confidential, authenticated message to $B$ with the shared keys $K^C$ and $K^M$. What should $A$ send $B$?

## Mac and Encrypt

- No integrity on ciphertext, since MAC is taken over plaintext.

## MAC-then-Encrypt

- Does not provide integrity on ciphertext
- If cipher scheme malleable, possible to alter message with valid MAC
- MAC provides no information on plaintext

## MAC-

- $E_{K^C}(m), \text{Tag}_{K^M}(E_{K^C}(m))$
- $E_{K^C}(m), \text{Tag}_{K^M}(m)$: Not good, Tag leaks information about message.
- $E_{K^C}(m, \text{Tag}_{K^M}(m))$

