LuaR  �

             @ e   
@�� @ e@  
@ � @ e�  
@�� @ e�  
@ � @ e  
@�� @ e@ 
@ � �    	   c9990308    initial_effect    atkop 
   condition    target 
   operation    reptg       !    c   L @ �@  ]@�F�@ G�� �   �   �@ AD  � AA ]@�L�A ]@ F�A G � �   ]� �@� �B F�B A�@�� � AC �@���� A �@���� D �@��@� �D �D�@�� E  � �@���A � B�   �� �@BFAE �@�� CFAC �@���CF�E �@���EA �AF ����@ ��FF�D G��@��@GF�D G���@��@DF�D G���@�� E @ �@���A � �   ݀ A��H �AH ��A�����H A����I A���AC A�A���D �AIA�E ��A� � &      EnableCounterPermit       6@   aux    AddSynchroProcedure 	   NonTuner       �?   EnableReviveLimit    Effect    CreateEffect    SetType    EFFECT_TYPE_FIELD    EFFECT_TYPE_TRIGGER_O 	   SetRange    LOCATION_MZONE    SetCountLimit    SetCode    EVENT_ATTACK_ANNOUNCE    SetOperation 	   c9990308    atkop    RegisterEffect    EFFECT_TYPE_QUICK_O    EVENT_FREE_CHAIN    SetHintTiming            TIMING_MAIN_END       |@   SetCondition 
   condition 
   SetTarget    target 
   operation    EFFECT_TYPE_SINGLE    EFFECT_TYPE_CONTINUOUS    EFFECT_DESTROY_REPLACE    SetProperty    EFFECT_FLAG_SINGLE_RANGE    reptg             @$ c                                                            	   	   	   	   	   
   
   
                                                                                                                                                                                                                           !         c     c      e1    c      e2 ,   c      e3 M   c         _ENV "   $       @ B@��   ���@ � �@�A ������ B  �       Duel    NegateAttack    GetHandler    AddCounter    COUNTER_NEED_ENABLE       6@       @            @$    #   #   #   #   #   #   #   #   #   #   #   #   $         e           tp           eg           ep           ev           re           r           rp              _ENV %   '       @ B@�� F�@ X@@�@ B@�� F�@ @��A � BA�� ��X�A  �B  �   �       Duel    GetCurrentPhase    PHASE_MAIN1    PHASE_MAIN2    GetHandler    GetFlagEffect    �cA                    @$    &   &   &   &   &   &   &   &   &   &   &   &   &   &   &   &   &   &   &   &   &   &   '         e           tp           eg           ep           ev           re           r           rp              _ENV (   E   	   L@ ]� LB��� �  A�  �A ]� [  ��FBA G���� ��  �  A�  ��A ]� �@ �� �B@ � A�  � �A �� �@ ݂ �B�@� ��  �C A ݂ �  @��BA ǂ��B C@� �C �� �  D  ݂��  �  \�  �@��   ������ ��   ���@C@�D�� �D   � � �  �  \�  �@��   ������ ��   ���E �   �FEA G��
�� �D �E�� AF ݅�D FDA� ��  ��FD GF��� � ]�]�  ��
 �  @��B  ��FEA G��
�� �D �E�� AF ݅�D FDA� ��  �]�  ��
 �[   ��B  ��FEA G��
�� �D �E�� AF ݅�D FDA� � �]�  ��
 B
��E @��  @�[B  ��FEA G��
�� �D �E�� A�  ݅�D FDA� � �]�  �
@�[  ���B   ��B  ��FEA G��
�� �D �E�� AF ��]�  ��
 ��  ��[B   ��B  ��FEA G��
�� �D �E�� A�  ��]�  �
���  @�[B  ���B  @�FEA G��
�� �D �E�� A ��]�  E�
 B
��L�D �E ]E�LEE ƅE ]E�FEA G��
�E��]E FEA G�
�E ]E FEA G��
�E ƅE   AF �F���F ]E�@�@B
��LEE ��F ]E�FEA G��
�E ��F FA GF�B G��� �F � D  � A�  �F �F ]E�L@ ]� LE�
�� �  @ 
�A ]E L�G � 
]E�L@ ]� L��
�� H AF ��  ]E  � !      GetHandler    IsCanRemoveCounter       6@      �?   REASON_COST    Duel    CheckRemoveOverlayCard    REASON_EFFECT        @      @   IsExistingMatchingCard    Card    IsDestructable               (@   SelectOption    aux 	   Stringid    �cA   SetProperty    EFFECT_FLAG_PLAYER_TARGET    SetCategory    CATEGORY_DAMAGE    SetTargetPlayer    SetTargetParam      @�@   SetOperationInfo    CATEGORY_DESTROY    GetMatchingGroup    RemoveCounter 	   SetLabel    RegisterFlagEffect    RESET_CHAIN             @$   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   +   +   +   +   +   +   +   +   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   ,   -   -   -   -   -   -   -   -   -   -   -   -   -   -   .   .   .   .   .   .   .   .   /   /   /   /   /   /   /   /   /   /   /   /   /   /   0   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   4   4   4   4   4   4   4   4   4   4   4   4   4   4   4   4   4   4   4   4   5   5   5   5   5   5   5   5   5   5   5   5   5   5   5   5   5   6   6   6   6   6   6   6   6   6   6   6   6   6   6   6   6   6   7   7   7   7   7   7   7   7   7   7   7   7   7   7   7   7   8   8   9   9   9   :   :   :   ;   ;   ;   ;   <   <   <   <   =   =   =   =   =   =   =   =   =   =   >   >   ?   ?   ?   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   B   B   B   B   B   B   B   B   C   C   C   D   D   D   D   D   D   D   D   E         e          tp          eg          ep          ev          re          r          rp          chk          v1 .        v2 .        v3 .        v12 <        v13 <        v23 <        v123 <        v12 R        v13 R        v23 R        v123 R        sel S           _ENV F   Y    k   @ � @@��F�@ G���A �BA�� � A� �  �� D  F�A ]������ @B@ � � ������ @@@ �@� ���@ ��B�C  � AC �B ��� � AC  �C  �  �� ����@ ��CƂB �B ��B �D�� �BD � AC  �C  ��A �B ���D �F�@ G���B �E CE ]� Ƃ@ ǂ� �@ ��A �B ���E@�F�@ G���A �F�� C AC �  ]� ���� X@B ���@ ��B�C  � F�F �B ��� � AC  �C  �  �� Ƃ@ ���  �B Ƃ@ ���  F�A �B� �    	   GetLabel       �?   Duel    GetMatchingGroup    Card    CheckRemoveOverlayCard       @   REASON_EFFECT 	   GetCount            rg    Hint    HINT_SELECTMSG      ��@   Select    HintSelection 	   GetFirst    RemoveOverlayCard        @   GetChainInfo    CHAININFO_TARGET_PLAYER    CHAININFO_TARGET_PARAM    Damage       @   IsDestructable       (@   HINTMSG_DESTROY    Destroy             @$ k   G   G   H   H   I   I   I   I   I   I   I   I   I   I   I   I   J   J   J   J   J   J   J   J   J   J   J   J   K   K   K   K   K   K   L   L   L   L   L   L   L   M   M   M   M   O   O   O   O   O   O   O   O   O   O   P   P   Q   Q   Q   Q   Q   Q   R   R   R   R   R   R   R   S   S   T   T   T   T   T   T   T   T   T   U   U   U   U   U   U   U   U   U   U   V   V   V   V   V   V   V   V   V   V   V   V   V   V   V   Y         e     k      tp     k      eg     k      ep     k      ev     k      re     k      r     k      rp     k      sel    k      sg    6      p ?   E      d ?   E      sg Q   j      rg a   j         _ENV Z   ^   	     @ �LB@ ]� L���� �  A �CA ^ _  LB@ ]� L���� �  A �CA ]B C� _  �               GetHandler    IsCanRemoveCounter       6@      �?   REASON_EFFECT    RemoveCounter             @$    [   [   [   [   [   [   [   [   [   [   [   \   \   \   \   \   \   \   \   ]   ]   ^   	      e           tp           eg           ep           ev           re           r           rp           chk              _ENV        @$       !      "   $   "   %   '   %   (   E   (   F   Y   F   Z   ^   Z   ^             _ENV 