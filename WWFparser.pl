s(parse_tree(S)) -->
    wff(S).

wff(X) --> iff(X).

wff(uni('A', variable(B), '(', X, ')')) -->
    oper('A'),
    variable(var(B)),
    oper('('),
    wff(X),
    oper(')').


wff(exi('E', variable(B), '(', X, ')')) -->
    oper('E'),
    variable(var(B)),
    oper('('),
    wff(X),
    oper(')').

iff(iff(T,'<=>',S)) --> imp(T), oper('<=>'), iff(S).
iff(T) --> imp(T).

imp(imp(T,'=>',S)) --> dis(T), oper('=>'), imp(S).
imp(T) --> dis(T).

dis(dis(T,'|',S)) --> conj(T), oper('|'), dis(S).
dis(T) --> conj(T).

conj(conj(T,'&',S)) --> neg(T), oper('&'), conj(S).
conj(T) --> neg(T).

neg(neg('~', T)) --> oper('~'), atom(T).
neg(T) --> atom(T).



atom(atom(pred(T))) --> predSymb(pred(A)), oper('('), term_list(B), oper(')'), {T=.. [A|B]}.
atom(X) --> paren(X).

paren(X) --> oper('('), wff(X), oper(')').

term_list([T|Ts]) --> term(term(T)), term_list_2(Ts).
term_list_2([T|Ts]) --> oper(T), term_list(Ts).
term_list_2([]) --> [].


term(term(var(V))) --> variable(var(V)).
term(term(cons(C))) --> constant(cons(C)).
term(term(func(F))) --> funSymb(func(A)), term_list(B), {F=.. [A|B]}.

variable(var(V)) --> [V], { member(V, [x, y, z, w, t]) }.
constant(cons(C)) --> [C], { member(C, ['J', 'K', 'L', 'M', 'N']) }.
oper(X) --> [X], { member(X, ['*', '&', '=>', '~', '(', ')', '|', 'A', 'E', '<=>']) }.
funSymb(func(F)) --> [F], { member(F, [f, g, h]) }.
predSymb(pred(P)) --> [P], { member(P, ['P', 'Q', 'R', 'S', 'T']) }.



