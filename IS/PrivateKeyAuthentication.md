# Private Key Authentication

Integrity of message (nobody modified the message) and to know that the message is from a certain person. Encryption doesn't guarantee anything.

## Message Authentication Codes (MACs)

Message authentication: Alice sends $(m, t=\text{Tag}_k(m))$ and Bob verifies whether $t=\text{Tag}_k(m)$. Eve can see $(m, t=\text{Tag}_k(m))$ but shouldn't be able to create a valid tag $t'$ for any message $m'\neq m$. Tag is always the same for the same message. Message authentication does not guarantee that the message is from a specific person!

MAC
 : A pair $\text{Vrfy}_k(m, t) \in {\text{yes}, \text{no}}$ and $\text{Tag}_k(m)$ where $\text{Vrfy}_k(m, \text{Tag}_k(m))=\text{yes}$ should hold.

### Security

An adversary breaks the MAC scheme if they output $(m', t')$ such that $\text{Vrfy}_k(m', t')=\text{yes}$ and $m'\neq m_1\dots,m_w$ for all previous messages $m_i$ received from an oracle with randomly chosen key $k$. This is the strongest possible adversary. 

A MAC is secure if $\forall$ polynomial time adversaries $A$, $P(\text{A breaks MAC})=\epsilon(n)$ (negligible in $n$).

Nothing prevents replay attacks though, Eve could always just resend $(m, t)$ to Bob.

## Construction of MACs block ciphers

For a block cipher $F:\{0,1\}^n\times\{0,1\}^n\to\{0,1\}^n$, a secure MAC for messages $m\in\{0,1\}^n$ is $\text{Tag}_k(m)=F(k,m)$. This way we send the message and the encrypted message and Bob just needs to reencrypt the message and check if it's the same.

### Longer messages

Idea 1: Each block separately, does not work, because a permutation of message and tag $(m'=\text{perm}(m), t'=\text{perm}(t))$ is still valid.

Idea 2: Add counter to each message, does not work, prefix of message still valid.

Idea 3: Add length and counter before each block encryption, does not work, can use different parts of multiple messages, mix and match.

Idea 4: Add a (per message) fresh random value and length and counter to each block. Does work but very space inefficient, up to 4 times larger.

#### CBC(Cipher Block Chaining)-MAC

$\text{Tag}_k(m) = F_k(m_d \oplus (F_k(m_{d-1}\oplus\dots F_k(|m|))))$. $|m|$ is needed to avoid splicing attack: Eve could construct $(m_1, m_2\oplus t_1)$ with $t_1=\text{Tag}_k(m_1)$.

Not very efficient, there's something better (see next chapter).

## Hash functions

$\text{Tag}(m) = F_k(h(m))$ with a hash function $h$. Only requires one encryption.

### Definition

Collision resistance, should be hard to find $x$, $x'$ such that $h(x) = h(x')$. Probability for an efficient adversary to find a collision is small.

Problem: For a fixed hash function, there is always a constant time algorithm to find a collision, which may be hard but it always exists.

Different hash functions indexed by $s$: $\{H^s\}_{s\in\text{keys}}$. Example: $s=1$ => $H^1$ is SHA1. Secure if for all polynomial time adversaries, $P(A \text{breaks} H)<\epsilon(n)$.

### From hash functions to MACs

$\text{Tag}((s, k), m) = F_k(H^s(m))$ where $s$ key for hash function $H$ and $k$ a key for the PRP $F$. If $H$ and $F$ are secure then this authentication is secure.

From collision resistant hash function follows that a one way function exists.

### Construction

Construct smaller fixed input length collision resistant function (e.g. $h:\{0, 1\}^{2L}\to\{0, 1\}^L$).

Idea: Use such a function with an initialization vector, continuously adding a block of the message (and padding) and shrinking it (in the above example by 2). Doesn't work for message that has the same padding at the end, results in same hash.

Solution: Add one more block after padding that contains the length of the message (without padding). This is called \textsc{Damg{\aa}rd-Merkel} transform. Constructs hash function from this smaller compression function. Provable via "If hash function $H$ not collision resistant, compression function $h$ is not collision resistant". 

Proof: If $H$ broken (a collision can be found), then for case $|m|=|m'|$ there must be a block where the message differs but since the result is the same, this means the compression function $h$ is broken (collision on exactly that block). If $|m|\neq|m'|$ then the last block is different, so a collision occurs in the last invocation of the collision function and it is therefore broken. $\square$

### Concrete functions

MD5: 128 bits output, completely broken.

SHA-1: 160 bits output, collision found.

### Other Properties

Preimage resistance: Given hash $v$, find $x$ such that $h(x)=v$.

2^nd^ preimage resistance: Given $x$, find $x'\neq x$ such that $h(x)=h(x')$.

Collision resistance $\Rightarrow$ 2^nd^ preimage resistance

### MAC from hash function

#### NMAC

Uses compression function $h$ again. Key1 as initialization vector, compress each block of message into the result with the length of the message as the last block. Compress with key2 in the end. Most real-world functions do not permit to change the IV, key is twice as long.

#### HMAC

ipad=0x36 repeated

opad=0x5C repeated

Compress IV and (key $\oplus$ ipad), then each block of the message, then the message length. Compress this with (IV compressed with k $\oplus$ opad). $H((k\oplus \text{opad}) || H(k \oplus \text{ipad} || m))$.

### Practical uses

- Uniform randomness from non-uniform one 
- Password-based encryption: Send $c=E(H(\text{password}),m)$ with shared password.
