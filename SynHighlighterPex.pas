{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

Code template generated with SynGen.
The original code is: D:\Dev\Projets\Fallout4Translator\SynHighlighterPex.pas, released 2016-05-29.
Description: Syntax Parser/Highlighter
The initial author of this file is stef.
Copyright (c) 2016, all rights reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

-------------------------------------------------------------------------------}

{$IFNDEF QSYNHIGHLIGHTERPEX}
unit SynHighlighterPex;
{$ENDIF}

{$I SynEdit.inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynEditTypes,
  QSynEditHighlighter,
  QSynUnicode,
{$ELSE}
  Graphics,
  SynEditTypes,
  SynEditHighlighter,
  SynUnicode,
{$ENDIF}
  SysUtils,
  Classes;

type
  TtkTokenKind = (
    tkComment2,
    tkComment3,
    tkIdentifier,
    tkKey,
    tkNull,
    tkPapyrus,
    tkSpace,
    tkString,
    tkUnknown,
    tkword0,
    tkword2,
    tkword3);

  TRangeState = (rsUnKnown, rsBracket2Comment, rsBracketComment, rsString);

  TProcTableProc = procedure of object;

  PIdentFuncTableFunc = ^TIdentFuncTableFunc;
  TIdentFuncTableFunc = function (Index: Integer): TtkTokenKind of object;

type
  TSynSampleSyn = class(TSynCustomHighlighter)
  private
    fRange: TRangeState;
    fTokenID: TtkTokenKind;
    fIdentFuncTable: array[0..23268] of TIdentFuncTableFunc;
    fComment2Attri: TSynHighlighterAttributes;
    fComment3Attri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fKeyAttri: TSynHighlighterAttributes;
    fPapyrusAttri: TSynHighlighterAttributes;
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fword0Attri: TSynHighlighterAttributes;
    fword2Attri: TSynHighlighterAttributes;
    fword3Attri: TSynHighlighterAttributes;
    function HashKey(Str: PWideChar): Cardinal;
    function Func95fo4(Index: Integer): TtkTokenKind;
    function FuncAbs(Index: Integer): TtkTokenKind;
    function FuncAcos(Index: Integer): TtkTokenKind;
    function FuncAction(Index: Integer): TtkTokenKind;
    function FuncActivate(Index: Integer): TtkTokenKind;
    function FuncActivator(Index: Integer): TtkTokenKind;
    function FuncActivemagiceffect(Index: Integer): TtkTokenKind;
    function FuncActor(Index: Integer): TtkTokenKind;
    function FuncActorbase(Index: Integer): TtkTokenKind;
    function FuncAdd(Index: Integer): TtkTokenKind;
    function FuncAddachievement(Index: Integer): TtkTokenKind;
    function FuncAdddependentanimatedobjectreference(Index: Integer): TtkTokenKind;
    function FuncAddform(Index: Integer): TtkTokenKind;
    function FuncAddhavokballandsocketconstraint(Index: Integer): TtkTokenKind;
    function FuncAddinventoryeventfilter(Index: Integer): TtkTokenKind;
    function FuncAdditem(Index: Integer): TtkTokenKind;
    function FuncAddperk(Index: Integer): TtkTokenKind;
    function FuncAddshout(Index: Integer): TtkTokenKind;
    function FuncAddspell(Index: Integer): TtkTokenKind;
    function FuncAddtextreplacementdata(Index: Integer): TtkTokenKind;
    function FuncAddtofaction(Index: Integer): TtkTokenKind;
    function FuncAddtomap(Index: Integer): TtkTokenKind;
    function FuncAdvanceskill(Index: Integer): TtkTokenKind;
    function FuncAlias(Index: Integer): TtkTokenKind;
    function FuncAllowbleedoutdialogue(Index: Integer): TtkTokenKind;
    function FuncAllowpcdialogue(Index: Integer): TtkTokenKind;
    function FuncAmmo(Index: Integer): TtkTokenKind;
    function FuncApparatus(Index: Integer): TtkTokenKind;
    function FuncApply(Index: Integer): TtkTokenKind;
    function FuncApplycrossfade(Index: Integer): TtkTokenKind;
    function FuncApplyhavokimpulse(Index: Integer): TtkTokenKind;
    function FuncArmor(Index: Integer): TtkTokenKind;
    function FuncAs(Index: Integer): TtkTokenKind;
    function FuncAsin(Index: Integer): TtkTokenKind;
    function FuncAssociationtype(Index: Integer): TtkTokenKind;
    function FuncAtan(Index: Integer): TtkTokenKind;
    function FuncAttachashpile(Index: Integer): TtkTokenKind;
    function FuncAuto(Index: Integer): TtkTokenKind;
    function FuncAutoreadonly(Index: Integer): TtkTokenKind;
    function FuncAutostatename(Index: Integer): TtkTokenKind;
    function FuncAutovarname(Index: Integer): TtkTokenKind;
    function FuncBlockactivation(Index: Integer): TtkTokenKind;
    function FuncBook(Index: Integer): TtkTokenKind;
    function FuncBool(Index: Integer): TtkTokenKind;
    function FuncCalculateencounterlevel(Index: Integer): TtkTokenKind;
    function FuncCalculatefavorcost(Index: Integer): TtkTokenKind;
    function FuncCanfasttraveltomarker(Index: Integer): TtkTokenKind;
    function FuncCanpaycrimegold(Index: Integer): TtkTokenKind;
    function FuncCaptureframerate(Index: Integer): TtkTokenKind;
    function FuncCast(Index: Integer): TtkTokenKind;
    function FuncCeiling(Index: Integer): TtkTokenKind;
    function FuncCell(Index: Integer): TtkTokenKind;
    function FuncCenteroncell(Index: Integer): TtkTokenKind;
    function FuncCenteroncellandwait(Index: Integer): TtkTokenKind;
    function FuncClass(Index: Integer): TtkTokenKind;
    function FuncClear(Index: Integer): TtkTokenKind;
    function FuncCleararrested(Index: Integer): TtkTokenKind;
    function FuncCleardestruction(Index: Integer): TtkTokenKind;
    function FuncClearextraarrows(Index: Integer): TtkTokenKind;
    function FuncClearforcedmovement(Index: Integer): TtkTokenKind;
    function FuncClearkeepoffsetfromactor(Index: Integer): TtkTokenKind;
    function FuncClearlookat(Index: Integer): TtkTokenKind;
    function FuncClearprison(Index: Integer): TtkTokenKind;
    function FuncCleartempeffects(Index: Integer): TtkTokenKind;
    function FuncCloseuserlog(Index: Integer): TtkTokenKind;
    function FuncCompleteallobjectives(Index: Integer): TtkTokenKind;
    function FuncCompletequest(Index: Integer): TtkTokenKind;
    function FuncComputer(Index: Integer): TtkTokenKind;
    function FuncConditional(Index: Integer): TtkTokenKind;
    function FuncConstructibleobject(Index: Integer): TtkTokenKind;
    function FuncContainer(Index: Integer): TtkTokenKind;
    function FuncCos(Index: Integer): TtkTokenKind;
    function FuncCreatedetectionevent(Index: Integer): TtkTokenKind;
    function FuncDamageactorvalue(Index: Integer): TtkTokenKind;
    function FuncDamageav(Index: Integer): TtkTokenKind;
    function FuncDamageobject(Index: Integer): TtkTokenKind;
    function FuncDbsendplayerposition(Index: Integer): TtkTokenKind;
    function FuncDebug(Index: Integer): TtkTokenKind;
    function FuncDebugchannelnotify(Index: Integer): TtkTokenKind;
    function FuncDebugtablecount(Index: Integer): TtkTokenKind;
    function FuncDegreestoradians(Index: Integer): TtkTokenKind;
    function FuncDelete(Index: Integer): TtkTokenKind;
    function FuncDeletewhenable(Index: Integer): TtkTokenKind;
    function FuncDisable(Index: Integer): TtkTokenKind;
    function FuncDisablenowait(Index: Integer): TtkTokenKind;
    function FuncDisableplayercontrols(Index: Integer): TtkTokenKind;
    function FuncDispel(Index: Integer): TtkTokenKind;
    function FuncDispelallspells(Index: Integer): TtkTokenKind;
    function FuncDispelspell(Index: Integer): TtkTokenKind;
    function FuncDocombatspellapply(Index: Integer): TtkTokenKind;
    function FuncDoor(Index: Integer): TtkTokenKind;
    function FuncDropobject(Index: Integer): TtkTokenKind;
    function FuncDumpaliasdata(Index: Integer): TtkTokenKind;
    function FuncEffectshader(Index: Integer): TtkTokenKind;
    function FuncEnable(Index: Integer): TtkTokenKind;
    function FuncEnableai(Index: Integer): TtkTokenKind;
    function FuncEnablefasttravel(Index: Integer): TtkTokenKind;
    function FuncEnablenowait(Index: Integer): TtkTokenKind;
    function FuncEnableplayercontrols(Index: Integer): TtkTokenKind;
    function FuncEnchantment(Index: Integer): TtkTokenKind;
    function FuncEncounterzone(Index: Integer): TtkTokenKind;
    function FuncEndframeratecapture(Index: Integer): TtkTokenKind;
    function FuncEndfunction(Index: Integer): TtkTokenKind;
    function FuncEndproperty(Index: Integer): TtkTokenKind;
    function FuncEndstate(Index: Integer): TtkTokenKind;
    function FuncEquipitem(Index: Integer): TtkTokenKind;
    function FuncEquipshout(Index: Integer): TtkTokenKind;
    function FuncEquipspell(Index: Integer): TtkTokenKind;
    function FuncEvaluatepackage(Index: Integer): TtkTokenKind;
    function FuncExplosion(Index: Integer): TtkTokenKind;
    function FuncExtends(Index: Integer): TtkTokenKind;
    function FuncFaction(Index: Integer): TtkTokenKind;
    function FuncFadeoutgame(Index: Integer): TtkTokenKind;
    function FuncFailallobjectives(Index: Integer): TtkTokenKind;
    function FuncFalse(Index: Integer): TtkTokenKind;
    function FuncFasttravel(Index: Integer): TtkTokenKind;
    function FuncFind(Index: Integer): TtkTokenKind;
    function FuncFindclosestactor(Index: Integer): TtkTokenKind;
    function FuncFindclosestreferenceofanytypeinlist(Index: Integer): TtkTokenKind;
    function FuncFindclosestreferenceoftype(Index: Integer): TtkTokenKind;
    function FuncFindrandomactor(Index: Integer): TtkTokenKind;
    function FuncFindrandomreferenceofanytypeinlist(Index: Integer): TtkTokenKind;
    function FuncFindrandomreferenceoftype(Index: Integer): TtkTokenKind;
    function FuncFindstruct(Index: Integer): TtkTokenKind;
    function FuncFindweather(Index: Integer): TtkTokenKind;
    function FuncFire(Index: Integer): TtkTokenKind;
    function FuncFlags(Index: Integer): TtkTokenKind;
    function FuncFloat(Index: Integer): TtkTokenKind;
    function FuncFloor(Index: Integer): TtkTokenKind;
    function FuncFlora(Index: Integer): TtkTokenKind;
    function FuncForceactive(Index: Integer): TtkTokenKind;
    function FuncForceactorvalue(Index: Integer): TtkTokenKind;
    function FuncForceaddragdolltoworld(Index: Integer): TtkTokenKind;
    function FuncForceav(Index: Integer): TtkTokenKind;
    function FuncForcefirstperson(Index: Integer): TtkTokenKind;
    function FuncForcelocationto(Index: Integer): TtkTokenKind;
    function FuncForcemovementdirection(Index: Integer): TtkTokenKind;
    function FuncForcemovementdirectionramp(Index: Integer): TtkTokenKind;
    function FuncForcemovementrotationspeed(Index: Integer): TtkTokenKind;
    function FuncForcemovementrotationspeedramp(Index: Integer): TtkTokenKind;
    function FuncForcemovementspeed(Index: Integer): TtkTokenKind;
    function FuncForcemovementspeedramp(Index: Integer): TtkTokenKind;
    function FuncForcerefto(Index: Integer): TtkTokenKind;
    function FuncForceremoveragdollfromworld(Index: Integer): TtkTokenKind;
    function FuncForcestart(Index: Integer): TtkTokenKind;
    function FuncForcetargetangle(Index: Integer): TtkTokenKind;
    function FuncForcetargetdirection(Index: Integer): TtkTokenKind;
    function FuncForcetargetspeed(Index: Integer): TtkTokenKind;
    function FuncForcethirdperson(Index: Integer): TtkTokenKind;
    function FuncForm(Index: Integer): TtkTokenKind;
    function FuncFormlist(Index: Integer): TtkTokenKind;
    function FuncFunction(Index: Integer): TtkTokenKind;
    function FuncFunctions(Index: Integer): TtkTokenKind;
    function FuncFurniture(Index: Integer): TtkTokenKind;
    function FuncGame(Index: Integer): TtkTokenKind;
    function FuncGametimetostring(Index: Integer): TtkTokenKind;
    function FuncGet(Index: Integer): TtkTokenKind;
    function FuncGetactorbase(Index: Integer): TtkTokenKind;
    function FuncGetactorowner(Index: Integer): TtkTokenKind;
    function FuncGetactorreference(Index: Integer): TtkTokenKind;
    function FuncGetactorvalue(Index: Integer): TtkTokenKind;
    function FuncGetactorvaluepercentage(Index: Integer): TtkTokenKind;
    function FuncGetalias(Index: Integer): TtkTokenKind;
    function FuncGetanglex(Index: Integer): TtkTokenKind;
    function FuncGetangley(Index: Integer): TtkTokenKind;
    function FuncGetanglez(Index: Integer): TtkTokenKind;
    function FuncGetanimationvariablebool(Index: Integer): TtkTokenKind;
    function FuncGetanimationvariablefloat(Index: Integer): TtkTokenKind;
    function FuncGetanimationvariableint(Index: Integer): TtkTokenKind;
    function FuncGetassociatedskill(Index: Integer): TtkTokenKind;
    function FuncGetat(Index: Integer): TtkTokenKind;
    function FuncGetav(Index: Integer): TtkTokenKind;
    function FuncGetaverageframerate(Index: Integer): TtkTokenKind;
    function FuncGetavpercentage(Index: Integer): TtkTokenKind;
    function FuncGetbaseactorvalue(Index: Integer): TtkTokenKind;
    function FuncGetbaseav(Index: Integer): TtkTokenKind;
    function FuncGetbaseobject(Index: Integer): TtkTokenKind;
    function FuncGetbribeamount(Index: Integer): TtkTokenKind;
    function FuncGetbudgetcount(Index: Integer): TtkTokenKind;
    function FuncGetbudgetname(Index: Integer): TtkTokenKind;
    function FuncGetcasteractor(Index: Integer): TtkTokenKind;
    function FuncGetclass(Index: Integer): TtkTokenKind;
    function FuncGetclassification(Index: Integer): TtkTokenKind;
    function FuncGetcombatstate(Index: Integer): TtkTokenKind;
    function FuncGetcombattarget(Index: Integer): TtkTokenKind;
    function FuncGetconfigname(Index: Integer): TtkTokenKind;
    function FuncGetcrimefaction(Index: Integer): TtkTokenKind;
    function FuncGetcrimegold(Index: Integer): TtkTokenKind;
    function FuncGetcrimegoldnonviolent(Index: Integer): TtkTokenKind;
    function FuncGetcrimegoldviolent(Index: Integer): TtkTokenKind;
    function FuncGetcurrentbudget(Index: Integer): TtkTokenKind;
    function FuncGetcurrentdestructionstage(Index: Integer): TtkTokenKind;
    function FuncGetcurrentgametime(Index: Integer): TtkTokenKind;
    function FuncGetcurrentlocation(Index: Integer): TtkTokenKind;
    function FuncGetcurrentmemory(Index: Integer): TtkTokenKind;
    function FuncGetcurrentpackage(Index: Integer): TtkTokenKind;
    function FuncGetcurrentrealtime(Index: Integer): TtkTokenKind;
    function FuncGetcurrentscene(Index: Integer): TtkTokenKind;
    function FuncGetcurrentstageid(Index: Integer): TtkTokenKind;
    function FuncGetcurrentweather(Index: Integer): TtkTokenKind;
    function FuncGetcurrentweathertransition(Index: Integer): TtkTokenKind;
    function FuncGetdeadcount(Index: Integer): TtkTokenKind;
    function FuncGetdialoguetarget(Index: Integer): TtkTokenKind;
    function FuncGetdistance(Index: Integer): TtkTokenKind;
    function FuncGeteditorlocation(Index: Integer): TtkTokenKind;
    function FuncGetequippeditemtype(Index: Integer): TtkTokenKind;
    function FuncGetequippedshield(Index: Integer): TtkTokenKind;
    function FuncGetequippedshout(Index: Integer): TtkTokenKind;
    function FuncGetequippedspell(Index: Integer): TtkTokenKind;
    function FuncGetequippedweapon(Index: Integer): TtkTokenKind;
    function FuncGetfactionowner(Index: Integer): TtkTokenKind;
    function FuncGetfactionrank(Index: Integer): TtkTokenKind;
    function FuncGetfactionreaction(Index: Integer): TtkTokenKind;
    function FuncGetfavorpoints(Index: Integer): TtkTokenKind;
    function FuncGetflyingstate(Index: Integer): TtkTokenKind;
    function FuncGetforcedlandingmarker(Index: Integer): TtkTokenKind;
    function FuncGetform(Index: Integer): TtkTokenKind;
    function FuncGetformid(Index: Integer): TtkTokenKind;
    function FuncGetgamesettingfloat(Index: Integer): TtkTokenKind;
    function FuncGetgamesettingint(Index: Integer): TtkTokenKind;
    function FuncGetgamesettingstring(Index: Integer): TtkTokenKind;
    function FuncGetgiftfilter(Index: Integer): TtkTokenKind;
    function FuncGetgoldamount(Index: Integer): TtkTokenKind;
    function FuncGetgoldvalue(Index: Integer): TtkTokenKind;
    function FuncGetheadingangle(Index: Integer): TtkTokenKind;
    function FuncGetheight(Index: Integer): TtkTokenKind;
    function FuncGethigestrelationshiprank(Index: Integer): TtkTokenKind;
    function FuncGethighestrelationshiprank(Index: Integer): TtkTokenKind;
    function FuncGetinfamy(Index: Integer): TtkTokenKind;
    function FuncGetinfamynonviolent(Index: Integer): TtkTokenKind;
    function FuncGetinfamyviolent(Index: Integer): TtkTokenKind;
    function FuncGetitemcount(Index: Integer): TtkTokenKind;
    function FuncGetitemhealthpercent(Index: Integer): TtkTokenKind;
    function FuncGetkey(Index: Integer): TtkTokenKind;
    function FuncGetkeyworddata(Index: Integer): TtkTokenKind;
    function FuncGetkiller(Index: Integer): TtkTokenKind;
    function FuncGetlength(Index: Integer): TtkTokenKind;
    function FuncGetlevel(Index: Integer): TtkTokenKind;
    function FuncGetleveledactorbase(Index: Integer): TtkTokenKind;
    function FuncGetlightlevel(Index: Integer): TtkTokenKind;
    function FuncGetlinkedref(Index: Integer): TtkTokenKind;
    function FuncGetlocation(Index: Integer): TtkTokenKind;
    function FuncGetlocklevel(Index: Integer): TtkTokenKind;
    function FuncGetlowestrelationshiprank(Index: Integer): TtkTokenKind;
    function FuncGetmass(Index: Integer): TtkTokenKind;
    function FuncGetmaxframerate(Index: Integer): TtkTokenKind;
    function FuncGetminframerate(Index: Integer): TtkTokenKind;
    function FuncGetnobleedoutrecovery(Index: Integer): TtkTokenKind;
    function FuncGetnthlinkedref(Index: Integer): TtkTokenKind;
    function FuncGetopenstate(Index: Integer): TtkTokenKind;
    function FuncGetoutgoingweather(Index: Integer): TtkTokenKind;
    function FuncGetowningquest(Index: Integer): TtkTokenKind;
    function FuncGetparentcell(Index: Integer): TtkTokenKind;
    function FuncGetplatformname(Index: Integer): TtkTokenKind;
    function FuncGetplayer(Index: Integer): TtkTokenKind;
    function FuncGetplayercontrols(Index: Integer): TtkTokenKind;
    function FuncGetplayergrabbedref(Index: Integer): TtkTokenKind;
    function FuncGetplayerslastriddenhorse(Index: Integer): TtkTokenKind;
    function FuncGetpositionx(Index: Integer): TtkTokenKind;
    function FuncGetpositiony(Index: Integer): TtkTokenKind;
    function FuncGetpositionz(Index: Integer): TtkTokenKind;
    function FuncGetrace(Index: Integer): TtkTokenKind;
    function FuncGetreaction(Index: Integer): TtkTokenKind;
    function FuncGetrealhourspassed(Index: Integer): TtkTokenKind;
    function FuncGetref(Index: Integer): TtkTokenKind;
    function FuncGetreference(Index: Integer): TtkTokenKind;
    function FuncGetreftypealivecount(Index: Integer): TtkTokenKind;
    function FuncGetreftypedeadcount(Index: Integer): TtkTokenKind;
    function FuncGetregard(Index: Integer): TtkTokenKind;
    function FuncGetrelationshiprank(Index: Integer): TtkTokenKind;
    function FuncGetreputation(Index: Integer): TtkTokenKind;
    function FuncGetscale(Index: Integer): TtkTokenKind;
    function FuncGetsex(Index: Integer): TtkTokenKind;
    function FuncGetsitstate(Index: Integer): TtkTokenKind;
    function FuncGetsize(Index: Integer): TtkTokenKind;
    function FuncGetskymode(Index: Integer): TtkTokenKind;
    function FuncGetsleepstate(Index: Integer): TtkTokenKind;
    function FuncGetstage(Index: Integer): TtkTokenKind;
    function FuncGetstagedone(Index: Integer): TtkTokenKind;
    function FuncGetstate(Index: Integer): TtkTokenKind;
    function FuncGetstolenitemvaluecrime(Index: Integer): TtkTokenKind;
    function FuncGetstolenitemvaluenocrime(Index: Integer): TtkTokenKind;
    function FuncGettargetactor(Index: Integer): TtkTokenKind;
    function FuncGettemplate(Index: Integer): TtkTokenKind;
    function FuncGettriggerobjectcount(Index: Integer): TtkTokenKind;
    function FuncGetvalue(Index: Integer): TtkTokenKind;
    function FuncGetvalueint(Index: Integer): TtkTokenKind;
    function FuncGetversionnumber(Index: Integer): TtkTokenKind;
    function FuncGetvoicerecoverytime(Index: Integer): TtkTokenKind;
    function FuncGetvoicetype(Index: Integer): TtkTokenKind;
    function FuncGetwidth(Index: Integer): TtkTokenKind;
    function FuncGetworldspace(Index: Integer): TtkTokenKind;
    function FuncGlobal(Index: Integer): TtkTokenKind;
    function FuncGlobalvariable(Index: Integer): TtkTokenKind;
    function FuncGotostate(Index: Integer): TtkTokenKind;
    function FuncGtlocklevel(Index: Integer): TtkTokenKind;
    function FuncHasassociation(Index: Integer): TtkTokenKind;
    function FuncHascommonparent(Index: Integer): TtkTokenKind;
    function FuncHaseffectkeyword(Index: Integer): TtkTokenKind;
    function FuncHasfamilyrelationship(Index: Integer): TtkTokenKind;
    function FuncHasform(Index: Integer): TtkTokenKind;
    function FuncHaskeyword(Index: Integer): TtkTokenKind;
    function FuncHaslos(Index: Integer): TtkTokenKind;
    function FuncHasmagiceffect(Index: Integer): TtkTokenKind;
    function FuncHasmagiceffectwithkeyword(Index: Integer): TtkTokenKind;
    function FuncHasnode(Index: Integer): TtkTokenKind;
    function FuncHasparentrelationship(Index: Integer): TtkTokenKind;
    function FuncHasperk(Index: Integer): TtkTokenKind;
    function FuncHasreftype(Index: Integer): TtkTokenKind;
    function FuncHasspell(Index: Integer): TtkTokenKind;
    function FuncHazard(Index: Integer): TtkTokenKind;
    function FuncHidden(Index: Integer): TtkTokenKind;
    function FuncHidetitlesequencemenu(Index: Integer): TtkTokenKind;
    function FuncIdle(Index: Integer): TtkTokenKind;
    function FuncIf(Index: Integer): TtkTokenKind;
    function FuncIgnorefriendlyhits(Index: Integer): TtkTokenKind;
    function FuncImagespacemodifier(Index: Integer): TtkTokenKind;
    function FuncImpactdataset(Index: Integer): TtkTokenKind;
    function FuncIncrementskill(Index: Integer): TtkTokenKind;
    function FuncIncrementskillby(Index: Integer): TtkTokenKind;
    function FuncIncrementstat(Index: Integer): TtkTokenKind;
    function FuncIngredient(Index: Integer): TtkTokenKind;
    function FuncInt(Index: Integer): TtkTokenKind;
    function FuncInterruptcast(Index: Integer): TtkTokenKind;
    function FuncIs(Index: Integer): TtkTokenKind;
    function FuncIs3dloaded(Index: Integer): TtkTokenKind;
    function FuncIsactioncomplete(Index: Integer): TtkTokenKind;
    function FuncIsactivatechild(Index: Integer): TtkTokenKind;
    function FuncIsactivatecontrolsenabled(Index: Integer): TtkTokenKind;
    function FuncIsactivationblocked(Index: Integer): TtkTokenKind;
    function FuncIsactive(Index: Integer): TtkTokenKind;
    function FuncIsalarmed(Index: Integer): TtkTokenKind;
    function FuncIsalerted(Index: Integer): TtkTokenKind;
    function FuncIsallowedtofly(Index: Integer): TtkTokenKind;
    function FuncIsarrested(Index: Integer): TtkTokenKind;
    function FuncIsarrestingtarget(Index: Integer): TtkTokenKind;
    function FuncIsattached(Index: Integer): TtkTokenKind;
    function FuncIsbleedingout(Index: Integer): TtkTokenKind;
    function FuncIsbribed(Index: Integer): TtkTokenKind;
    function FuncIscamswitchcontrolsenabled(Index: Integer): TtkTokenKind;
    function FuncIschild(Index: Integer): TtkTokenKind;
    function FuncIscleared(Index: Integer): TtkTokenKind;
    function FuncIscommandedactor(Index: Integer): TtkTokenKind;
    function FuncIscompleted(Index: Integer): TtkTokenKind;
    function FuncIsdead(Index: Integer): TtkTokenKind;
    function FuncIsdetectedby(Index: Integer): TtkTokenKind;
    function FuncIsdisabled(Index: Integer): TtkTokenKind;
    function FuncIsdoingfavor(Index: Integer): TtkTokenKind;
    function FuncIsequipped(Index: Integer): TtkTokenKind;
    function FuncIsessential(Index: Integer): TtkTokenKind;
    function FuncIseuiped(Index: Integer): TtkTokenKind;
    function FuncIsfactionincrimegroup(Index: Integer): TtkTokenKind;
    function FuncIsfasttravelenabled(Index: Integer): TtkTokenKind;
    function FuncIsfightingcontrolsenabled(Index: Integer): TtkTokenKind;
    function FuncIsflying(Index: Integer): TtkTokenKind;
    function FuncIsfurnitureinuse(Index: Integer): TtkTokenKind;
    function FuncIsfurnituremarkerinuse(Index: Integer): TtkTokenKind;
    function FuncIsghost(Index: Integer): TtkTokenKind;
    function FuncIsguard(Index: Integer): TtkTokenKind;
    function FuncIshostile(Index: Integer): TtkTokenKind;
    function FuncIshostiletoactor(Index: Integer): TtkTokenKind;
    function FuncIsignoringfriendlyhits(Index: Integer): TtkTokenKind;
    function FuncIsincombat(Index: Integer): TtkTokenKind;
    function FuncIsindialoguewithplayer(Index: Integer): TtkTokenKind;
    function FuncIsinfaction(Index: Integer): TtkTokenKind;
    function FuncIsininterior(Index: Integer): TtkTokenKind;
    function FuncIsinkillmove(Index: Integer): TtkTokenKind;
    function FuncIsinmenumode(Index: Integer): TtkTokenKind;
    function FuncIsinterior(Index: Integer): TtkTokenKind;
    function FuncIsintimidated(Index: Integer): TtkTokenKind;
    function FuncIsinvulnerable(Index: Integer): TtkTokenKind;
    function FuncIsjournalcontrolsenabled(Index: Integer): TtkTokenKind;
    function FuncIsloaded(Index: Integer): TtkTokenKind;
    function FuncIslockbroken(Index: Integer): TtkTokenKind;
    function FuncIslocked(Index: Integer): TtkTokenKind;
    function FuncIslookingcontrolsenabled(Index: Integer): TtkTokenKind;
    function FuncIsmapmarkervisible(Index: Integer): TtkTokenKind;
    function FuncIsmenucontrolsenabled(Index: Integer): TtkTokenKind;
    function FuncIsmovementcontrolsenabled(Index: Integer): TtkTokenKind;
    function FuncIsobjectivecompleted(Index: Integer): TtkTokenKind;
    function FuncIsobjectivedisplayed(Index: Integer): TtkTokenKind;
    function FuncIsobjectivefailed(Index: Integer): TtkTokenKind;
    function FuncIsplayerexpelled(Index: Integer): TtkTokenKind;
    function FuncIsplayerslastriddenhorse(Index: Integer): TtkTokenKind;
    function FuncIsplayerteammate(Index: Integer): TtkTokenKind;
    function FuncIsplaying(Index: Integer): TtkTokenKind;
    function FuncIsprotected(Index: Integer): TtkTokenKind;
    function FuncIsrunning(Index: Integer): TtkTokenKind;
    function FuncIssamelocation(Index: Integer): TtkTokenKind;
    function FuncIssneaking(Index: Integer): TtkTokenKind;
    function FuncIssneakingcontrolsenabled(Index: Integer): TtkTokenKind;
    function FuncIssprinting(Index: Integer): TtkTokenKind;
    function FuncIsstagedone(Index: Integer): TtkTokenKind;
    function FuncIsstartin(Index: Integer): TtkTokenKind;
    function FuncIsstarting(Index: Integer): TtkTokenKind;
    function FuncIsstopped(Index: Integer): TtkTokenKind;
    function FuncIsstopping(Index: Integer): TtkTokenKind;
    function FuncIstrespassing(Index: Integer): TtkTokenKind;
    function FuncIsunconscious(Index: Integer): TtkTokenKind;
    function FuncIsunique(Index: Integer): TtkTokenKind;
    function FuncIsweapondrawn(Index: Integer): TtkTokenKind;
    function FuncIswordunlocked(Index: Integer): TtkTokenKind;
    function FuncJump(Index: Integer): TtkTokenKind;
    function FuncKeepoffsetfromactor(Index: Integer): TtkTokenKind;
    function FuncKey(Index: Integer): TtkTokenKind;
    function FuncKeyword(Index: Integer): TtkTokenKind;
    function FuncKill(Index: Integer): TtkTokenKind;
    function FuncKillsilent(Index: Integer): TtkTokenKind;
    function FuncKnockareaeffect(Index: Integer): TtkTokenKind;
    function FuncLearnalleffects(Index: Integer): TtkTokenKind;
    function FuncLearneffect(Index: Integer): TtkTokenKind;
    function FuncLearnnexteffect(Index: Integer): TtkTokenKind;
    function FuncLength(Index: Integer): TtkTokenKind;
    function FuncLeveledactor(Index: Integer): TtkTokenKind;
    function FuncLeveleditem(Index: Integer): TtkTokenKind;
    function FuncLeveledspell(Index: Integer): TtkTokenKind;
    function FuncLight(Index: Integer): TtkTokenKind;
    function FuncLocal(Index: Integer): TtkTokenKind;
    function FuncLocation(Index: Integer): TtkTokenKind;
    function FuncLocationalias(Index: Integer): TtkTokenKind;
    function FuncLocationreftype(Index: Integer): TtkTokenKind;
    function FuncLock(Index: Integer): TtkTokenKind;
    function FuncMagiceffect(Index: Integer): TtkTokenKind;
    function FuncMath(Index: Integer): TtkTokenKind;
    function FuncMessage(Index: Integer): TtkTokenKind;
    function FuncMessagebox(Index: Integer): TtkTokenKind;
    function FuncMiscobject(Index: Integer): TtkTokenKind;
    function FuncModactorvalue(Index: Integer): TtkTokenKind;
    function FuncModav(Index: Integer): TtkTokenKind;
    function FuncModcrimegold(Index: Integer): TtkTokenKind;
    function FuncModfactionrank(Index: Integer): TtkTokenKind;
    function FuncModfavorpoints(Index: Integer): TtkTokenKind;
    function FuncModfavorpointswithglobal(Index: Integer): TtkTokenKind;
    function FuncModreaction(Index: Integer): TtkTokenKind;
    function FuncModregard(Index: Integer): TtkTokenKind;
    function FuncMoveto(Index: Integer): TtkTokenKind;
    function FuncMovetointeractionlocation(Index: Integer): TtkTokenKind;
    function FuncMovetomyeditorlocation(Index: Integer): TtkTokenKind;
    function FuncMovetonode(Index: Integer): TtkTokenKind;
    function FuncMovetopackagelocation(Index: Integer): TtkTokenKind;
    function FuncMovetowhenunloaded(Index: Integer): TtkTokenKind;
    function FuncMusictype(Index: Integer): TtkTokenKind;
    function FuncMute(Index: Integer): TtkTokenKind;
    function FuncNew(Index: Integer): TtkTokenKind;
    function FuncNone(Index: Integer): TtkTokenKind;
    function FuncNot(Index: Integer): TtkTokenKind;
    function FuncNotification(Index: Integer): TtkTokenKind;
    function FuncObjectname(Index: Integer): TtkTokenKind;
    function FuncObjectreference(Index: Integer): TtkTokenKind;
    function FuncObjectscount(Index: Integer): TtkTokenKind;
    function FuncOnactivate(Index: Integer): TtkTokenKind;
    function FuncOnanimationevent(Index: Integer): TtkTokenKind;
    function FuncOnattachedtocell(Index: Integer): TtkTokenKind;
    function FuncOnbeginstate(Index: Integer): TtkTokenKind;
    function FuncOncellattach(Index: Integer): TtkTokenKind;
    function FuncOncelldetach(Index: Integer): TtkTokenKind;
    function FuncOncellload(Index: Integer): TtkTokenKind;
    function FuncOnclose(Index: Integer): TtkTokenKind;
    function FuncOncombatstatechanged(Index: Integer): TtkTokenKind;
    function FuncOncontainerchanged(Index: Integer): TtkTokenKind;
    function FuncOndeath(Index: Integer): TtkTokenKind;
    function FuncOndestructionstagechanged(Index: Integer): TtkTokenKind;
    function FuncOndetachedfromcell(Index: Integer): TtkTokenKind;
    function FuncOndying(Index: Integer): TtkTokenKind;
    function FuncOneffectfinish(Index: Integer): TtkTokenKind;
    function FuncOneffectstart(Index: Integer): TtkTokenKind;
    function FuncOnendstate(Index: Integer): TtkTokenKind;
    function FuncOnenterbleedout(Index: Integer): TtkTokenKind;
    function FuncOnequipped(Index: Integer): TtkTokenKind;
    function FuncOngainlos(Index: Integer): TtkTokenKind;
    function FuncOngetup(Index: Integer): TtkTokenKind;
    function FuncOngrab(Index: Integer): TtkTokenKind;
    function FuncOnhit(Index: Integer): TtkTokenKind;
    function FuncOninit(Index: Integer): TtkTokenKind;
    function FuncOnitemadded(Index: Integer): TtkTokenKind;
    function FuncOnitemremoved(Index: Integer): TtkTokenKind;
    function FuncOnload(Index: Integer): TtkTokenKind;
    function FuncOnlocationchange(Index: Integer): TtkTokenKind;
    function FuncOnlockstatechanged(Index: Integer): TtkTokenKind;
    function FuncOnlostlos(Index: Integer): TtkTokenKind;
    function FuncOnmagiceffectapply(Index: Integer): TtkTokenKind;
    function FuncOnobjectequipped(Index: Integer): TtkTokenKind;
    function FuncOnobjectunequipped(Index: Integer): TtkTokenKind;
    function FuncOnopen(Index: Integer): TtkTokenKind;
    function FuncOnpackagechange(Index: Integer): TtkTokenKind;
    function FuncOnpackageend(Index: Integer): TtkTokenKind;
    function FuncOnpackagestart(Index: Integer): TtkTokenKind;
    function FuncOnraceswitchcomplete(Index: Integer): TtkTokenKind;
    function FuncOnread(Index: Integer): TtkTokenKind;
    function FuncOnrelease(Index: Integer): TtkTokenKind;
    function FuncOnreset(Index: Integer): TtkTokenKind;
    function FuncOnsell(Index: Integer): TtkTokenKind;
    function FuncOnsleepstart(Index: Integer): TtkTokenKind;
    function FuncOnsleepstop(Index: Integer): TtkTokenKind;
    function FuncOnstoryactivateactor(Index: Integer): TtkTokenKind;
    function FuncOnstoryaddtoplayer(Index: Integer): TtkTokenKind;
    function FuncOnstoryarrest(Index: Integer): TtkTokenKind;
    function FuncOnstoryassaultactor(Index: Integer): TtkTokenKind;
    function FuncOnstorybribenpc(Index: Integer): TtkTokenKind;
    function FuncOnstorycastmagic(Index: Integer): TtkTokenKind;
    function FuncOnstorychangelocation(Index: Integer): TtkTokenKind;
    function FuncOnstorycraftitem(Index: Integer): TtkTokenKind;
    function FuncOnstorycrimegold(Index: Integer): TtkTokenKind;
    function FuncOnstorycure(Index: Integer): TtkTokenKind;
    function FuncOnstorydialogue(Index: Integer): TtkTokenKind;
    function FuncOnstorydiscoverdeadbody(Index: Integer): TtkTokenKind;
    function FuncOnstoryescapejail(Index: Integer): TtkTokenKind;
    function FuncOnstoryflatternpc(Index: Integer): TtkTokenKind;
    function FuncOnstoryhello(Index: Integer): TtkTokenKind;
    function FuncOnstoryincreaselevel(Index: Integer): TtkTokenKind;
    function FuncOnstoryincreaseskill(Index: Integer): TtkTokenKind;
    function FuncOnstoryinfection(Index: Integer): TtkTokenKind;
    function FuncOnstoryintimidatenpc(Index: Integer): TtkTokenKind;
    function FuncOnstoryjail(Index: Integer): TtkTokenKind;
    function FuncOnstorykillactor(Index: Integer): TtkTokenKind;
    function FuncOnstorynewvoicepower(Index: Integer): TtkTokenKind;
    function FuncOnstorypayfine(Index: Integer): TtkTokenKind;
    function FuncOnstorypicklock(Index: Integer): TtkTokenKind;
    function FuncOnstoryplayergetsfavor(Index: Integer): TtkTokenKind;
    function FuncOnstoryrelationshipchange(Index: Integer): TtkTokenKind;
    function FuncOnstoryremovefromplayer(Index: Integer): TtkTokenKind;
    function FuncOnstoryscript(Index: Integer): TtkTokenKind;
    function FuncOnstoryservedtime(Index: Integer): TtkTokenKind;
    function FuncOnstorytrespass(Index: Integer): TtkTokenKind;
    function FuncOntrackedstatsevent(Index: Integer): TtkTokenKind;
    function FuncOntranslationalmostcomplete(Index: Integer): TtkTokenKind;
    function FuncOntranslationcomplete(Index: Integer): TtkTokenKind;
    function FuncOntranslationfailed(Index: Integer): TtkTokenKind;
    function FuncOntraphit(Index: Integer): TtkTokenKind;
    function FuncOntraphitstart(Index: Integer): TtkTokenKind;
    function FuncOntraphitstop(Index: Integer): TtkTokenKind;
    function FuncOntrigger(Index: Integer): TtkTokenKind;
    function FuncOntriggerenter(Index: Integer): TtkTokenKind;
    function FuncOntriggerleave(Index: Integer): TtkTokenKind;
    function FuncOnunequipped(Index: Integer): TtkTokenKind;
    function FuncOnunload(Index: Integer): TtkTokenKind;
    function FuncOnupdate(Index: Integer): TtkTokenKind;
    function FuncOnupdategametime(Index: Integer): TtkTokenKind;
    function FuncOnwardhit(Index: Integer): TtkTokenKind;
    function FuncOpeninventory(Index: Integer): TtkTokenKind;
    function FuncOpenuserlog(Index: Integer): TtkTokenKind;
    function FuncOutfit(Index: Integer): TtkTokenKind;
    function FuncOverbudget(Index: Integer): TtkTokenKind;
    function FuncPackage(Index: Integer): TtkTokenKind;
    function FuncPapyrusversion(Index: Integer): TtkTokenKind;
    function FuncParent(Index: Integer): TtkTokenKind;
    function FuncPathtoreference(Index: Integer): TtkTokenKind;
    function FuncPause(Index: Integer): TtkTokenKind;
    function FuncPerk(Index: Integer): TtkTokenKind;
    function FuncPlaceactoratme(Index: Integer): TtkTokenKind;
    function FuncPlaceatme(Index: Integer): TtkTokenKind;
    function FuncPlay(Index: Integer): TtkTokenKind;
    function FuncPlayandwait(Index: Integer): TtkTokenKind;
    function FuncPlayanimation(Index: Integer): TtkTokenKind;
    function FuncPlayanimationandwait(Index: Integer): TtkTokenKind;
    function FuncPlayerknows(Index: Integer): TtkTokenKind;
    function FuncPlayermovetoandwait(Index: Integer): TtkTokenKind;
    function FuncPlayerpaycrimegold(Index: Integer): TtkTokenKind;
    function FuncPlaygamebryoanimation(Index: Integer): TtkTokenKind;
    function FuncPlayidle(Index: Integer): TtkTokenKind;
    function FuncPlayidlewithtarget(Index: Integer): TtkTokenKind;
    function FuncPlayimpacteffect(Index: Integer): TtkTokenKind;
    function FuncPlaysubgraphanimation(Index: Integer): TtkTokenKind;
    function FuncPlaysyncedanimationandwaitss(Index: Integer): TtkTokenKind;
    function FuncPlaysyncedanimationss(Index: Integer): TtkTokenKind;
    function FuncPlayterraineffect(Index: Integer): TtkTokenKind;
    function FuncPopto(Index: Integer): TtkTokenKind;
    function FuncPotion(Index: Integer): TtkTokenKind;
    function FuncPow(Index: Integer): TtkTokenKind;
    function FuncPrecachechargen(Index: Integer): TtkTokenKind;
    function FuncPrecachechargenclear(Index: Integer): TtkTokenKind;
    function FuncProcesstraphit(Index: Integer): TtkTokenKind;
    function FuncProjectile(Index: Integer): TtkTokenKind;
    function FuncProperties(Index: Integer): TtkTokenKind;
    function FuncProperty(Index: Integer): TtkTokenKind;
    function FuncPushactoraway(Index: Integer): TtkTokenKind;
    function FuncQuerystat(Index: Integer): TtkTokenKind;
    function FuncQuest(Index: Integer): TtkTokenKind;
    function FuncQuitgame(Index: Integer): TtkTokenKind;
    function FuncQuittomainmenu(Index: Integer): TtkTokenKind;
    function FuncRace(Index: Integer): TtkTokenKind;
    function FuncRadianstodegrees(Index: Integer): TtkTokenKind;
    function FuncRandomfloat(Index: Integer): TtkTokenKind;
    function FuncRandomint(Index: Integer): TtkTokenKind;
    function FuncReferencealias(Index: Integer): TtkTokenKind;
    function FuncRegisterforanimationevent(Index: Integer): TtkTokenKind;
    function FuncRegisterforlos(Index: Integer): TtkTokenKind;
    function FuncRegisterforremoteevent(Index: Integer): TtkTokenKind;
    function FuncRegisterforsinglelosgain(Index: Integer): TtkTokenKind;
    function FuncRegisterforsingleloslost(Index: Integer): TtkTokenKind;
    function FuncRegisterforsingleupdate(Index: Integer): TtkTokenKind;
    function FuncRegisterforsingleupdategametime(Index: Integer): TtkTokenKind;
    function FuncRegisterforsleep(Index: Integer): TtkTokenKind;
    function FuncRegisterfortrackedstatsevent(Index: Integer): TtkTokenKind;
    function FuncRegisterfortutorialevent(Index: Integer): TtkTokenKind;
    function FuncRegisterforupdate(Index: Integer): TtkTokenKind;
    function FuncRegisterforupdategametime(Index: Integer): TtkTokenKind;
    function FuncReleaseoverride(Index: Integer): TtkTokenKind;
    function FuncRemotecast(Index: Integer): TtkTokenKind;
    function FuncRemove(Index: Integer): TtkTokenKind;
    function FuncRemoveaddedform(Index: Integer): TtkTokenKind;
    function FuncRemoveallinventoryeventfilters(Index: Integer): TtkTokenKind;
    function FuncRemoveallitems(Index: Integer): TtkTokenKind;
    function FuncRemovecrossfade(Index: Integer): TtkTokenKind;
    function FuncRemovedependentanimatedobjectreference(Index: Integer): TtkTokenKind;
    function FuncRemovefromallfactions(Index: Integer): TtkTokenKind;
    function FuncRemovefromfaction(Index: Integer): TtkTokenKind;
    function FuncRemovehavokconstraints(Index: Integer): TtkTokenKind;
    function FuncRemoveinventoryeventfilter(Index: Integer): TtkTokenKind;
    function FuncRemoveitem(Index: Integer): TtkTokenKind;
    function FuncRemovelast(Index: Integer): TtkTokenKind;
    function FuncRemoveperk(Index: Integer): TtkTokenKind;
    function FuncRemoveshout(Index: Integer): TtkTokenKind;
    function FuncRemovespell(Index: Integer): TtkTokenKind;
    function FuncRequestautosave(Index: Integer): TtkTokenKind;
    function FuncRequestmodel(Index: Integer): TtkTokenKind;
    function FuncRequestsave(Index: Integer): TtkTokenKind;
    function FuncReset(Index: Integer): TtkTokenKind;
    function FuncResethealthandlimbs(Index: Integer): TtkTokenKind;
    function FuncResethelpmessage(Index: Integer): TtkTokenKind;
    function FuncRestoreactorvalue(Index: Integer): TtkTokenKind;
    function FuncRestoreav(Index: Integer): TtkTokenKind;
    function FuncResurrect(Index: Integer): TtkTokenKind;
    function FuncReturn(Index: Integer): TtkTokenKind;
    function FuncRevert(Index: Integer): TtkTokenKind;
    function FuncRfind(Index: Integer): TtkTokenKind;
    function FuncRfindstruct(Index: Integer): TtkTokenKind;
    function FuncSay(Index: Integer): TtkTokenKind;
    function FuncScene(Index: Integer): TtkTokenKind;
    function FuncScript(Index: Integer): TtkTokenKind;
    function FuncScroll(Index: Integer): TtkTokenKind;
    function FuncSelf(Index: Integer): TtkTokenKind;
    function FuncSendanimationevent(Index: Integer): TtkTokenKind;
    function FuncSendassaultalarm(Index: Integer): TtkTokenKind;
    function FuncSendcustomevent(Index: Integer): TtkTokenKind;
    function FuncSendplayertojail(Index: Integer): TtkTokenKind;
    function FuncSendstealalarm(Index: Integer): TtkTokenKind;
    function FuncSendstoryevent(Index: Integer): TtkTokenKind;
    function FuncSendstoryeventandwait(Index: Integer): TtkTokenKind;
    function FuncSendtrespassalarm(Index: Integer): TtkTokenKind;
    function FuncSendwerewolftransformation(Index: Integer): TtkTokenKind;
    function FuncServetime(Index: Integer): TtkTokenKind;
    function FuncSet(Index: Integer): TtkTokenKind;
    function FuncSetactive(Index: Integer): TtkTokenKind;
    function FuncSetactorcause(Index: Integer): TtkTokenKind;
    function FuncSetactorowner(Index: Integer): TtkTokenKind;
    function FuncSetactorvalue(Index: Integer): TtkTokenKind;
    function FuncSetalert(Index: Integer): TtkTokenKind;
    function FuncSetallowflying(Index: Integer): TtkTokenKind;
    function FuncSetally(Index: Integer): TtkTokenKind;
    function FuncSetalpha(Index: Integer): TtkTokenKind;
    function FuncSetangle(Index: Integer): TtkTokenKind;
    function FuncSetanimationvariablebool(Index: Integer): TtkTokenKind;
    function FuncSetanimationvariablefloat(Index: Integer): TtkTokenKind;
    function FuncSetanimationvariableint(Index: Integer): TtkTokenKind;
    function FuncSetattackactoronsight(Index: Integer): TtkTokenKind;
    function FuncSetav(Index: Integer): TtkTokenKind;
    function FuncSetbeastform(Index: Integer): TtkTokenKind;
    function FuncSetbribed(Index: Integer): TtkTokenKind;
    function FuncSetcameratarget(Index: Integer): TtkTokenKind;
    function FuncSetcleared(Index: Integer): TtkTokenKind;
    function FuncSetcrimefaction(Index: Integer): TtkTokenKind;
    function FuncSetcrimegold(Index: Integer): TtkTokenKind;
    function FuncSetcrimegoldviolent(Index: Integer): TtkTokenKind;
    function FuncSetcriticalstage(Index: Integer): TtkTokenKind;
    function FuncSetcurrentstageid(Index: Integer): TtkTokenKind;
    function FuncSetdestroyed(Index: Integer): TtkTokenKind;
    function FuncSetdoingfavor(Index: Integer): TtkTokenKind;
    function FuncSetenemy(Index: Integer): TtkTokenKind;
    function FuncSetessential(Index: Integer): TtkTokenKind;
    function FuncSetfactionowner(Index: Integer): TtkTokenKind;
    function FuncSetfactionrank(Index: Integer): TtkTokenKind;
    function FuncSetfogplanes(Index: Integer): TtkTokenKind;
    function FuncSetfogpower(Index: Integer): TtkTokenKind;
    function FuncSetfootik(Index: Integer): TtkTokenKind;
    function FuncSetforcedlandingmarker(Index: Integer): TtkTokenKind;
    function FuncSetfrequency(Index: Integer): TtkTokenKind;
    function FuncSetghost(Index: Integer): TtkTokenKind;
    function FuncSetgodmode(Index: Integer): TtkTokenKind;
    function FuncSetheadtracking(Index: Integer): TtkTokenKind;
    function FuncSethudcartmode(Index: Integer): TtkTokenKind;
    function FuncSetinchargen(Index: Integer): TtkTokenKind;
    function FuncSetinibool(Index: Integer): TtkTokenKind;
    function FuncSetinifloat(Index: Integer): TtkTokenKind;
    function FuncSetiniint(Index: Integer): TtkTokenKind;
    function FuncSetinistring(Index: Integer): TtkTokenKind;
    function FuncSetinstancevolume(Index: Integer): TtkTokenKind;
    function FuncSetintimidated(Index: Integer): TtkTokenKind;
    function FuncSetinvulnerable(Index: Integer): TtkTokenKind;
    function FuncSetkeyworddata(Index: Integer): TtkTokenKind;
    function FuncSetlocklevel(Index: Integer): TtkTokenKind;
    function FuncSetlookat(Index: Integer): TtkTokenKind;
    function FuncSetmotiontype(Index: Integer): TtkTokenKind;
    function FuncSetnobleedoutrecovery(Index: Integer): TtkTokenKind;
    function FuncSetnofavorallowed(Index: Integer): TtkTokenKind;
    function FuncSetnotshowonstealthmeter(Index: Integer): TtkTokenKind;
    function FuncSetobjectivecompleted(Index: Integer): TtkTokenKind;
    function FuncSetobjectivedisplayed(Index: Integer): TtkTokenKind;
    function FuncSetobjectivefailed(Index: Integer): TtkTokenKind;
    function FuncSetopen(Index: Integer): TtkTokenKind;
    function FuncSetoutfit(Index: Integer): TtkTokenKind;
    function FuncSetplayeraidriven(Index: Integer): TtkTokenKind;
    function FuncSetplayercontrols(Index: Integer): TtkTokenKind;
    function FuncSetplayerenemy(Index: Integer): TtkTokenKind;
    function FuncSetplayerexpelled(Index: Integer): TtkTokenKind;
    function FuncSetplayerreportcrime(Index: Integer): TtkTokenKind;
    function FuncSetplayerresistingarrest(Index: Integer): TtkTokenKind;
    function FuncSetplayerteammate(Index: Integer): TtkTokenKind;
    function FuncSetposition(Index: Integer): TtkTokenKind;
    function FuncSetprotected(Index: Integer): TtkTokenKind;
    function FuncSetpublic(Index: Integer): TtkTokenKind;
    function FuncSetrace(Index: Integer): TtkTokenKind;
    function FuncSetraction(Index: Integer): TtkTokenKind;
    function FuncSetreaction(Index: Integer): TtkTokenKind;
    function FuncSetrelationshiprank(Index: Integer): TtkTokenKind;
    function FuncSetrestrained(Index: Integer): TtkTokenKind;
    function FuncSetscale(Index: Integer): TtkTokenKind;
    function FuncSetsittingrotation(Index: Integer): TtkTokenKind;
    function FuncSetstage(Index: Integer): TtkTokenKind;
    function FuncSetunconscious(Index: Integer): TtkTokenKind;
    function FuncSetvalue(Index: Integer): TtkTokenKind;
    function FuncSetvalueint(Index: Integer): TtkTokenKind;
    function FuncSetvehicle(Index: Integer): TtkTokenKind;
    function FuncSetvoicerecoverytime(Index: Integer): TtkTokenKind;
    function FuncSetvolume(Index: Integer): TtkTokenKind;
    function FuncShakecamera(Index: Integer): TtkTokenKind;
    function FuncShakecontroller(Index: Integer): TtkTokenKind;
    function FuncShout(Index: Integer): TtkTokenKind;
    function FuncShow(Index: Integer): TtkTokenKind;
    function FuncShowashelpmessage(Index: Integer): TtkTokenKind;
    function FuncShowbartermenu(Index: Integer): TtkTokenKind;
    function FuncShowfirstpersongeometry(Index: Integer): TtkTokenKind;
    function FuncShowgiftmenu(Index: Integer): TtkTokenKind;
    function FuncShowracemenu(Index: Integer): TtkTokenKind;
    function FuncShowrefposition(Index: Integer): TtkTokenKind;
    function FuncShowtitlesequencemenu(Index: Integer): TtkTokenKind;
    function FuncShowtrainingmenu(Index: Integer): TtkTokenKind;
    function FuncSin(Index: Integer): TtkTokenKind;
    function FuncSoulgem(Index: Integer): TtkTokenKind;
    function FuncSound(Index: Integer): TtkTokenKind;
    function FuncSoundcategory(Index: Integer): TtkTokenKind;
    function FuncSpell(Index: Integer): TtkTokenKind;
    function FuncSplinetranslateto(Index: Integer): TtkTokenKind;
    function FuncSplinetranslatetorefnode(Index: Integer): TtkTokenKind;
    function FuncSqrt(Index: Integer): TtkTokenKind;
    function FuncStart(Index: Integer): TtkTokenKind;
    function FuncStartcannibal(Index: Integer): TtkTokenKind;
    function FuncStartcombat(Index: Integer): TtkTokenKind;
    function FuncStartframeratecapture(Index: Integer): TtkTokenKind;
    function FuncStartobjectprofiling(Index: Integer): TtkTokenKind;
    function FuncStartscriptprofiling(Index: Integer): TtkTokenKind;
    function FuncStartstackprofiling(Index: Integer): TtkTokenKind;
    function FuncStarttitlesequence(Index: Integer): TtkTokenKind;
    function FuncStartvampirefeed(Index: Integer): TtkTokenKind;
    function FuncState(Index: Integer): TtkTokenKind;
    function FuncStatic(Index: Integer): TtkTokenKind;
    function FuncStop(Index: Integer): TtkTokenKind;
    function FuncStopcombat(Index: Integer): TtkTokenKind;
    function FuncStopcombatalarm(Index: Integer): TtkTokenKind;
    function FuncStopinstance(Index: Integer): TtkTokenKind;
    function FuncStopobjectprofiling(Index: Integer): TtkTokenKind;
    function FuncStopscriptprofiling(Index: Integer): TtkTokenKind;
    function FuncStopstackprofiling(Index: Integer): TtkTokenKind;
    function FuncStoptranslation(Index: Integer): TtkTokenKind;
    function FuncString(Index: Integer): TtkTokenKind;
    function FuncStringtablecount(Index: Integer): TtkTokenKind;
    function FuncTakescreenshot(Index: Integer): TtkTokenKind;
    function FuncTalkingactivator(Index: Integer): TtkTokenKind;
    function FuncTan(Index: Integer): TtkTokenKind;
    function FuncTeachword(Index: Integer): TtkTokenKind;
    function FuncTethertohorse(Index: Integer): TtkTokenKind;
    function FuncThen(Index: Integer): TtkTokenKind;
    function FuncTimedata(Index: Integer): TtkTokenKind;
    function FuncToggleai(Index: Integer): TtkTokenKind;
    function FuncTogglecollisions(Index: Integer): TtkTokenKind;
    function FuncTogglemenus(Index: Integer): TtkTokenKind;
    function FuncTopic(Index: Integer): TtkTokenKind;
    function FuncTopicinfo(Index: Integer): TtkTokenKind;
    function FuncTrace(Index: Integer): TtkTokenKind;
    function FuncTraceconditional(Index: Integer): TtkTokenKind;
    function FuncTracestack(Index: Integer): TtkTokenKind;
    function FuncTraceuser(Index: Integer): TtkTokenKind;
    function FuncTranslateto(Index: Integer): TtkTokenKind;
    function FuncTrapsoul(Index: Integer): TtkTokenKind;
    function FuncTriggerscreenblood(Index: Integer): TtkTokenKind;
    function FuncTrue(Index: Integer): TtkTokenKind;
    function FuncTrytoaddtofaction(Index: Integer): TtkTokenKind;
    function FuncTrytodisable(Index: Integer): TtkTokenKind;
    function FuncTrytoenable(Index: Integer): TtkTokenKind;
    function FuncTrytoevaluatepackage(Index: Integer): TtkTokenKind;
    function FuncTrytokill(Index: Integer): TtkTokenKind;
    function FuncTrytomoveto(Index: Integer): TtkTokenKind;
    function FuncTrytoremovefromfaction(Index: Integer): TtkTokenKind;
    function FuncTrytoreset(Index: Integer): TtkTokenKind;
    function FuncTrytostopcombat(Index: Integer): TtkTokenKind;
    function FuncUnequipall(Index: Integer): TtkTokenKind;
    function FuncUnequipitem(Index: Integer): TtkTokenKind;
    function FuncUnequipshout(Index: Integer): TtkTokenKind;
    function FuncUnequipspell(Index: Integer): TtkTokenKind;
    function FuncUnlockowneddoorsincell(Index: Integer): TtkTokenKind;
    function FuncUnlockword(Index: Integer): TtkTokenKind;
    function FuncUnmute(Index: Integer): TtkTokenKind;
    function FuncUnpause(Index: Integer): TtkTokenKind;
    function FuncUnregisterforanimationevent(Index: Integer): TtkTokenKind;
    function FuncUnregisterforlos(Index: Integer): TtkTokenKind;
    function FuncUnregisterforremoteevent(Index: Integer): TtkTokenKind;
    function FuncUnregisterforsleep(Index: Integer): TtkTokenKind;
    function FuncUnregisterfortrackedstatsevent(Index: Integer): TtkTokenKind;
    function FuncUnregisterfortutorialevent(Index: Integer): TtkTokenKind;
    function FuncUnregisterforupdate(Index: Integer): TtkTokenKind;
    function FuncUnregisterforupdategametime(Index: Integer): TtkTokenKind;
    function FuncUpdatecurrentinstanceglobal(Index: Integer): TtkTokenKind;
    function FuncUser(Index: Integer): TtkTokenKind;
    function FuncUserflagscount(Index: Integer): TtkTokenKind;
    function FuncUsinggamepad(Index: Integer): TtkTokenKind;
    function FuncUtility(Index: Integer): TtkTokenKind;
    function FuncVars(Index: Integer): TtkTokenKind;
    function FuncVisualeffect(Index: Integer): TtkTokenKind;
    function FuncVoicetype(Index: Integer): TtkTokenKind;
    function FuncWait(Index: Integer): TtkTokenKind;
    function FuncWaitforanimationevent(Index: Integer): TtkTokenKind;
    function FuncWaitgametime(Index: Integer): TtkTokenKind;
    function FuncWaitmenumode(Index: Integer): TtkTokenKind;
    function FuncWeapon(Index: Integer): TtkTokenKind;
    function FuncWeather(Index: Integer): TtkTokenKind;
    function FuncWillintimidatesucceed(Index: Integer): TtkTokenKind;
    function FuncWordofpower(Index: Integer): TtkTokenKind;
    function FuncWorldspace(Index: Integer): TtkTokenKind;
    function FuncWornhaskeyword(Index: Integer): TtkTokenKind;
    procedure IdentProc;
    procedure UnknownProc;
    function AltFunc(Index: Integer): TtkTokenKind;
    procedure InitIdent;
    function IdentKind(MayBe: PWideChar): TtkTokenKind;
    procedure NullProc;
    procedure SpaceProc;
    procedure CRProc;
    procedure LFProc;
    procedure Bracket2CommentOpenProc;
    procedure Bracket2CommentProc;
    procedure BracketCommentOpenProc;
    procedure BracketCommentProc;
    procedure StringOpenProc;
    procedure StringProc;
  protected
    function GetSampleSource: UnicodeString; override;
    function IsFilterStored: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetFriendlyLanguageName: UnicodeString; override;
    class function GetLanguageName: string; override;
    function GetRange: Pointer; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
    function GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetKeyWords(TokenKind: Integer): UnicodeString; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: Integer; override;
    function IsIdentChar(AChar: WideChar): Boolean; override;
    procedure Next; override;
  published
    property Comment2Attri: TSynHighlighterAttributes read fComment2Attri write fComment2Attri;
    property Comment3Attri: TSynHighlighterAttributes read fComment3Attri write fComment3Attri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property KeyAttri: TSynHighlighterAttributes read fKeyAttri write fKeyAttri;
    property PapyrusAttri: TSynHighlighterAttributes read fPapyrusAttri write fPapyrusAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property word0Attri: TSynHighlighterAttributes read fword0Attri write fword0Attri;
    property word2Attri: TSynHighlighterAttributes read fword2Attri write fword2Attri;
    property word3Attri: TSynHighlighterAttributes read fword3Attri write fword3Attri;
  end;

implementation

uses
{$IFDEF SYN_CLX}
  QSynEditStrConst;
{$ELSE}
  SynEditStrConst;
{$ENDIF}

resourcestring
  SYNS_FilterPex = '*.pex';
  SYNS_LangPex = 'Pex';
  SYNS_FriendlyLangPex = 'Pex';
  SYNS_AttrComment2 = 'Comment2';
  SYNS_FriendlyAttrComment2 = 'Comment2';
  SYNS_AttrComment3 = 'Comment3';
  SYNS_FriendlyAttrComment3 = 'Comment3';
  SYNS_AttrPapyrus = 'Papyrus';
  SYNS_FriendlyAttrPapyrus = 'Papyrus';
  SYNS_Attrword0 = 'word0';
  SYNS_FriendlyAttrword0 = 'word0';
  SYNS_Attrword2 = 'word2';
  SYNS_FriendlyAttrword2 = 'word2';
  SYNS_Attrword3 = 'word3';
  SYNS_FriendlyAttrword3 = 'word3';

const
  // as this language is case-insensitive keywords *must* be in lowercase
  KeyWords: array[0..828] of UnicodeString = (
    '_fo4', 'abs', 'acos', 'action', 'activate', 'activator', 
    'activemagiceffect', 'actor', 'actorbase', 'add', 'addachievement', 
    'adddependentanimatedobjectreference', 'addform', 
    'addhavokballandsocketconstraint', 'addinventoryeventfilter', 'additem', 
    'addperk', 'addshout', 'addspell', 'addtextreplacementdata', 'addtofaction', 
    'addtomap', 'advanceskill', 'alias', 'allowbleedoutdialogue', 
    'allowpcdialogue', 'ammo', 'apparatus', 'apply', 'applycrossfade', 
    'applyhavokimpulse', 'armor', 'as', 'asin', 'associationtype', 'atan', 
    'attachashpile', 'auto', 'autoreadonly', 'autostatename', 'autovarname', 
    'blockactivation', 'book', 'bool', 'calculateencounterlevel', 
    'calculatefavorcost', 'canfasttraveltomarker', 'canpaycrimegold', 
    'captureframerate', 'cast', 'ceiling', 'cell', 'centeroncell', 
    'centeroncellandwait', 'class', 'clear', 'cleararrested', 
    'cleardestruction', 'clearextraarrows', 'clearforcedmovement', 
    'clearkeepoffsetfromactor', 'clearlookat', 'clearprison', 
    'cleartempeffects', 'closeuserlog', 'completeallobjectives', 
    'completequest', 'computer', 'conditional', 'constructibleobject', 
    'container', 'cos', 'createdetectionevent', 'damageactorvalue', 'damageav', 
    'damageobject', 'dbsendplayerposition', 'debug', 'debugchannelnotify', 
    'debugtablecount', 'degreestoradians', 'delete', 'deletewhenable', 
    'disable', 'disablenowait', 'disableplayercontrols', 'dispel', 
    'dispelallspells', 'dispelspell', 'docombatspellapply', 'door', 
    'dropobject', 'dumpaliasdata', 'effectshader', 'enable', 'enableai', 
    'enablefasttravel', 'enablenowait', 'enableplayercontrols', 'enchantment', 
    'encounterzone', 'endframeratecapture', 'endfunction', 'endproperty', 
    'endstate', 'equipitem', 'equipshout', 'equipspell', 'evaluatepackage', 
    'explosion', 'extends', 'faction', 'fadeoutgame', 'failallobjectives', 
    'false', 'fasttravel', 'find', 'findclosestactor', 
    'findclosestreferenceofanytypeinlist', 'findclosestreferenceoftype', 
    'findrandomactor', 'findrandomreferenceofanytypeinlist', 
    'findrandomreferenceoftype', 'findstruct', 'findweather', 'fire', 'flags', 
    'float', 'floor', 'flora', 'forceactive', 'forceactorvalue', 
    'forceaddragdolltoworld', 'forceav', 'forcefirstperson', 'forcelocationto', 
    'forcemovementdirection', 'forcemovementdirectionramp', 
    'forcemovementrotationspeed', 'forcemovementrotationspeedramp', 
    'forcemovementspeed', 'forcemovementspeedramp', 'forcerefto', 
    'forceremoveragdollfromworld', 'forcestart', 'forcetargetangle', 
    'forcetargetdirection', 'forcetargetspeed', 'forcethirdperson', 'form', 
    'formlist', 'function', 'functions', 'furniture', 'game', 
    'gametimetostring', 'get', 'getactorbase', 'getactorowner', 
    'getactorreference', 'getactorvalue', 'getactorvaluepercentage', 'getalias', 
    'getanglex', 'getangley', 'getanglez', 'getanimationvariablebool', 
    'getanimationvariablefloat', 'getanimationvariableint', 
    'getassociatedskill', 'getat', 'getav', 'getaverageframerate', 
    'getavpercentage', 'getbaseactorvalue', 'getbaseav', 'getbaseobject', 
    'getbribeamount', 'getbudgetcount', 'getbudgetname', 'getcasteractor', 
    'getclass', 'getclassification', 'getcombatstate', 'getcombattarget', 
    'getconfigname', 'getcrimefaction', 'getcrimegold', 
    'getcrimegoldnonviolent', 'getcrimegoldviolent', 'getcurrentbudget', 
    'getcurrentdestructionstage', 'getcurrentgametime', 'getcurrentlocation', 
    'getcurrentmemory', 'getcurrentpackage', 'getcurrentrealtime', 
    'getcurrentscene', 'getcurrentstageid', 'getcurrentweather', 
    'getcurrentweathertransition', 'getdeadcount', 'getdialoguetarget', 
    'getdistance', 'geteditorlocation', 'getequippeditemtype', 
    'getequippedshield', 'getequippedshout', 'getequippedspell', 
    'getequippedweapon', 'getfactionowner', 'getfactionrank', 
    'getfactionreaction', 'getfavorpoints', 'getflyingstate', 
    'getforcedlandingmarker', 'getform', 'getformid', 'getgamesettingfloat', 
    'getgamesettingint', 'getgamesettingstring', 'getgiftfilter', 
    'getgoldamount', 'getgoldvalue', 'getheadingangle', 'getheight', 
    'gethigestrelationshiprank', 'gethighestrelationshiprank', 'getinfamy', 
    'getinfamynonviolent', 'getinfamyviolent', 'getitemcount', 
    'getitemhealthpercent', 'getkey', 'getkeyworddata', 'getkiller', 
    'getlength', 'getlevel', 'getleveledactorbase', 'getlightlevel', 
    'getlinkedref', 'getlocation', 'getlocklevel', 'getlowestrelationshiprank', 
    'getmass', 'getmaxframerate', 'getminframerate', 'getnobleedoutrecovery', 
    'getnthlinkedref', 'getopenstate', 'getoutgoingweather', 'getowningquest', 
    'getparentcell', 'getplatformname', 'getplayer', 'getplayercontrols', 
    'getplayergrabbedref', 'getplayerslastriddenhorse', 'getpositionx', 
    'getpositiony', 'getpositionz', 'getrace', 'getreaction', 
    'getrealhourspassed', 'getref', 'getreference', 'getreftypealivecount', 
    'getreftypedeadcount', 'getregard', 'getrelationshiprank', 'getreputation', 
    'getscale', 'getsex', 'getsitstate', 'getsize', 'getskymode', 
    'getsleepstate', 'getstage', 'getstagedone', 'getstate', 
    'getstolenitemvaluecrime', 'getstolenitemvaluenocrime', 'gettargetactor', 
    'gettemplate', 'gettriggerobjectcount', 'getvalue', 'getvalueint', 
    'getversionnumber', 'getvoicerecoverytime', 'getvoicetype', 'getwidth', 
    'getworldspace', 'global', 'globalvariable', 'gotostate', 'gtlocklevel', 
    'hasassociation', 'hascommonparent', 'haseffectkeyword', 
    'hasfamilyrelationship', 'hasform', 'haskeyword', 'haslos', 
    'hasmagiceffect', 'hasmagiceffectwithkeyword', 'hasnode', 
    'hasparentrelationship', 'hasperk', 'hasreftype', 'hasspell', 'hazard', 
    'hidden', 'hidetitlesequencemenu', 'idle', 'if', 'ignorefriendlyhits', 
    'imagespacemodifier', 'impactdataset', 'incrementskill', 'incrementskillby', 
    'incrementstat', 'ingredient', 'int', 'interruptcast', 'is', 'is3dloaded', 
    'isactioncomplete', 'isactivatechild', 'isactivatecontrolsenabled', 
    'isactivationblocked', 'isactive', 'isalarmed', 'isalerted', 
    'isallowedtofly', 'isarrested', 'isarrestingtarget', 'isattached', 
    'isbleedingout', 'isbribed', 'iscamswitchcontrolsenabled', 'ischild', 
    'iscleared', 'iscommandedactor', 'iscompleted', 'isdead', 'isdetectedby', 
    'isdisabled', 'isdoingfavor', 'isequipped', 'isessential', 'iseuiped', 
    'isfactionincrimegroup', 'isfasttravelenabled', 'isfightingcontrolsenabled', 
    'isflying', 'isfurnitureinuse', 'isfurnituremarkerinuse', 'isghost', 
    'isguard', 'ishostile', 'ishostiletoactor', 'isignoringfriendlyhits', 
    'isincombat', 'isindialoguewithplayer', 'isinfaction', 'isininterior', 
    'isinkillmove', 'isinmenumode', 'isinterior', 'isintimidated', 
    'isinvulnerable', 'isjournalcontrolsenabled', 'isloaded', 'islockbroken', 
    'islocked', 'islookingcontrolsenabled', 'ismapmarkervisible', 
    'ismenucontrolsenabled', 'ismovementcontrolsenabled', 
    'isobjectivecompleted', 'isobjectivedisplayed', 'isobjectivefailed', 
    'isplayerexpelled', 'isplayerslastriddenhorse', 'isplayerteammate', 
    'isplaying', 'isprotected', 'isrunning', 'issamelocation', 'issneaking', 
    'issneakingcontrolsenabled', 'issprinting', 'isstagedone', 'isstartin', 
    'isstarting', 'isstopped', 'isstopping', 'istrespassing', 'isunconscious', 
    'isunique', 'isweapondrawn', 'iswordunlocked', 'jump', 
    'keepoffsetfromactor', 'key', 'keyword', 'kill', 'killsilent', 
    'knockareaeffect', 'learnalleffects', 'learneffect', 'learnnexteffect', 
    'length', 'leveledactor', 'leveleditem', 'leveledspell', 'light', 'local', 
    'location', 'locationalias', 'locationreftype', 'lock', 'magiceffect', 
    'math', 'message', 'messagebox', 'miscobject', 'modactorvalue', 'modav', 
    'modcrimegold', 'modfactionrank', 'modfavorpoints', 
    'modfavorpointswithglobal', 'modreaction', 'modregard', 'moveto', 
    'movetointeractionlocation', 'movetomyeditorlocation', 'movetonode', 
    'movetopackagelocation', 'movetowhenunloaded', 'musictype', 'mute', 'new', 
    'none', 'not', 'notification', 'objectname', 'objectreference', 
    'objectscount', 'onactivate', 'onanimationevent', 'onattachedtocell', 
    'onbeginstate', 'oncellattach', 'oncelldetach', 'oncellload', 'onclose', 
    'oncombatstatechanged', 'oncontainerchanged', 'ondeath', 
    'ondestructionstagechanged', 'ondetachedfromcell', 'ondying', 
    'oneffectfinish', 'oneffectstart', 'onendstate', 'onenterbleedout', 
    'onequipped', 'ongainlos', 'ongetup', 'ongrab', 'onhit', 'oninit', 
    'onitemadded', 'onitemremoved', 'onload', 'onlocationchange', 
    'onlockstatechanged', 'onlostlos', 'onmagiceffectapply', 'onobjectequipped', 
    'onobjectunequipped', 'onopen', 'onpackagechange', 'onpackageend', 
    'onpackagestart', 'onraceswitchcomplete', 'onread', 'onrelease', 'onreset', 
    'onsell', 'onsleepstart', 'onsleepstop', 'onstoryactivateactor', 
    'onstoryaddtoplayer', 'onstoryarrest', 'onstoryassaultactor', 
    'onstorybribenpc', 'onstorycastmagic', 'onstorychangelocation', 
    'onstorycraftitem', 'onstorycrimegold', 'onstorycure', 'onstorydialogue', 
    'onstorydiscoverdeadbody', 'onstoryescapejail', 'onstoryflatternpc', 
    'onstoryhello', 'onstoryincreaselevel', 'onstoryincreaseskill', 
    'onstoryinfection', 'onstoryintimidatenpc', 'onstoryjail', 
    'onstorykillactor', 'onstorynewvoicepower', 'onstorypayfine', 
    'onstorypicklock', 'onstoryplayergetsfavor', 'onstoryrelationshipchange', 
    'onstoryremovefromplayer', 'onstoryscript', 'onstoryservedtime', 
    'onstorytrespass', 'ontrackedstatsevent', 'ontranslationalmostcomplete', 
    'ontranslationcomplete', 'ontranslationfailed', 'ontraphit', 
    'ontraphitstart', 'ontraphitstop', 'ontrigger', 'ontriggerenter', 
    'ontriggerleave', 'onunequipped', 'onunload', 'onupdate', 
    'onupdategametime', 'onwardhit', 'openinventory', 'openuserlog', 'outfit', 
    'overbudget', 'package', 'papyrusversion', 'parent', 'pathtoreference', 
    'pause', 'perk', 'placeactoratme', 'placeatme', 'play', 'playandwait', 
    'playanimation', 'playanimationandwait', 'playerknows', 
    'playermovetoandwait', 'playerpaycrimegold', 'playgamebryoanimation', 
    'playidle', 'playidlewithtarget', 'playimpacteffect', 
    'playsubgraphanimation', 'playsyncedanimationandwaitss', 
    'playsyncedanimationss', 'playterraineffect', 'popto', 'potion', 'pow', 
    'precachechargen', 'precachechargenclear', 'processtraphit', 'projectile', 
    'properties', 'property', 'pushactoraway', 'querystat', 'quest', 'quitgame', 
    'quittomainmenu', 'race', 'radianstodegrees', 'randomfloat', 'randomint', 
    'referencealias', 'registerforanimationevent', 'registerforlos', 
    'registerforremoteevent', 'registerforsinglelosgain', 
    'registerforsingleloslost', 'registerforsingleupdate', 
    'registerforsingleupdategametime', 'registerforsleep', 
    'registerfortrackedstatsevent', 'registerfortutorialevent', 
    'registerforupdate', 'registerforupdategametime', 'releaseoverride', 
    'remotecast', 'remove', 'removeaddedform', 'removeallinventoryeventfilters', 
    'removeallitems', 'removecrossfade', 
    'removedependentanimatedobjectreference', 'removefromallfactions', 
    'removefromfaction', 'removehavokconstraints', 'removeinventoryeventfilter', 
    'removeitem', 'removelast', 'removeperk', 'removeshout', 'removespell', 
    'requestautosave', 'requestmodel', 'requestsave', 'reset', 
    'resethealthandlimbs', 'resethelpmessage', 'restoreactorvalue', 'restoreav', 
    'resurrect', 'return', 'revert', 'rfind', 'rfindstruct', 'say', 'scene', 
    'script', 'scroll', 'self', 'sendanimationevent', 'sendassaultalarm', 
    'sendcustomevent', 'sendplayertojail', 'sendstealalarm', 'sendstoryevent', 
    'sendstoryeventandwait', 'sendtrespassalarm', 'sendwerewolftransformation', 
    'servetime', 'set', 'setactive', 'setactorcause', 'setactorowner', 
    'setactorvalue', 'setalert', 'setallowflying', 'setally', 'setalpha', 
    'setangle', 'setanimationvariablebool', 'setanimationvariablefloat', 
    'setanimationvariableint', 'setattackactoronsight', 'setav', 'setbeastform', 
    'setbribed', 'setcameratarget', 'setcleared', 'setcrimefaction', 
    'setcrimegold', 'setcrimegoldviolent', 'setcriticalstage', 
    'setcurrentstageid', 'setdestroyed', 'setdoingfavor', 'setenemy', 
    'setessential', 'setfactionowner', 'setfactionrank', 'setfogplanes', 
    'setfogpower', 'setfootik', 'setforcedlandingmarker', 'setfrequency', 
    'setghost', 'setgodmode', 'setheadtracking', 'sethudcartmode', 
    'setinchargen', 'setinibool', 'setinifloat', 'setiniint', 'setinistring', 
    'setinstancevolume', 'setintimidated', 'setinvulnerable', 'setkeyworddata', 
    'setlocklevel', 'setlookat', 'setmotiontype', 'setnobleedoutrecovery', 
    'setnofavorallowed', 'setnotshowonstealthmeter', 'setobjectivecompleted', 
    'setobjectivedisplayed', 'setobjectivefailed', 'setopen', 'setoutfit', 
    'setplayeraidriven', 'setplayercontrols', 'setplayerenemy', 
    'setplayerexpelled', 'setplayerreportcrime', 'setplayerresistingarrest', 
    'setplayerteammate', 'setposition', 'setprotected', 'setpublic', 'setrace', 
    'setraction', 'setreaction', 'setrelationshiprank', 'setrestrained', 
    'setscale', 'setsittingrotation', 'setstage', 'setunconscious', 'setvalue', 
    'setvalueint', 'setvehicle', 'setvoicerecoverytime', 'setvolume', 
    'shakecamera', 'shakecontroller', 'shout', 'show', 'showashelpmessage', 
    'showbartermenu', 'showfirstpersongeometry', 'showgiftmenu', 'showracemenu', 
    'showrefposition', 'showtitlesequencemenu', 'showtrainingmenu', 'sin', 
    'soulgem', 'sound', 'soundcategory', 'spell', 'splinetranslateto', 
    'splinetranslatetorefnode', 'sqrt', 'start', 'startcannibal', 'startcombat', 
    'startframeratecapture', 'startobjectprofiling', 'startscriptprofiling', 
    'startstackprofiling', 'starttitlesequence', 'startvampirefeed', 'state', 
    'static', 'stop', 'stopcombat', 'stopcombatalarm', 'stopinstance', 
    'stopobjectprofiling', 'stopscriptprofiling', 'stopstackprofiling', 
    'stoptranslation', 'string', 'stringtablecount', 'takescreenshot', 
    'talkingactivator', 'tan', 'teachword', 'tethertohorse', 'then', 'timedata', 
    'toggleai', 'togglecollisions', 'togglemenus', 'topic', 'topicinfo', 
    'trace', 'traceconditional', 'tracestack', 'traceuser', 'translateto', 
    'trapsoul', 'triggerscreenblood', 'true', 'trytoaddtofaction', 
    'trytodisable', 'trytoenable', 'trytoevaluatepackage', 'trytokill', 
    'trytomoveto', 'trytoremovefromfaction', 'trytoreset', 'trytostopcombat', 
    'unequipall', 'unequipitem', 'unequipshout', 'unequipspell', 
    'unlockowneddoorsincell', 'unlockword', 'unmute', 'unpause', 
    'unregisterforanimationevent', 'unregisterforlos', 
    'unregisterforremoteevent', 'unregisterforsleep', 
    'unregisterfortrackedstatsevent', 'unregisterfortutorialevent', 
    'unregisterforupdate', 'unregisterforupdategametime', 
    'updatecurrentinstanceglobal', 'user', 'userflagscount', 'usinggamepad', 
    'utility', 'vars', 'visualeffect', 'voicetype', 'wait', 
    'waitforanimationevent', 'waitgametime', 'waitmenumode', 'weapon', 
    'weather', 'willintimidatesucceed', 'wordofpower', 'worldspace', 
    'wornhaskeyword' 
  );

  KeyIndices: array[0..23268] of Integer = (
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 212, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 494, -1, -1, -1, -1, -1, 469, -1, -1, 
    -1, 134, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 738, 
    22, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 312, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    363, -1, -1, -1, -1, -1, -1, -1, 674, -1, -1, -1, -1, -1, 407, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 227, -1, -1, -1, -1, 124, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 682, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    556, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 404, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    715, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 711, -1, -1, -1, -1, 
    -1, -1, -1, -1, 488, -1, 33, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 280, -1, 772, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 393, -1, -1, 
    -1, 600, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 517, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 705, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 330, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 31, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 822, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 272, -1, -1, 750, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 196, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 561, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 619, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 791, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 761, -1, 
    386, -1, -1, 410, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 325, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 610, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 417, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 190, -1, -1, -1, -1, -1, -1, -1, 194, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 504, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 328, -1, -1, -1, -1, -1, -1, -1, 71, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 329, -1, 
    -1, -1, -1, -1, -1, -1, 278, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 41, -1, 714, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 532, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 411, -1, -1, -1, -1, -1, -1, -1, -1, -1, 625, 473, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 744, -1, -1, 803, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 108, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 573, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    74, -1, -1, -1, -1, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 63, -1, -1, -1, 525, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 524, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 722, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 588, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 551, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 423, -1, -1, -1, -1, -1, -1, 
    349, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 785, -1, -1, -1, -1, 82, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    116, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 364, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 693, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 137, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 147, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 720, 
    146, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 232, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 42, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 43, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 678, -1, 639, 697, -1, -1, -1, -1, -1, -1, 
    -1, 355, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 432, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 624, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 746, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 601, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 462, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 826, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 733, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 40, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 737, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 799, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 814, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 191, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 492, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 706, -1, -1, -1, -1, -1, -1, -1, -1, 
    655, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 305, -1, -1, -1, -1, 
    451, -1, -1, -1, 662, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 215, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 694, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    3, -1, -1, -1, 816, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 808, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 563, -1, -1, -1, 149, -1, -1, 
    -1, -1, 170, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 171, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 506, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 99, 
    391, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 782, -1, -1, 332, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 622, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 668, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 12, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 767, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    177, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 159, -1, 
    415, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 18, -1, 778, -1, -1, -1, -1, -1, -1, 544, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 584, -1, -1, -1, -1, -1, 131, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 85, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 86, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 306, -1, -1, -1, -1, 528, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 483, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    670, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 243, -1, 
    -1, -1, -1, -1, -1, -1, -1, 47, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    719, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 135, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 186, -1, -1, -1, -1, 
    -1, 60, -1, -1, -1, -1, -1, -1, -1, 245, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 39, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 725, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    219, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 717, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 558, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 7, -1, -1, -1, -1, -1, -1, -1, 516, -1, -1, -1, -1, 
    -1, -1, -1, -1, 45, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 784, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    567, -1, -1, -1, -1, -1, -1, -1, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 749, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 666, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 809, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 543, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 345, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 702, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 789, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 389, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 283, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 548, -1, 
    -1, -1, -1, -1, -1, -1, 455, -1, 790, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 224, -1, -1, -1, -1, -1, -1, 339, -1, -1, 216, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 512, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 281, 
    -1, -1, -1, 642, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 765, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 226, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 759, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 447, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 818, -1, 16, -1, -1, -1, 
    -1, -1, -1, -1, 94, 732, -1, -1, -1, -1, -1, -1, -1, 526, -1, 11, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 148, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 630, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 585, -1, -1, -1, -1, -1, 
    464, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 771, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 379, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 652, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 14, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 781, -1, -1, 
    -1, -1, -1, 319, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 743, 
    -1, -1, -1, -1, -1, -1, -1, -1, 294, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 129, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 238, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 310, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 83, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 429, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 158, -1, -1, -1, -1, -1, -1, -1, 794, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 316, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 231, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 113, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 197, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 151, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 338, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 476, -1, -1, -1, 
    -1, -1, -1, -1, -1, 174, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 760, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 618, -1, 295, -1, -1, -1, -1, -1, 318, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 397, -1, -1, -1, 
    -1, -1, -1, -1, -1, 729, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 195, 
    -1, -1, -1, -1, -1, -1, -1, -1, 327, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 250, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 46, -1, -1, -1, 430, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 409, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 98, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 234, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 359, -1, -1, -1, -1, -1, -1, 680, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    590, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 825, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 716, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 487, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 611, -1, 
    -1, -1, -1, -1, -1, -1, -1, 612, -1, -1, -1, -1, 28, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 755, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 425, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 262, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 365, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 367, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 437, -1, -1, 
    -1, -1, -1, -1, 695, -1, -1, -1, -1, -1, 144, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 256, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 354, -1, -1, -1, -1, -1, -1, 
    502, -1, -1, -1, -1, -1, -1, -1, -1, -1, 683, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 286, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 166, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 747, -1, -1, -1, -1, -1, -1, 
    -1, -1, 726, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 340, -1, -1, -1, 703, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    723, -1, -1, -1, -1, 481, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 550, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 385, 651, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 301, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 712, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 81, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 72, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 350, 304, -1, 341, 246, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 727, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 627, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 78, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 541, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 766, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 552, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 689, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 740, -1, -1, -1, 
    -1, 783, -1, 491, -1, 61, -1, -1, -1, -1, -1, -1, -1, -1, 646, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 745, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 780, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 718, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 704, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 368, -1, -1, -1, -1, 15, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 48, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 636, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    467, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 353, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 207, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 88, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, -1, -1, -1, 687, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 827, 628, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 574, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 315, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 795, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 546, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 511, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 657, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 792, -1, -1, 730, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 700, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 298, -1, -1, -1, -1, 
    -1, 641, -1, -1, -1, -1, -1, -1, -1, 337, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 811, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 101, -1, -1, -1, -1, -1, 372, -1, -1, -1, 
    292, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 472, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 161, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 452, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 181, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 580, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 387, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, -1, -1, -1, 
    500, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 505, 
    -1, -1, -1, -1, 267, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 519, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 112, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 586, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 180, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 495, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    569, -1, -1, -1, -1, -1, -1, -1, -1, 382, -1, -1, -1, -1, -1, -1, -1, -1, 
    456, -1, -1, -1, 681, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 609, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 54, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 631, -1, -1, -1, -1, -1, -1, -1, -1, 615, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 100, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 535, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 644, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 593, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 198, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 140, -1, -1, -1, -1, -1, -1, -1, -1, 89, 463, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    530, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 335, -1, 617, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 27, -1, -1, -1, -1, 531, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 50, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 823, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 126, 607, -1, 182, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 807, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 523, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 258, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 259, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 260, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 239, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 127, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 501, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 536, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 422, -1, 553, -1, -1, -1, -1, 
    -1, 828, -1, -1, -1, -1, -1, -1, -1, -1, 515, 333, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 793, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 479, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 58, -1, -1, -1, -1, -1, 
    308, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 77, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 436, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 696, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 684, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 775, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 55, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 438, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 453, -1, -1, -1, -1, -1, -1, -1, 169, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 804, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 222, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 576, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 480, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 152, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 80, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 520, -1, -1, -1, -1, -1, -1, -1, -1, 
    400, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 49, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 362, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 96, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 797, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 402, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 206, -1, -1, -1, -1, 
    -1, -1, -1, -1, 713, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 70, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 248, -1, -1, 774, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 154, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 143, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 299, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 64, -1, -1, -1, 549, -1, -1, -1, -1, 
    -1, -1, -1, 313, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 650, -1, -1, -1, -1, -1, -1, -1, 
    465, -1, -1, -1, -1, -1, -1, -1, -1, 289, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 120, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 721, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 252, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 433, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 769, -1, -1, 701, -1, -1, -1, -1, 427, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 264, -1, -1, -1, -1, -1, 
    -1, -1, -1, 371, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 724, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 708, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 496, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 788, 
    360, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 620, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    529, -1, 547, 477, -1, -1, -1, -1, -1, -1, -1, -1, 779, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 273, -1, -1, -1, -1, -1, 
    -1, -1, 249, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 347, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 559, 
    -1, -1, -1, -1, -1, 428, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 578, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 323, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 265, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 557, 489, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 302, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    179, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 242, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 698, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 317, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    575, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 210, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 121, -1, -1, -1, 608, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 29, -1, -1, -1, 633, -1, -1, -1, 261, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 440, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    450, -1, -1, -1, -1, 796, -1, 237, -1, -1, -1, -1, -1, -1, 806, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 378, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 677, -1, -1, -1, -1, 204, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 824, 562, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 545, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 75, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 587, 
    199, -1, -1, 602, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 527, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 370, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 253, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 581, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 565, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 388, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 392, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 37, -1, -1, -1, -1, -1, -1, -1, -1, 597, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 403, -1, -1, -1, -1, -1, 203, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 742, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 773, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    106, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 490, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 579, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 211, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 398, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 414, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 503, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 366, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 270, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 736, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 293, -1, -1, -1, -1, -1, -1, -1, 189, -1, -1, -1, -1, 424, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    691, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 95, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 361, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 632, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    188, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 128, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 448, 268, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 679, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    458, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 770, -1, -1, -1, -1, -1, -1, -1, -1, 442, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 688, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    443, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 285, -1, -1, -1, -1, 461, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 616, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 752, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 375, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 763, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 801, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 111, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    482, -1, -1, -1, -1, 172, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 132, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 300, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 420, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 228, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 117, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 653, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 8, -1, -1, -1, -1, 
    -1, -1, -1, -1, 762, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 478, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 800, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 257, -1, -1, -1, -1, -1, -1, 67, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 634, -1, -1, -1, -1, -1, -1, 426, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 73, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 591, -1, -1, -1, -1, 640, -1, -1, -1, 52, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 133, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 542, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    413, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 25, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 777, -1, -1, -1, -1, -1, 471, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 540, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 466, -1, -1, -1, -1, -1, -1, -1, -1, -1, 418, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 150, 686, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 521, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 130, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 514, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 221, -1, 621, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 93, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 296, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 498, 786, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 20, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 275, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 728, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 91, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 396, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    167, -1, -1, -1, -1, -1, -1, 649, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 336, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 202, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 220, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 105, -1, -1, 613, 810, -1, -1, -1, 817, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 287, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    369, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    314, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 439, -1, 671, -1, -1, 163, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 164, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 165, -1, -1, -1, -1, -1, -1, 30, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    230, -1, -1, -1, -1, 320, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 734, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 595, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 225, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 408, -1, -1, -1, -1, 
    -1, 324, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 518, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 538, -1, 577, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, 
    139, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 357, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 348, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 606, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 731, -1, -1, -1, -1, -1, -1, -1, 626, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    284, -1, -1, -1, -1, -1, -1, -1, -1, 509, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 263, -1, 374, -1, -1, -1, -1, -1, -1, -1, -1, 533, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 416, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    155, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 741, -1, -1, 
    -1, 175, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 36, -1, -1, -1, -1, -1, -1, -1, -1, -1, 685, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 34, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 390, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 735, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 271, -1, -1, -1, -1, -1, 255, 
    -1, -1, -1, -1, 475, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 454, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 274, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 53, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 24, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 44, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 497, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 160, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 59, -1, -1, 
    -1, 474, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 603, -1, -1, -1, -1, -1, 
    522, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 739, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 208, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 102, -1, -1, -1, -1, -1, -1, -1, 
    690, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 114, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 537, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 162, -1, 
    307, 399, -1, -1, -1, -1, -1, -1, -1, -1, 643, -1, -1, -1, -1, -1, 599, 381, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 499, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    109, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 401, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 276, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 35, -1, 
    -1, 570, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 279, -1, -1, -1, 269, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    405, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 205, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 344, -1, -1, 
    -1, -1, -1, -1, -1, -1, 79, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 507, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 23, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 815, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 419, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 290, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 406, -1, -1, -1, -1, 
    -1, -1, 754, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 17, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 26, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 485, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 709, -1, 92, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 115, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 311, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 470, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 229, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 510, -1, -1, -1, -1, 291, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 119, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 758, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 68, -1, -1, -1, -1, -1, -1, 
    -1, -1, 251, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 645, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 421, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 145, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    240, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 123, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 566, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 288, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 648, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 104, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 571, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 675, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 235, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 247, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 66, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 90, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 604, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 435, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 692, 513, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 380, -1, -1, -1, 664, -1, -1, -1, -1, -1, -1, 
    -1, 659, -1, -1, -1, -1, -1, -1, -1, -1, -1, 672, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 661, -1, -1, -1, -1, -1, -1, -1, 572, -1, -1, -1, -1, -1, -1, 757, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 141, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 233, -1, -1, -1, -1, -1, -1, -1, 412, 
    -1, 277, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 103, -1, -1, -1, 
    -1, 377, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 459, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 710, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 445, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 560, -1, -1, 768, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 343, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 460, -1, -1, 
    605, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 596, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 69, -1, -1, -1, -1, -1, -1, -1, -1, 468, -1, -1, 223, 
    -1, -1, -1, -1, -1, -1, 638, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    812, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 508, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 184, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 56, -1, -1, -1, -1, -1, -1, -1, 673, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 484, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, 122, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 192, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 623, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 582, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 334, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 373, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 798, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 821, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 321, -1, -1, -1, -1, -1, 178, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 214, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 764, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    217, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    555, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 669, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 589, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 331, -1, 309, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 185, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 699, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 157, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 351, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 787, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 32, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 457, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 598, -1, -1, -1, -1, -1, -1, 568, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 665, -1, -1, -1, -1, -1, -1, 342, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 583, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 676, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 802, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 431, -1, 539, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 57, -1, -1, -1, -1, -1, -1, -1, -1, -1, 183, -1, 
    -1, -1, 820, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 358, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 187, -1, 654, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 444, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 449, 297, -1, 156, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 776, 
    564, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 614, -1, -1, 637, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 254, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 209, -1, -1, 493, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, 667, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    110, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 753, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 19, 
    -1, -1, -1, -1, -1, -1, 594, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 176, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 346, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 65, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 173, -1, -1, -1, -1, -1, -1, -1, -1, 84, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 707, -1, -1, 
    -1, -1, -1, 441, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 813, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, 244, -1, -1, -1, 21, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 136, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 819, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 663, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 592, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 236, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 352, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    660, -1, -1, -1, -1, -1, -1, -1, -1, -1, 434, 107, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, 356, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 486, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 87, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 218, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 756, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 76, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 647, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, 118, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    658, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 656, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 303, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 266, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, 376, -1, -1, -1, -1, -1, -1, -1, -1, -1, 97, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 751, -1, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    142, 629, -1, -1, -1, -1, -1, -1, -1, -1, 326, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 635, -1, -1, -1, -1, -1, -1, 125, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, 805, -1, 138, -1, 383, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 322, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, 200, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 554, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 395, -1, -1, -1, -1, -1, -1, 384, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 51, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 394, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, 446, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, 748, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 282 
  );

procedure TSynSampleSyn.InitIdent;
var
  i: Integer;
begin
  for i := Low(fIdentFuncTable) to High(fIdentFuncTable) do
    if KeyIndices[i] = -1 then
      fIdentFuncTable[i] := AltFunc;

  fIdentFuncTable[19815] := Func95fo4;
  fIdentFuncTable[1958] := FuncAbs;
  fIdentFuncTable[22602] := FuncAcos;
  fIdentFuncTable[3193] := FuncAction;
  fIdentFuncTable[16135] := FuncActivate;
  fIdentFuncTable[9029] := FuncActivator;
  fIdentFuncTable[14605] := FuncActivemagiceffect;
  fIdentFuncTable[4408] := FuncActor;
  fIdentFuncTable[14462] := FuncActorbase;
  fIdentFuncTable[12182] := FuncAdd;
  fIdentFuncTable[12977] := FuncAddachievement;
  fIdentFuncTable[5249] := FuncAdddependentanimatedobjectreference;
  fIdentFuncTable[3584] := FuncAddform;
  fIdentFuncTable[7880] := FuncAddhavokballandsocketconstraint;
  fIdentFuncTable[5553] := FuncAddinventoryeventfilter;
  fIdentFuncTable[7855] := FuncAdditem;
  fIdentFuncTable[5230] := FuncAddperk;
  fIdentFuncTable[17972] := FuncAddshout;
  fIdentFuncTable[3781] := FuncAddspell;
  fIdentFuncTable[21470] := FuncAddtextreplacementdata;
  fIdentFuncTable[15380] := FuncAddtofaction;
  fIdentFuncTable[21762] := FuncAddtomap;
  fIdentFuncTable[74] := FuncAdvanceskill;
  fIdentFuncTable[17742] := FuncAlias;
  fIdentFuncTable[16919] := FuncAllowbleedoutdialogue;
  fIdentFuncTable[14820] := FuncAllowpcdialogue;
  fIdentFuncTable[17999] := FuncAmmo;
  fIdentFuncTable[9797] := FuncApparatus;
  fIdentFuncTable[6664] := FuncApply;
  fIdentFuncTable[12150] := FuncApplycrossfade;
  fIdentFuncTable[15860] := FuncApplyhavokimpulse;
  fIdentFuncTable[758] := FuncArmor;
  fIdentFuncTable[20695] := FuncAs;
  fIdentFuncTable[610] := FuncAsin;
  fIdentFuncTable[16612] := FuncAssociationtype;
  fIdentFuncTable[17519] := FuncAtan;
  fIdentFuncTable[16584] := FuncAttachashpile;
  fIdentFuncTable[12825] := FuncAuto;
  fIdentFuncTable[8101] := FuncAutoreadonly;
  fIdentFuncTable[4149] := FuncAutostatename;
  fIdentFuncTable[2611] := FuncAutovarname;
  fIdentFuncTable[1469] := FuncBlockactivation;
  fIdentFuncTable[2276] := FuncBook;
  fIdentFuncTable[2292] := FuncBool;
  fIdentFuncTable[16936] := FuncCalculateencounterlevel;
  fIdentFuncTable[4425] := FuncCalculatefavorcost;
  fIdentFuncTable[6356] := FuncCanfasttraveltomarker;
  fIdentFuncTable[4010] := FuncCanpaycrimegold;
  fIdentFuncTable[7913] := FuncCaptureframerate;
  fIdentFuncTable[11014] := FuncCast;
  fIdentFuncTable[9841] := FuncCeiling;
  fIdentFuncTable[23170] := FuncCell;
  fIdentFuncTable[14723] := FuncCenteroncell;
  fIdentFuncTable[16864] := FuncCenteroncellandwait;
  fIdentFuncTable[9323] := FuncClass;
  fIdentFuncTable[10577] := FuncClear;
  fIdentFuncTable[19754] := FuncCleararrested;
  fIdentFuncTable[21083] := FuncCleardestruction;
  fIdentFuncTable[10421] := FuncClearextraarrows;
  fIdentFuncTable[17048] := FuncClearforcedmovement;
  fIdentFuncTable[4080] := FuncClearkeepoffsetfromactor;
  fIdentFuncTable[7713] := FuncClearlookat;
  fIdentFuncTable[17529] := FuncClearprison;
  fIdentFuncTable[1663] := FuncCleartempeffects;
  fIdentFuncTable[11309] := FuncCloseuserlog;
  fIdentFuncTable[21557] := FuncCompleteallobjectives;
  fIdentFuncTable[19000] := FuncCompletequest;
  fIdentFuncTable[14556] := FuncComputer;
  fIdentFuncTable[18310] := FuncConditional;
  fIdentFuncTable[19644] := FuncConstructibleobject;
  fIdentFuncTable[11185] := FuncContainer;
  fIdentFuncTable[1352] := FuncCos;
  fIdentFuncTable[7436] := FuncCreatedetectionevent;
  fIdentFuncTable[14586] := FuncDamageactorvalue;
  fIdentFuncTable[1604] := FuncDamageav;
  fIdentFuncTable[12315] := FuncDamageobject;
  fIdentFuncTable[22480] := FuncDbsendplayerposition;
  fIdentFuncTable[10440] := FuncDebug;
  fIdentFuncTable[7559] := FuncDebugchannelnotify;
  fIdentFuncTable[17678] := FuncDebugtablecount;
  fIdentFuncTable[10970] := FuncDegreestoradians;
  fIdentFuncTable[7422] := FuncDelete;
  fIdentFuncTable[1921] := FuncDeletewhenable;
  fIdentFuncTable[5736] := FuncDisable;
  fIdentFuncTable[21637] := FuncDisablenowait;
  fIdentFuncTable[3862] := FuncDisableplayercontrols;
  fIdentFuncTable[3906] := FuncDispel;
  fIdentFuncTable[22330] := FuncDispelallspells;
  fIdentFuncTable[8090] := FuncDispelspell;
  fIdentFuncTable[9571] := FuncDocombatspellapply;
  fIdentFuncTable[19034] := FuncDoor;
  fIdentFuncTable[15513] := FuncDropobject;
  fIdentFuncTable[18031] := FuncDumpaliasdata;
  fIdentFuncTable[15200] := FuncEffectshader;
  fIdentFuncTable[5238] := FuncEnable;
  fIdentFuncTable[13387] := FuncEnableai;
  fIdentFuncTable[11062] := FuncEnablefasttravel;
  fIdentFuncTable[22814] := FuncEnablenowait;
  fIdentFuncTable[6442] := FuncEnableplayercontrols;
  fIdentFuncTable[3419] := FuncEnchantment;
  fIdentFuncTable[9409] := FuncEncounterzone;
  fIdentFuncTable[8700] := FuncEndframeratecapture;
  fIdentFuncTable[17193] := FuncEndfunction;
  fIdentFuncTable[19371] := FuncEndproperty;
  fIdentFuncTable[18839] := FuncEndstate;
  fIdentFuncTable[15734] := FuncEquipitem;
  fIdentFuncTable[13012] := FuncEquipshout;
  fIdentFuncTable[22090] := FuncEquipspell;
  fIdentFuncTable[1570] := FuncEvaluatepackage;
  fIdentFuncTable[17445] := FuncExplosion;
  fIdentFuncTable[21395] := FuncExtends;
  fIdentFuncTable[14017] := FuncFaction;
  fIdentFuncTable[9124] := FuncFadeoutgame;
  fIdentFuncTable[5877] := FuncFailallobjectives;
  fIdentFuncTable[17246] := FuncFalse;
  fIdentFuncTable[18062] := FuncFasttravel;
  fIdentFuncTable[1945] := FuncFind;
  fIdentFuncTable[14377] := FuncFindclosestactor;
  fIdentFuncTable[22578] := FuncFindclosestreferenceofanytypeinlist;
  fIdentFuncTable[18229] := FuncFindclosestreferenceoftype;
  fIdentFuncTable[11383] := FuncFindrandomactor;
  fIdentFuncTable[12116] := FuncFindrandomreferenceofanytypeinlist;
  fIdentFuncTable[19822] := FuncFindrandomreferenceoftype;
  fIdentFuncTable[18530] := FuncFindstruct;
  fIdentFuncTable[220] := FuncFindweather;
  fIdentFuncTable[22889] := FuncFire;
  fIdentFuncTable[9905] := FuncFlags;
  fIdentFuncTable[10093] := FuncFloat;
  fIdentFuncTable[13502] := FuncFloor;
  fIdentFuncTable[5657] := FuncFlora;
  fIdentFuncTable[15007] := FuncForceactive;
  fIdentFuncTable[3806] := FuncForceactorvalue;
  fIdentFuncTable[14062] := FuncForceaddragdolltoworld;
  fIdentFuncTable[14754] := FuncForceav;
  fIdentFuncTable[57] := FuncForcefirstperson;
  fIdentFuncTable[4059] := FuncForcelocationto;
  fIdentFuncTable[21831] := FuncForcemovementdirection;
  fIdentFuncTable[2177] := FuncForcemovementdirectionramp;
  fIdentFuncTable[22941] := FuncForcemovementrotationspeed;
  fIdentFuncTable[16144] := FuncForcemovementrotationspeedramp;
  fIdentFuncTable[9562] := FuncForcemovementspeed;
  fIdentFuncTable[19318] := FuncForcemovementspeedramp;
  fIdentFuncTable[22856] := FuncForcerefto;
  fIdentFuncTable[11235] := FuncForceremoveragdollfromworld;
  fIdentFuncTable[6890] := FuncForcestart;
  fIdentFuncTable[18396] := FuncForcetargetangle;
  fIdentFuncTable[2229] := FuncForcetargetdirection;
  fIdentFuncTable[2199] := FuncForcetargetspeed;
  fIdentFuncTable[5275] := FuncForcethirdperson;
  fIdentFuncTable[3303] := FuncForm;
  fIdentFuncTable[14970] := FuncFormlist;
  fIdentFuncTable[5991] := FuncFunction;
  fIdentFuncTable[10820] := FuncFunctions;
  fIdentFuncTable[10847] := FuncFurniture;
  fIdentFuncTable[11219] := FuncGame;
  fIdentFuncTable[16520] := FuncGametimetostring;
  fIdentFuncTable[21225] := FuncGet;
  fIdentFuncTable[20599] := FuncGetactorbase;
  fIdentFuncTable[5805] := FuncGetactorowner;
  fIdentFuncTable[3682] := FuncGetactorreference;
  fIdentFuncTable[17004] := FuncGetactorvalue;
  fIdentFuncTable[8794] := FuncGetactorvaluepercentage;
  fIdentFuncTable[17350] := FuncGetalias;
  fIdentFuncTable[15821] := FuncGetanglex;
  fIdentFuncTable[15837] := FuncGetangley;
  fIdentFuncTable[15853] := FuncGetanglez;
  fIdentFuncTable[7019] := FuncGetanimationvariablebool;
  fIdentFuncTable[15560] := FuncGetanimationvariablefloat;
  fIdentFuncTable[12465] := FuncGetanimationvariableint;
  fIdentFuncTable[10633] := FuncGetassociatedskill;
  fIdentFuncTable[3308] := FuncGetat;
  fIdentFuncTable[3340] := FuncGetav;
  fIdentFuncTable[14036] := FuncGetaverageframerate;
  fIdentFuncTable[21628] := FuncGetavpercentage;
  fIdentFuncTable[6052] := FuncGetbaseactorvalue;
  fIdentFuncTable[16559] := FuncGetbaseav;
  fIdentFuncTable[21517] := FuncGetbaseobject;
  fIdentFuncTable[3647] := FuncGetbribeamount;
  fIdentFuncTable[20216] := FuncGetbudgetcount;
  fIdentFuncTable[11956] := FuncGetbudgetname;
  fIdentFuncTable[9171] := FuncGetcasteractor;
  fIdentFuncTable[8931] := FuncGetclass;
  fIdentFuncTable[9908] := FuncGetclassification;
  fIdentFuncTable[21093] := FuncGetcombatstate;
  fIdentFuncTable[19717] := FuncGetcombattarget;
  fIdentFuncTable[20558] := FuncGetconfigname;
  fIdentFuncTable[4074] := FuncGetcrimefaction;
  fIdentFuncTable[21175] := FuncGetcrimegold;
  fIdentFuncTable[13485] := FuncGetcrimegoldnonviolent;
  fIdentFuncTable[13290] := FuncGetcrimegoldviolent;
  fIdentFuncTable[1160] := FuncGetcurrentbudget;
  fIdentFuncTable[2855] := FuncGetcurrentdestructionstage;
  fIdentFuncTable[19834] := FuncGetcurrentgametime;
  fIdentFuncTable[1609] := FuncGetcurrentlocation;
  fIdentFuncTable[1168] := FuncGetcurrentmemory;
  fIdentFuncTable[6234] := FuncGetcurrentpackage;
  fIdentFuncTable[828] := FuncGetcurrentrealtime;
  fIdentFuncTable[5907] := FuncGetcurrentscene;
  fIdentFuncTable[9526] := FuncGetcurrentstageid;
  fIdentFuncTable[12406] := FuncGetcurrentweather;
  fIdentFuncTable[22989] := FuncGetcurrentweathertransition;
  fIdentFuncTable[22843] := FuncGetdeadcount;
  fIdentFuncTable[15689] := FuncGetdialoguetarget;
  fIdentFuncTable[12859] := FuncGetdistance;
  fIdentFuncTable[12263] := FuncGeteditorlocation;
  fIdentFuncTable[17630] := FuncGetequippeditemtype;
  fIdentFuncTable[11162] := FuncGetequippedshield;
  fIdentFuncTable[8073] := FuncGetequippedshout;
  fIdentFuncTable[17151] := FuncGetequippedspell;
  fIdentFuncTable[21323] := FuncGetequippedweapon;
  fIdentFuncTable[12082] := FuncGetfactionowner;
  fIdentFuncTable[13143] := FuncGetfactionrank;
  fIdentFuncTable[37] := FuncGetfactionreaction;
  fIdentFuncTable[4466] := FuncGetfavorpoints;
  fIdentFuncTable[20241] := FuncGetflyingstate;
  fIdentFuncTable[3124] := FuncGetforcedlandingmarker;
  fIdentFuncTable[5005] := FuncGetform;
  fIdentFuncTable[20301] := FuncGetformid;
  fIdentFuncTable[22372] := FuncGetgamesettingfloat;
  fIdentFuncTable[4345] := FuncGetgamesettingint;
  fIdentFuncTable[15701] := FuncGetgamesettingstring;
  fIdentFuncTable[15148] := FuncGetgiftfilter;
  fIdentFuncTable[10672] := FuncGetgoldamount;
  fIdentFuncTable[19656] := FuncGetgoldvalue;
  fIdentFuncTable[4995] := FuncGetheadingangle;
  fIdentFuncTable[15992] := FuncGetheight;
  fIdentFuncTable[5116] := FuncGethigestrelationshiprank;
  fIdentFuncTable[215] := FuncGethighestrelationshiprank;
  fIdentFuncTable[14366] := FuncGetinfamy;
  fIdentFuncTable[18161] := FuncGetinfamynonviolent;
  fIdentFuncTable[15937] := FuncGetinfamyviolent;
  fIdentFuncTable[5862] := FuncGetitemcount;
  fIdentFuncTable[2263] := FuncGetitemhealthpercent;
  fIdentFuncTable[19348] := FuncGetkey;
  fIdentFuncTable[6472] := FuncGetkeyworddata;
  fIdentFuncTable[18953] := FuncGetkiller;
  fIdentFuncTable[21968] := FuncGetlength;
  fIdentFuncTable[12226] := FuncGetlevel;
  fIdentFuncTable[5679] := FuncGetleveledactorbase;
  fIdentFuncTable[10058] := FuncGetlightlevel;
  fIdentFuncTable[18469] := FuncGetlinkedref;
  fIdentFuncTable[849] := FuncGetlocation;
  fIdentFuncTable[12004] := FuncGetlocklevel;
  fIdentFuncTable[4001] := FuncGetlowestrelationshiprank;
  fIdentFuncTable[21758] := FuncGetmass;
  fIdentFuncTable[4088] := FuncGetmaxframerate;
  fIdentFuncTable[7459] := FuncGetminframerate;
  fIdentFuncTable[18989] := FuncGetnobleedoutrecovery;
  fIdentFuncTable[11196] := FuncGetnthlinkedref;
  fIdentFuncTable[11810] := FuncGetopenstate;
  fIdentFuncTable[6344] := FuncGetoutgoingweather;
  fIdentFuncTable[18319] := FuncGetowningquest;
  fIdentFuncTable[11438] := FuncGetparentcell;
  fIdentFuncTable[12571] := FuncGetplatformname;
  fIdentFuncTable[21297] := FuncGetplayer;
  fIdentFuncTable[16746] := FuncGetplayercontrols;
  fIdentFuncTable[6901] := FuncGetplayergrabbedref;
  fIdentFuncTable[14549] := FuncGetplayerslastriddenhorse;
  fIdentFuncTable[9994] := FuncGetpositionx;
  fIdentFuncTable[10010] := FuncGetpositiony;
  fIdentFuncTable[10026] := FuncGetpositionz;
  fIdentFuncTable[12158] := FuncGetrace;
  fIdentFuncTable[6730] := FuncGetreaction;
  fIdentFuncTable[16408] := FuncGetrealhourspassed;
  fIdentFuncTable[11557] := FuncGetref;
  fIdentFuncTable[11893] := FuncGetreference;
  fIdentFuncTable[22733] := FuncGetreftypealivecount;
  fIdentFuncTable[9055] := FuncGetreftypedeadcount;
  fIdentFuncTable[13520] := FuncGetregard;
  fIdentFuncTable[17571] := FuncGetrelationshiprank;
  fIdentFuncTable[13248] := FuncGetreputation;
  fIdentFuncTable[16740] := FuncGetscale;
  fIdentFuncTable[803] := FuncGetsex;
  fIdentFuncTable[11802] := FuncGetsitstate;
  fIdentFuncTable[16850] := FuncGetsize;
  fIdentFuncTable[15448] := FuncGetskymode;
  fIdentFuncTable[17497] := FuncGetsleepstate;
  fIdentFuncTable[19358] := FuncGetstage;
  fIdentFuncTable[1384] := FuncGetstagedone;
  fIdentFuncTable[17567] := FuncGetstate;
  fIdentFuncTable[636] := FuncGetstolenitemvaluecrime;
  fIdentFuncTable[5062] := FuncGetstolenitemvaluenocrime;
  fIdentFuncTable[23268] := FuncGettargetactor;
  fIdentFuncTable[4834] := FuncGettemplate;
  fIdentFuncTable[16389] := FuncGettriggerobjectcount;
  fIdentFuncTable[13810] := FuncGetvalue;
  fIdentFuncTable[6987] := FuncGetvalueint;
  fIdentFuncTable[15771] := FuncGetversionnumber;
  fIdentFuncTable[18760] := FuncGetvoicerecoverytime;
  fIdentFuncTable[11365] := FuncGetvoicetype;
  fIdentFuncTable[17905] := FuncGetwidth;
  fIdentFuncTable[18181] := FuncGetworldspace;
  fIdentFuncTable[8710] := FuncGlobal;
  fIdentFuncTable[13282] := FuncGlobalvariable;
  fIdentFuncTable[5638] := FuncGotostate;
  fIdentFuncTable[6188] := FuncGtlocklevel;
  fIdentFuncTable[15332] := FuncHasassociation;
  fIdentFuncTable[21223] := FuncHascommonparent;
  fIdentFuncTable[8650] := FuncHaseffectkeyword;
  fIdentFuncTable[11266] := FuncHasfamilyrelationship;
  fIdentFuncTable[14251] := FuncHasform;
  fIdentFuncTable[7321] := FuncHaskeyword;
  fIdentFuncTable[11939] := FuncHaslos;
  fIdentFuncTable[22685] := FuncHasmagiceffect;
  fIdentFuncTable[7456] := FuncHasmagiceffectwithkeyword;
  fIdentFuncTable[3094] := FuncHasnode;
  fIdentFuncTable[3935] := FuncHasparentrelationship;
  fIdentFuncTable[17352] := FuncHasperk;
  fIdentFuncTable[10427] := FuncHasreftype;
  fIdentFuncTable[20521] := FuncHasspell;
  fIdentFuncTable[5694] := FuncHazard;
  fIdentFuncTable[18082] := FuncHidden;
  fIdentFuncTable[85] := FuncHidetitlesequencemenu;
  fIdentFuncTable[11321] := FuncIdle;
  fIdentFuncTable[15805] := FuncIf;
  fIdentFuncTable[8252] := FuncIgnorefriendlyhits;
  fIdentFuncTable[5832] := FuncImagespacemodifier;
  fIdentFuncTable[12056] := FuncImpactdataset;
  fIdentFuncTable[6194] := FuncIncrementskill;
  fIdentFuncTable[5615] := FuncIncrementskillby;
  fIdentFuncTable[15942] := FuncIncrementstat;
  fIdentFuncTable[20210] := FuncIngredient;
  fIdentFuncTable[22960] := FuncInt;
  fIdentFuncTable[11881] := FuncInterruptcast;
  fIdentFuncTable[16013] := FuncIs;
  fIdentFuncTable[1058] := FuncIs3dloaded;
  fIdentFuncTable[22866] := FuncIsactioncomplete;
  fIdentFuncTable[6243] := FuncIsactivatechild;
  fIdentFuncTable[1344] := FuncIsactivatecontrolsenabled;
  fIdentFuncTable[1376] := FuncIsactivationblocked;
  fIdentFuncTable[746] := FuncIsactive;
  fIdentFuncTable[20519] := FuncIsalarmed;
  fIdentFuncTable[3474] := FuncIsalerted;
  fIdentFuncTable[10325] := FuncIsallowedtofly;
  fIdentFuncTable[20100] := FuncIsarrested;
  fIdentFuncTable[9719] := FuncIsarrestingtarget;
  fIdentFuncTable[15647] := FuncIsattached;
  fIdentFuncTable[8664] := FuncIsbleedingout;
  fIdentFuncTable[6013] := FuncIsbribed;
  fIdentFuncTable[5002] := FuncIscamswitchcontrolsenabled;
  fIdentFuncTable[7094] := FuncIschild;
  fIdentFuncTable[7458] := FuncIscleared;
  fIdentFuncTable[20805] := FuncIscommandedactor;
  fIdentFuncTable[19557] := FuncIscompleted;
  fIdentFuncTable[17669] := FuncIsdead;
  fIdentFuncTable[4695] := FuncIsdetectedby;
  fIdentFuncTable[21531] := FuncIsdisabled;
  fIdentFuncTable[11821] := FuncIsdoingfavor;
  fIdentFuncTable[16253] := FuncIsequipped;
  fIdentFuncTable[1850] := FuncIsessential;
  fIdentFuncTable[7455] := FuncIseuiped;
  fIdentFuncTable[20611] := FuncIsfactionincrimegroup;
  fIdentFuncTable[22037] := FuncIsfasttravelenabled;
  fIdentFuncTable[7991] := FuncIsfightingcontrolsenabled;
  fIdentFuncTable[6947] := FuncIsflying;
  fIdentFuncTable[2324] := FuncIsfurnitureinuse;
  fIdentFuncTable[22174] := FuncIsfurnituremarkerinuse;
  fIdentFuncTable[16157] := FuncIsghost;
  fIdentFuncTable[21129] := FuncIsguard;
  fIdentFuncTable[6485] := FuncIshostile;
  fIdentFuncTable[11734] := FuncIshostiletoactor;
  fIdentFuncTable[13451] := FuncIsignoringfriendlyhits;
  fIdentFuncTable[11044] := FuncIsincombat;
  fIdentFuncTable[112] := FuncIsindialoguewithplayer;
  fIdentFuncTable[2050] := FuncIsinfaction;
  fIdentFuncTable[6773] := FuncIsininterior;
  fIdentFuncTable[13232] := FuncIsinkillmove;
  fIdentFuncTable[6819] := FuncIsinmenumode;
  fIdentFuncTable[7850] := FuncIsinterior;
  fIdentFuncTable[15786] := FuncIsintimidated;
  fIdentFuncTable[12534] := FuncIsinvulnerable;
  fIdentFuncTable[11566] := FuncIsjournalcontrolsenabled;
  fIdentFuncTable[8706] := FuncIsloaded;
  fIdentFuncTable[20134] := FuncIslockbroken;
  fIdentFuncTable[16410] := FuncIslocked;
  fIdentFuncTable[13913] := FuncIslookingcontrolsenabled;
  fIdentFuncTable[22804] := FuncIsmapmarkervisible;
  fIdentFuncTable[19376] := FuncIsmenucontrolsenabled;
  fIdentFuncTable[12248] := FuncIsmovementcontrolsenabled;
  fIdentFuncTable[5519] := FuncIsobjectivecompleted;
  fIdentFuncTable[19178] := FuncIsobjectivedisplayed;
  fIdentFuncTable[17369] := FuncIsobjectivefailed;
  fIdentFuncTable[9230] := FuncIsplayerexpelled;
  fIdentFuncTable[22943] := FuncIsplayerslastriddenhorse;
  fIdentFuncTable[23093] := FuncIsplayerteammate;
  fIdentFuncTable[7294] := FuncIsplaying;
  fIdentFuncTable[962] := FuncIsprotected;
  fIdentFuncTable[9015] := FuncIsrunning;
  fIdentFuncTable[12764] := FuncIssamelocation;
  fIdentFuncTable[4803] := FuncIssneaking;
  fIdentFuncTable[16678] := FuncIssneakingcontrolsenabled;
  fIdentFuncTable[3420] := FuncIssprinting;
  fIdentFuncTable[12783] := FuncIsstagedone;
  fIdentFuncTable[657] := FuncIsstartin;
  fIdentFuncTable[23192] := FuncIsstarting;
  fIdentFuncTable[23086] := FuncIsstopped;
  fIdentFuncTable[15544] := FuncIsstopping;
  fIdentFuncTable[6213] := FuncIstrespassing;
  fIdentFuncTable[13158] := FuncIsunconscious;
  fIdentFuncTable[17353] := FuncIsunique;
  fIdentFuncTable[10996] := FuncIsweapondrawn;
  fIdentFuncTable[17473] := FuncIswordunlocked;
  fIdentFuncTable[11128] := FuncJump;
  fIdentFuncTable[12853] := FuncKeepoffsetfromactor;
  fIdentFuncTable[406] := FuncKey;
  fIdentFuncTable[17596] := FuncKeyword;
  fIdentFuncTable[17952] := FuncKill;
  fIdentFuncTable[126] := FuncKillsilent;
  fIdentFuncTable[16007] := FuncKnockareaeffect;
  fIdentFuncTable[6370] := FuncLearnalleffects;
  fIdentFuncTable[965] := FuncLearneffect;
  fIdentFuncTable[1496] := FuncLearnnexteffect;
  fIdentFuncTable[19356] := FuncLength;
  fIdentFuncTable[14806] := FuncLeveledactor;
  fIdentFuncTable[13174] := FuncLeveleditem;
  fIdentFuncTable[3684] := FuncLeveledspell;
  fIdentFuncTable[16488] := FuncLight;
  fIdentFuncTable[1125] := FuncLocal;
  fIdentFuncTable[14933] := FuncLocation;
  fIdentFuncTable[17842] := FuncLocationalias;
  fIdentFuncTable[14282] := FuncLocationreftype;
  fIdentFuncTable[18357] := FuncLock;
  fIdentFuncTable[10307] := FuncMagiceffect;
  fIdentFuncTable[1843] := FuncMath;
  fIdentFuncTable[13295] := FuncMessage;
  fIdentFuncTable[6719] := FuncMessagebox;
  fIdentFuncTable[14574] := FuncMiscobject;
  fIdentFuncTable[11500] := FuncModactorvalue;
  fIdentFuncTable[11850] := FuncModav;
  fIdentFuncTable[5783] := FuncModcrimegold;
  fIdentFuncTable[6360] := FuncModfactionrank;
  fIdentFuncTable[20952] := FuncModfavorpoints;
  fIdentFuncTable[2367] := FuncModfavorpointswithglobal;
  fIdentFuncTable[11473] := FuncModreaction;
  fIdentFuncTable[22089] := FuncModregard;
  fIdentFuncTable[19143] := FuncMoveto;
  fIdentFuncTable[10456] := FuncMovetointeractionlocation;
  fIdentFuncTable[6877] := FuncMovetomyeditorlocation;
  fIdentFuncTable[10599] := FuncMovetonode;
  fIdentFuncTable[15816] := FuncMovetopackagelocation;
  fIdentFuncTable[12197] := FuncMovetowhenunloaded;
  fIdentFuncTable[21664] := FuncMusictype;
  fIdentFuncTable[13645] := FuncMute;
  fIdentFuncTable[13786] := FuncNew;
  fIdentFuncTable[21197] := FuncNone;
  fIdentFuncTable[19520] := FuncNot;
  fIdentFuncTable[23202] := FuncNotification;
  fIdentFuncTable[5172] := FuncObjectname;
  fIdentFuncTable[13519] := FuncObjectreference;
  fIdentFuncTable[21222] := FuncObjectscount;
  fIdentFuncTable[12219] := FuncOnactivate;
  fIdentFuncTable[3099] := FuncOnanimationevent;
  fIdentFuncTable[8829] := FuncOnattachedtocell;
  fIdentFuncTable[10625] := FuncOnbeginstate;
  fIdentFuncTable[16792] := FuncOncellattach;
  fIdentFuncTable[4957] := FuncOncelldetach;
  fIdentFuncTable[9239] := FuncOncellload;
  fIdentFuncTable[20707] := FuncOnclose;
  fIdentFuncTable[13597] := FuncOncombatstatechanged;
  fIdentFuncTable[19404] := FuncOncontainerchanged;
  fIdentFuncTable[19579] := FuncOndeath;
  fIdentFuncTable[13815] := FuncOndestructionstagechanged;
  fIdentFuncTable[2554] := FuncOndetachedfromcell;
  fIdentFuncTable[9572] := FuncOndying;
  fIdentFuncTable[5422] := FuncOneffectfinish;
  fIdentFuncTable[11356] := FuncOneffectstart;
  fIdentFuncTable[14923] := FuncOnendstate;
  fIdentFuncTable[7935] := FuncOnenterbleedout;
  fIdentFuncTable[19653] := FuncOnequipped;
  fIdentFuncTable[53] := FuncOngainlos;
  fIdentFuncTable[18121] := FuncOngetup;
  fIdentFuncTable[14894] := FuncOngrab;
  fIdentFuncTable[8766] := FuncOnhit;
  fIdentFuncTable[1507] := FuncOninit;
  fIdentFuncTable[17052] := FuncOnitemadded;
  fIdentFuncTable[16751] := FuncOnitemremoved;
  fIdentFuncTable[6043] := FuncOnload;
  fIdentFuncTable[11774] := FuncOnlocationchange;
  fIdentFuncTable[14484] := FuncOnlockstatechanged;
  fIdentFuncTable[10391] := FuncOnlostlos;
  fIdentFuncTable[10782] := FuncOnmagiceffectapply;
  fIdentFuncTable[7204] := FuncOnobjectequipped;
  fIdentFuncTable[14031] := FuncOnobjectunequipped;
  fIdentFuncTable[3972] := FuncOnopen;
  fIdentFuncTable[19784] := FuncOnpackagechange;
  fIdentFuncTable[18013] := FuncOnpackageend;
  fIdentFuncTable[22219] := FuncOnpackagestart;
  fIdentFuncTable[6626] := FuncOnraceswitchcomplete;
  fIdentFuncTable[608] := FuncOnread;
  fIdentFuncTable[11917] := FuncOnrelease;
  fIdentFuncTable[13034] := FuncOnreset;
  fIdentFuncTable[7711] := FuncOnsell;
  fIdentFuncTable[2890] := FuncOnsleepstart;
  fIdentFuncTable[21326] := FuncOnsleepstop;
  fIdentFuncTable[47] := FuncOnstoryactivateactor;
  fIdentFuncTable[9211] := FuncOnstoryaddtoplayer;
  fIdentFuncTable[11669] := FuncOnstoryarrest;
  fIdentFuncTable[16961] := FuncOnstoryassaultactor;
  fIdentFuncTable[15361] := FuncOnstorybribenpc;
  fIdentFuncTable[17432] := FuncOnstorycastmagic;
  fIdentFuncTable[9033] := FuncOnstorychangelocation;
  fIdentFuncTable[10171] := FuncOnstorycraftitem;
  fIdentFuncTable[6954] := FuncOnstorycrimegold;
  fIdentFuncTable[13186] := FuncOnstorycure;
  fIdentFuncTable[1318] := FuncOnstorydialogue;
  fIdentFuncTable[9050] := FuncOnstorydiscoverdeadbody;
  fIdentFuncTable[3351] := FuncOnstoryescapejail;
  fIdentFuncTable[17697] := FuncOnstoryflatternpc;
  fIdentFuncTable[19690] := FuncOnstoryhello;
  fIdentFuncTable[16398] := FuncOnstoryincreaselevel;
  fIdentFuncTable[18176] := FuncOnstoryincreaseskill;
  fIdentFuncTable[8361] := FuncOnstoryinfection;
  fIdentFuncTable[5024] := FuncOnstoryintimidatenpc;
  fIdentFuncTable[19163] := FuncOnstoryjail;
  fIdentFuncTable[15054] := FuncOnstorykillactor;
  fIdentFuncTable[10324] := FuncOnstorynewvoicepower;
  fIdentFuncTable[4416] := FuncOnstorypayfine;
  fIdentFuncTable[675] := FuncOnstorypicklock;
  fIdentFuncTable[16046] := FuncOnstoryplayergetsfavor;
  fIdentFuncTable[9086] := FuncOnstoryrelationshipchange;
  fIdentFuncTable[10987] := FuncOnstoryremovefromplayer;
  fIdentFuncTable[14992] := FuncOnstoryscript;
  fIdentFuncTable[17069] := FuncOnstoryservedtime;
  fIdentFuncTable[9966] := FuncOnstorytrespass;
  fIdentFuncTable[1698] := FuncOntrackedstatsevent;
  fIdentFuncTable[1667] := FuncOntranslationalmostcomplete;
  fIdentFuncTable[5247] := FuncOntranslationcomplete;
  fIdentFuncTable[12506] := FuncOntranslationfailed;
  fIdentFuncTable[3940] := FuncOntraphit;
  fIdentFuncTable[11771] := FuncOntraphitstart;
  fIdentFuncTable[9634] := FuncOntraphitstop;
  fIdentFuncTable[9802] := FuncOntrigger;
  fIdentFuncTable[1485] := FuncOntriggerenter;
  fIdentFuncTable[16419] := FuncOntriggerleave;
  fIdentFuncTable[20982] := FuncOnunequipped;
  fIdentFuncTable[9433] := FuncOnunload;
  fIdentFuncTable[10295] := FuncOnupdate;
  fIdentFuncTable[17293] := FuncOnupdategametime;
  fIdentFuncTable[16075] := FuncOnwardhit;
  fIdentFuncTable[20954] := FuncOpeninventory;
  fIdentFuncTable[14905] := FuncOpenuserlog;
  fIdentFuncTable[7601] := FuncOutfit;
  fIdentFuncTable[14791] := FuncOverbudget;
  fIdentFuncTable[4660] := FuncPackage;
  fIdentFuncTable[3790] := FuncPapyrusversion;
  fIdentFuncTable[12304] := FuncParent;
  fIdentFuncTable[8319] := FuncPathtoreference;
  fIdentFuncTable[11773] := FuncPause;
  fIdentFuncTable[4949] := FuncPerk;
  fIdentFuncTable[11313] := FuncPlaceactoratme;
  fIdentFuncTable[7233] := FuncPlaceatme;
  fIdentFuncTable[1818] := FuncPlay;
  fIdentFuncTable[7678] := FuncPlayandwait;
  fIdentFuncTable[10309] := FuncPlayanimation;
  fIdentFuncTable[23076] := FuncPlayanimationandwait;
  fIdentFuncTable[20320] := FuncPlayerknows;
  fIdentFuncTable[376] := FuncPlayermovetoandwait;
  fIdentFuncTable[11916] := FuncPlayerpaycrimegold;
  fIdentFuncTable[4394] := FuncPlaygamebryoanimation;
  fIdentFuncTable[11844] := FuncPlayidle;
  fIdentFuncTable[19535] := FuncPlayidlewithtarget;
  fIdentFuncTable[882] := FuncPlayimpacteffect;
  fIdentFuncTable[12288] := FuncPlaysubgraphanimation;
  fIdentFuncTable[3299] := FuncPlaysyncedanimationandwaitss;
  fIdentFuncTable[21245] := FuncPlaysyncedanimationss;
  fIdentFuncTable[12732] := FuncPlayterraineffect;
  fIdentFuncTable[18739] := FuncPopto;
  fIdentFuncTable[4458] := FuncPotion;
  fIdentFuncTable[20753] := FuncPow;
  fIdentFuncTable[9221] := FuncPrecachechargen;
  fIdentFuncTable[17522] := FuncPrecachechargenclear;
  fIdentFuncTable[18870] := FuncProcesstraphit;
  fIdentFuncTable[19254] := FuncProjectile;
  fIdentFuncTable[1587] := FuncProperties;
  fIdentFuncTable[8169] := FuncProperty;
  fIdentFuncTable[12070] := FuncPushactoraway;
  fIdentFuncTable[10767] := FuncQuerystat;
  fIdentFuncTable[16077] := FuncQuest;
  fIdentFuncTable[11867] := FuncQuitgame;
  fIdentFuncTable[13125] := FuncQuittomainmenu;
  fIdentFuncTable[9001] := FuncRace;
  fIdentFuncTable[12626] := FuncRadianstodegrees;
  fIdentFuncTable[19916] := FuncRandomfloat;
  fIdentFuncTable[20827] := FuncRandomint;
  fIdentFuncTable[3800] := FuncReferencealias;
  fIdentFuncTable[5416] := FuncRegisterforanimationevent;
  fIdentFuncTable[9156] := FuncRegisterforlos;
  fIdentFuncTable[12405] := FuncRegisterforremoteevent;
  fIdentFuncTable[1748] := FuncRegisterforsinglelosgain;
  fIdentFuncTable[20450] := FuncRegisterforsingleloslost;
  fIdentFuncTable[6519] := FuncRegisterforsingleupdate;
  fIdentFuncTable[14714] := FuncRegisterforsingleupdategametime;
  fIdentFuncTable[21936] := FuncRegisterforsleep;
  fIdentFuncTable[9462] := FuncRegisterfortrackedstatsevent;
  fIdentFuncTable[21477] := FuncRegisterfortutorialevent;
  fIdentFuncTable[15963] := FuncRegisterforupdate;
  fIdentFuncTable[19610] := FuncRegisterforupdategametime;
  fIdentFuncTable[12834] := FuncReleaseoverride;
  fIdentFuncTable[20746] := FuncRemotecast;
  fIdentFuncTable[17368] := FuncRemove;
  fIdentFuncTable[661] := FuncRemoveaddedform;
  fIdentFuncTable[2448] := FuncRemoveallinventoryeventfilters;
  fIdentFuncTable[12409] := FuncRemoveallitems;
  fIdentFuncTable[17063] := FuncRemovecrossfade;
  fIdentFuncTable[19086] := FuncRemovedependentanimatedobjectreference;
  fIdentFuncTable[19582] := FuncRemovefromallfactions;
  fIdentFuncTable[16345] := FuncRemovefromfaction;
  fIdentFuncTable[9906] := FuncRemovehavokconstraints;
  fIdentFuncTable[12120] := FuncRemoveinventoryeventfilter;
  fIdentFuncTable[9275] := FuncRemoveitem;
  fIdentFuncTable[1088] := FuncRemovelast;
  fIdentFuncTable[6650] := FuncRemoveperk;
  fIdentFuncTable[6659] := FuncRemoveshout;
  fIdentFuncTable[15737] := FuncRemovespell;
  fIdentFuncTable[21278] := FuncRequestautosave;
  fIdentFuncTable[9362] := FuncRequestmodel;
  fIdentFuncTable[13856] := FuncRequestsave;
  fIdentFuncTable[9721] := FuncReset;
  fIdentFuncTable[6186] := FuncResethealthandlimbs;
  fIdentFuncTable[894] := FuncResethelpmessage;
  fIdentFuncTable[11748] := FuncRestoreactorvalue;
  fIdentFuncTable[15150] := FuncRestoreav;
  fIdentFuncTable[3491] := FuncResurrect;
  fIdentFuncTable[19859] := FuncReturn;
  fIdentFuncTable[2397] := FuncRevert;
  fIdentFuncTable[1506] := FuncRfind;
  fIdentFuncTable[16364] := FuncRfindstruct;
  fIdentFuncTable[7487] := FuncSay;
  fIdentFuncTable[8152] := FuncScene;
  fIdentFuncTable[22857] := FuncScript;
  fIdentFuncTable[5356] := FuncScroll;
  fIdentFuncTable[9353] := FuncSelf;
  fIdentFuncTable[13464] := FuncSendanimationevent;
  fIdentFuncTable[12154] := FuncSendassaultalarm;
  fIdentFuncTable[14567] := FuncSendcustomevent;
  fIdentFuncTable[22882] := FuncSendplayertojail;
  fIdentFuncTable[7924] := FuncSendstealalarm;
  fIdentFuncTable[21281] := FuncSendstoryevent;
  fIdentFuncTable[19663] := FuncSendstoryeventandwait;
  fIdentFuncTable[2315] := FuncSendtrespassalarm;
  fIdentFuncTable[14719] := FuncSendwerewolftransformation;
  fIdentFuncTable[8656] := FuncServetime;
  fIdentFuncTable[5066] := FuncSet;
  fIdentFuncTable[17362] := FuncSetactive;
  fIdentFuncTable[9450] := FuncSetactorcause;
  fIdentFuncTable[18337] := FuncSetactorowner;
  fIdentFuncTable[7722] := FuncSetactorvalue;
  fIdentFuncTable[22551] := FuncSetalert;
  fIdentFuncTable[18803] := FuncSetallowflying;
  fIdentFuncTable[15567] := FuncSetally;
  fIdentFuncTable[11348] := FuncSetalpha;
  fIdentFuncTable[7295] := FuncSetangle;
  fIdentFuncTable[5539] := FuncSetanimationvariablebool;
  fIdentFuncTable[14440] := FuncSetanimationvariablefloat;
  fIdentFuncTable[21177] := FuncSetanimationvariableint;
  fIdentFuncTable[2910] := FuncSetattackactoronsight;
  fIdentFuncTable[22659] := FuncSetav;
  fIdentFuncTable[8467] := FuncSetbeastform;
  fIdentFuncTable[22629] := FuncSetbribed;
  fIdentFuncTable[19190] := FuncSetcameratarget;
  fIdentFuncTable[22079] := FuncSetcleared;
  fIdentFuncTable[19246] := FuncSetcrimefaction;
  fIdentFuncTable[3103] := FuncSetcrimegold;
  fIdentFuncTable[21914] := FuncSetcrimegoldviolent;
  fIdentFuncTable[19182] := FuncSetcriticalstage;
  fIdentFuncTable[20798] := FuncSetcurrentstageid;
  fIdentFuncTable[4529] := FuncSetdestroyed;
  fIdentFuncTable[21364] := FuncSetdoingfavor;
  fIdentFuncTable[3559] := FuncSetenemy;
  fIdentFuncTable[20372] := FuncSetessential;
  fIdentFuncTable[3985] := FuncSetfactionowner;
  fIdentFuncTable[15818] := FuncSetfactionrank;
  fIdentFuncTable[19200] := FuncSetfogplanes;
  fIdentFuncTable[19762] := FuncSetfogpower;
  fIdentFuncTable[120] := FuncSetfootik;
  fIdentFuncTable[18935] := FuncSetforcedlandingmarker;
  fIdentFuncTable[20845] := FuncSetfrequency;
  fIdentFuncTable[12258] := FuncSetghost;
  fIdentFuncTable[2313] := FuncSetgodmode;
  fIdentFuncTable[13541] := FuncSetheadtracking;
  fIdentFuncTable[6492] := FuncSethudcartmode;
  fIdentFuncTable[9243] := FuncSetinchargen;
  fIdentFuncTable[259] := FuncSetinibool;
  fIdentFuncTable[6964] := FuncSetinifloat;
  fIdentFuncTable[10487] := FuncSetiniint;
  fIdentFuncTable[16594] := FuncSetinistring;
  fIdentFuncTable[14971] := FuncSetinstancevolume;
  fIdentFuncTable[8105] := FuncSetintimidated;
  fIdentFuncTable[13745] := FuncSetinvulnerable;
  fIdentFuncTable[7692] := FuncSetkeyworddata;
  fIdentFuncTable[17201] := FuncSetlocklevel;
  fIdentFuncTable[13334] := FuncSetlookat;
  fIdentFuncTable[19162] := FuncSetmotiontype;
  fIdentFuncTable[2146] := FuncSetnobleedoutrecovery;
  fIdentFuncTable[3165] := FuncSetnofavorallowed;
  fIdentFuncTable[6884] := FuncSetnotshowonstealthmeter;
  fIdentFuncTable[10471] := FuncSetobjectivecompleted;
  fIdentFuncTable[2316] := FuncSetobjectivedisplayed;
  fIdentFuncTable[12016] := FuncSetobjectivefailed;
  fIdentFuncTable[20577] := FuncSetopen;
  fIdentFuncTable[8559] := FuncSetoutfit;
  fIdentFuncTable[11495] := FuncSetplayeraidriven;
  fIdentFuncTable[4749] := FuncSetplayercontrols;
  fIdentFuncTable[7098] := FuncSetplayerenemy;
  fIdentFuncTable[7795] := FuncSetplayerexpelled;
  fIdentFuncTable[721] := FuncSetplayerreportcrime;
  fIdentFuncTable[2901] := FuncSetplayerresistingarrest;
  fIdentFuncTable[21658] := FuncSetplayerteammate;
  fIdentFuncTable[11630] := FuncSetposition;
  fIdentFuncTable[18029] := FuncSetprotected;
  fIdentFuncTable[19446] := FuncSetpublic;
  fIdentFuncTable[599] := FuncSetrace;
  fIdentFuncTable[7352] := FuncSetraction;
  fIdentFuncTable[11171] := FuncSetreaction;
  fIdentFuncTable[1471] := FuncSetrelationshiprank;
  fIdentFuncTable[490] := FuncSetrestrained;
  fIdentFuncTable[6613] := FuncSetscale;
  fIdentFuncTable[4371] := FuncSetsittingrotation;
  fIdentFuncTable[7776] := FuncSetstage;
  fIdentFuncTable[4022] := FuncSetunconscious;
  fIdentFuncTable[2228] := FuncSetvalue;
  fIdentFuncTable[11428] := FuncSetvalueint;
  fIdentFuncTable[1736] := FuncSetvehicle;
  fIdentFuncTable[7199] := FuncSetvoicerecoverytime;
  fIdentFuncTable[11592] := FuncSetvolume;
  fIdentFuncTable[4292] := FuncShakecamera;
  fIdentFuncTable[7050] := FuncShakecontroller;
  fIdentFuncTable[7477] := FuncShout;
  fIdentFuncTable[15464] := FuncShow;
  fIdentFuncTable[6222] := FuncShowashelpmessage;
  fIdentFuncTable[8509] := FuncShowbartermenu;
  fIdentFuncTable[16356] := FuncShowfirstpersongeometry;
  fIdentFuncTable[5239] := FuncShowgiftmenu;
  fIdentFuncTable[2587] := FuncShowracemenu;
  fIdentFuncTable[15953] := FuncShowrefposition;
  fIdentFuncTable[16706] := FuncShowtitlesequencemenu;
  fIdentFuncTable[13268] := FuncShowtrainingmenu;
  fIdentFuncTable[2629] := FuncSin;
  fIdentFuncTable[73] := FuncSoulgem;
  fIdentFuncTable[17141] := FuncSound;
  fIdentFuncTable[7704] := FuncSoundcategory;
  fIdentFuncTable[16555] := FuncSpell;
  fIdentFuncTable[12897] := FuncSplinetranslateto;
  fIdentFuncTable[5629] := FuncSplinetranslatetorefnode;
  fIdentFuncTable[1541] := FuncSqrt;
  fIdentFuncTable[7735] := FuncStart;
  fIdentFuncTable[2414] := FuncStartcannibal;
  fIdentFuncTable[7041] := FuncStartcombat;
  fIdentFuncTable[23256] := FuncStartframeratecapture;
  fIdentFuncTable[4502] := FuncStartobjectprofiling;
  fIdentFuncTable[806] := FuncStartscriptprofiling;
  fIdentFuncTable[22841] := FuncStartstackprofiling;
  fIdentFuncTable[13895] := FuncStarttitlesequence;
  fIdentFuncTable[21449] := FuncStartvampirefeed;
  fIdentFuncTable[17959] := FuncState;
  fIdentFuncTable[6703] := FuncStatic;
  fIdentFuncTable[22462] := FuncStop;
  fIdentFuncTable[19261] := FuncStopcombat;
  fIdentFuncTable[18273] := FuncStopcombatalarm;
  fIdentFuncTable[5137] := FuncStopinstance;
  fIdentFuncTable[6111] := FuncStopobjectprofiling;
  fIdentFuncTable[960] := FuncStopscriptprofiling;
  fIdentFuncTable[14471] := FuncStopstackprofiling;
  fIdentFuncTable[13945] := FuncStoptranslation;
  fIdentFuncTable[20284] := FuncString;
  fIdentFuncTable[5088] := FuncStringtablecount;
  fIdentFuncTable[7643] := FuncTakescreenshot;
  fIdentFuncTable[3634] := FuncTalkingactivator;
  fIdentFuncTable[19538] := FuncTan;
  fIdentFuncTable[11492] := FuncTeachword;
  fIdentFuncTable[13636] := FuncTethertohorse;
  fIdentFuncTable[5499] := FuncThen;
  fIdentFuncTable[638] := FuncTimedata;
  fIdentFuncTable[12930] := FuncToggleai;
  fIdentFuncTable[11199] := FuncTogglecollisions;
  fIdentFuncTable[10536] := FuncTogglemenus;
  fIdentFuncTable[21244] := FuncTopic;
  fIdentFuncTable[14888] := FuncTopicinfo;
  fIdentFuncTable[3783] := FuncTrace;
  fIdentFuncTable[11783] := FuncTraceconditional;
  fIdentFuncTable[7748] := FuncTracestack;
  fIdentFuncTable[5609] := FuncTraceuser;
  fIdentFuncTable[3471] := FuncTranslateto;
  fIdentFuncTable[7709] := FuncTrapsoul;
  fIdentFuncTable[4445] := FuncTriggerscreenblood;
  fIdentFuncTable[1916] := FuncTrue;
  fIdentFuncTable[15362] := FuncTrytoaddtofaction;
  fIdentFuncTable[20665] := FuncTrytodisable;
  fIdentFuncTable[11733] := FuncTrytoenable;
  fIdentFuncTable[4782] := FuncTrytoevaluatepackage;
  fIdentFuncTable[4959] := FuncTrytokill;
  fIdentFuncTable[914] := FuncTrytomoveto;
  fIdentFuncTable[8506] := FuncTrytoremovefromfaction;
  fIdentFuncTable[10364] := FuncTrytoreset;
  fIdentFuncTable[5813] := FuncTrytostopcombat;
  fIdentFuncTable[8296] := FuncUnequipall;
  fIdentFuncTable[12224] := FuncUnequipitem;
  fIdentFuncTable[11078] := FuncUnequipshout;
  fIdentFuncTable[20156] := FuncUnequipspell;
  fIdentFuncTable[2730] := FuncUnlockowneddoorsincell;
  fIdentFuncTable[14502] := FuncUnlockword;
  fIdentFuncTable[13993] := FuncUnmute;
  fIdentFuncTable[20941] := FuncUnpause;
  fIdentFuncTable[1544] := FuncUnregisterforanimationevent;
  fIdentFuncTable[10652] := FuncUnregisterforlos;
  fIdentFuncTable[22939] := FuncUnregisterforremoteevent;
  fIdentFuncTable[12233] := FuncUnregisterforsleep;
  fIdentFuncTable[9926] := FuncUnregisterfortrackedstatsevent;
  fIdentFuncTable[3262] := FuncUnregisterfortutorialevent;
  fIdentFuncTable[4558] := FuncUnregisterforupdate;
  fIdentFuncTable[15738] := FuncUnregisterforupdategametime;
  fIdentFuncTable[8682] := FuncUpdatecurrentinstanceglobal;
  fIdentFuncTable[19676] := FuncUser;
  fIdentFuncTable[21748] := FuncUserflagscount;
  fIdentFuncTable[2827] := FuncUsinggamepad;
  fIdentFuncTable[17763] := FuncUtility;
  fIdentFuncTable[3197] := FuncVars;
  fIdentFuncTable[15742] := FuncVisualeffect;
  fIdentFuncTable[5228] := FuncVoicetype;
  fIdentFuncTable[21893] := FuncWait;
  fIdentFuncTable[21097] := FuncWaitforanimationevent;
  fIdentFuncTable[20189] := FuncWaitgametime;
  fIdentFuncTable[788] := FuncWaitmenumode;
  fIdentFuncTable[9871] := FuncWeapon;
  fIdentFuncTable[12287] := FuncWeather;
  fIdentFuncTable[6545] := FuncWillintimidatesucceed;
  fIdentFuncTable[2572] := FuncWordofpower;
  fIdentFuncTable[8151] := FuncWorldspace;
  fIdentFuncTable[10315] := FuncWornhaskeyword;
end;

{$Q-}
function TSynSampleSyn.HashKey(Str: PWideChar): Cardinal;
begin
  Result := 0;
  while IsIdentChar(Str^) do
  begin
    Result := Result * 327 + Ord(Str^) * 16;
    inc(Str);
  end;
  Result := Result mod 23269;
  fStringLen := Str - fToIdent;
end;
{$Q+}

function TSynSampleSyn.Func95fo4(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAbs(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAcos(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncActivate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncActivator(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncActivemagiceffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncActor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncActorbase(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAdd(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddachievement(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAdddependentanimatedobjectreference(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddform(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddhavokballandsocketconstraint(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddinventoryeventfilter(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAdditem(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddperk(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddshout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddspell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddtextreplacementdata(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddtofaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAddtomap(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAdvanceskill(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAlias(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAllowbleedoutdialogue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAllowpcdialogue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAmmo(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncApparatus(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncApply(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncApplycrossfade(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncApplyhavokimpulse(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncArmor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAs(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAsin(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAssociationtype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAtan(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAttachashpile(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAuto(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAutoreadonly(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAutostatename(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncAutovarname(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncBlockactivation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncBook(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncBool(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCalculateencounterlevel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCalculatefavorcost(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCanfasttraveltomarker(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCanpaycrimegold(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCaptureframerate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCast(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCeiling(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCenteroncell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCenteroncellandwait(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncClass(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncClear(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCleararrested(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCleardestruction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncClearextraarrows(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncClearforcedmovement(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncClearkeepoffsetfromactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncClearlookat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncClearprison(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCleartempeffects(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCloseuserlog(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCompleteallobjectives(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCompletequest(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncComputer(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncConditional(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncConstructibleobject(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncContainer(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCos(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncCreatedetectionevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDamageactorvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDamageav(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDamageobject(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDbsendplayerposition(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDebug(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDebugchannelnotify(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDebugtablecount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDegreestoradians(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDelete(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDeletewhenable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDisable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDisablenowait(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDisableplayercontrols(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDispel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDispelallspells(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDispelspell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDocombatspellapply(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDoor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDropobject(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncDumpaliasdata(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEffectshader(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEnable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEnableai(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEnablefasttravel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEnablenowait(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEnableplayercontrols(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEnchantment(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEncounterzone(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEndframeratecapture(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEndfunction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEndproperty(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEndstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEquipitem(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEquipshout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEquipspell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncEvaluatepackage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncExplosion(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncExtends(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFadeoutgame(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFailallobjectives(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFalse(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFasttravel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFind(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFindclosestactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFindclosestreferenceofanytypeinlist(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFindclosestreferenceoftype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFindrandomactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFindrandomreferenceofanytypeinlist(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFindrandomreferenceoftype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFindstruct(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFindweather(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFire(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFlags(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFloat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFloor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFlora(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForceactive(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForceactorvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForceaddragdolltoworld(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForceav(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcefirstperson(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcelocationto(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcemovementdirection(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcemovementdirectionramp(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcemovementrotationspeed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcemovementrotationspeedramp(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcemovementspeed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcemovementspeedramp(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcerefto(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForceremoveragdollfromworld(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcestart(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcetargetangle(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcetargetdirection(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcetargetspeed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForcethirdperson(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncForm(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFormlist(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFunction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFunctions(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncFurniture(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGame(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGametimetostring(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGet(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetactorbase(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetactorowner(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetactorreference(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetactorvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetactorvaluepercentage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetalias(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetanglex(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetangley(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetanglez(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetanimationvariablebool(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetanimationvariablefloat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetanimationvariableint(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetassociatedskill(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetav(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetaverageframerate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetavpercentage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetbaseactorvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetbaseav(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetbaseobject(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetbribeamount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetbudgetcount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetbudgetname(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcasteractor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetclass(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetclassification(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcombatstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcombattarget(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetconfigname(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcrimefaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcrimegold(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcrimegoldnonviolent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcrimegoldviolent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentbudget(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentdestructionstage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentgametime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentlocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentmemory(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentpackage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentrealtime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentscene(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentstageid(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentweather(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetcurrentweathertransition(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetdeadcount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetdialoguetarget(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetdistance(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGeteditorlocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetequippeditemtype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetequippedshield(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetequippedshout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetequippedspell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetequippedweapon(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetfactionowner(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetfactionrank(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetfactionreaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetfavorpoints(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetflyingstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetforcedlandingmarker(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetform(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetformid(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetgamesettingfloat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetgamesettingint(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetgamesettingstring(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetgiftfilter(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetgoldamount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetgoldvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetheadingangle(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetheight(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGethigestrelationshiprank(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGethighestrelationshiprank(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetinfamy(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetinfamynonviolent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetinfamyviolent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetitemcount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetitemhealthpercent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetkey(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetkeyworddata(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetkiller(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetlength(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetlevel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetleveledactorbase(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetlightlevel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetlinkedref(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetlocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetlocklevel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetlowestrelationshiprank(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetmass(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetmaxframerate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetminframerate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetnobleedoutrecovery(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetnthlinkedref(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetopenstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetoutgoingweather(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetowningquest(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetparentcell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetplatformname(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetplayer(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetplayercontrols(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetplayergrabbedref(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetplayerslastriddenhorse(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetpositionx(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetpositiony(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetpositionz(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetrace(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetreaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetrealhourspassed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetref(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetreference(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetreftypealivecount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetreftypedeadcount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetregard(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetrelationshiprank(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetreputation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetscale(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetsex(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetsitstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetsize(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetskymode(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetsleepstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetstage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetstagedone(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetstolenitemvaluecrime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetstolenitemvaluenocrime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGettargetactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGettemplate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGettriggerobjectcount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetvalueint(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetversionnumber(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetvoicerecoverytime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetvoicetype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetwidth(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGetworldspace(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGlobal(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGlobalvariable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGotostate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncGtlocklevel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasassociation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHascommonparent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHaseffectkeyword(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasfamilyrelationship(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasform(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHaskeyword(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHaslos(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasmagiceffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasmagiceffectwithkeyword(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasnode(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasparentrelationship(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasperk(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasreftype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHasspell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHazard(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHidden(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncHidetitlesequencemenu(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIdle(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIf(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIgnorefriendlyhits(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncImagespacemodifier(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncImpactdataset(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIncrementskill(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIncrementskillby(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIncrementstat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIngredient(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncInt(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncInterruptcast(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIs(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIs3dloaded(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsactioncomplete(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsactivatechild(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsactivatecontrolsenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsactivationblocked(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsactive(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsalarmed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsalerted(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsallowedtofly(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsarrested(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsarrestingtarget(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsattached(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsbleedingout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsbribed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIscamswitchcontrolsenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIschild(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIscleared(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIscommandedactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIscompleted(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsdead(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsdetectedby(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsdisabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsdoingfavor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsequipped(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsessential(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIseuiped(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsfactionincrimegroup(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsfasttravelenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsfightingcontrolsenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsflying(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsfurnitureinuse(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsfurnituremarkerinuse(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsghost(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsguard(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIshostile(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIshostiletoactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsignoringfriendlyhits(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsincombat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsindialoguewithplayer(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsinfaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsininterior(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsinkillmove(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsinmenumode(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsinterior(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsintimidated(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsinvulnerable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsjournalcontrolsenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsloaded(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIslockbroken(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIslocked(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIslookingcontrolsenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsmapmarkervisible(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsmenucontrolsenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsmovementcontrolsenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsobjectivecompleted(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsobjectivedisplayed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsobjectivefailed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsplayerexpelled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsplayerslastriddenhorse(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsplayerteammate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsplaying(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsprotected(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsrunning(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIssamelocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIssneaking(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIssneakingcontrolsenabled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIssprinting(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsstagedone(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsstartin(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsstarting(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsstopped(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsstopping(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIstrespassing(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsunconscious(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsunique(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIsweapondrawn(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncIswordunlocked(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncJump(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncKeepoffsetfromactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncKey(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncKeyword(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncKill(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncKillsilent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncKnockareaeffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLearnalleffects(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLearneffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLearnnexteffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLength(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLeveledactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLeveleditem(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLeveledspell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLight(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLocal(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLocationalias(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLocationreftype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncLock(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMagiceffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMath(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMessage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMessagebox(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMiscobject(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncModactorvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncModav(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncModcrimegold(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncModfactionrank(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncModfavorpoints(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncModfavorpointswithglobal(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncModreaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncModregard(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMoveto(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMovetointeractionlocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMovetomyeditorlocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMovetonode(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMovetopackagelocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMovetowhenunloaded(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMusictype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncMute(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncNew(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncNone(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncNot(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncNotification(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncObjectname(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncObjectreference(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncObjectscount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnactivate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnanimationevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnattachedtocell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnbeginstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOncellattach(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOncelldetach(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOncellload(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnclose(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOncombatstatechanged(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOncontainerchanged(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOndeath(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOndestructionstagechanged(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOndetachedfromcell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOndying(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOneffectfinish(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOneffectstart(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnendstate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnenterbleedout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnequipped(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOngainlos(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOngetup(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOngrab(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnhit(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOninit(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnitemadded(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnitemremoved(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnload(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnlocationchange(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnlockstatechanged(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnlostlos(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnmagiceffectapply(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnobjectequipped(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnobjectunequipped(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnopen(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnpackagechange(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnpackageend(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnpackagestart(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnraceswitchcomplete(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnread(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnrelease(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnreset(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnsell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnsleepstart(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnsleepstop(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryactivateactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryaddtoplayer(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryarrest(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryassaultactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorybribenpc(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorycastmagic(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorychangelocation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorycraftitem(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorycrimegold(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorycure(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorydialogue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorydiscoverdeadbody(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryescapejail(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryflatternpc(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryhello(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryincreaselevel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryincreaseskill(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryinfection(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryintimidatenpc(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryjail(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorykillactor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorynewvoicepower(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorypayfine(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorypicklock(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryplayergetsfavor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryrelationshipchange(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryremovefromplayer(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryscript(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstoryservedtime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnstorytrespass(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntrackedstatsevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntranslationalmostcomplete(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntranslationcomplete(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntranslationfailed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntraphit(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntraphitstart(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntraphitstop(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntrigger(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntriggerenter(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOntriggerleave(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnunequipped(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnunload(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnupdate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnupdategametime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOnwardhit(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword3
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOpeninventory(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOpenuserlog(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOutfit(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncOverbudget(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPackage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPapyrusversion(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncParent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPathtoreference(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPause(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPerk(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlaceactoratme(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlaceatme(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlay(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayandwait(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayanimation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayanimationandwait(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayerknows(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayermovetoandwait(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayerpaycrimegold(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlaygamebryoanimation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayidle(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayidlewithtarget(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayimpacteffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlaysubgraphanimation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlaysyncedanimationandwaitss(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlaysyncedanimationss(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPlayterraineffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPopto(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPotion(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPow(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPrecachechargen(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPrecachechargenclear(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncProcesstraphit(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncProjectile(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncProperties(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncProperty(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncPushactoraway(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncQuerystat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncQuest(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncQuitgame(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncQuittomainmenu(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRace(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRadianstodegrees(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRandomfloat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRandomint(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncReferencealias(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforanimationevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforlos(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforremoteevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforsinglelosgain(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforsingleloslost(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforsingleupdate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforsingleupdategametime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforsleep(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterfortrackedstatsevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterfortutorialevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforupdate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRegisterforupdategametime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncReleaseoverride(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemotecast(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemove(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemoveaddedform(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemoveallinventoryeventfilters(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemoveallitems(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemovecrossfade(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemovedependentanimatedobjectreference(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemovefromallfactions(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemovefromfaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemovehavokconstraints(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemoveinventoryeventfilter(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemoveitem(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemovelast(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemoveperk(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemoveshout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRemovespell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRequestautosave(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRequestmodel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRequestsave(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncReset(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncResethealthandlimbs(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncResethelpmessage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRestoreactorvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRestoreav(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncResurrect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncReturn(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRevert(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRfind(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncRfindstruct(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSay(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncScene(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncScript(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncScroll(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSelf(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendanimationevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendassaultalarm(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendcustomevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendplayertojail(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendstealalarm(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendstoryevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendstoryeventandwait(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendtrespassalarm(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSendwerewolftransformation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncServetime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSet(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetactive(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetactorcause(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetactorowner(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetactorvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetalert(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetallowflying(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetally(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetalpha(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetangle(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetanimationvariablebool(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetanimationvariablefloat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetanimationvariableint(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetattackactoronsight(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetav(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetbeastform(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetbribed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetcameratarget(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetcleared(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetcrimefaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetcrimegold(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetcrimegoldviolent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetcriticalstage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetcurrentstageid(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetdestroyed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetdoingfavor(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetenemy(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetessential(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetfactionowner(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetfactionrank(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetfogplanes(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetfogpower(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetfootik(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetforcedlandingmarker(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetfrequency(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetghost(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetgodmode(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetheadtracking(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSethudcartmode(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetinchargen(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetinibool(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetinifloat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetiniint(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetinistring(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetinstancevolume(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetintimidated(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetinvulnerable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetkeyworddata(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetlocklevel(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetlookat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetmotiontype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetnobleedoutrecovery(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetnofavorallowed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetnotshowonstealthmeter(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetobjectivecompleted(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetobjectivedisplayed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetobjectivefailed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetopen(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetoutfit(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetplayeraidriven(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetplayercontrols(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetplayerenemy(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetplayerexpelled(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetplayerreportcrime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetplayerresistingarrest(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetplayerteammate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetposition(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetprotected(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetpublic(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetrace(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetraction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetreaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetrelationshiprank(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetrestrained(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetscale(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetsittingrotation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetstage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetunconscious(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetvalue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetvalueint(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetvehicle(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetvoicerecoverytime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSetvolume(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShakecamera(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShakecontroller(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShow(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShowashelpmessage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShowbartermenu(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShowfirstpersongeometry(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShowgiftmenu(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShowracemenu(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShowrefposition(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShowtitlesequencemenu(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncShowtrainingmenu(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSin(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSoulgem(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSound(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSoundcategory(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSpell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSplinetranslateto(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSplinetranslatetorefnode(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncSqrt(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStart(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStartcannibal(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStartcombat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStartframeratecapture(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStartobjectprofiling(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStartscriptprofiling(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStartstackprofiling(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStarttitlesequence(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStartvampirefeed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncState(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStatic(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStop(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStopcombat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStopcombatalarm(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStopinstance(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStopobjectprofiling(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStopscriptprofiling(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStopstackprofiling(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStoptranslation(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncString(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncStringtablecount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTakescreenshot(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTalkingactivator(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTan(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTeachword(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTethertohorse(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncThen(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTimedata(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncToggleai(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTogglecollisions(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTogglemenus(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTopic(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTopicinfo(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrace(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTraceconditional(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTracestack(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTraceuser(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTranslateto(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrapsoul(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTriggerscreenblood(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytoaddtofaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytodisable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytoenable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytoevaluatepackage(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytokill(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytomoveto(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytoremovefromfaction(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytoreset(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncTrytostopcombat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnequipall(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnequipitem(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnequipshout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnequipspell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnlockowneddoorsincell(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnlockword(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnmute(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnpause(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnregisterforanimationevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnregisterforlos(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnregisterforremoteevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnregisterforsleep(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnregisterfortrackedstatsevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnregisterfortutorialevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnregisterforupdate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUnregisterforupdategametime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUpdatecurrentinstanceglobal(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUser(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword0
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUserflagscount(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUsinggamepad(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncUtility(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncVars(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncVisualeffect(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncVoicetype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWait(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWaitforanimationevent(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWaitgametime(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWaitmenumode(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWeapon(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWeather(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWillintimidatesucceed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWordofpower(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWorldspace(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkword2
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.FuncWornhaskeyword(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkpapyrus
  else
    Result := tkIdentifier;
end;

function TSynSampleSyn.AltFunc(Index: Integer): TtkTokenKind;
begin
  Result := tkIdentifier;
end;

function TSynSampleSyn.IdentKind(MayBe: PWideChar): TtkTokenKind;
var
  Key: Cardinal;
begin
  fToIdent := MayBe;
  Key := HashKey(MayBe);
  if Key <= High(fIdentFuncTable) then
    Result := fIdentFuncTable[Key](KeyIndices[Key])
  else
    Result := tkIdentifier;
end;

procedure TSynSampleSyn.SpaceProc;
begin
  inc(Run);
  fTokenID := tkSpace;
  while (FLine[Run] <= #32) and not IsLineEnd(Run) do inc(Run);
end;

procedure TSynSampleSyn.NullProc;
begin
  fTokenID := tkNull;
  inc(Run);
end;

procedure TSynSampleSyn.CRProc;
begin
  fTokenID := tkSpace;
  inc(Run);
  if fLine[Run] = #10 then
    inc(Run);
end;

procedure TSynSampleSyn.LFProc;
begin
  fTokenID := tkSpace;
  inc(Run);
end;

procedure TSynSampleSyn.Bracket2CommentOpenProc;
begin
  Inc(Run);
  fRange := rsBracket2Comment;
  fTokenID := tkComment2;
end;

procedure TSynSampleSyn.Bracket2CommentProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      fTokenID := tkComment2;
      repeat
        if (fLine[Run] = '}') then
        begin
          Inc(Run, 1);
          fRange := rsUnKnown;
          Break;
        end;
        if not IsLineEnd(Run) then
          Inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

procedure TSynSampleSyn.BracketCommentOpenProc;
begin
  Inc(Run);
  fRange := rsBracketComment;
  fTokenID := tkComment3;
end;

procedure TSynSampleSyn.BracketCommentProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      fTokenID := tkComment3;
      repeat
        if (fLine[Run] = ']') then
        begin
          Inc(Run, 1);
          fRange := rsUnKnown;
          Break;
        end;
        if not IsLineEnd(Run) then
          Inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

procedure TSynSampleSyn.StringOpenProc;
begin
  Inc(Run);
  fRange := rsString;
  fTokenID := tkString;
end;

procedure TSynSampleSyn.StringProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      fTokenID := tkString;
      repeat
        if (fLine[Run] = '"') then
        begin
          Inc(Run, 1);
          fRange := rsUnKnown;
          Break;
        end;
        if not IsLineEnd(Run) then
          Inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

constructor TSynSampleSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fCaseSensitive := False;

  fComment2Attri := TSynHighLighterAttributes.Create(SYNS_AttrComment2, SYNS_FriendlyAttrComment2);
  fComment2Attri.Style := [fsItalic];
  fComment2Attri.Foreground := clGray;
  AddAttribute(fComment2Attri);

  fComment3Attri := TSynHighLighterAttributes.Create(SYNS_AttrComment3, SYNS_FriendlyAttrComment3);
  fComment3Attri.Style := [fsBold];
  fComment3Attri.Foreground := clGreen;
  AddAttribute(fComment3Attri);

  fIdentifierAttri := TSynHighLighterAttributes.Create(SYNS_AttrIdentifier, SYNS_FriendlyAttrIdentifier);
  AddAttribute(fIdentifierAttri);

  fKeyAttri := TSynHighLighterAttributes.Create(SYNS_AttrReservedWord, SYNS_FriendlyAttrReservedWord);
  fKeyAttri.Style := [fsBold];
  fKeyAttri.Foreground := clNavy;
  AddAttribute(fKeyAttri);

  fPapyrusAttri := TSynHighLighterAttributes.Create(SYNS_AttrPapyrus, SYNS_FriendlyAttrPapyrus);
  fPapyrusAttri.Style := [fsBold];
  fPapyrusAttri.Foreground := clBlack;
  AddAttribute(fPapyrusAttri);

  fSpaceAttri := TSynHighLighterAttributes.Create(SYNS_AttrSpace, SYNS_FriendlyAttrSpace);
  AddAttribute(fSpaceAttri);

  fStringAttri := TSynHighLighterAttributes.Create(SYNS_AttrString, SYNS_FriendlyAttrString);
  fStringAttri.Style := [fsBold];
  fStringAttri.Foreground := clMaroon;
  AddAttribute(fStringAttri);

  fword0Attri := TSynHighLighterAttributes.Create(SYNS_Attrword0, SYNS_FriendlyAttrword0);
  fword0Attri.Style := [fsItalic];
  fword0Attri.Foreground := clNavy;
  AddAttribute(fword0Attri);

  fword2Attri := TSynHighLighterAttributes.Create(SYNS_Attrword2, SYNS_FriendlyAttrword2);
  fword2Attri.Style := [fsBold];
  fword2Attri.Foreground := clGreen;
  AddAttribute(fword2Attri);

  fword3Attri := TSynHighLighterAttributes.Create(SYNS_Attrword3, SYNS_FriendlyAttrword3);
  fword3Attri.Style := [fsBold];
  fword3Attri.Foreground := clPurple;
  AddAttribute(fword3Attri);

  SetAttributesOnChange(DefHighlightChange);
  InitIdent;
  fDefaultFilter := SYNS_FilterPex;
  fRange := rsUnknown;
end;

procedure TSynSampleSyn.IdentProc;
begin
  fTokenID := IdentKind(fLine + Run);
  inc(Run, fStringLen);
  while IsIdentChar(fLine[Run]) do
    Inc(Run);
end;

procedure TSynSampleSyn.UnknownProc;
begin
  inc(Run);
  fTokenID := tkUnknown;
end;

procedure TSynSampleSyn.Next;
begin
  fTokenPos := Run;
  case fRange of
    rsBracket2Comment: Bracket2CommentProc;
    rsBracketComment: BracketCommentProc;
    rsString: StringProc;
  else
    case fLine[Run] of
      #0: NullProc;
      #10: LFProc;
      #13: CRProc;
      '{': Bracket2CommentOpenProc;
      '[': BracketCommentOpenProc;
      '"': StringOpenProc;
      #1..#9, #11, #12, #14..#32: SpaceProc;
      'A'..'Z', 'a'..'z', '_': IdentProc;
    else
      UnknownProc;
    end;
  end;
  inherited;
end;

function TSynSampleSyn.GetDefaultAttribute(Index: Integer): TSynHighLighterAttributes;
begin
  case Index of
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD: Result := fKeyAttri;
    SYN_ATTR_STRING: Result := fStringAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
  else
    Result := nil;
  end;
end;

function TSynSampleSyn.GetEol: Boolean;
begin
  Result := Run = fLineLen + 1;
end;

function TSynSampleSyn.GetKeyWords(TokenKind: Integer): UnicodeString;
begin
  Result := 
    '_FO4,abs,acos,Action,Activate,Activator,ActiveMagicEffect,Actor,Actor' +
    'Base,Add,AddAchievement,AddDependentAnimatedObjectReference,AddForm,Ad' +
    'dHavokBallAndSocketConstraint,AddInventoryEventFilter,AddItem,AddPerk,' +
    'AddShout,AddSpell,AddTextReplacementData,AddToFaction,AddToMap,Advance' +
    'Skill,Alias,AllowBleedoutDialogue,AllowPCDialogue,Ammo,Apparatus,Apply' +
    ',ApplyCrossFade,ApplyHavokImpulse,Armor,as,asin,AssociationType,atan,A' +
    'ttachAshPile,Auto,AutoReadOnly,autoStateName,AutoVarName,BlockActivati' +
    'on,Book,Bool,CalculateEncounterLevel,CalculateFavorCost,CanFastTravelT' +
    'oMarker,CanPayCrimeGold,CaptureFrameRate,Cast,Ceiling,Cell,CenterOnCel' +
    'l,CenterOnCellAndWait,Class,Clear,ClearArrested,ClearDestruction,Clear' +
    'ExtraArrows,ClearForcedMovement,ClearKeepOffsetFromActor,ClearLookAt,C' +
    'learPrison,ClearTempEffects,CloseUserLog,CompleteAllObjectives,Complet' +
    'eQuest,Computer,Conditional,ConstructibleObject,Container,cos,CreateDe' +
    'tectionEvent,DamageActorValue,DamageAV,DamageObject,DBSendPlayerPositi' +
    'on,Debug,DebugChannelNotify,DebugTableCount,DegreesToRadians,Delete,De' +
    'leteWhenAble,Disable,DisableNoWait,DisablePlayerControls,Dispel,Dispel' +
    'AllSpells,DispelSpell,DoCombatSpellApply,Door,DropObject,DumpAliasData' +
    ',EffectShader,Enable,EnableAI,EnableFastTravel,EnableNoWait,EnablePlay' +
    'erControls,Enchantment,EncounterZone,EndFrameRateCapture,endFunction,E' +
    'ndProperty,endState,EquipItem,EquipShout,EquipSpell,EvaluatePackage,Ex' +
    'plosion,Extends,Faction,FadeOutGame,FailAllObjectives,False,FastTravel' +
    ',find,FindClosestActor,FindClosestReferenceOfAnyTypeInList,FindClosest' +
    'ReferenceOfType,FindRandomActor,FindRandomReferenceOfAnyTypeInList,Fin' +
    'dRandomReferenceOfType,findstruct,FindWeather,Fire,flags,Float,Floor,F' +
    'lora,ForceActive,ForceActorValue,ForceAddRagdollToWorld,ForceAV,ForceF' +
    'irstPerson,ForceLocationTo,ForceMovementDirection,ForceMovementDirecti' +
    'onRamp,ForceMovementRotationSpeed,ForceMovementRotationSpeedRamp,Force' +
    'MovementSpeed,ForceMovementSpeedRamp,ForceRefTo,ForceRemoveRagdollFrom' +
    'World,ForceStart,ForceTargetAngle,ForceTargetDirection,ForceTargetSpee' +
    'd,ForceThirdPerson,Form,FormList,function,functions,Furniture,Game,Gam' +
    'eTimeToString,Get,GetActorBase,GetActorOwner,GetActorReference,GetActo' +
    'rValue,GetActorValuePercentage,GetAlias,GetAngleX,GetAngleY,GetAngleZ,' +
    'GetAnimationVariableBool,GetAnimationVariableFloat,GetAnimationVariabl' +
    'eInt,GetAssociatedSkill,GetAt,GetAV,GetAverageFrameRate,GetAVPercentag' +
    'e,GetBaseActorValue,GetBaseAV,GetBaseObject,GetBribeAmount,GetBudgetCo' +
    'unt,GetBudgetName,GetCasterActor,GetClass,GetClassification,GetCombatS' +
    'tate,GetCombatTarget,GetConfigName,GetCrimeFaction,GetCrimeGold,GetCri' +
    'meGoldNonViolent,GetCrimeGoldViolent,GetCurrentBudget,GetCurrentDestru' +
    'ctionStage,GetCurrentGameTime,GetCurrentLocation,GetCurrentMemory,GetC' +
    'urrentPackage,GetCurrentRealTime,GetCurrentScene,GetCurrentStageID,Get' +
    'CurrentWeather,GetCurrentWeatherTransition,GetDeadCount,GetDialogueTar' +
    'get,GetDistance,GetEditorLocation,GetEquippedItemType,GetEquippedShiel' +
    'd,GetEquippedShout,GetEquippedSpell,GetEquippedWeapon,GetFactionOwner,' +
    'GetFactionRank,GetFactionReaction,GetFavorPoints,GetFlyingState,GetFor' +
    'cedLandingMarker,GetForm,GetFormID,GetGameSettingFloat,GetGameSettingI' +
    'nt,GetGameSettingString,GetGiftFilter,GetGoldAmount,GetGoldValue,GetHe' +
    'adingAngle,GetHeight,GetHigestRelationshipRank,GetHighestRelationshipR' +
    'ank,GetInfamy,GetInfamyNonViolent,GetInfamyViolent,GetItemCount,GetIte' +
    'mHealthPercent,GetKey,GetKeywordData,GetKiller,GetLength,GetLevel,GetL' +
    'eveledActorBase,GetLightLevel,GetLinkedRef,GetLocation,GetLockLevel,Ge' +
    'tLowestRelationshipRank,GetMass,GetMaxFrameRate,GetMinFrameRate,GetNoB' +
    'leedoutRecovery,GetNthLinkedRef,GetOpenState,GetOutgoingWeather,GetOwn' +
    'ingQuest,GetParentCell,GetPlatformName,GetPlayer,GetPlayerControls,Get' +
    'PlayerGrabbedRef,GetPlayersLastRiddenHorse,GetPositionX,GetPositionY,G' +
    'etPositionZ,GetRace,GetReaction,GetRealHoursPassed,GetRef,GetReference' +
    ',GetRefTypeAliveCount,GetRefTypeDeadCount,GetRegard,GetRelationshipRan' +
    'k,GetReputation,GetScale,GetSex,GetSitState,GetSize,GetSkyMode,GetSlee' +
    'pState,GetStage,GetStageDone,GetState,GetStolenItemValueCrime,GetStole' +
    'nItemValueNoCrime,GetTargetActor,GetTemplate,GetTriggerObjectCount,Get' +
    'Value,GetValueInt,GetVersionNumber,GetVoiceRecoveryTime,GetVoiceType,G' +
    'etWidth,GetWorldSpace,Global,GlobalVariable,GoToState,GtLockLevel,HasA' +
    'ssociation,HasCommonParent,HasEffectKeyword,HasFamilyRelationship,HasF' +
    'orm,HasKeyword,HasLOS,HasMagicEffect,HasMagicEffectWithKeyword,HasNode' +
    ',HasParentRelationship,HasPerk,HasRefType,HasSpell,Hazard,Hidden,HideT' +
    'itleSequenceMenu,Idle,if,IgnoreFriendlyHits,ImageSpaceModifier,ImpactD' +
    'ataSet,IncrementSkill,IncrementSkillBy,IncrementStat,Ingredient,Int,In' +
    'terruptCast,is,Is3DLoaded,IsActionComplete,IsActivateChild,IsActivateC' +
    'ontrolsEnabled,IsActivationBlocked,IsActive,IsAlarmed,IsAlerted,IsAllo' +
    'wedToFly,IsArrested,IsArrestingTarget,IsAttached,IsBleedingOut,IsBribe' +
    'd,IsCamSwitchControlsEnabled,IsChild,IsCleared,IsCommandedActor,IsComp' +
    'leted,IsDead,IsDetectedBy,IsDisabled,IsDoingFavor,IsEquipped,IsEssenti' +
    'al,IsEuiped,IsFactionInCrimeGroup,IsFastTravelEnabled,IsFightingContro' +
    'lsEnabled,IsFlying,IsFurnitureInUse,IsFurnitureMarkerInUse,IsGhost,IsG' +
    'uard,IsHostile,IsHostileToActor,IsIgnoringFriendlyHits,IsInCombat,IsIn' +
    'DialogueWithPlayer,IsInFaction,IsInInterior,IsInKillMove,IsInMenuMode,' +
    'IsInterior,IsIntimidated,IsInvulnerable,IsJournalControlsEnabled,IsLoa' +
    'ded,IsLockBroken,IsLocked,IsLookingControlsEnabled,IsMapMarkerVisible,' +
    'IsMenuControlsEnabled,IsMovementControlsEnabled,IsObjectiveCompleted,I' +
    'sObjectiveDisplayed,IsObjectiveFailed,IsPlayerExpelled,IsPlayersLastRi' +
    'ddenHorse,IsPlayerTeammate,IsPlaying,IsProtected,IsRunning,IsSameLocat' +
    'ion,IsSneaking,IsSneakingControlsEnabled,IsSprinting,IsStageDone,IsSta' +
    'rtin,IsStarting,IsStopped,IsStopping,IsTrespassing,IsUnconscious,IsUni' +
    'que,IsWeaponDrawn,IsWordUnlocked,jump,KeepOffsetFromActor,Key,Keyword,' +
    'Kill,KillSilent,KnockAreaEffect,LearnAllEffects,LearnEffect,LearnNextE' +
    'ffect,Length,LeveledActor,LeveledItem,LeveledSpell,Light,local,Locatio' +
    'n,LocationAlias,LocationRefType,Lock,MagicEffect,Math,Message,MessageB' +
    'ox,MiscObject,ModActorValue,ModAV,ModCrimeGold,ModFactionRank,ModFavor' +
    'Points,ModFavorPointsWithGlobal,ModReaction,ModRegard,MoveTo,MoveToInt' +
    'eractionLocation,MoveToMyEditorLocation,MoveToNode,MoveToPackageLocati' +
    'on,MoveToWhenUnloaded,MusicType,Mute,New,None,not,Notification,ObjectN' +
    'ame,ObjectReference,ObjectsCount,OnActivate,OnAnimationEvent,OnAttache' +
    'dToCell,OnBeginState,OnCellAttach,OnCellDetach,OnCellLoad,OnClose,OnCo' +
    'mbatStateChanged,OnContainerChanged,OnDeath,OnDestructionStageChanged,' +
    'OnDetachedFromCell,OnDying,OnEffectFinish,OnEffectStart,OnEndState,OnE' +
    'nterBleedout,OnEquipped,OnGainLOS,OnGetUp,OnGrab,OnHit,OnInit,OnItemAd' +
    'ded,OnItemRemoved,OnLoad,OnLocationChange,OnLockStateChanged,OnLostLOS' +
    ',OnMagicEffectApply,OnObjectEquipped,OnObjectUnequipped,OnOpen,OnPacka' +
    'geChange,OnPackageEnd,OnPackageStart,OnRaceSwitchComplete,OnRead,OnRel' +
    'ease,OnReset,OnSell,OnSleepStart,OnSleepStop,OnStoryActivateActor,OnSt' +
    'oryAddToPlayer,OnStoryArrest,OnStoryAssaultActor,OnStoryBribeNPC,OnSto' +
    'ryCastMagic,OnStoryChangeLocation,OnStoryCraftItem,OnStoryCrimeGold,On' +
    'StoryCure,OnStoryDialogue,OnStoryDiscoverDeadBody,OnStoryEscapeJail,On' +
    'StoryFlatterNPC,OnStoryHello,OnStoryIncreaseLevel,OnStoryIncreaseSkill' +
    ',OnStoryInfection,OnStoryIntimidateNPC,OnStoryJail,OnStoryKillActor,On' +
    'StoryNewVoicePower,OnStoryPayFine,OnStoryPickLock,OnStoryPlayerGetsFav' +
    'or,OnStoryRelationshipChange,OnStoryRemoveFromPlayer,OnStoryScript,OnS' +
    'toryServedTime,OnStoryTrespass,OnTrackedStatsEvent,OnTranslationAlmost' +
    'Complete,OnTranslationComplete,OnTranslationFailed,OnTrapHit,OnTrapHit' +
    'Start,OnTrapHitStop,OnTrigger,OnTriggerEnter,OnTriggerLeave,OnUnequipp' +
    'ed,OnUnload,OnUpdate,OnUpdateGameTime,OnWardHit,OpenInventory,OpenUser' +
    'Log,Outfit,OverBudget,Package,PapyrusVersion,Parent,PathToReference,Pa' +
    'use,Perk,PlaceActorAtMe,PlaceAtMe,Play,PlayAndWait,PlayAnimation,PlayA' +
    'nimationAndWait,PlayerKnows,PlayerMoveToAndWait,PlayerPayCrimeGold,Pla' +
    'yGamebryoAnimation,PlayIdle,PlayIdleWithTarget,PlayImpactEffect,PlaySu' +
    'bGraphAnimation,PlaySyncedAnimationAndWaitSS,PlaySyncedAnimationSS,Pla' +
    'yTerrainEffect,PopTo,Potion,pow,PrecacheCharGen,PrecacheCharGenClear,P' +
    'rocessTrapHit,Projectile,properties,Property,PushActorAway,QueryStat,Q' +
    'uest,QuitGame,QuitToMainMenu,Race,RadiansToDegrees,RandomFloat,RandomI' +
    'nt,ReferenceAlias,RegisterForAnimationEvent,RegisterForLOS,RegisterFor' +
    'RemoteEvent,RegisterForSingleLOSGain,RegisterForSingleLOSLost,Register' +
    'ForSingleUpdate,RegisterForSingleUpdateGameTime,RegisterForSleep,Regis' +
    'terForTrackedStatsEvent,RegisterForTutorialEvent,RegisterForUpdate,Reg' +
    'isterForUpdateGameTime,ReleaseOverride,RemoteCast,Remove,RemoveAddedFo' +
    'rm,RemoveAllInventoryEventFilters,RemoveAllItems,RemoveCrossFade,Remov' +
    'eDependentAnimatedObjectReference,RemoveFromAllFactions,RemoveFromFact' +
    'ion,RemoveHavokConstraints,RemoveInventoryEventFilter,RemoveItem,Remov' +
    'eLast,RemovePerk,RemoveShout,RemoveSpell,RequestAutoSave,RequestModel,' +
    'RequestSave,Reset,ResetHealthAndLimbs,ResetHelpMessage,RestoreActorVal' +
    'ue,RestoreAV,Resurrect,return,Revert,rfind,rfindstruct,Say,Scene,Scrip' +
    't,Scroll,Self,SendAnimationEvent,SendAssaultAlarm,SendCustomEvent,Send' +
    'PlayerToJail,SendStealAlarm,SendStoryEvent,SendStoryEventAndWait,SendT' +
    'respassAlarm,SendWereWolfTransformation,ServeTime,Set,SetActive,SetAct' +
    'orCause,SetActorOwner,SetActorValue,SetAlert,SetAllowFlying,SetAlly,Se' +
    'tAlpha,SetAngle,SetAnimationVariableBool,SetAnimationVariableFloat,Set' +
    'AnimationVariableInt,SetAttackActorOnSight,SetAV,SetBeastForm,SetBribe' +
    'd,SetCameraTarget,SetCleared,SetCrimeFaction,SetCrimeGold,SetCrimeGold' +
    'Violent,SetCriticalStage,SetCurrentStageID,SetDestroyed,SetDoingFavor,' +
    'SetEnemy,SetEssential,SetFactionOwner,SetFactionRank,SetFogPlanes,SetF' +
    'ogPower,SetFootIK,SetForcedLandingMarker,SetFrequency,SetGhost,SetGodM' +
    'ode,SetHeadTracking,SetHudCartMode,SetInChargen,SetINIBool,SetINIFloat' +
    ',SetINIInt,SetINIString,SetInstanceVolume,SetIntimidated,SetInvulnerab' +
    'le,SetKeywordData,SetLockLevel,SetLookAt,SetMotionType,SetNoBleedoutRe' +
    'covery,SetNoFavorAllowed,SetNotShowOnStealthMeter,SetObjectiveComplete' +
    'd,SetObjectiveDisplayed,SetObjectiveFailed,SetOpen,SetOutfit,SetPlayer' +
    'AIDriven,SetPlayerControls,SetPlayerEnemy,SetPlayerExpelled,SetPlayerR' +
    'eportCrime,SetPlayerResistingArrest,SetPlayerTeammate,SetPosition,SetP' +
    'rotected,SetPublic,SetRace,SetRaction,SetReaction,SetRelationshipRank,' +
    'SetRestrained,SetScale,SetSittingRotation,SetStage,SetUnconscious,SetV' +
    'alue,SetValueInt,SetVehicle,SetVoiceRecoveryTime,SetVolume,ShakeCamera' +
    ',ShakeController,Shout,Show,ShowAsHelpMessage,ShowBarterMenu,ShowFirst' +
    'PersonGeometry,ShowGiftMenu,ShowRaceMenu,ShowRefPosition,ShowTitleSequ' +
    'enceMenu,ShowTrainingMenu,sin,SoulGem,Sound,SoundCategory,Spell,Spline' +
    'TranslateTo,SplineTranslateToRefNode,sqrt,Start,StartCannibal,StartCom' +
    'bat,StartFrameRateCapture,StartObjectProfiling,StartScriptProfiling,St' +
    'artStackProfiling,StartTitleSequence,StartVampireFeed,state,Static,Sto' +
    'p,StopCombat,StopCombatAlarm,StopInstance,StopObjectProfiling,StopScri' +
    'ptProfiling,StopStackProfiling,StopTranslation,String,StringTableCount' +
    ',TakeScreenshot,TalkingActivator,tan,TeachWord,TetherToHorse,then,time' +
    'data,ToggleAI,ToggleCollisions,ToggleMenus,Topic,TopicInfo,Trace,Trace' +
    'Conditional,TraceStack,TraceUser,TranslateTo,TrapSoul,TriggerScreenBlo' +
    'od,True,TryToAddToFaction,TryToDisable,TryToEnable,TryToEvaluatePackag' +
    'e,TryToKill,TryToMoveTo,TryToRemoveFromFaction,TryToReset,TryToStopCom' +
    'bat,UnequipAll,UnEquipItem,UnequipShout,UnequipSpell,UnLockOwnedDoorsI' +
    'nCell,UnlockWord,UnMute,UnPause,UnregisterForAnimationEvent,Unregister' +
    'ForLOS,UnRegisterForRemoteEvent,UnregisterForSleep,UnregisterForTracke' +
    'dStatsEvent,UnregisterForTutorialEvent,UnregisterForUpdate,UnregisterF' +
    'orUpdateGameTime,UpdateCurrentInstanceGlobal,User,UserFlagsCount,Using' +
    'Gamepad,Utility,vars,VisualEffect,VoiceType,Wait,WaitForAnimationEvent' +
    ',WaitGameTime,WaitMenuMode,Weapon,Weather,WillIntimidateSucceed,WordOf' +
    'Power,WorldSpace,WornHasKeyword';
end;

function TSynSampleSyn.GetTokenID: TtkTokenKind;
begin
  Result := fTokenId;
end;

function TSynSampleSyn.GetTokenAttribute: TSynHighLighterAttributes;
begin
  case GetTokenID of
    tkComment2: Result := fComment2Attri;
    tkComment3: Result := fComment3Attri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey: Result := fKeyAttri;
    tkPapyrus: Result := fPapyrusAttri;
    tkSpace: Result := fSpaceAttri;
    tkString: Result := fStringAttri;
    tkword0: Result := fword0Attri;
    tkword2: Result := fword2Attri;
    tkword3: Result := fword3Attri;
    tkUnknown: Result := fIdentifierAttri;
  else
    Result := nil;
  end;
end;

function TSynSampleSyn.GetTokenKind: Integer;
begin
  Result := Ord(fTokenId);
end;

function TSynSampleSyn.IsIdentChar(AChar: WideChar): Boolean;
begin
  case AChar of
    '_', '0'..'9', 'a'..'z', 'A'..'Z':
      Result := True;
    else
      Result := False;
  end;
end;

function TSynSampleSyn.GetSampleSource: UnicodeString;
begin
  Result := 
'{highlighter}';
end;

function TSynSampleSyn.IsFilterStored: Boolean;
begin
  Result := fDefaultFilter <> SYNS_FilterPex;
end;

class function TSynSampleSyn.GetFriendlyLanguageName: UnicodeString;
begin
  Result := SYNS_FriendlyLangPex;
end;

class function TSynSampleSyn.GetLanguageName: string;
begin
  Result := SYNS_LangPex;
end;

procedure TSynSampleSyn.ResetRange;
begin
  fRange := rsUnknown;
end;

procedure TSynSampleSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

function TSynSampleSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

initialization
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynSampleSyn);
{$ENDIF}
end.
