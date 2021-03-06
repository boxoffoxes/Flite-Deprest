{
  inc v77 = (+) v77 1;
  
  dec v78 = (-) v78 1;
  
  dis v79 v80 = case v79 of {
      True -> True;
      False -> v80
      };
  
  con v81 v82 = case v81 of {
      True -> v82;
      False -> False
      };
  
  not v83 = case v83 of {
      True -> False;
      False -> True
      };
  
  non v84 v85 = not (v84 v85);
  
  isNothing v86 = case v86 of {
      Nothing -> True;
      Just v840 -> False
      };
  
  isJust v88 = case v88 of {
      Nothing -> False;
      Just v841 -> True
      };
  
  fromJust v90 = case v90 of {
      Just v842 -> v842
      };
  
  maybe v92 v93 v94 = case v94 of
      {
      Nothing -> v92;
      Just v843 -> v93 v843
      };
  
  fst v96 = case v96 of {
      Pair v844 v845 -> v844
      };
  
  snd v99 = case v99 of {
      Pair v846 v847 -> v847
      };
  
  id v102 = v102;
  
  curry v103 v104 v105
    = v103 (Pair v104 v105);
  
  uncurry v106 v107 = case v107 of
      {
      Pair v848 v849 -> v106 v848 v849
      };
  
  flip v110 v111 v112
    = v110 v112 v111;
  
  cross v113 v114 v115 = case v115
    of {
      Pair v850 v851 ->
        Pair (v113 v850) (v114 v851)
      };
  
  both v118 v119 = case v119 of {
      Pair v852 v853 ->
        con (v118 v852) (v118 v853)
      };
  
  null v122 = case v122 of {
      Nil -> True;
      Cons v854 v855 -> False
      };
  
  head v125 = case v125 of {
      Cons v856 v857 -> v856
      };
  
  tail v128 = case v128 of {
      Cons v858 v859 -> v859
      };
  
  append v131 v132 = case v131 of
      {
      Nil -> v132;
      Cons v860 v861 ->
        Cons v860 (append v861 v132)
      };
  
  map v135 v136 = case v136 of {
      Nil -> Nil;
      Cons v862 v863 ->
        Cons (v135 v862) (map v135 v863)
      };
  
  concatMap v139 v140 = case v140
    of {
      Nil -> Nil;
      Cons v864 v865 ->
        append (v139 v864) (concatMap v139 v865)
      };
  
  elemBy v143 v144 v145 = case
      v145 of {
      Nil -> False;
      Cons v866 v867 -> case
          (v143 v144 v866) of {
          True -> True;
          False -> elemBy v143 v144 v867
          }
      };
  
  elemAt v148 v149 = case v148 of
      {
      Cons v868 v869 -> case
          ((==) v149 0) of {
          True -> v868;
          False -> elemAt v869 (dec v149)
          }
      };
  
  filter v152 v153 = case v153 of
      {
      Nil -> Nil;
      Cons v870 v871 -> case
          (v152 v870) of {
          True ->
            Cons v870 (filter v152 v871);
          False -> filter v152 v871
          }
      };
  
  foldr v156 v157 v158 = case v158
    of {
      Nil -> v157;
      Cons v872 v873 ->
        v156 v872 (foldr v156 v157 v873)
      };
  
  zipWith v161 v162 v163 = case
      v162 of {
      Nil -> case v163 of {
          Nil -> Nil;
          Cons v874 v875 -> Nil
          };
      Cons v876 v877 -> case v163 of {
          Nil -> Nil;
          Cons v878 v879 ->
            Cons (v161 v876 v878) (zipWith v161 v877 v879)
          }
      };
  
  zip  = zipWith Pair;
  
  unlines v170 = case v170 of {
      Nil -> Nil;
      Cons v880 v881 ->
        append v880 (Cons 10 (unlines v881))
      };
  
  emitStr v173 v174 = case v173 of
      {
      Nil -> v174;
      Cons v882 v883 ->
        (+) v882 (emitStr v883 v174)
      };
  
  length v177 = case v177 of {
      Nil -> 0;
      Cons v884 v885 ->
        inc (length v885)
      };
  
  repeat v180
    = Cons v180 (repeat v180);
  
  last v181 = case v181 of {
      Cons v886 v887 -> case
          (null v887) of {
          True -> v886;
          False -> last v887
          }
      };
  
  enumFromTo v184 v185 = case
      ((<=) v184 v185) of {
      True ->
        Cons v184 (enumFromTo (inc v184) v185);
      False -> Nil
      };
  
  plus v186 v187 = (+) v186 v187;
  
  sum v188 = foldr plus 0 v188;
  
  concatStrings v189
    = foldr append Nil v189;
  
  and v190 = foldr con True v190;
  
  all v191 v192
    = and (map v191 v192);
  
  unionBy v193 v194 v195
    = foldr (insBy v193) v194 v195;
  
  insBy v196 v197 v198 = case
      (elemBy v196 v197 v198) of {
      True -> v198;
      False -> Cons v197 v198
      };
  
  intersperse v199 v200 = case
      v200 of {
      Nil -> Nil;
      Cons v888 v889 -> case v889 of {
          Nil -> Cons v888 Nil;
          Cons v890 v891 ->
            Cons v888 (Cons v199 (intersperse v199 (Cons v890 v891)))
          }
      };
  
  nubBy v205 v206
    = nubBySans Nil v205 v206;
  
  nubBySans v207 v208 v209 = case
      v209 of {
      Nil -> Nil;
      Cons v892 v893 -> case
          (elemBy v208 v892 v207) of {
          True ->
            nubBySans v207 v208 v893;
          False ->
            Cons v892 (nubBySans (Cons v892 v207) v208 v893)
          }
      };
  
  lookUpBy v212 v213 v214 = case
      v214 of {
      Nil -> Nothing;
      Cons v894 v895 -> case v894 of {
          Pair v896 v897 -> case
              (v212 v213 v896) of {
              True -> Just v897;
              False -> lookUpBy v212 v213 v895
              }
          }
      };
  
  equalStrings v219 v220 = case
      v219 of {
      Nil -> case v220 of {
          Nil -> True;
          Cons v898 v899 -> False
          };
      Cons v900 v901 -> case v220 of {
          Nil -> False;
          Cons v902 v903 ->
            con ((==) v900 v902) (equalStrings v901 v903)
          }
      };
  
  showResult v227 v228 = case v227
    of {
      Just v904 ->
        append (Cons 10 (Cons 83 (Cons 117 (Cons 99 (Cons 99 (Cons 101 (Cons 115 (Cons 115 (Cons 10 Nil))))))))) (showRules v228 (map rn v904));
      Nothing ->
        Cons 10 (Cons 70 (Cons 97 (Cons 105 (Cons 108 (Cons 117 (Cons 114 (Cons 101 (Cons 10 Nil))))))))
      };
  
  varWeight v230 = case v230 of {
      Weights v905 v906 -> v905
      };
  
  funWeight v233 v234 = case v233
    of {
      Weights v907 v908 ->
        fromJust (lookUpBy equalStrings v234 v908)
      };
  
  funSequence v237 = case v237 of
      {
      Weights v909 v910 ->
        map fst v910
      };
  
  weights 
    = Weights 1 (Cons (Pair (Cons 48 Nil) 1) (Cons (Pair (Cons 43 Nil) 0) (Cons (Pair (Cons 45 Nil) 0) Nil)));
  
  order  = kbGreaterThan weights;
  
  arity v240 v241
    = maybe ((-) 0 1) fst (lookUpBy equalStrings v241 v240);
  
  isInfix v242 v243
    = maybe False snd (lookUpBy equalStrings v243 v242);
  
  main  = let {
      v911 = Cons (Pair (Cons 43 Nil) (Pair 2 True)) (Cons (Pair (Cons 45 Nil) (Pair 1 False)) (Cons (Pair (Cons 48 Nil) (Pair 0 False)) Nil));
      v912 = Cons (Pair (Fun (Cons 43 Nil) (Cons (Fun (Cons 48 Nil) Nil) (Cons (Var (Cons 88 Nil)) Nil))) (Var (Cons 88 Nil))) (Cons (Pair (Fun (Cons 43 Nil) (Cons (Fun (Cons 45 Nil) (Cons (Var (Cons 88 Nil)) Nil)) (Cons (Var (Cons 88 Nil)) Nil))) (Fun (Cons 48 Nil) Nil)) (Cons (Pair (Fun (Cons 43 Nil) (Cons (Fun (Cons 43 Nil) (Cons (Var (Cons 88 Nil)) (Cons (Var (Cons 89 Nil)) Nil))) (Cons (Var (Cons 90 Nil)) Nil))) (Fun (Cons 43 Nil) (Cons (Var (Cons 88 Nil)) (Cons (Fun (Cons 43 Nil) (Cons (Var (Cons 89 Nil)) (Cons (Var (Cons 90 Nil)) Nil))) Nil)))) Nil))
      } in (case
        (checkEquations v912 v911) of {
        True ->
          emitStr (Cons 85 (Cons 115 (Cons 105 (Cons 110 (Cons 103 (Cons 32 (Cons 101 (Cons 113 (Cons 117 (Cons 97 (Cons 116 (Cons 105 (Cons 111 (Cons 110 (Cons 115 (Cons 58 (Cons 10 Nil))))))))))))))))) (emitStr (showEqns v911 v912) (emitStr (showResult (complete v911 v912) v911) 0));
        False ->
          emitStr (Cons 73 (Cons 108 (Cons 108 (Cons 45 (Cons 102 (Cons 111 (Cons 114 (Cons 109 (Cons 101 (Cons 100 (Cons 32 (Cons 101 (Cons 113 (Cons 117 (Cons 97 (Cons 116 (Cons 105 (Cons 111 (Cons 110 (Cons 10 Nil)))))))))))))))))))) 0
        });
  
  checkEquations v244 v245
    = all (both (checkTerm v245)) v244;
  
  checkTerm v246 v247 = case v247
    of {
      Var v913 -> True;
      Fun v914 v915 ->
        con ((==) (length v915) (arity v246 v914)) (all (checkTerm v246) v915)
      };
  
  rn v251 = case v251 of {
      Pair v916 v917 -> let {
          v918 = zip (vars v916) (map Var variables)
          } in
          (Pair (subst v918 v916) (subst v918 v917))
      };
  
  zipWithRemRight v254 v255 v256
    = case v255 of {
      Nil -> case v256 of {
          Nil -> Pair Nil Nil;
          Cons v919 v920 ->
            Pair Nil (Cons v919 v920)
          };
      Cons v921 v922 -> case v256 of {
          Nil -> Pair Nil Nil;
          Cons v923 v924 -> case
              (zipWithRemRight v254 v922 v924)
            of {
              Pair v925 v926 ->
                Pair (Cons (v254 v921 v923) v925) v926
              }
          }
      };
  
  renameNew v263 v264 = case v264
    of {
      Pair v927 v928 -> case
          (zipWithRemRight (curry (cross id Var)) (vars v927) v263)
        of {
          Pair v929 v930 ->
            Pair (Pair (subst v929 v927) (subst v929 v928)) v930
          }
      };
  
  renameNewList v267 v268 = case
      v268 of {
      Nil -> Pair Nil v267;
      Cons v931 v932 -> case
          (renameNew v267 v931) of {
          Pair v933 v934 -> case
              (renameNewList v934 v932) of {
              Pair v935 v936 ->
                Pair (Cons v933 v935) v936
              }
          }
      };
  
  complete v271 v272
    = completionLoop v271 variables 0 v272 Nil;
  
  completionLoop v273 v274 v275 v276 v277
    = case v276 of {
      Nil -> Just v277;
      Cons v937 v938 -> case
          ((==) v275 1000) of {
          True -> Nothing;
          False -> case
              (renameNew v274 v937) of {
              Pair v939 v940 -> case
                  (orient v939) of {
                  Nothing -> Nothing;
                  Just v941 ->
                    completionWith v273 v940 (inc v275) v938 v941 v277
                  }
              }
          }
      };
  
  completionWith v280 v281 v282 v283 v284 v285
    = let {
      v942 = Cons v284 v285
      } in
      (completionWith2 (simplifyRules v280 v284 v285) v280 v942 v283 (getCriticalPairs v942 v284) (completionLoop v280 v281 v282));
  
  completionWith2 v286 v287 v288 v289 v290 v291
    = case v286 of {
      Pair v943 v944 ->
        v291 (simplifyEquations v287 v288 (append v289 (append v943 v290))) (uniqueRules v944)
      };
  
  orient v294 = case v294 of {
      Pair v945 v946 -> case
          (order v945 v946) of {
          True -> Just (Pair v945 v946);
          False -> case (order v946 v945)
            of {
              True -> Just (Pair v946 v945);
              False -> Nothing
              }
          }
      };
  
  getCriticalPairs v297 v298
    = append (selfCriticalPairs v297 v298) (concatMap (duoCriticalPairs v297 v298) v297);
  
  simplifyRules v299 v300 v301
    = case
      (reduceSplit v299 v300 v301) of
      {
      Pair v947 v948 ->
        Pair v947 (uniqueRules (map (normRhs (Cons v300 v948)) (Cons v300 v948)))
      };
  
  normRhs v302 v303 = case v303 of
      {
      Pair v949 v950 ->
        Pair v949 (norm v302 v950)
      };
  
  simplifyEquations v306 v307 v308
    = filter (non (uncurry equalTerms)) (uniqueRules (map (normEqn v307) v308));
  
  normEqn v309 v310 = case v310 of
      {
      Pair v951 v952 ->
        Pair (norm v309 v951) (norm v309 v952)
      };
  
  reduceSplit v313 v314 v315
    = case v315 of {
      Nil -> Pair Nil Nil;
      Cons v953 v954 -> case v953 of {
          Pair v955 v956 -> let {
              v959 = reduce (Cons v314 Nil) v955
              } in (case
                (reduceSplit v313 v314 v954) of
                {
                Pair v957 v958 -> case
                    (dis (null v959) (reducible (Cons (Pair v955 v956) Nil) (left v314)))
                  of {
                    True ->
                      Pair v957 (Cons (Pair v955 v956) v958);
                    False ->
                      Pair (Cons (Pair (head v959) v956) v957) v958
                    }
                })
          }
      };
  
  selfCriticalPairs v320 v321
    = case v321 of {
      Pair v960 v961 ->
        criticalPairs v320 False (Pair v960 v961) (rename (Pair v960 v961))
      };
  
  duoCriticalPairs v324 v325 v326
    = case v325 of {
      Pair v962 v963 -> case v326 of {
          Pair v964 v965 ->
            append (criticalPairs v324 True (Pair v962 v963) (Pair v964 v965)) (criticalPairs v324 False (Pair v964 v965) (Pair v962 v963))
          }
      };
  
  criticalPairs v331 v332 v333 v334
    = case v333 of {
      Pair v966 v967 -> case v334 of {
          Pair v968 v969 ->
            concatMap (criticalPairsAt v331 (Pair v966 v967) (Pair v968 v969)) (case
              v332 of {
              True -> positions v966;
              False ->
                filter (non null) (positions v966)
              })
          }
      };
  
  criticalPairsAt v339 v340 v341 v342
    = case v340 of {
      Pair v970 v971 -> case v341 of {
          Pair v972 v973 -> let {
              v975 = subterm v970 v342
              } in (case (isVar v975) of {
                True -> Nil;
                False -> case (unify v975 v972)
                  of {
                    Nothing -> Nil;
                    Just v974 ->
                      criticalPairsFrom (norm v339 (subst v974 v971)) (norm v339 (placeAt (subst v974 v973) v342 (subst v974 v970)))
                    }
                })
          }
      };
  
  criticalPairsFrom v347 v348
    = case (equalTerms v347 v348) of
      {
      True -> Nil;
      False ->
        Cons (Pair v347 v348) Nil
      };
  
  rename v349 = case v349 of {
      Pair v976 v977 -> let {
          v978 = vars v976;
          v979 = zip v978 (map Var (filter (non (flip (elemBy equalStrings) v978)) variables))
          } in
          (Pair (subst v979 v976) (subst v979 v977))
      };
  
  leq v352 v353 = (<=) v352 v353;
  
  eq v354 v355 = (==) v354 v355;
  
  kbGreaterThan v356 v357 v358
    = let {
      v980 = unionBy equalStrings (vars v357) (vars v358);
      v981 = termWeight v356 v357;
      v982 = termWeight v356 v358;
      v983 = map snd (varCounts v357 v980);
      v984 = map snd (varCounts v358 v980)
      } in
      (dis (con (not ((<=) v981 v982)) (compareAll leq v984 v983)) (con (con ((==) v981 v982) (compareAll eq v983 v984)) (dis (powerOf (last (funSequence v356)) v357 v358) (funcAfter v356 v357 v358))));
  
  termWeight v359 v360 = case v360
    of {
      Var v985 -> varWeight v359;
      Fun v986 v987 ->
        (+) (funWeight v359 v986) (sum (map (termWeight v359) v987))
      };
  
  powerOf v364 v365 v366 = case
      v365 of {
      Var v988 -> False;
      Fun v989 v990 -> case v990 of {
          Nil -> False;
          Cons v991 v992 ->
            con (con (isVar v366) (equalStrings v989 v364)) (con (null v992) (pow v364 v991))
          }
      };
  
  pow v372 v373 = case v373 of {
      Var v993 -> True;
      Fun v994 v995 -> case v995 of {
          Cons v996 v997 ->
            con (equalStrings v994 v372) (con (null v997) (pow v372 v996))
          }
      };
  
  funcAfter v379 v380 v381 = case
      v380 of {
      Var v998 -> case v381 of {
          Var v999 -> False;
          Fun v1000 v1001 -> False
          };
      Fun v1002 v1003 -> case v381 of
          {
          Var v1004 -> False;
          Fun v1005 v1006 -> case
              (equalStrings v1002 v1005) of {
              True ->
                orderLex (kbGreaterThan v379) v1003 v1006;
              False ->
                before (funSequence v379) v1005 v1002
              }
          }
      };
  
  compareAll v391 v392 v393
    = and (zipWith v391 v392 v393);
  
  varCounts v394 v395
    = foldr tally (zip v395 (repeat 0)) (concatMap (varAt v394) (positions v394));
  
  varAt v396 v397 = case
      (subterm v396 v397) of {
      Var v1007 -> Cons v1007 Nil;
      Fun v1008 v1009 -> Nil
      };
  
  tally v398 v399 = case v399 of {
      Nil -> Nil;
      Cons v1010 v1011 -> case v1010
        of {
          Pair v1012 v1013 -> case
              (equalStrings v398 v1012) of {
              True ->
                Cons (Pair v1012 (inc v1013)) v1011;
              False ->
                Cons (Pair v1012 v1013) (tally v398 v1011)
              }
          }
      };
  
  orderLex v404 v405 v406 = case
      v405 of {
      Nil -> case v406 of {
          Nil -> False;
          Cons v1014 v1015 -> False
          };
      Cons v1016 v1017 -> case v406 of
          {
          Nil -> False;
          Cons v1018 v1019 -> case
              (equalTerms v1016 v1018) of {
              True ->
                orderLex v404 v1017 v1019;
              False -> v404 v1016 v1018
              }
          }
      };
  
  before v413 v414 v415 = case
      v413 of {
      Cons v1020 v1021 ->
        dis (equalStrings v1020 v414) (con (not (equalStrings v1020 v415)) (before v1021 v414 v415))
      };
  
  showTerm v418 v419 = case v419
    of {
      Var v1022 -> v1022;
      Fun v1023 v1024 -> case
          (isInfix v418 v1023) of {
          True ->
            append (Cons 40 Nil) (append (showTerm v418 (elemAt v1024 0)) (append (Cons 32 Nil) (append v1023 (append (Cons 32 Nil) (append (showTerm v418 (elemAt v1024 1)) (Cons 41 Nil))))));
          False -> case (null v1024) of {
              True -> v1023;
              False ->
                append v1023 (append (Cons 40 Nil) (append (concatStrings (intersperse (Cons 44 Nil) (map (showTerm v418) v1024))) (Cons 41 Nil)))
              }
          }
      };
  
  showEqn v423 v424 = case v424 of
      {
      Pair v1025 v1026 ->
        append (showTerm v423 v1025) (append (Cons 32 (Cons 61 (Cons 32 Nil))) (showTerm v423 v1026))
      };
  
  showEqns v427 v428
    = unlines (map (showEqn v427) v428);
  
  showRule v429 v430 = case v430
    of {
      Pair v1027 v1028 ->
        append (showTerm v429 v1027) (append (Cons 32 (Cons 45 (Cons 62 (Cons 32 Nil)))) (showTerm v429 v1028))
      };
  
  showRules v433 v434
    = unlines (map (showRule v433) v434);
  
  left  = fst;
  
  right  = snd;
  
  uniqueRules  = nubBy equivPair;
  
  equivPair v435 v436 = case v435
    of {
      Pair v1029 v1030 -> case v436 of
          {
          Pair v1031 v1032 ->
            dis (con (equiv v1029 v1031) (equiv v1030 v1032)) (con (equiv v1029 v1032) (equiv v1030 v1031))
          }
      };
  
  unify v441 v442
    = unifyWith (Cons v441 Nil) (Cons v442 Nil) Nil;
  
  unifyWith v443 v444 v445 = case
      v443 of {
      Nil -> case v444 of {
          Nil -> Just v445
          };
      Cons v1033 v1034 -> case v1033
        of {
          Var v1035 -> case v444 of {
              Cons v1036 v1037 -> let {
                  v1038 = subst v445 v1036;
                  v1039 = subst v445 (Var v1035);
                  v1040 = unify v1039 v1038
                  } in (case
                    (equalTerms v1036 (Var v1035))
                  of {
                    True ->
                      unifyWith v1034 v1037 v445;
                    False -> case
                        (equalTerms v1039 (Var v1035))
                      of {
                        True -> case
                            (elemBy equalStrings v1035 (vars v1038))
                          of {
                            True -> Nothing;
                            False ->
                              unifyWith v1034 v1037 (substAdd (Cons (Pair v1035 v1038) Nil) v445)
                            };
                        False -> case (isJust v1040) of
                            {
                            True ->
                              unifyWith v1034 v1037 (substAdd (fromJust v1040) v445);
                            False -> Nothing
                            }
                        }
                    })
              };
          Fun v1041 v1042 -> case v444 of
              {
              Cons v1043 v1044 -> case v1043
                of {
                  Var v1045 ->
                    unifyWith (Cons (Var v1045) v1044) (Cons (Fun v1041 v1042) v1034) v445;
                  Fun v1046 v1047 -> case
                      (equalStrings v1041 v1046) of {
                      True ->
                        unifyWith (append v1042 v1034) (append v1047 v1044) v445;
                      False -> Nothing
                      }
                  }
              }
          }
      };
  
  substAdd v455 v456
    = append v455 (map (cross id (subst v455)) v456);
  
  match v457 v458
    = matchWith (Cons v457 Nil) (Cons v458 Nil) Nil;
  
  matchWith v459 v460 v461 = case
      v459 of {
      Nil -> case v460 of {
          Nil -> Just v461
          };
      Cons v1048 v1049 -> case v1048
        of {
          Var v1050 -> case v460 of {
              Cons v1051 v1052 -> case
                  (elemBy equalStrings v1050 (map fst v461))
                of {
                  True -> case
                      (equalTerms v1051 (subst v461 (Var v1050)))
                    of {
                      True ->
                        matchWith v1049 v1052 v461;
                      False -> Nothing
                      };
                  False ->
                    matchWith v1049 v1052 (Cons (Pair v1050 v1051) v461)
                  }
              };
          Fun v1053 v1054 -> case v460 of
              {
              Cons v1055 v1056 -> case v1055
                of {
                  Var v1057 -> Nothing;
                  Fun v1058 v1059 -> case
                      (equalStrings v1053 v1058) of {
                      True ->
                        matchWith (append v1054 v1049) (append v1059 v1056) v461;
                      False -> Nothing
                      }
                  }
              }
          }
      };
  
  normalForms v471 v472 = let {
      v1060 = reduce v471 v472
      } in (case (null v1060) of {
        True -> Cons v472 Nil;
        False ->
          concatMap (normalForms v471) v1060
        });
  
  norm v473 v474
    = head (normalForms v473 v474);
  
  reducible v475 v476
    = not (null (reduce v475 v476));
  
  reduce v477 v478
    = concatMap (reduceAt v477 v478) (positions v478);
  
  reduceAt v479 v480 v481 = case
      (isVar (subterm v480 v481)) of {
      True -> Nil;
      False ->
        concatMap (reduceAtWith v480 v481) v479
      };
  
  reduceAtWith v482 v483 v484
    = case v484 of {
      Pair v1061 v1062 -> case
          (match v1061 (subterm v482 v483))
        of {
          Nothing -> Nil;
          Just v1063 ->
            Cons (placeAt (subst v1063 v1062) v483 v482) Nil
          }
      };
  
  isVar v487 = case v487 of {
      Var v1064 -> True;
      Fun v1065 v1066 -> False
      };
  
  subst v491 v492 = case v492 of {
      Var v1067 -> case v491 of {
          Nil -> Var v1067;
          Cons v1068 v1069 -> case v1068
            of {
              Pair v1070 v1071 -> case
                  (equalStrings v1067 v1070) of {
                  True -> v1071;
                  False -> subst v1069 (Var v1067)
                  }
              }
          };
      Fun v1072 v1073 ->
        Fun v1072 (map (subst v491) v1073)
      };
  
  equalTerms v496 v497 = case v496
    of {
      Var v1074 -> case v497 of {
          Var v1075 ->
            equalStrings v1074 v1075;
          Fun v1076 v1077 -> False
          };
      Fun v1078 v1079 -> case v497 of
          {
          Var v1080 -> False;
          Fun v1081 v1082 ->
            con (equalStrings v1078 v1081) (and (zipWith equalTerms v1079 v1082))
          }
      };
  
  applyToIndex v507 v508 v509
    = case v509 of {
      Cons v1083 v1084 -> case
          ((==) v508 0) of {
          True -> Cons (v507 v1083) v1084;
          False ->
            Cons v1083 (applyToIndex v507 (dec v508) v1084)
          }
      };
  
  equiv v512 v513
    = con (isJust (match v512 v513)) (isJust (match v513 v512));
  
  subterm v514 v515 = case v515 of
      {
      Nil -> v514;
      Cons v1085 v1086 -> case v514 of
          {
          Fun v1087 v1088 ->
            subterm (elemAt v1088 (dec v1085)) v1086
          }
      };
  
  placeAt v518 v519 v520 = case
      v519 of {
      Nil -> v518;
      Cons v1089 v1090 -> case v520 of
          {
          Fun v1091 v1092 ->
            Fun v1091 (applyToIndex (placeAt v518 v1090) (dec v1089) v1092)
          }
      };
  
  vars v523 = case v523 of {
      Var v1093 -> Cons v1093 Nil;
      Fun v1094 v1095 ->
        foldr (unionBy equalStrings) Nil (map vars v1095)
      };
  
  positions v527 = case v527 of {
      Var v1096 -> Cons Nil Nil;
      Fun v1097 v1098 ->
        Cons Nil (concatMap (argPositions v1098) (enumFromTo 1 (length v1098)))
      };
  
  argPositions v531 v532
    = map (Cons v532) (positions (elemAt v531 (dec v532)));
  
  variables  = let {
      v1099 = Cons Nil (concatMap variations v1099)
      } in (tail v1099);
  
  variations v533
    = map (flip Cons v533) (Cons 65 (Cons 66 (Cons 67 (Cons 68 (Cons 69 (Cons 70 (Cons 71 (Cons 72 (Cons 73 (Cons 74 (Cons 75 (Cons 76 (Cons 77 (Cons 78 (Cons 79 (Cons 80 (Cons 81 (Cons 82 (Cons 83 (Cons 84 (Cons 85 (Cons 86 (Cons 87 (Cons 88 (Cons 89 (Cons 90 Nil))))))))))))))))))))))))))
}
