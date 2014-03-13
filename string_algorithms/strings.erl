-module(strings).
-export([dna/1, rna/1]).

count_char(String, Chr) ->
    F = fun(X, N) when X =:= Chr -> N + 1;
           (_, N)                -> N
        end,
    lists:foldl(F, 0, String).

%%Counting DNA Nucleotides
dna(String) ->
    {A, C, G, T} = {count_char(String, $A), count_char(String, $C), count_char(String, $G), count_char(String, $T)}.

%%Transcribing DNA into RNA
rna(String) -> re:replace(String, "T", "U", [global, {return, list}]).
    
