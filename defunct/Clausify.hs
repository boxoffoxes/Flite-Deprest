{
  main  = let {
      v297 = Sym 0
      } in
      (display (clausify (foldr^Con v297 (replicate 80 (eqv (eqv v297 (eqv v297 v297)) (eqv (eqv v297 (eqv v297 v297)) (eqv v297 (eqv v297 v297))))))));
  
  display v126 = case v126 of {
      Nil -> 0;
      Cons v291 v292 ->
        (+) (emitClause v291) (display v292)
      };
  
  clausify v98
    = uniq (nonTaut (clauses (split (disin (negin v98)))));
  
  foldr^Con v121 v122 = case v122
    of {
      Nil -> v121;
      Cons v289 v290 ->
        Con v289 (foldr^Con v121 v290)
      };
  
  replicate v139 v140 = case
      ((==) v139 0) of {
      True -> Nil;
      False ->
        Cons v140 (replicate ((-) v139 1) v140)
      };
  
  eqv v137 v138
    = Con (Dis (Neg v137) v138) (Dis (Neg v138) v137);
  
  emitClause v129 = case v129 of {
      Pair v293 v294 ->
        (+) (sum v293) (sum v294)
      };
  
  uniq v125
    = foldr^comp^union^eqClause^singleton Nil v125;
  
  nonTaut v72
    = filter^notTaut v72;
  
  clauses v8
    = map^clause (Pair Nil Nil) v8;
  
  split v99 = spl Nil v99;
  
  disin v25 = case v25 of {
      Sym v233 -> Sym v233;
      Neg v234 -> Neg v234;
      Con v235 v236 ->
        Con (disin v235) (disin v236);
      Dis v237 v238 ->
        din (disin v237) (disin v238)
      };
  
  negin v59 = case v59 of {
      Neg v255 -> case v255 of {
          Con v256 v257 ->
            Dis (negin (Neg v256)) (negin (Neg v257));
          Dis v258 v259 ->
            Con (negin (Neg v258)) (negin (Neg v259));
          Neg v260 -> negin v260;
          Sym v261 -> Neg (Sym v261)
          };
      Dis v262 v263 ->
        Dis (negin v262) (negin v263);
      Con v264 v265 ->
        Con (negin v264) (negin v265);
      Sym v266 -> Sym v266
      };
  
  sum v132 = sumAcc 0 v132;
  
  foldr^comp^union^eqClause^singleton v121 v122
    = case v122 of {
      Nil -> v121;
      Cons v289 v290 ->
        comp^union^eqClause^singleton v289 (foldr^comp^union^eqClause^singleton v121 v290)
      };
  
  filter^notTaut v53 = case v53 of
      {
      Nil -> Nil;
      Cons v253 v254 -> case
          (notTaut v253) of {
          True ->
            Cons v253 (filter^notTaut v254);
          False -> filter^notTaut v254
          }
      };
  
  map^clause v9 v5 = case v5 of {
      Nil -> Nil;
      Cons v222 v223 ->
        Cons (clause v9 v222) (map^clause v9 v223)
      };
  
  spl v100 v101 = case v101 of {
      Con v281 v282 ->
        spl (spl v100 v281) v282;
      Dis v283 v284 ->
        Cons (Dis v283 v284) v100;
      Neg v285 ->
        Cons (Neg v285) v100;
      Sym v286 -> Cons (Sym v286) v100
      };
  
  din v32 v33 = case v32 of {
      Con v239 v240 ->
        Con (din v239 v33) (din v240 v33);
      Dis v241 v242 ->
        din2 (Dis v241 v242) v33;
      Neg v243 -> din2 (Neg v243) v33;
      Sym v244 -> din2 (Sym v244) v33
      };
  
  sumAcc v133 v134 = case v134 of
      {
      Nil -> v133;
      Cons v295 v296 ->
        sumAcc ((+) v133 v295) v296
      };
  
  comp^union^eqClause^singleton v114
    = union^eqClause (singleton v114);
  
  notTaut v95 = case v95 of {
      Pair v279 v280 ->
        null (inter^eq v279 v280)
      };
  
  clause v9 v10 = case v9 of {
      Pair v224 v225 -> case v10 of {
          Dis v226 v227 ->
            clause (clause (Pair v224 v225) v226) v227;
          Sym v228 ->
            Pair (ins v228 v224) v225;
          Neg v229 -> case v229 of {
              Sym v230 ->
                Pair v224 (ins v230 v225)
              }
          }
      };
  
  din2 v40 v41 = case v41 of {
      Con v245 v246 ->
        Con (din v40 v245) (din v40 v246);
      Dis v247 v248 ->
        Dis v40 (Dis v247 v248);
      Neg v249 -> Dis v40 (Neg v249);
      Sym v250 -> Dis v40 (Sym v250)
      };
  
  union^eqClause v117 v118
    = append v117 (filter^comp^not^contains^eqClause v117 v118);
  
  singleton v119 = Cons v119 Nil;
  
  null v92 = case v92 of {
      Nil -> True;
      Cons v277 v278 -> False
      };
  
  inter^eq v57 v58
    = filter^contains^eq v57 v58;
  
  ins v48 v49 = case v49 of {
      Nil -> Cons v48 Nil;
      Cons v251 v252 -> case
          ((==) v48 v251) of {
          True -> Cons v251 v252;
          False -> case ((<=) v48 v251) of
              {
              True ->
                Cons v48 (Cons v251 v252);
              False ->
                Cons v251 (ins v48 v252)
              }
          }
      };
  
  append v108 v109 = case v108 of
      {
      Nil -> v109;
      Cons v287 v288 ->
        Cons v287 (append v288 v109)
      };
  
  filter^comp^not^contains^eqClause v21 v53
    = case v53 of {
      Nil -> Nil;
      Cons v253 v254 -> case
          (comp^not^contains^eqClause v21 v253)
        of {
          True ->
            Cons v253 (filter^comp^not^contains^eqClause v21 v254);
          False ->
            filter^comp^not^contains^eqClause v21 v254
          }
      };
  
  filter^contains^eq v21 v53
    = case v53 of {
      Nil -> Nil;
      Cons v253 v254 -> case
          (contains^eq v21 v253) of {
          True ->
            Cons v253 (filter^contains^eq v21 v254);
          False ->
            filter^contains^eq v21 v254
          }
      };
  
  comp^not^contains^eqClause v21 v114
    = not (contains^eqClause v21 v114);
  
  contains^eq v21 v22 = case v21
    of {
      Nil -> False;
      Cons v231 v232 ->
        or (eq v231 v22) (contains^eq v232 v22)
      };
  
  not v115 = case v115 of {
      False -> True;
      True -> False
      };
  
  contains^eqClause v21 v22 = case
      v21 of {
      Nil -> False;
      Cons v231 v232 ->
        or (eqClause v231 v22) (contains^eqClause v232 v22)
      };
  
  or v18 v19 = case v18 of {
      False -> v19;
      True -> True
      };
  
  eq v84 v85 = (==) v84 v85;
  
  eqClause v86 v87 = case v86 of {
      Pair v273 v274 -> case v87 of {
          Pair v275 v276 ->
            and (eqList^eq v273 v275) (eqList^eq v274 v276)
          }
      };
  
  and v73 v74 = case v73 of {
      False -> False;
      True -> v74
      };
  
  eqList^eq v76 v77 = case v76 of
      {
      Nil -> case v77 of {
          Nil -> True;
          Cons v267 v268 -> False
          };
      Cons v269 v270 -> case v77 of {
          Nil -> False;
          Cons v271 v272 ->
            and (eq v269 v271) (eqList^eq v270 v272)
          }
      }
}
