LuaR  �

             @ e   
@�� @ e@  
@ � @ e�  
@�� @ e�  
@ � @ e  
@�� �    	   c9990313    initial_effect 	   rmfilter 
   condition    target 
   operation       -    	u   L @ ]@ F@@ G�� �   �   A@ �@FA GA���A ��A� ]@�F B G@� �   ]� ��� �B �@�� � AC �@���� �C FD A�@��@D  � �@�� B �@B�   �� ̀CF�C �D M���@�̀BF�B ��D M���@�� CF�D �@�� EFAE G���@���EeA  �@��@D @ �@�� B �@�   ݀ ����B A����F �D ��A�A���F A����F A����  A�AD ��A�B AB@  � LAGƁG ]A�L�B��B �G ��]A�LC�H ]A�LAH�� ]A�LE�AE ǁ�]A�L�H�AE ��]A�L�E�AE �A�]A�LAD � ]A� � &      EnableReviveLimit    aux    AddSynchroProcedure 	   NonTuner    Card    IsAttribute    ATTRIBUTE_DARK        @   Effect    CreateEffect    SetType    EFFECT_TYPE_SINGLE    SetCode    EFFECT_CANNOT_DISABLE_SPSUMMON    SetProperty    EFFECT_FLAG_CANNOT_DISABLE    EFFECT_FLAG_UNCOPYABLE    RegisterEffect    EFFECT_TYPE_CONTINUOUS    EVENT_SPSUMMON_SUCCESS    SetCondition 	   c9990313 
   condition    SetOperation    EFFECT_FLAG_SINGLE_RANGE 	   SetRange    LOCATION_MZONE    EFFECT_IMMUNE_EFFECT 	   SetValue    SetCategory    CATEGORY_REMOVE    EFFECT_TYPE_TRIGGER_O    EVENT_BATTLE_START    SetCountLimit       �?
   SetTarget    target 
   operation           
   L @ �@@ ]��[   � �L�@ ��@ ]��_   �       IsRace 
   RACE_WYRM    IsType    TYPE_PENDULUM             @$ 
                                       c     
         _ENV           @ � B@��  ��  A AC �� ��A ���  A� ��B   � 	      GetHandler    RegisterFlagEffect     cA     �A   EFFECT_FLAG_CLIENT_HINT       �?           aux 	   Stringid             @$                                                       e           tp           eg           ep           ev           re           r           rp              _ENV    !       � � A@ F�@ A����   � �� � �  ����� �� � AAA ݀��@  � �̀AAA ݀��   �       IsActiveType    TYPE_SPELL 
   TYPE_TRAP    GetHandler    IsLevelBelow       "@   IsRankBelow             @$                                                                   !         e           te           rc             _ENV         @$ u                                                                           	   	   	   	   	   
   
   
                                                                                                                                             !      "   "   "   $   $   $   $   %   %   %   &   &   &   &   &   '   '   '   (   (   (   )   )   )   )   *   *   *   *   +   +   +   +   ,   ,   ,   -         c     u      e1    u      succ $   u      e2 ?   u      e3 W   u         _ENV .   1       L @ ]� [   ��L@@ ƀ@ ]��[   @�L�@ ]� [@  ��L A �@ ]��[@  @�L�A �@ ]��@ �C@  C � _   �       IsAbleToRemove    IsLocation    LOCATION_MZONE    IsFacedown    IsLevelBelow       "@   IsRankBelow             @$    /   /   /   /   /   /   /   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1         c              _ENV 2   4    
   @ � B@� F�@ X@  �B  �   �       GetHandler    GetSummonType    SUMMON_TYPE_SYNCHRO             @$    3   3   3   3   3   3   3   3   3   3   4         e           tp           eg           ep           ev           re           r           rp              _ENV 5   8   	     @��FB@ G����@ �A�� CA FCA �� �  ^�_  FB@ G���  �B   A� �CA �CA ]B� � 	              Duel    IsExistingMatchingCard 	   c9990313 	   rmfilter    LOCATION_ONFIELD       �?   SetOperationInfo    CATEGORY_REMOVE             @$    6   6   6   6   6   6   6   6   6   6   6   6   6   7   7   7   7   7   7   7   7   7   8   	      e           tp           eg           ep           ev           re           r           rp           chk              _ENV 9   ?    "   @ B@F�@ �� ��@ B @ A@� �BA ��A�� �A F�A � �   ��LBB]� ��  � � F@ G��� ]B F@ G�� �BC �C ]B  �       Duel    Hint    HINT_SELECTMSG    HINTMSG_REMOVE    SelectMatchingCard 	   c9990313 	   rmfilter    LOCATION_ONFIELD       �?	   GetCount            HintSelection    Remove    POS_FACEUP    REASON_EFFECT             @$ "   :   :   :   :   :   :   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   <   <   <   <   <   =   =   =   =   >   >   >   >   >   >   ?   	      e     "      tp     "      eg     "      ep     "      ev     "      re     "      r     "      rp     "      sg    "         _ENV        @$       -      .   1   .   2   4   2   5   8   5   9   ?   9   ?             _ENV 