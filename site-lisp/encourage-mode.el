;;; encourage-mode.el --- Encourages you in your work. :D -*- lexical-binding:t -*-

;; Copyright (C) 2015 Patrick Mosby <patrick@schreiblogade.de>

;; Author: Patrick Mosby <patrick@schreiblogade.de>
;; URL: https://github.com/halbtuerke/encourage-mode.el
;; Package-Version: 20151128.105
;; Version: 0.0.1
;; Keywords: fun
;; Package-Requires: ((emacs "24.4"))
;; Prefix: encourage
;; Separator: -

;;; Commentary:
;;
;; This minor-mode is inspired by https://github.com/Haacked/Encourage
;;
;; To use it, simply call M-x `encourage-mode'.
;;
;; `encourage-mode' is a global minor-mode which displays a small encouragement
;; everytime you save a buffer.

;;; License:
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.


;;; Code:


(defconst encourage-mode-version "0.0.1" "Version of the encourage-mode.el package.")

(defgroup encourage-mode ()
  "Some encouragement is always nice."
  :group 'emacs)

(defcustom encourage-encouragements
  '("Nice Job!"
    "Way to go!"
    "Wow, nice change!"
    "So good!"
    "Bravo!"
    "You rock!"
    "Well done!"
    "I see what you did there!"
    "Genius work!"
    "Thumbs up!"
    "Coding win!"
    "FTW!"
    "Yep!"
    "Nnnnailed it!")
  "The list of encouragements.
One of these will be randomly displayed when saving a buffer."
  :group 'encourage-mode)

(defcustom encourage-encouragements-LaoTze
  '(
"有狀混成，先天地生，寂寥獨立不改，可以為天下母，未知其名，字之曰道，吾強為之名曰大。大曰逝，逝曰遠，遠曰反。天大，地大，道大，王亦大。國中有四大焉，王居一焉。人法地，地法天，天法道，道法自然。"

"天地之間，其猶橐籥歟？虛而屈，動而愈出。"

"至虛，恒也。守中，篤也。萬物並作，居以須復也。天道云云，各復其根。"

"含德之厚者，比於赤子。虺蠆蟲蛇弗蟄，攫鳥猛獸弗扣，骨弱筋柔而握固，未知牝牡之合脧怒，精之至也。終日號而不嗄，和之至也。和曰常，知和曰明，益生曰祥，心使氣曰強。物壯則老，是謂不道。"

"名與身孰親？身與貨孰多？得與亡孰病？甚愛必大費，厚藏必多亡。故知足不辱，知止不殆，可以長久。"

"反也者，道動也。弱也者，道之用也。天下之物生於有，【有】生於無。"

"持而盈之，不若已。揣而群之，不可長保也。金玉盈室，莫能守也。貴富驕，自遺咎也。功遂身退，天之道也。"

"絕智棄辯，民利百倍。絕巧棄利，盜賊無有。絕偽棄詐，民復孝慈。三言以為使不足，或令之有乎屬：視素抱樸，少私寡欲。"

"江海所以為百谷王，以其能為百谷下，是以能為百谷王。聖人之在民前也，以身後之；其在民上也，以言下之。其在民上也，民弗厚也；其在民前也，民弗害也。天下樂進而弗厭。以其不爭也，故天下莫能與之爭。罪莫厚乎貪欲，咎莫險乎欲得，禍莫大乎不知足。知足之為足，此恒足矣。"

"以道佐人主者，不欲以兵強於天下。善者果而已，不以取強。果而弗伐，果而弗驕，果而弗矜，是謂果而不強。其事好長。"

"古之善為士者，必微妙玄達，深不可識，是以為之容：豫乎【其】如冬涉川，猶乎其如畏四鄰，嚴乎其如客，渙乎其如釋，混乎其如樸，沌乎其如濁。孰能濁以靜者，將徐清。孰能安以動者，將徐生。保此道者不欲尚盈。"

"為之者敗之，執之者失之。是以聖人無為故無敗，無執故無失。臨事之紀，慎終如始，此無敗事矣。聖人欲不欲，不貴難得之貨；教不教，復眾之所過。是故聖人能輔萬物之自然，而弗能為。道恒無為也，侯王能守之，而萬物將自化。化而欲作，將鎮之以無名之樸。夫亦將知足，知【足】以靜，萬物將自定。"

"為無為，事無事，味無味。大小之多易必多難。是以聖人猶難之，故終無難。"

"天下皆知美之為美也，惡已；皆知善，此其不善已。有無之相生也，難易之相成也，長短之相形也，高下之相盈也，音聲之相和也，先後之相隨也。是以聖人居無為之事，行不言之教。萬物作而弗始也，為而弗恃也，成【功】而弗居。夫唯弗居也，是以弗去也。"

"道恒無名，樸雖細，天地弗敢臣。侯王如能守之，萬物將自賓。"

"天地相合也，以逾甘露。民莫之命而自均安，始制有名。名亦既有，夫亦將知止。知止所以不殆，譬道之在天下也，猶小谷之與江海。"

"其安也，易持也。其未兆也，易謀也。其脆也，易泮也。其微也，易散也。為之於其無有也，治之於其未亂。合【抱之木，生於毫】末。九層之台，作【於累土。千里之行，始於】足下。"
"知之者弗言，言之者弗知。閉其兌，塞其門，和其光，同其塵，銼其銳，解其紛，是謂玄同。故不可得而親，亦不可得而疏；不可得而利，亦不可得而害；不可得而貴，亦不可得而賤。故為天下貴。"

"以正治邦，以奇用兵，以無事取天下。吾何以知其然也？夫天多忌諱，而民彌叛。民多利器，而邦滋昏。人多智而奇物滋起。法物滋章，盜賊多有。是以聖人之言曰：我無事而民自富，我無為而民自化，我好靜而民自正，我欲不欲而民自樸。"

"治人事天莫若嗇。天唯嗇，是以早服，是謂【重積德。重積德則無不克，無】不克則莫知其極，莫知其極可以有國。有國之母，可以長【久，是謂深根固柢之法】，長生久視之道也。"

"【為】學者日益，為道者日損。損之又損，以至無為也。無為而無不為。"

"絕學無憂。唯與阿，相去幾何？美與惡，相去何若？人之所畏，亦不可以不畏。"

"人寵辱若驚，貴大患若身。何謂寵辱【驚】？寵為下也，得之若驚，失之若驚，是謂寵辱驚。【何謂貴大患】若身？吾所以有大患者，為吾有身。及吾無身，有何【患？故貴為身於】為天下，若可以托天下矣；愛以身為天下，若可以去天下矣。"

"上士聞道，僅能行於其中。中士聞道，若聞若無。下士聞道，大笑之。弗大笑，不足以為道矣。是以建言有之：明道如昧，夷道【如類，進】道若退。上德如谷，大白如辱，廣德如不足，建德如【偷，質】真如愉，大方無隅，大器慢成，大音希聲，大象無形，道【善始且善成。】"

"閉其門，塞其兌，終身不侮。啟其兌，塞其事，終身不來。"

"大盛若缺，其用不敝。大盈若盅，其用不窮。大巧若拙，大盛若詘，大直若屈。"

"燥勝寒，靜勝熱，清淨為天下正。善建者不拔，善抱者不脫，子孫以其祭祀不輟。修之身，其德乃真。修之家，其德有餘。修之鄉，其德乃長。修之邦，其德乃豐。修之天下，【其德乃溥，以家觀】家，以鄉觀鄉，以邦觀邦，以天下觀天下。吾何以知天【下然？以此。】"

"太上下知有之，其次親譽之，其次畏之，其次侮之。信不足，焉有不信，猶乎其貴言也。成事遂功，而百姓曰我自然也。故大道廢，焉有仁義。六親不和，焉有孝慈。邦家昏亂，焉有貞臣。"

"執大象，天下往。往而不害，安平大。樂與餌，過客止，故道【之出言】，淡兮其無味也。視之不足見，聽之不足聞，而不可既也。"

"君子居則貴左，用兵則貴右。故曰兵者【非君子之器，不】得已而用之，恬淡為上，弗美也。美之，是樂殺人。夫樂【殺，不可】以得志於天下。故吉事上左，喪事上右。是以偏將軍居左，上將軍居右，言以喪禮居之也。故殺【人眾】則以哀悲蒞之，戰勝則以喪禮居之。"

"為之者敗之，執之者失之。聖人無為，故無敗也；無執，故【無失也】。慎終若始，則無敗事矣。人之敗也，恒於其且成也敗之。是以【聖】人欲不欲，不貴難得之貨；學不學，復眾之所過。是以能輔萬物之自然而弗敢為。"


    "道可道，非常道。"
    "名可名，非常名。"
    "无名天地之始；有名万物之母。"
    "故常无，欲以观其妙；常有，欲以观其徼。"
    "此两者，同出而异名，同谓之玄。"
    "玄之又玄，众妙之门。"
    "天下皆知美之为美，斯恶已。"
    "皆知善之为善，斯不善已。"
    "有无相生，难易相成，长短相形，高下相盈，音声相和，前后相随。"
    "恒也。"
    "是以圣人处无为之事，行不言之教；"
    "万物作而弗始，生而弗有，为而弗恃，功成而不居。"
    "夫唯弗居，是以不去。"
    "不尚贤，使民不争；不贵难得之货，使民不为盗；不见可欲，使民心不乱。"
    "是以圣人之治，虚其心，实其腹，弱其志，强其骨。"
    "常使民无知无欲。"
    "使夫智者不敢为也。"
    "为无为，则无不治。"
    "道冲，而用之或不盈。"
    "渊兮，似万物之宗；湛兮，似或存。"
    "吾不知谁之子，象帝之先。"
    "天地不仁，以万物为刍狗；圣人不仁，以百姓为刍狗。"
    "天地之间，其犹橐龠乎？"
    "虚而不屈，动而愈出。"
    "多言数穷，不如守中。"
    "谷神不死，是谓玄牝。"
    "玄牝之门，是谓天地根。"
    "绵绵若存，用之不勤。"
    "天长地久。"
    "天地所以能长且久者，以其不自生，故能长生。"
    "是以圣人后其身而身先；外其身而身存。"
    "非以其无私邪？故能成其私。"
    "上善若水。"
    "水善利万物而不争，处众人之所恶，故几于道。"
    "居善地，心善渊，与善仁，言善信，政善治，事善能，动善时。"
    "夫唯不争，故无尤。"
    "持而盈之，不如其已；揣而锐之，不可长保。"
    "金玉满堂，莫之能守；富贵而骄，自遗其咎。"
    "功遂身退，天之道也。"
    "载营魄抱一，能无离乎？"
    "专气致柔，能如婴儿乎？"
    "涤除玄鉴，能如疵乎？"
    "爱国治民，能无为乎？"
    "天门开阖，能为雌乎？"
    "明白四达，能无知乎？"
    "三十辐，共一毂，当其无，有车之用。"
    "埏埴以为器，当其无，有器之用。"
    "凿户牖以为室，当其无，有室之用。"
    "故有之以为利，无之以为用。"
    "五色令人目盲；五音令人耳聋；五味令人口爽；驰骋畋猎，令人心发狂；难得之货，令人行妨。"
    "是以圣人为腹不为目，故去彼取此。"
    "宠辱若惊，贵大患若身。"
    "何谓宠辱若惊？宠为下，得之若惊，失之若惊，是谓宠辱若惊。"
    "何谓贵大患若身？吾所以有大患者，为吾有身，及吾无身，吾有何患？"
    "故贵以身为天下，若可寄天下；爱以身为天下，若可托天下。"
    "视之不见，名曰夷；听之不闻，名曰希；搏之不得，名曰微。"
    "此三者不可致诘，故混而为一。"
    "其上不皦，其下不昧。"
    "绳绳兮不可名，复归于物。"
    "是谓无状之状，无物之象，是谓惚恍。"
    "迎之不见其首，随之不见其后。"
    "执古之道，以御今之有。"
    "能知古始，是谓道纪。"
    "古之善为道者，微妙玄通，深不可识。"
    "夫唯不可识，故强为之容：豫兮若冬涉川；"
    "犹兮若畏四邻；俨兮其若客；涣兮其若凌释；"
    "敦兮其若朴；旷兮其若谷；混兮其若浊；"
    "澹兮其若海；飂兮若无止。"
    "孰能浊以静之徐清？"
    "孰能安以动之徐生？"
    "保此道者，不欲盈。"
    "夫唯不盈，故能蔽而新成。"
    "致虚极，守静笃。"
    "万物并作，吾以观复。"
    "夫物芸芸，各复归其根。"
    "归根曰静，静曰复命。"
    "复命曰常，知常曰明。"
    "不知常，妄作凶。"
    "知常容，容乃公，公乃全，全乃天，天乃道，道乃久，没身不殆。"
    "太上，不知有之；其次，亲而誉之；其次，畏之；其次，侮之。"
    "信不足焉，有不信焉。"
    "悠兮其贵言。"
    "功成事遂，百姓皆谓：「我自然」。"
    "大道废，有仁义；智慧出，有大伪；六亲不和，有孝慈；国家昏乱，有忠臣。"
    "绝圣弃智，民利百倍；绝仁弃义，民复孝慈；绝巧弃利，盗贼无有。"
    "此三者以为文，不足。"
    "故令有所属：见素抱朴，少思寡欲，绝学无忧。"
    "唯之与阿，相去几何？美之与恶，相去若何？人之所畏，不可不畏。"
    "荒兮，其未央哉！"
    "众人熙熙，如享太牢，如春登台。"
    "我独泊兮，其未兆；沌沌兮，如婴儿之未孩；累累兮，若无所归。"
    "众人皆有馀，而我独若遗。"
    "我愚人之心也哉！俗人昭昭，我独昏昏。"
    "俗人察察，我独闷闷。"
    "众人皆有以，而我独顽且鄙。"
    "我独异于人，而贵食母。"
    "孔德之容，惟道是从。"
    "道之为物，惟恍惟惚。"
    "惚兮恍兮，其中有象；恍兮惚兮，其中有物。"
    "窈兮冥兮，其中有精；其精甚真，其中有信。"
    "自今及古，其名不去，以阅众甫。"
    "吾何以知众甫之状哉？以此。"
    "曲则全，枉则直，洼则盈，敝则新，少则多，多则惑。"
    "是以圣人抱一为天下式。"
    "不自见，故明；不自是，故彰；不自伐，故有功；不自矜，故长。"
    "夫唯不争，故天下莫能与之争。"
    "古之所谓「曲则全」者，岂虚言哉！诚全而归之。"
    "希言自然。"
    "故飘风不终朝，骤雨不终日。"
    "孰为此者？天地。"
    "天地尚不能久，而况于人乎？"
    "故从事于道者，同于道；德者，同于德；失者，同于失。"
    "同于道者，道亦乐得之；同于德者，德亦乐得之；同于失者，失亦乐得之。"
    "信不足焉，有不信焉。"
    "企者不立；跨者不行；自见者不明；自是者不彰；自伐者无功；自矜者不长。"
    "其在道也，曰：馀食赘形。"
    "物或恶之，故有道者不处。"
    "有物混成，先天地生。"
    "寂兮寥兮，独立而不改，周行而不殆，可以为天地母。"
    "吾不知其名，强字之曰道，强为之名曰大。"
    "大曰逝，逝曰远，远曰反。"
    "故道大，天大，地大，人亦大。"
    "域中有四大，而人居其一焉。"
    "人法地，地法天，天法道，道法自然。"
    "重为轻根，静为躁君。"
    "是以君子终日行不离辎重。"
    "虽有荣观，燕处超然。"
    "奈何万乘之主，而以身轻天下？轻则失根，躁则失君。"
    "善行无辙迹，善言无瑕谪；善数不用筹策；善闭无关楗而不可开，善结无绳约而不可解。"
    "是以圣人常善救人，故无弃人；常善救物，故无弃物。"
    "是谓袭明。"
    "故善人者，不善人之师；不善人者，善人之资。"
    "不贵其师，不爱其资，虽智大迷，是谓要妙。"
    "知其雄，守其雌，为天下溪。"
    "为天下溪，常德不离，复归于婴儿。"
    "知其白，守其辱，为天下谷。"
    "为天下谷，常德乃足，复归于朴。"
    "知其白，守其黑，为天下式。"
    "为天下式，常德不忒，复归于无极。"
    "朴散则为器，圣人用之，则为官长，故大智不割。"
    "将欲取天下而为之，吾见其不得已。"
    "天下神器，不可为也，不可执也。"
    "为者败之，执者失之。"
    "是以圣人无为，故无败；无执，故无失。"
    "夫物或行或随；或嘘或吹；或强或羸；或载或隳。"
    "是以圣人去甚，去奢，去泰。"
    "以道佐人主者，不以兵强天下。"
    "其事好远。"
    "师之所处，荆棘生焉。"
    "大军之后，必有凶年。"
    "善有果而已，不以取强。"
    "果而勿矜，果而勿伐，果而勿骄。"
    "果而不得已，果而勿强。"
    "物壮则老，是谓不道，不道早已。"
    "夫兵者，不祥之器，物或恶之，故有道者不处。"
    "君子居则贵左，用兵则贵右。"
    "兵者不祥之器，非君子之器，不得已而用之，恬淡为上。"
    "胜而不美，而美之者，是乐杀人。"
    "夫乐杀人者，则不可得志于天下矣。"
    "吉事尚左，凶事尚右。"
    "偏将军居左，上将军居右，言以丧礼处之。"
    "杀人之众，以悲哀泣之，战胜以丧礼处之。"
    "道常无名朴。"
    "虽小，天下莫能臣。"
    "侯王若能守之，万物将自宾。"
    "天地相合，以降甘露，民莫之令而自均。"
    "始制有名，名亦既有，夫亦将知止，知止可以不殆。"
    "譬道之在天下，犹川谷之于江海。"
    "知人者智，自知者明。"
    "胜人者有力，自胜者强。"
    "知足者富。"
    "强行者有志。"
    "不失其所者久。"
    "死而不亡者寿。"
    "大道泛兮，其可左右。"
    "万物恃之以生而不辞，功成而不有。"
    "衣养万物而不为主，可名于小；万物归焉而不为主，可名为大。"
    "以其终不自为大，故能成其大。"
    "执大象，天下往。"
    "往而不害，安平泰。"
    "乐与饵，过客止。"
    "道之出口，淡乎其无味，视之不足见，听之不足闻，用之不足既。"
    "将欲歙之，必故张之；将欲弱之，必故强之；将欲废之，必故兴之；将欲取之，必故与之。"
    "是谓微明。"
    "柔弱胜刚强。"
    "鱼不可脱于渊，国之利器不可以示人。"
    "道常无为而无不为。"
    "侯王若能守之，万物将自化。"
    "化而欲作，吾将镇之以无名之朴。"
    "镇之以无名之朴，夫将不欲。"
    "不欲以静，天下将自正。"
    "上德不德，是以有德；下德不失德，是以无德。"
    "上德无为而无以为；下德无为而有以为。"
    "上仁为之而无以为；上义为之而有以为。"
    "上礼为之而莫之应，则攘臂而扔之。"
    "故失道而后德，失德而后仁，失仁而后义，失义而后礼。"
    "夫礼者，忠信之薄，而乱之首。"
    "前识者，道之华，而愚之始。"
    "是以大丈夫处其厚，不居其薄；处其实，不居其华。"
    "故去彼取此。"
    "昔之得一者：天得一以清；地得一以宁；神得一以灵；"
    "谷得一以生；侯得一以为天下正。"
    "其致之也，谓天无以清，将恐裂；"
    "地无以宁，将恐废；"
    "神无以灵，将恐歇；"
    "谷无以盈，将恐竭；"
    "万物无以生，将恐灭；"
    "侯王无以正，将恐蹶。"
    "故贵以贱为本，高以下为基。"
    "是以侯王自称孤、寡、不谷。"
    "此非以贱为本邪？非乎？故致誉无誉。"
    "是故不欲瑑瑑如玉，珞珞如石。"
    "反者道之动；弱者道之用。"
    "天下万物生于有，有生于无。"
    "上士闻道，勤而行之；中士闻道，若存若亡；下士闻道，大笑之。"
    "不笑不足以为道。"
    "故建言有之：明道若昧；进道若退；夷道若颣；上德若谷；"
    "广德若不足；建德若偷；质真若渝；"
    "大白若辱；大方无隅；大器晚成；大音希声；大象无形；"
    "道隐无名。"
    "夫唯道，善贷且成。"
    "道生一，一生二，二生三，三生万物。"
    "万物负阴而抱阳，冲气以为和。"
    "人之所恶，唯孤、寡、不谷，而王公以为称。"
    "故物或损之而益，或益之而损。"
    "人之所教，我亦教之。"
    "强梁者不得其死，吾将以为教父。"
    "天下之至柔，驰骋天下之至坚。"
    "无有入无间，吾是以知无为之有益。"
    "不言之教，无为之益，天下希及之。"
    "名与身孰亲？身与货孰多？得与亡孰病？"
    "甚爱必大费；多藏必厚亡。"
    "故知足不辱，知止不殆，可以长久。"
    "大成若缺，其用不弊。"
    "大盈若冲，其用不穷。"
    "大直若屈，大巧若拙，大辩若讷。"
    "静胜躁，寒胜热。"
    "清静为天下正。"
    "天下有道，却走马以粪。"
    "天下无道，戎马生于郊。"
    "祸莫大于不知足；咎莫大于欲得。"
    "故知足之足，常足矣。"
    "不出户，知天下；不窥牖，见天道。"
    "其出弥远，其知弥少。"
    "是以圣人不行而知，不见而明，不为而成。"
    "为学日益，为道日损。"
    "损之又损，以至于无为。"
    "无为而无不为。"
    "取天下常以无事，及其有事，不足以取天下。"
    "圣人常无心，以百姓心为心。"
    "善者，吾善之；不善者，吾亦善之；德善。"
    "信者，吾信之；不信者，吾亦信之；德信。"
    "圣人在天下，歙歙焉，为天下浑其心，百姓皆注其耳目，圣人皆孩之。"
    "出生入死。"
    "生之徒，十有三；死之徒，十有三；人之生，动之于死地，亦十有三。"
    "夫何故？以其生之厚。"
    "盖闻善摄生者，路行不遇兕虎，入军不被甲兵；"
    "兕无所投其角，虎无所用其爪，兵无所容其刃。"
    "夫何故？以其无死地。"
    "道生之，德畜之，物形之，势成之。"
    "是以万物莫不尊道而贵德。"
    "道之尊，德之贵，夫莫之命而常自然。"
    "故道生之，德畜之；长之育之；成之熟之；养之覆之。"
    "生而不有，为而不恃，长而不宰。"
    "是谓玄德。"
    "天下有始，以为天下母。"
    "既得其母，以知其子，复守其母，没身不殆。"
    "塞其兑，闭其门，终身不勤。"
    "开其兑，济其事，终身不救。"
    "见小曰明，守柔曰强。"
    "用其光，复归其明，无遗身殃；是为袭常。"
    "使我介然有知，行于大道，唯施是畏。"
    "大道甚夷，而人好径。"
    "朝甚除，田甚芜，仓甚虚；"
    "服文采，带利剑，厌饮食，财货有馀；是为盗夸。"
    "非道也哉！"
    "善建者不拔，善抱者不脱，子孙以祭祀不辍。"
    "修之于身，其德乃真；修之于家，其德乃馀；"
    "修之于乡，其德乃长；修之于邦，其德乃丰；"
    "修之于天下，其德乃普。"
    "故以身观身，以家观家，以乡观乡，以邦观邦，以天下观天下。"
    "吾何以知天下然哉？以此。"
    "含「德」之厚，比于赤子。"
    "毒虫不螫，猛兽不据，攫鸟不搏。"
    "骨弱筋柔而握固。"
    "未知牝牡之合而朘作，精之至也。"
    "终日号而不嗄，和之至也。"
    "知和曰「常」，知常曰「明」。"
    "益生曰祥。"
    "心使气曰强。"
    "物壮则老，谓之不道，不道早已。"
    "知者不言，言者不知。"
    "挫其锐，解其纷，和其光，同其尘，是谓「玄同」。"
    "故不可得而亲，不可得而疏；"
    "不可得而利，不可得而害；"
    "不可得而贵，不可得而贱。"
    "故为天下贵。"
    "以正治国，以奇用兵，以无事取天下。"
    "吾何以知其然哉？"
    "以此：天下多忌讳，而民弥贫；"
    "人多利器，国家滋昏；"
    "人多伎巧，奇物滋起；"
    "法令滋彰，盗贼多有。"
    "故圣人云：我无为，而民自化；"
    "我好静，而民自正；"
    "我无事，而民自富；我无欲，而民自朴。"
    "其政闷闷，其民淳淳；其政察察，其民缺缺。"
    "是以圣人方而不割，廉而不刿，直而不肆，光而不耀。"
    "祸兮福之所倚，福兮祸之所伏。"
    "孰知其极？其无正也。"
    "正复为奇，善复为妖。"
    "人之迷，其日固久。"
    "治人事天，莫若啬。"
    "夫为啬，是谓早服；"
    "早服谓之重积德；重积德则无不克；"
    "无不克则莫知其极；"
    "莫知其极，可以有国；"
    "有国之母，可以长久；"
    "是谓深根固柢，长生久视之道。"
    "治大国，若烹小鲜。"
    "以道莅天下，其鬼不神；"
    "非其鬼不神，其神不伤人；"
    "非其神不伤人，圣人亦不伤人。"
    "夫两不相伤，故德交归焉。"
    "大邦者下流，天下之牝，天下之交也。"
    "牝常以静胜牡，以静为下。"
    "故大邦以下小邦，则取小邦；小邦以下大邦，则取大邦。"
    "故或下以取，或下而取。"
    "大邦不过欲兼畜人，小邦不过欲入事人。"
    "夫两者各得所欲，大者宜为下。"
    "道者万物之奥。"
    "善人之宝，不善人之所保。"
    "美言可以市尊，美行可以加人。"
    "人之不善，何弃之有？"
    "故立天子，置三公，虽有拱璧以先驷马，不如坐进此道。"
    "古之所以贵此道者何？"
    "不曰：求以得，有罪以免邪？故为天下贵。"
    "为无为，事无事，味无味。"
    "图难于其易，为大于其细；天下难事，必作于易，天下大事，必作于细。"
    "是以圣人终不为大，故能成其大。"
    "夫轻诺必寡信，多易必多难。"
    "是以圣人犹难之，故终无难矣。"
    "其安易持，其未兆易谋。"
    "其脆易泮，其微易散。"
    "为之于未有，治之于未乱。"
    "合抱之木，生于毫末；九层之台，起于累土；千里之行，始于足下。"
    "民之从事，常于几成而败之。"
    "慎终如始，则无败事。"
    "古之善为道者，非以明民，将以愚之。"
    "民之难治，以其智多。"
    "故以智治国，国之贼；"
    "不以智治国，国之福。"
    "知此两者亦稽式。"
    "常知稽式，是谓「玄德」。"
    "「玄德」深矣，远矣，与物反矣，然后乃至大顺。"
    "江海之所以能为百谷王者，以其善下之，故能为百谷王。"
    "是以圣人欲上民，必以言下之；"
    "欲先民，必以身后之。"
    "是以圣人处上而民不重，处前而民不害。"
    "是以天下乐推而不厌。"
    "以其不争，故天下莫能与之争。"
    "天下皆谓我道大，似不肖。"
    "夫唯大，故似不肖。"
    "若肖，久矣其细也夫！我有三宝，持而保之。"
    "一曰慈，二曰俭，三曰不敢为天下先。"
    "慈故能勇；"
    "俭故能广；"
    "不敢为天下先，故能成器长。"
    "今舍慈且勇；舍俭且广；舍后且先；"
    "死矣！夫慈以战则胜，以守则固。"
    "天将救之，以慈卫之。"
    "善为士者，不武；善战者，不怒；善胜敌者，不与；善用人者，为之下。"
    "是谓不争之德，是谓用人之力，是谓配天古之极。"
    "用兵有言：「吾不敢为主，而为客；不敢进寸，而退尺。」是谓行无行；"
    "攘无臂；扔无敌；执无兵。"
    "祸莫大于轻敌，轻敌几丧吾宝。"
    "故抗兵相若，哀者胜矣。"
    "吾言甚易知，甚易行。天下莫能知，莫能行。"
    "言有宗，事有君。"
    "夫唯无知，是以不我知。知我者希，则我者贵。是以圣人被褐而怀玉。"
    "知不知，尚矣；不知知，病也。"
    "圣人不病，以其病病。夫唯病病，是以不病。"
    "民不畏威，则大威至。"
    "无狎其所居，无厌其所生。"
    "夫唯不厌，是以不厌。"
    "是以圣人自知不自见；自爱不自贵。故去彼取此。"
    "勇于敢则杀，勇于不敢则活。"
    "此两者，或利或害。"
    "天之所恶，孰知其故？"
    "天之道，不争而善胜，不言而善应，不召而自来，繟然而善谋。"
    "天网恢恢，疏而不失。"
    "民不畏死，奈何以死惧之？"
    "若使民常畏死，而为奇者，吾得执而杀之，孰敢？"
    "常有司杀者杀。"
    "夫代司杀者杀，是谓代大匠斫，夫代大匠斫者，希有不伤其手矣。"
    "民之饥，以其上食税之多，是以饥。"
    "民之难治，以其上之有为，是以难治。"
    "民之轻死，以其上求生之厚，是以轻死。"
    "夫唯无以生为者，是贤于贵生。"
    "人之生也柔弱，其死也坚强。"
    "草木之生也柔脆，其死也枯槁。"
    "故坚强者死之徒，柔弱者生之徒。"
    "是以兵强则灭，木强则折。"
    "强大处下，柔弱处上。"
    "天之道，其犹张弓欤？高者抑之，下者举之；"
    "有馀者损之，不足者补之。"
    "天之道，损有馀而补不足。"
    "人之道，则不然，损不足以奉有馀。"
    "孰能有馀以奉天下，唯有道者。"
    "是以圣人为而不恃，功成而不处，其不欲见贤。"
    "天下莫柔弱于水，而攻坚强者莫之能胜，以其无以易之。"
    "弱之胜强，柔之胜刚，天下莫不知，莫能行。"
    "是以圣人云：「受国之垢，是谓社稷主；"
    "受国不祥，是为天下王。"
    "」正言若反。"
    "和大怨，必有馀怨；"
    "报怨以德，安可以为善？"
    "是以圣人执左契，而不责于人。"
    "有德司契，无德司彻。"
    "天道无亲，常与善人。"
    "小国寡民。"
    "使有什伯之器而不用；"
    "使民重死而不远徙。"
    "虽有舟舆，无所乘之，虽有甲兵，无所陈之。"
    "使民复结绳而用之。"
    "甘其食，美其服，安其居，乐其俗。"
    "邻国相望，鸡犬之声相闻，民至老死，不相往来。"
    "信言不美，美言不信。"
    "善者不辩，辩者不善。"
    "知者不博，博者不知。"
    "圣人不积，既以为人己愈有，既以与人己愈多。"
    "天之道，利而不害；"
    "圣人之道，为而不争。"
    )
   "The list of encouragements.
Each of these will be sequentially displayed when saving a buffer."
  :group 'encourage-mode)

;;;###autoload
(define-minor-mode encourage-mode
  "A whimsical mode that adds just a little bit of encouragement throughout your day."
  :lighter " YAY!"
  :init-value t
  :global t
  (encourage--toggle-encouragements))

(defun encourage--toggle-encouragements ()
  "Toggle display of encouragements."
  (interactive)
  (if encourage-mode
      (add-hook 'after-save-hook 'encourage--show-encouragements)
    (remove-hook 'after-save-hook 'encourage--show-encouragements)))

(defun encourage--show-encouragements ()
  "Display a random encouragement."
  ;; (message (encourage--random-encouragement))
  (message (encourage--LaoTze-encouragement)))

(defun encourage--random-encouragement ()
  "Get a random encouragement."
  (elt encourage-encouragements (random (length encourage-encouragements))))

(defvar encourage--LaoTze-index 0)
(defun encourage--LaoTze-encouragement ()
  "Get the next sentense of LaoTze."
  (elt encourage-encouragements-LaoTze (mod (setq encourage--LaoTze-index (+ 1 encourage--LaoTze-index)) (length encourage-encouragements-LaoTze))))

(provide 'encourage-mode)
;;; encourage-mode.el ends here
