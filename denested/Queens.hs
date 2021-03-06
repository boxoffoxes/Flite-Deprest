{
  and v3 v4 = case v3 of {
      False -> False;
      True -> v4
      };
  
  map v5 v6 = case v6 of {
      Nil -> Nil;
      Cons v48 v49 ->
        Cons (v5 v48) (map v5 v49)
      };
  
  append v9 v10 = case v9 of {
      Nil -> v10;
      Cons v50 v51 ->
        Cons v50 (append v51 v10)
      };
  
  concatMap v13 v14 = case v14 of
      {
      Nil -> Nil;
      Cons v52 v53 ->
        append (v13 v52) (concatMap v13 v53)
      };
  
  length v17 = lengthAcc 0 v17;
  
  lengthAcc v18 v19 = case v19 of
      {
      Nil -> v18;
      Cons v54 v55 ->
        lengthAcc ((+) 1 v18) v55
      };
  
  nsoln v22
    = length (gen v22 v22);
  
  gen v23 v24 = case ((==) v24 0)
    of {
      True -> Cons Nil Nil;
      False ->
        concatMap (gen1 v23) (gen v23 ((-) v24 1))
      };
  
  gen1 v25 v26
    = concatMap (gen2 v26) (toOne v25);
  
  gen2 v27 v28 = case
      (safe v28 1 v27) of {
      True -> Cons (Cons v28 v27) Nil;
      False -> Nil
      };
  
  safe v29 v30 v31 = case v31 of {
      Nil -> True;
      Cons v56 v57 ->
        and ((/=) v29 v56) (and ((/=) v29 (safe^^0 v56 v30)) (and ((/=) v29 (safe^^1 v56 v30)) (safe v29 ((+) v30 1) v57)))
      };
  
  safe^^0 v1 v2 = (+) v1 v2;
  
  safe^^1 v1 v2 = (-) v1 v2;
  
  toOne v34 = case ((==) v34 1) of
      {
      True -> Cons 1 Nil;
      False ->
        Cons v34 (toOne ((-) v34 1))
      };
  
  main  = nsoln 11
}
