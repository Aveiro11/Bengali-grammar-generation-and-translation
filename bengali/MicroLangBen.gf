--# -path=.:../abstract
concrete MicroLangBen of MicroLang = open MicroResBen, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  lincat
    Utt = {s : Str} ;
    
    S  = {s : Str} ;
    VP = {verb : Verb ; compl : Str} ; ---s special case of Mini
    Comp = {s : Str} ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Case => Str ; a : Agreement} ;
    Pron = {s : Case => Str ; a : Agreement} ;
    Det = {s : Str ; n : Number} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    Adv = {s : Str} ;

  lin
    UttS s = s ;
    UttNP np = {s = np.s ! Acc} ;

    PredVPS np vp = {
      s = np.s ! Nom ++ vp.verb.s ! agr2vform np.a ++ vp.compl
      } ;
      
    UseV v = {
      verb = v ;
      compl = [] ;
      } ;
      
    ComplV2 v2 np = {
      verb = v2 ;
      compl = v2.c ++ np.s ! Acc  -- NP object in the accusative, preposition first
      } ;
      
    UseComp comp = {
      verb = be_Verb ;     -- the verb is the copula "be"
      compl = comp.s
      } ;
      
    CompAP ap = ap ;
      
    AdvVP vp adv =
      vp ** {compl = vp.compl ++ adv.s} ;
      
    DetCN det cn = {
      s = \\c => det.s ++ cn.s ! det.n ;
      a = Agr det.n ;
      } ;
      
    UsePron p = p ;
            
    a_Det = {s = pre {"a"|"e"|"i"|"o" => "an" ; _ => "a"} ; n = Sg} ; --- a/an can get wrong
    aPl_Det = {s = "" ; n = Pl} ;
    the_Det = {s = "the" ; n = Sg} ;
    thePl_Det = {s = "the" ; n = Pl} ;
    
    UseN n = n ;
    
    AdjCN ap cn = {
      s = table {n => ap.s ++ cn.s ! n}
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    in_Prep = {s = "in"} ;
    on_Prep = {s = "on"} ;
    with_Prep = {s = "with"} ;

    he_Pron = {
      s = table {Nom => "he" ; Acc => "him"} ;
      a = Agr Sg ;
      } ;
    she_Pron = {
      s = table {Nom => "she" ; Acc => "her"} ;
      a = Agr Sg ;
      } ;
    they_Pron = {
      s = table {Nom => "they" ; Acc => "them"} ;
      a = Agr Pl ;
      } ;

-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

lin already_Adv = mkAdv "ইতিমধ্যে" ;
lin animal_N = mkN "প্রাণী" ;
lin apple_N = mkN "আপেল" ;
lin baby_N = mkN "শিশু" ;
lin bad_A = mkA "খারাপ" ;
lin beer_N = mkN "বিয়ার" ;
lin big_A = mkA "বড়" ;
lin bike_N = mkN "সাইকেল" ;
lin bird_N = mkN "পাখি" ;
lin black_A = mkA "কালো" ;
lin blood_N = mkN "রক্ত" ;
lin blue_A = mkA "নীল" ;
lin boat_N = mkN "নৌকা" ;
lin book_N = mkN "বই" ;
lin boy_N = mkN "ছেলে" ;
lin bread_N = mkN "রুটি" ;
lin break_V2 = mkV2 (mkV "ভাঙা" "ভাঙে" "ভেঙেছিল" "ভাঙো") ;
lin buy_V2 = mkV2 (mkV "কেনা" "কেনে" "কিনেছিল" "কেনো") ;
lin car_N = mkN "গাড়ি" ;
lin cat_N = mkN "বিড়াল" ;
lin child_N = mkN "শিশু" ;
lin city_N = mkN "শহর" ;
lin clean_A = mkA "পরিষ্কার" ;
lin clever_A = mkA "চালাক" ;
lin cloud_N = mkN "মেঘ" ;
lin cold_A = mkA "ঠান্ডা" ;
lin come_V = mkV "আসা" "আসে" "এসেছিল" "আসো" ;
lin computer_N = mkN "কম্পিউটার" ;
lin cow_N = mkN "গরু" ;
lin dirty_A = mkA "নোংরা" ;
lin dog_N = mkN "কুকুর" ;
lin drink_V2 = mkV2 (mkV "পান করা" "পান করে" "পান করেছিল" "পান করো") ;
lin eat_V2 = mkV2 (mkV "খাওয়া" "খায়" "খেয়েছিল" "খাও") ;
lin find_V2 = mkV2 (mkV "খোঁজা" "খোঁজে" "খুঁজেছিল" "খোঁজো") ;
lin fire_N = mkN "আগুন" ;
lin fish_N = mkN "মাছ" ;
lin flower_N = mkN "ফুল" ;
lin friend_N = mkN "বন্ধু" ;
lin girl_N = mkN "মেয়ে" ;
lin good_A = mkA "ভালো" ;
lin go_V = mkV "যাওয়া" "যায়" "গিয়েছিল" "যাও" ;
lin grammar_N = mkN "ব্যাকরণ" ;
lin green_A = mkA "সবুজ" ;
lin heavy_A = mkA "ভারী" ;
lin horse_N = mkN "ঘোড়া" ;
lin hot_A = mkA "গরম" ;
lin house_N = mkN "বাড়ি" ;
lin jump_V = mkV "লাফানো" "লাফায়" "লাফিয়েছিল" "লাফাও" ;
lin kill_V2 = mkV2 (mkV "মারা" "মারে" "মেরেছিল" "মারো") ;
lin language_N = mkN "ভাষা" ;
lin live_V = mkV "বাঁচা" "বাঁচে" "বেঁচেছিল" "বাঁচো" ;
lin love_V2 = mkV2 (mkV "ভালোবাসা" "ভালোবাসে" "ভালোবেসেছিল" "ভালোবাসো") ;
lin man_N = mkN "মানুষ" ;
lin milk_N = mkN "দুধ" ;
lin music_N = mkN "সংগীত" ;
lin new_A = mkA "নতুন" ;
lin now_Adv = mkAdv "এখন" ;
lin old_A = mkA "পুরনো" ;
lin play_V = mkV "খেলা" "খেলে" "খেলেছিল" "খেলো" ;
lin read_V2 = mkV2 (mkV "পড়া" "পড়ে" "পড়েছিল" "পড়ো") ;
lin ready_A = mkA "প্রস্তুত" ;
lin red_A = mkA "লাল" ;
lin river_N = mkN "নদী" ;
lin run_V = mkV "দৌড়ানো" "দৌড়ায়" "দৌড়েছিল" "দৌড়াও" ;
lin sea_N = mkN "সমুদ্র" ;
lin see_V2 = mkV2 (mkV "দেখা" "দেখে" "দেখেছিল" "দেখো") ;
lin ship_N = mkN "জাহাজ" ;
lin sleep_V = mkV "ঘুমানো" "ঘুমায়" "ঘুমিয়েছিল" "ঘুমাও" ;
lin small_A = mkA "ছোট" ;
lin star_N = mkN "তারা" ;
lin swim_V = mkV "সাঁতরানো" "সাঁতরায়" "সাঁতরেছিল" "সাঁতরাও" ;
lin teach_V2 = mkV2 (mkV "শেখানো" "শেখায়" "শিখিয়েছিল" "শেখাও") ;
lin train_N = mkN "ট্রেন" ;
lin travel_V = mkV "ভ্রমণ করা" "ভ্রমণ করে" "ভ্রমণ করেছিল" "ভ্রমণ করো" ;
lin tree_N = mkN "গাছ" ;
lin understand_V2 = mkV2 (mkV "বোঝা" "বোঝে" "বুঝেছিল" "বোঝো") ;
lin wait_V2 = mkV2 "অপেক্ষা করা" "এর জন্য" ;
lin walk_V = mkV "হাঁটা" "হাঁটে" "হেঁটেছিল" "হাঁটো" ;
lin warm_A = mkA "উষ্ণ" ;
lin water_N = mkN "পানি" ;
lin white_A = mkA "সাদা" ;
lin wine_N = mkN "মদ" ;
lin woman_N = mkN "মহিলা" ;
lin yellow_A = mkA "হলুদ" ;
lin young_A = mkA "তরুণ" ;

---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartNoun n) ;
    mkN : Str -> Str -> Noun  -- irregular noun, e.g. man-men
      = \sg,pl -> lin N (mkNoun sg pl) ;
    } ;

  mkA : Str -> A
    = \s -> lin A {s = s} ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. play-plays, cry-cries, wash-washes
      = \s -> lin V (smartVerb s) ;
    mkV : (inf,pres,part : Str) -> V  -- irregular verb, e.g. drink-drank-drunk
      = \inf,pres,part -> lin V (irregVerb inf pres part) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "wash"
      = \s   -> lin V2 (smartVerb s ** {c = []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition, e.g. "wait - for"
      = \s,p -> lin V2 (smartVerb s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. "drink"
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
  mkPrep : Str -> Prep
    = \s -> lin Prep {s = s} ;

}
