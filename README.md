# Well-Formed Formula (WFF) Parser in Prolog

## Assignment Overview

This project is part of the Compilers course at the German University in Cairo, Spring Term 2024, under the guidance of Assoc. Prof. Haythem O. Ismail. The task involves writing a parser in Prolog for well-formed formulas (WFFs) of a language of first-order logic, using definite clause grammars (DCGs).

## Specifications

### Language Alphabet

The language's alphabet is defined as the union of the following sets:
- **Variables (V):** `{x, y, z, w, t}`
- **Constants (C):** `{J, K, L, M, N}`
- **Function Symbols (F):** `{f, g, h}`
- **Predicate Symbols (P):** `{P, Q, R, S, T}`
- **Syncategorematic Symbols:** `{∼, &, |, =>, <=>, A, E, (, ), ∗}`

### Terms (T)

The set of terms `T` of the language includes:
1. Variables (`V`)
2. Constants (`C`)
3. Function applications: `{f(t1 ∗ t2 ∗ ... ∗ tn) | f ∈ F and ti ∈ T}`

### Atoms (A)

The set of atoms `A` is defined as:
- `{P(t1 ∗ t2 ∗ ... ∗ tn) | P ∈ P and ti ∈ T}`

### Well-Formed Formulas (WFFs)

The set of WFFs includes:
1. Atoms
2. Negations: `∼φ`
3. Conjunctions: `φ&ψ`
4. Disjunctions: `φ|ψ`
5. Implications: `φ=>ψ`
6. Biconditionals: `φ<=>ψ`
7. Universal quantifications: `Ax(φ)`
8. Existential quantifications: `Ex(φ)`
9. Parenthesized formulas: `(φ)`

### Operator Precedence

The precedence of boolean operators is:
1. `∼`
2. `&`
3. `|`
4. `=>`
5. `<=>`
6. Parentheses have the highest precedence.

### Grammar Requirements

- No ε-rules are allowed.
- The start variable is `s`.
- The parser should generate a parse tree for successful parses.

### Parse Tree Representation

A parse tree is represented as:
- `l` for leaf labels
- `p(l1, l2, ..., ln)` for parent nodes with `p` as the label and `li` as the sub-trees in left-to-right order.

## Submission Guidelines

- **Individual Assignment:** This assignment must be completed individually.
- **File Format:** Submit a single `.pl` file named with your student ID (e.g., `49-1234.pl`).
- **Query Format:** Ensure that your Prolog queries follow this format:
  ```prolog
  s(T, ['A', 'x', '(', 'P', '(', 'J', '*', 'K', ')', ')'], [])
