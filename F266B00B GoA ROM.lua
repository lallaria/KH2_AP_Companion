--ROM Version
--Last Update: v1.0.0.10 Epic & Steam addresses

LUAGUI_NAME = 'GoA ROM Randomizer Build'
LUAGUI_AUTH = 'SonicShadowSilver2 (Ported by Num)'
LUAGUI_DESC = 'A GoA build for use with the Randomizer. Requires ROM patching.'

function _OnInit()
GameVersion = 0
print('GoA v1.54.3.1 - Archipelago')
GoAOffset = 0x7C
SeedCleared = false
end

function GetVersion() --Define anchor addresses
if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then --PCSX2
	OnPC = false
	GameVersion = 1
	print('GoA PS2 Version')
	Now = 0x032BAE0 --Current Location
	Sve = 0x1D5A970 --Saved Location
	Save = 0x032BB30 --Save File
	Obj0Pointer = 0x1D5BA10 --00objentry.bin Pointer Address
	Sys3Pointer = 0x1C61AF8 --03system.bin Pointer Address
	Btl0Pointer = 0x1C61AFC --00battle.bin Pointer Address
	ARDPointer  = 0x034ECF4 --ARD Pointer Address
	Music = 0x0347D34 --Background Music
	Pause = 0x0347E08 --Ability to Pause
	React = 0x1C5FF4E --Reaction Command
	Cntrl = 0x1D48DB8 --Sora Controllable
	Timer = 0x0349DE8
	Songs = 0x035DAC4 --Atlantica Stuff
	GScre = 0x1F8039C --Gummi Score
	GMdal = 0x1F803C0 --Gummi Medal
	GKill = 0x1F80856 --Gummi Kills
	CamTyp = 0x0348750 --Camera Type
	GamSpd = 0x0349E0C --Game Speed
	CutNow = 0x035DE20 --Cutscene Timer
	CutLen = 0x035DE28 --Cutscene Length
	CutSkp = 0x035DE08 --Cutscene Skip
	BtlTyp = 0x1C61958 --Battle Status (Out-of-Battle, Regular, Forced)
	BtlEnd = 0x1D490C0 --End-of-Battle camera & signal
	TxtBox = 0x1D48D54 --Last Displayed Textbox
	DemCln = 0x1D48DEC --Demyx Clone Status (might have to do with other mission status/signal?)
	Slot1    = 0x1C6C750 --Unit Slot 1
	NextSlot = 0x268
	Point1   = 0x1D48EFC
	NxtPoint = 0x38
	Gauge1   = 0x1D48FA4
	NxtGauge = 0x34
	Menu1    = 0x1C5FF18 --Menu 1 (main command menu)
	NextMenu = 0x4
	Obj0 = ReadInt(Obj0Pointer)
	Sys3 = ReadInt(Sys3Pointer)
	Btl0 = ReadInt(Btl0Pointer)
	MSN = 0x04FA440
	hasDied = false
elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
	OnPC = true
	if ReadString(0x9A9330,4) == 'KH2J' then --EGS
		GameVersion = 2
		print('GoA Epic Version')
		Now = 0x0716DF8
		Sve = 0x2A0BFC0
		Save = 0x09A9330
		Obj0Pointer = 0x2A24AB0
		Sys3Pointer = 0x2AE58D0
		Btl0Pointer = 0x2AE58D8
		ARDPointer = 0x2A0F2A8
		Music = 0x0ABA7C4
		Pause = 0x0ABB2F8
		React = 0x2A10BE2
		Cntrl = 0x2A16C68
		Timer = 0x0ABB2D0
		Songs = 0x0B657F4
		GScre = 0x072AEB0
		GMdal = 0x072B044
		GKill = 0x0AF6BC6
		CamTyp = 0x0718A98
		GamSpd = 0x0717214
		CutNow = 0x0B64A18
		CutLen = 0x0B64A34
		CutSkp = 0x0B64A1C
		BtlTyp = 0x2A10E84
		BtlEnd = 0x2A0F760
		TxtBox = 0x074DCB0
		DemCln = 0x2A0F334
		Slot1    = 0x2A23018
		NextSlot = 0x278
		Point1   = 0x2A0F4C8
		NxtPoint = 0x50
		Gauge1   = 0x2A0F5B8
		NxtGauge = 0x48
		Menu1    = 0x2A10B90
		NextMenu = 0x8
		Obj0 = ReadLong(Obj0Pointer)
		Sys3 = ReadLong(Sys3Pointer)
		Btl0 = ReadLong(Btl0Pointer)
		MSN = 0x0BF2C80
		IsDead = 0x0BEEF28 
	elseif ReadString(0x9A98B0,4) == 'KH2J' then --Steam Global
		GameVersion = 3
		print('GoA Steam Global Version')
		Now = 0x0717008
		Sve = 0x2A0C540
		Save = 0x09A98B0
		Obj0Pointer = 0x2A25030
		Sys3Pointer = 0x2AE5E50
		Btl0Pointer = 0x2AE5E58
		ARDPointer = 0x2A0F828
		Music = 0x0ABAD44
		Pause = 0x0ABB878
		React = 0x2A11162
		Cntrl = 0x2A171E8
		Timer = 0x0ABB850
		Songs = 0x0B65D44
		GScre = 0x072B130
		GMdal = 0x072B2C4
		GKill = 0x0AF7146
		CamTyp = 0x0718CA8
		GamSpd = 0x0717424
		CutNow = 0x0B64F98
		CutLen = 0x0B64FB4
		CutSkp = 0x0B64F9C
		BtlTyp = 0x2A11404
		BtlEnd = 0x2A0FCE0
		TxtBox = 0x074DF20
		DemCln = 0x2A0F8B4
		Slot1    = 0x2A23598
		NextSlot = 0x278
		Point1   = 0x2A0FA48
		NxtPoint = 0x50
		Gauge1   = 0x2A0FB38
		NxtGauge = 0x48
		Menu1    = 0x2A11110
		NextMenu = 0x8
		Obj0 = ReadLong(Obj0Pointer)
		Sys3 = ReadLong(Sys3Pointer)
		Btl0 = ReadLong(Btl0Pointer)
		MSN = 0x0BF33C0
		IsDead = 0x0BEF4A8 
	elseif ReadString(0x9A98B0,4) == 'KH2J' then --Steam JP (same as Global for now)
		GameVersion = 4
		print('GoA Steam JP Version')
		Now = 0x0717008
		Sve = 0x2A0C540
		Save = 0x09A98B0
		Obj0Pointer = 0x2A25030
		Sys3Pointer = 0x2AE5E50
		Btl0Pointer = 0x2AE5E58
		ARDPointer = 0x2A0F828
		Music = 0x0ABAD44
		Pause = 0x0ABB878
		React = 0x2A11162
		Cntrl = 0x2A171E8
		Timer = 0x0ABB850
		Songs = 0x0B65D74
		GScre = 0x072B130
		GMdal = 0x072B2C4
		GKill = 0x0AF7146
		CamTyp = 0x0718CA8
		GamSpd = 0x0717424
		CutNow = 0x0B64F98
		CutLen = 0x0B64FB4
		CutSkp = 0x0B64F9C
		BtlTyp = 0x2A11404
		BtlEnd = 0x2A0FCE0
		TxtBox = 0x074DF20
		DemCln = 0x2A0F8B4
		Slot1    = 0x2A23598
		NextSlot = 0x278
		Point1   = 0x2A0FA48
		NxtPoint = 0x50
		Gauge1   = 0x2A0FB38
		NxtGauge = 0x48
		Menu1    = 0x2A11110
		NextMenu = 0x8
		Obj0 = ReadLong(Obj0Pointer)
		Sys3 = ReadLong(Sys3Pointer)
		Btl0 = ReadLong(Btl0Pointer)
		MSN = 0x0BF33C0
		IsDead = 0x0BEF4A8 
	elseif ReadString(0x9A7070,4) == "KH2J" or ReadString(0x9A70B0,4) == "KH2J" or ReadString(0x9A92F0,4) == "KH2J" then
		GameVersion = -1
		print("Epic Version is outdated. Please update the game.")
	elseif ReadString(0x9A9830,4) == "KH2J" then
		GameVersion = -1
		print("Steam Global Version is outdated. Please update the game.")
	elseif ReadString(0x9A8830,4) == "KH2J" then
		GameVersion = -1
		print("Steam JP Version is outdated. Please update the game.")
	end
end
if GameVersion ~= 0 then
	--[[Slot2  = Slot1 - NextSlot
	Slot3  = Slot2 - NextSlot
	Slot4  = Slot3 - NextSlot
	Slot5  = Slot4 - NextSlot
	Slot6  = Slot5 - NextSlot
	Slot7  = Slot6 - NextSlot
	Slot8  = Slot7 - NextSlot
	Slot9  = Slot8 - NextSlot
	Slot10 = Slot9 - NextSlot
	Slot11 = Slot10 - NextSlot
	Slot12 = Slot11 - NextSlot
	Point2 = Point1 + NxtPoint
	Point3 = Point2 + NxtPoint
	Gauge2 = Gauge1 + NxtGauge
	Gauge3 = Gauge2 + NxtGauge--]]
	Menu2  = Menu1 + NextMenu
	--Menu3  = Menu2 + NextMenu
end
end

function Warp(W,R,D,M,B,E) --Warp into the appropriate World, Room, Door, Map, Btl, Evt
M = M or ReadShort(Save + 0x10 + 0x180*W + 0x6*R)
B = B or ReadShort(Save + 0x10 + 0x180*W + 0x6*R + 2)
E = E or ReadShort(Save + 0x10 + 0x180*W + 0x6*R + 4)
WriteByte(Now+0x00,W)
WriteByte(Now+0x01,R)
WriteShort(Now+0x02,D)
WriteShort(Now+0x04,M)
WriteShort(Now+0x06,B)
WriteShort(Now+0x08,E)
--Record Location in Save File
WriteByte(Save+0x000C,W)
WriteByte(Save+0x000D,R)
WriteShort(Save+0x000E,D)
end

function Events(M,B,E) --Check for Map, Btl, and Evt
return ((Map == M or not M) and (Btl == B or not B) and (Evt == E or not E))
end

function BAR(File,Subfile,Offset) --Get address within a BAR file
local Subpoint = File + 0x08 + 0x10*Subfile
local Address
--Detect errors
if ReadInt(File,OnPC) ~= 0x01524142 then --Header mismatch
	return
elseif Subfile > ReadInt(File+4,OnPC) then --Subfile over count
	return
elseif Offset >= ReadInt(Subpoint+4,OnPC) then --Offset exceed subfile length
	return
end
--Get address
Address = File + (ReadInt(Subpoint,OnPC) - ReadInt(File+8,OnPC)) + Offset
return Address
end

function BitOr(Address,Bit,Abs)
WriteByte(Address, ReadByte(Address, Abs and OnPC)|Bit, Abs and OnPC)
end

function BitNot(Address,Bit,Abs)
WriteByte(Address, ReadByte(Address, Abs and OnPC)&~Bit, Abs and OnPC)
end

function Faster(Toggle)
if Toggle then
	WriteFloat(GamSpd,2) --Faster Speed
elseif ReadFloat(GamSpd) > 1 then
	WriteFloat(GamSpd,1) --Normal Speed
end
end

function RemoveTTBlocks() --Remove All TT & STT Blocks
WriteShort(Save+0x207C,0) --Sunset Station
WriteShort(Save+0x2080,0) --Central Station
WriteShort(Save+0x20E4,0) --Underground Concourse
WriteShort(Save+0x20E8,0) --The Woods
WriteShort(Save+0x20EC,0) --Sandlot
WriteShort(Save+0x20F0,0) --Tram Commons
WriteShort(Save+0x20F4,0) --The Mysterious Tower
WriteShort(Save+0x20F8,0) --Tower Wardrobe
WriteShort(Save+0x20FC,0) --Basement Corridor
WriteShort(Save+0x2100,0) --Mansion Library
WriteShort(Save+0x2110,0) --Tunnelway
WriteShort(Save+0x2114,0) --Station Plaza
WriteShort(Save+0x211C,0) --The Old Mansion
WriteShort(Save+0x2120,0) --Mansion Foyer
end

function VisitLock(ItemAddress, RequiredCount, Address, Bit)
	local ItemCount = ReadByte(ItemAddress)
	if ItemCount < RequiredCount then
		BitNot(Address, Bit)
	elseif ReadByte(Address) & Bit == 0 then
		BitOr(Address, Bit)
	end
end

function _OnFrame()
if GameVersion == 0 then --Get anchor addresses
	GetVersion()
	return
end
if true then --Define current values for common addresses
	World  = ReadByte(Now+0x00)
	Room   = ReadByte(Now+0x01)
	Place  = ReadShort(Now+0x00)
	Door   = ReadShort(Now+0x02)
	Map    = ReadShort(Now+0x04)
	Btl    = ReadShort(Now+0x06)
	Evt    = ReadShort(Now+0x08)
	PrevPlace = ReadShort(Now+0x30)
	if not OnPC then
		ARD = ReadInt(ARDPointer)
	else
		ARD = ReadLong(ARDPointer)
	end
end
NewGame()
GoA()
TWtNW()
LoD()
BC()
HT()
Ag()
OC()
PL()
TT()
HB()
PR()
DC()
SP()
STT()
AW()
At()
Data()

-- 0x0BEF4A8 steam
-- 0x0BEEF28 epic
-- deathlink
killSora = false
isDeathLink = ReadLong(IsDead)

-- kills sora if deathlink is active
if(ReadByte(0x810000)==1)then
	-- if drive gauge> 5 and world is not atlantica
	if(Slot1+0x1B2>=5 and World ~= 11) then
		killSora = true
	end
end
if(isDeathLink~=0) then
	hasDied = true
	--print(hasDied)
end
if(killSora and ((World~=6 or Room~=0)))then
	WriteByte(Slot1,0)
end
if(hasDied and isDeathLink==0)then
	--print("sora has come back")
	hasDied = false
	WriteByte(0x810000,0)
	WriteByte(0x810001,0)
end
if(isDeathLink~=0 and hasDied==true)then
	WriteByte(0x810001,1)
end
end

function NewGame()
--Before New Game
if OnPC and ReadByte(BAR(Sys3,0x6,0x0E5F),OnPC) == 0x19 then --Change Form's Icons in PC from Analog Stick
	WriteByte(BAR(Sys3,0x6,0x0E5F),0xCE,OnPC) --Valor
	WriteByte(BAR(Sys3,0x6,0x0E77),0xCE,OnPC) --Wisdom
	WriteByte(BAR(Sys3,0x6,0x0E8F),0xCE,OnPC) --Limit
	WriteByte(BAR(Sys3,0x6,0x0EA7),0xCE,OnPC) --Master
	WriteByte(BAR(Sys3,0x6,0x0EBF),0xCE,OnPC) --Final
	WriteByte(BAR(Sys3,0x6,0x0ED7),0xCE,OnPC) --Anti
	WriteByte(BAR(Sys3,0x6,0x253F),0xCE,OnPC) --Valor DUMMY (Navigational Map)
	WriteByte(BAR(Sys3,0x6,0x265F),0xCE,OnPC) --Final DUMMY (Window of Time 2 Map)
end
--Start New Game
if Place == 0x2002 and Events(0x01,Null,0x01) then --Station of Serenity Weapons
	WriteByte(Pause,2) --Disable Pause
	--Starting Stats
	WriteByte(Slot1+0x1B0,100) --Starting Drive %
	WriteByte(Slot1+0x1B1,5)   --Starting Drive Current
	WriteByte(Slot1+0x1B2,5)   --Starting Drive Max
	BitNot(Save+0x41A5,0x06)   --Default No Summon Animations
	--Tutorial Flags & Form Weapons
	BitOr(Save+0x36E8,0x01)  --Enable Item in Command Menu
	WriteShort(Save+0x4270,0x1FF) --Pause Menu Tutorial Prompts Seen Flags
	WriteShort(Save+0x4274,0x1FF) --Status Form & Summon Seen Flags
	BitOr(Save+0x49F0,0x03) --Shop Tutorial Prompt Flags (1=Big Shops, 2=Small Shops)
	--Fix for a softlock added on purpose for debugging purposes
	--It'll warp you to Wedding Ship if Lua isn't running; this code will warp you properly to GoA)
	if ReadShort(BAR(ARD,0x0A,0xD6),OnPC) == 0x0B and ReadShort(BAR(ARD,0x0A,0xD8),OnPC) == 0x0A then
		WriteShort(BAR(ARD,0x0A,0xD6),0x04,OnPC)
		WriteShort(BAR(ARD,0x0A,0xD8),0x1A,OnPC)
	elseif ReadShort(BAR(ARD,0x0A,0xDE),OnPC) == 0x0B and ReadShort(BAR(ARD,0x0A,0xE0),OnPC) == 0x0A then
		WriteShort(BAR(ARD,0x0A,0xDE),0x04,OnPC)
		WriteShort(BAR(ARD,0x0A,0xE0),0x1A,OnPC)
	end
end
end

function GoA()
--Clear Conditions
if not SeedCleared then
	local ObjectiveCount = ReadShort(BAR(Sys3,0x6,0x4F4),OnPC)
	if ObjectiveCount == 0 then
		if ReadByte(Save+0x36B2) > 0 and ReadByte(Save+0x36B3) > 0 and ReadByte(Save+0x36B4) > 0 then --All Proofs Obtained
			SeedCleared = true
		end
	else
		if ReadByte(Save+0x363D) >= ObjectiveCount then --Requisite Objective Count Achieved
			SeedCleared = true
		end
	end
end
--Garden of Assemblage Rearrangement
if Place == 0x1A04 then
	--Open Promise Charm Path
	if ReadByte(Save+0x3694) > 0 then --Seed Cleared & Promise Charm
		WriteShort(BAR(ARD,0x06,0x05C),0x77A,OnPC) --Text
	end
	--Demyx's Portal Text
	if ReadByte(Save+0x1D2E) > 0 then --Hollow Bastion Cleared
		WriteShort(BAR(ARD,0x05,0x25C),0x779,OnPC) --Radiant Garden
	end
end
--World Map -> Garden of Assemblage
if Place == 0x000F then
	local WarpDoor = false
	if Door == 0x0C then --The World that Never Was
		WarpDoor = 0x15
	elseif Door == 0x03 then --Land of Dragons
		WarpDoor = 0x16
	elseif Door == 0x04 then --Beast's Castle
		WarpDoor = 0x17
	elseif Door == 0x09 then --Halloween Town
		WarpDoor = 0x18
	elseif Door == 0x0A then --Agrabah
		WarpDoor = 0x19
	elseif Door == 0x05 then --Olympus Coliseum
		WarpDoor = 0x1A
	elseif Door == 0x0B then --Pride Lands
		WarpDoor = 0x1B
	elseif Door == 0x01 then --Twilight Town
		if ReadByte(Save+0x1CFF) == 8 then --Twilight Town
			WarpDoor = 0x1C
		elseif ReadByte(Save+0x1CFF) == 13 then --Simulated Twilight Town
			WarpDoor = 0x21
		end
	elseif Door == 0x02 then --Hollow Bastion
		WarpDoor = 0x1D
	elseif Door == 0x08 then --Port Royal
		WarpDoor = 0x1E
	elseif Door == 0x06 then --Disney Castle
		WarpDoor = 0x1F
	elseif Door == 0x07 then --Atlantica
		WarpDoor = 0x01
	end
	if WarpDoor then
		Warp(0x04,0x1A,WarpDoor)
	end
end
--Visit Locks
if true then
	--Namine's Sketches
	VisitLock(Save+0x3642, 1, Save+0x1CD0, 0x01) --TT_START_1
	--Ice Cream
	VisitLock(Save+0x3649, 1, Save+0x1CD2, 0x10) --TT_INIT
	VisitLock(Save+0x3649, 2, Save+0x1C92, 0x08) --ZZ_TT_CHECK_1_GOA
	VisitLock(Save+0x3649, 3, Save+0x1C92, 0x10) --ZZ_TT_CHECK_2_GOA
	--Membership Card
	VisitLock(Save+0x3643, 1, Save+0x1D1B, 0x08) --HB_INIT
	VisitLock(Save+0x3643, 2, Save+0x1C92, 0x20) --ZZ_HB_CHECK_1_GOA
	VisitLock(Save+0x3643, 0, Save+0x1C92, 0x40) --ZZ_HB_CHECK_2_GOA
	--Beast's Claw
	VisitLock(Save+0x35B3, 1, Save+0x1D31, 0x08) --BB_INIT
	VisitLock(Save+0x35B3, 2, Save+0x1C92, 0x80) --ZZ_BB_CHECK_GOA
	--Battlefields of War
	VisitLock(Save+0x35AE, 1, Save+0x1D53, 0x20) --HE_INIT
	VisitLock(Save+0x35AE, 2, Save+0x1C93, 0x01) --ZZ_HE_CHECK_GOA
	--Scimitar
	VisitLock(Save+0x35C0, 1, Save+0x1D73, 0x02) --AL_INIT
	VisitLock(Save+0x35C0, 2, Save+0x1C93, 0x02) --ZZ_AL_CHECK_GOA
	--Sword of the Ancestors
	VisitLock(Save+0x35AF, 1, Save+0x1D91, 0x01) --MU_INIT
	VisitLock(Save+0x35AF, 2, Save+0x1C93, 0x04) --ZZ_MU_CHECK_GOA
	--Proud Fang
	VisitLock(Save+0x35B5, 1, Save+0x1DD5, 0x04) --LK_INIT
	VisitLock(Save+0x35B5, 2, Save+0x1C94, 0x01) --ZZ_LK_CHECK_GOA
	--Royal Summons (DUMMY 13)
	VisitLock(Save+0x365D, 1, Save+0x1E12, 0x08) --DC_INIT
	VisitLock(Save+0x365D, 2, Save+0x1C94, 0x20) --ZZ_DC_CHECK_GOA
	--Bone Fist
	VisitLock(Save+0x35B4, 1, Save+0x1E56, 0x08) --NM_INIT
	VisitLock(Save+0x35B4, 2, Save+0x1C94, 0x40) --ZZ_NM_CHECK_GOA
	--Skill and Crossbones
	VisitLock(Save+0x35B6, 1, Save+0x1E99, 0x04) --CA_INIT
	VisitLock(Save+0x35B6, 2, Save+0x1C94, 0x80) --ZZ_CA_CHECK_GOA
	--Identity Disk
	VisitLock(Save+0x35C2, 1, Save+0x1EB5, 0x20) --TR_INIT
	VisitLock(Save+0x35C2, 2, Save+0x1C95, 0x01) --ZZ_TR_CHECK_GOA
	--Way to the Dawn
	VisitLock(Save+0x35C1, 1, Save+0x1C95, 0x02) --ZZ_EH_CHECK_1_GOA
	VisitLock(Save+0x35C1, 2, Save+0x1C95, 0x04) --ZZ_EH_CHECK_2_GOA
else --Remove the item requirements
	--Namine's Sketches
	VisitLock(Save+0x3642, 0, Save+0x1CD0, 0x01) --TT_START_1
	--Ice Cream
	VisitLock(Save+0x3649, 0, Save+0x1CD2, 0x10) --TT_INIT
	VisitLock(Save+0x3649, 0, Save+0x1C92, 0x08) --ZZ_TT_CHECK_1_GOA
	VisitLock(Save+0x3649, 0, Save+0x1C92, 0x10) --ZZ_TT_CHECK_2_GOA
	--Membership Card
	VisitLock(Save+0x3643, 0, Save+0x1D1B, 0x08) --HB_INIT
	VisitLock(Save+0x3643, 0, Save+0x1C92, 0x20) --ZZ_HB_CHECK_1_GOA
	VisitLock(Save+0x3643, 0, Save+0x1C92, 0x40) --ZZ_HB_CHECK_2_GOA
	--Beast's Claw
	VisitLock(Save+0x35B3, 0, Save+0x1D31, 0x08) --BB_INIT
	VisitLock(Save+0x35B3, 0, Save+0x1C92, 0x80) --ZZ_BB_CHECK_GOA
	--Battlefields of War
	VisitLock(Save+0x35AE, 0, Save+0x1D53, 0x20) --HE_INIT
	VisitLock(Save+0x35AE, 0, Save+0x1C93, 0x01) --ZZ_HE_CHECK_GOA
	--Scimitar
	VisitLock(Save+0x35C0, 0, Save+0x1D73, 0x02) --AL_INIT
	VisitLock(Save+0x35C0, 0, Save+0x1C93, 0x02) --ZZ_AL_CHECK_GOA
	--Sword of the Ancestors
	VisitLock(Save+0x35AF, 0, Save+0x1D91, 0x01) --MU_INIT
	VisitLock(Save+0x35AF, 0, Save+0x1C93, 0x04) --ZZ_MU_CHECK_GOA
	--Proud Fang
	VisitLock(Save+0x35B5, 0, Save+0x1DD5, 0x04) --LK_INIT
	VisitLock(Save+0x35B5, 0, Save+0x1C94, 0x01) --ZZ_LK_CHECK_GOA
	--Royal Summons (DUMMY 13)
	VisitLock(Save+0x365D, 0, Save+0x1E12, 0x08) --DC_INIT
	VisitLock(Save+0x365D, 0, Save+0x1C94, 0x20) --ZZ_DC_CHECK_GOA
	--Bone Fist
	VisitLock(Save+0x35B4, 0, Save+0x1E56, 0x08) --NM_INIT
	VisitLock(Save+0x35B4, 0, Save+0x1C94, 0x40) --ZZ_NM_CHECK_GOA
	--Skill and Crossbones
	VisitLock(Save+0x35B6, 0, Save+0x1E99, 0x04) --CA_INIT
	VisitLock(Save+0x35B6, 0, Save+0x1C94, 0x80) --ZZ_CA_CHECK_GOA
	--Identity Disk
	VisitLock(Save+0x35C2, 0, Save+0x1EB5, 0x20) --TR_INIT
	VisitLock(Save+0x35C2, 0, Save+0x1C95, 0x01) --ZZ_TR_CHECK_GOA
	--Way to the Dawn
	VisitLock(Save+0x35C1, 0, Save+0x1C95, 0x02) --ZZ_EH_CHECK_1_GOA
	VisitLock(Save+0x35C1, 0, Save+0x1C95, 0x04) --ZZ_EH_CHECK_2_GOA

	--Disable GoA Visit Skip
	--BitOr(Save+0x1CED,0x01) --TT_MISTERY_SKIP_GOA
	--BitOr(Save+0x1D20,0x20) --HB_SCENARIO_5_SKIP_GOA
	--BitOr(Save+0x1DB6,0x08) --PO_SCENARIO_0_SKIP_GOA
	--BitOr(Save+0x1EB1,0x01) --TR_LIGHTCYCLE_SKIP_GOA
end
--Battle Level
if true then
	local Bitmask = 0x00001
	local Visit
	--Bitmask 0x00001 for all Lv  1
	--Bitmask 0x00002 for all Lv 50
	--Bitmask 0x00004 for all Lv 80
	--Bitmask 0x00008 for all Lv 99
	if World == 0x02 then --Twilight Town & Simulated Twilight Town
		Visit = ReadByte(Save+0x3FF5)
		if Visit == 1 or Visit == 2 or Visit == 3 then
			Bitmask = 0x00010
		elseif Visit == 4 or Visit == 5 then
			Bitmask = 0x00020
		elseif Visit == 6 then
			Bitmask = 0x00040
		elseif Visit == 7 or Visit == 8 then
			Bitmask = 0x00100
		elseif Visit == 9 then
			Bitmask = 0x00200
		elseif Visit == 10 then
			Bitmask = 0x00800
		end
		--0x00080 actual TT7
		--0x00400 post-HB4
		--Lv 1, 2, 3, 6, 7, 28, 34, 47
	elseif World == 0x04 then --Hollow Bastion
		Visit = ReadByte(Save+0x3FFD)
		if Visit == 1 or Visit == 2 or Visit == 3 then
			Bitmask = 0x00010
		elseif Visit == 4 then
			Bitmask = 0x00080
		elseif Visit == 5 then
			Bitmask = 0x00200
		end
		--0x00020 actual HB2 & HB3
		--0x00040 HB4 pre-SP1
		--0x00100 post-HB4
		--Lv 8, 15, 28, 30, 34, 45
	elseif World == 0x05 then --Beast's Castle
		Visit = ReadByte(Save+0x4001)
		if Visit == 1 then
			Bitmask = 0x00010
		elseif Visit == 2 then
			Bitmask = 0x00020
		end
		--Lv 13, 36
	elseif World == 0x06 then --Olympus Coliseum
		Visit = ReadByte(Save+0x4005)
		if Visit == 1 then
			Bitmask = 0x00010
		elseif Visit == 2 then
			Bitmask = 0x00020
		end
		--Lv 16, 39
	elseif World == 0x07 then --Agrabah
		Visit = ReadByte(Save+0x4009)
		if Visit == 1 then
			Bitmask = 0x00010
		elseif Visit == 2 then
			Bitmask = 0x00040
		end
		--0x00020 AG1 post HB4
		--Lv 22, 38, 40
	elseif World == 0x08 then --The Land of Dragons
		Visit = ReadByte(Save+0x400D)
		if Visit == 1 then
			Bitmask = 0x00010
		elseif Visit == 2 then
			Bitmask = 0x00020
		end
		--Lv 10, 35
	elseif World == 0x09 then --100 Acre Wood
		Bitmask = 0x00010
		--Lv 1
	elseif World == 0x0A then --Pride Lands
		Visit = ReadByte(Save+0x4015)
		if Visit == 1 then
			Bitmask = 0x00010
		elseif Visit == 2 then
			Bitmask = 0x00040
		end
		--0x00020 PL1 post HB4
		--Lv 26, 41, 43
	elseif World == 0x0C or World == 0x0D then --Disney Castle & Timeless River
		Bitmask = 0x00010
		if ReadByte(Save+0x1E1E) > 0 then --Post-HB4
			Bitmask = 0x00020
		end
		--Lv 18, 34 for DC
		--Lv 19, 34 for TR
	elseif World == 0x0E then --Halloween Town
		Visit = ReadByte(Save+0x4025)
		if Visit == 1 then
			Bitmask = 0x00010
		elseif Visit == 2 then
			Bitmask = 0x00040
		end
		--0x00020 HT1 post HB4
		--Lv 24, 39, 41
	elseif World == 0x10 then --Port Royal
		Visit = ReadByte(Save+0x402D)
		if Visit == 1 then
			Bitmask = 0x00010
		elseif Visit == 2 then
			Bitmask = 0x00020
		end
		--Lv 20, 37
	elseif World == 0x11 then --Space Paranoids
		Visit = ReadByte(Save+0x4031)
		if Visit == 1 then
			Bitmask = 0x00010
		elseif Visit == 2 then
			Bitmask = 0x00040
		end
		--0x00020 post HB4
		--Lv 28, 34, 45
	elseif World == 0x12 then --The World that Never Was
		Bitmask = 0x00010
		--Lv 50
	end
	WriteInt(Save+0x3724,Bitmask)
end
--Fix Genie Crash
if ReadByte(Save+0x36C4)&0x10 == 0x10 then --If Lamp Charm is obtained
	local CurSubmenu
	if not OnPC then
		CurSubmenu = ReadInt(Menu2)
	else
		CurSubmenu = ReadLong(Menu2)
	end
	CurSubmenu = ReadByte(CurSubmenu,OnPC)
	if CurSubmenu == 7 and ReadByte(Save+0x36C0)&0x56 == 0x00 then --In Summon menu without Forms
		BitOr(Save+0x36C0,0x02) --Add Valor Form
		BitOr(Save+0x06B2,0x01)
	elseif ReadShort(React) == 0x059 and ReadByte(Save+0x36C0)&0x56 == 0x00 then --Genie in Auto Summon RC without Forms
		BitOr(Save+0x36C0,0x02) --Add Valor Form
		BitOr(Save+0x06B2,0x01)
	elseif CurSubmenu ~= 7 and ReadShort(React) ~= 0x059 and ReadByte(Save+0x06B2)&0x01==0x01 then --None of the above
		BitNot(Save+0x36C0,0x02) --Remove Valor Form
		BitNot(Save+0x06B2,0x01)
	end
end
--Invincibility on Cutscenes
if ReadByte(Cntrl) == 3 then --Cutscene
	WriteByte(Slot1+0x1AE,0)
else --Gameplay
	WriteByte(Slot1+0x1AE,100)
end
--Progressive Growth Abilities & Fixed Trinity Limit Slot
for Slot = 0,68 do
	local Current = Save + 0x2544 + 2*Slot
	local Ability = ReadShort(Current) & 0x0FFF
	local Initial = ReadShort(Current) & 0xF000
	if Ability >= 0x05E and Ability <= 0x061 then --High Jump
		WriteShort(Current,0)
	elseif Ability >= 0x062 and Ability <= 0x065 then --Quick Run
		WriteShort(Current,0)
	elseif Ability >= 0x234 and Ability <= 0x237 then --Dodge Roll
		WriteShort(Current,0)
	elseif Ability >= 0x066 and Ability <= 0x069 then --Aerial Dodge
		WriteShort(Current,0)
	elseif Ability >= 0x06A and Ability <= 0x06D then --Glide
		WriteShort(Current,0)
	end
end
--Remove Growth Abilities from Forms
if ReadByte(BAR(Btl0,0x10,0x41),0,OnPC) ~= 0 then
	for i = 0,34 do
		WriteByte(BAR(Btl0,0x10,0x41+0x8*i),0,OnPC) --Remove Innate Growth Abilities
	end
end
--Growth Abilities during Forms
if true then
	local Growth = {0x805E,0x8062,0x8234,0x8066,0x806A}
	for form = 0,4 do --Adjust Form Movement
		local FormAddress = Save + 0x32F6 + 0x38*form
		for level = 0,6 do
			if ReadByte(FormAddress) == level+1 then
				WriteShort(FormAddress+6, Growth[form+1] + math.floor(level/2))
			end
		end
	end
end
-- Munny Pouch (Not Mickey)
while ReadByte(Save+0x363C) > ReadByte(Save+0x35C4) do
	WriteInt(Save+0x2440,ReadInt(Save+0x2440)+2500)
	WriteByte(Save+0x35C4,ReadByte(Save+0x35C4)+1)
end
--Munny Pouch (Mickey)
while ReadByte(Save+0x3695) > ReadByte(Save+0x35C5) do
	WriteInt(Save+0x2440,ReadInt(Save+0x2440)+5000)
	WriteByte(Save+0x35C5,ReadByte(Save+0x35C5)+1)
end
-- Bounty Money 
while ReadByte(Save+0x36C2)&0x20 > ReadByte(Save+0x3D18) do
	WriteInt(Save+0x2440,ReadInt(Save+0x2440)+1000)
	WriteByte(Save+0x3D18,ReadByte(Save+0x3D18)+1)
end
--DUMMY 23 = Maximum HP Increased!
while ReadByte(Save+0x3671) > ReadByte(Save+0x35CC) and ReadInt(Slot1+0x000) > 1 do
	local Bonus
	if ReadByte(Save+0x2498) < 3 then --Non-Critical
		Bonus = 5
	else --Critical
		Bonus = 2
	end
	WriteInt(Slot1+0x000,ReadInt(Slot1+0x000)+Bonus)
	WriteInt(Slot1+0x004,ReadInt(Slot1+0x004)+Bonus)
	WriteByte(Save+0x35CC,ReadByte(Save+0x35CC)+1)
end
--DUMMY 24 = Maximum MP Increased!
while ReadByte(Save+0x3672) > ReadByte(Save+0x35CD) and ReadInt(Slot1+0x000) > 1 do
	local Bonus
	if ReadByte(Save+0x2498) < 3 then --Non-Critical
		Bonus = 10
	else --Critical
		Bonus = 5
	end
	WriteInt(Slot1+0x180,ReadInt(Slot1+0x180)+Bonus)
	WriteInt(Slot1+0x184,ReadInt(Slot1+0x184)+Bonus)
	WriteByte(Save+0x35CD,ReadByte(Save+0x35CD)+1)
end
--DUMMY 25 = Drive Gauge Powered Up!
while ReadByte(Save+0x3673) > ReadByte(Save+0x35CE) and ReadInt(Slot1+0x000) > 1 do
	if ReadByte(Slot1+0x1B2) < 9 then
		WriteByte(Slot1+0x1B1,ReadByte(Slot1+0x1B1)+1)
		WriteByte(Slot1+0x1B2,ReadByte(Slot1+0x1B2)+1)
	end
	WriteByte(Save+0x35CE,ReadByte(Save+0x35CE)+1)
end
--DUMMY 26 = Gained Armor Slot!
while ReadByte(Save+0x3674) > ReadByte(Save+0x35D5) and ReadInt(Slot1+0x000) > 1 do
	if ReadByte(Save+0x2500) < 8 then
		WriteByte(Save+0x2500,ReadByte(Save+0x2500)+1)
	end
	WriteByte(Save+0x35D5,ReadByte(Save+0x35D5)+1)
end
--DUMMY 27 = Gained Accessory Slot!
while ReadByte(Save+0x3675) > ReadByte(Save+0x35D6)and ReadInt(Slot1+0x000) > 1 do
	if ReadByte(Save+0x2501) < 8 then
		WriteByte(Save+0x2501,ReadByte(Save+0x2501)+1)
	end
	WriteByte(Save+0x35D6,ReadByte(Save+0x35D6)+1)
end
--DUMMY 16 = Gained Item Slot!
while ReadByte(Save+0x3660) > ReadByte(Save+0x35DB) and ReadInt(Slot1+0x000) > 1 do
	if ReadByte(Save+0x2502) < 8 then
		WriteByte(Save+0x2502,ReadByte(Save+0x2502)+1)
	end
	WriteByte(Save+0x35DB,ReadByte(Save+0x35DB)+1)
end
-- if potion null is greater than counter
while ReadByte(Save+0x36B8) > ReadByte(Save+0x3613) do
	WriteByte(Save+0x3580,ReadByte(Save+0x3580)+1)
	WriteByte(Save+0x3613,ReadByte(Save+0x3613)+1)
end
-- if hi potion null is greater than counter
while ReadByte(Save+0x36B9) > ReadByte(Save+0x3614) do
	WriteByte(Save+0x3581,ReadByte(Save+0x3581)+1)
	WriteByte(Save+0x3614,ReadByte(Save+0x3614)+1)
end
-- if ether null is greater than counter
while ReadByte(Save+0x36BA) > ReadByte(Save+0x3615) do
	WriteByte(Save+0x3582,ReadByte(Save+0x3582)+1)
	WriteByte(Save+0x3615,ReadByte(Save+0x3615)+1)
end

-- if elixer null is greater than counter
while ReadByte(Save+0x36BB) > ReadByte(Save+0x3616) do
	WriteByte(Save+0x3583,ReadByte(Save+0x3583)+1)
	WriteByte(Save+0x3616,ReadByte(Save+0x3616)+1)
end

-- if megaexlier null is greater than counter
while ReadByte(Save+0x36BC) > ReadByte(Save+0x360E) do
	WriteByte(Save+0x3586,ReadByte(Save+0x3586)+1)
	WriteByte(Save+0x360E,ReadByte(Save+0x360E)+1)
end

-- if tent null is greater than counter
while ReadByte(Save+0x36BD) > ReadByte(Save+0x360D) do
	WriteByte(Save+0x35E1,ReadByte(Save+0x35E1)+1)
	WriteByte(Save+0x360D,ReadByte(Save+0x360D)+1)
end

-- if drive recov null is greater than counter
while ReadByte(Save+0x36BE) > ReadByte(Save+0x360C) do
	WriteByte(Save+0x3664,ReadByte(Save+0x3664)+1)
	WriteByte(Save+0x360C,ReadByte(Save+0x360C)+1)
end

-- if high drive recov null is greater than counter
while ReadByte(Save+0x36BF) > ReadByte(Save+0x360B) do
	WriteByte(Save+0x3665,ReadByte(Save+0x3665)+1)
	WriteByte(Save+0x360B,ReadByte(Save+0x360B)+1)
end
-- power boost
while ReadByte(Save+0x359D)>ReadByte(Save+0x360A) do
	WriteByte(Save+0x3666,ReadByte(Save+0x3666)+1)
	WriteByte(Save+0x360A,ReadByte(Save+0x360A)+1)
end
-- magic boost
while ReadByte(Save+0x35E0)>ReadByte(Save+0x3609) do
	WriteByte(Save+0x3667,ReadByte(Save+0x3667)+1)
	WriteByte(Save+0x3609,ReadByte(Save+0x3609)+1)
end
-- defence boost
while ReadByte(Save+0x35F8)>ReadByte(Save+0x3608) do
	WriteByte(Save+0x3668,ReadByte(Save+0x3668)+1)
	WriteByte(Save+0x3608,ReadByte(Save+0x3608)+1)
end
-- ap boost
while ReadByte(Save+0x35FE)>ReadByte(Save+0x3599) do
	WriteByte(Save+0x3669,ReadByte(Save+0x3669)+1)
	WriteByte(Save+0x3599,ReadByte(Save+0x3599)+1)
end
--Donald's Staff Active Abilities
if true then
	local Staff   = ReadShort(Save+0x2604)
	local Ability = {} --Offset for staff's ability within 03system.bar's item
	Ability[0x04B] = 0x48A --Mage's Staff
	Ability[0x094] = 0x49A --Hammer Staff
	Ability[0x095] = 0x4AA --Victory Bell
	Ability[0x097] = 0x4CA --Comet Staff
	Ability[0x098] = 0x4DA --Lord's Broom
	Ability[0x099] = 0x4EA --Wisdom Wand
	Ability[0x096] = 0x4BA --Meteor Staff
	Ability[0x09A] = 0x4FA --Rising Dragon
	Ability[0x09C] = 0x51A --Shaman's Relic
	Ability[0x258] = 0x95A --Shaman's Relic+
	Ability[0x09B] = 0x50A --Nobody Lance
	Ability[0x221] = 0x86A --Centurion
	Ability[0x222] = 0x87A --Centurion+
	Ability[0x1E2] = 0x6DA --Save the Queen
	Ability[0x1F7] = 0x82A --Save the Queen+
	Ability[0x223] = 0x88A --Plain Mushroom
	Ability[0x224] = 0x89A --Plain Mushroom+
	Ability[0x225] = 0x8AA --Precious Mushroom
	Ability[0x226] = 0x8BA --Precious Mushroom+
	Ability[0x227] = 0x8CA --Premium Mushroom
	Ability[0x0A1] = 0x52A --Detection Staff
	if Ability[Staff] ~= nil then
		local StatOffset = 0x8 + ReadInt(BAR(Sys3,0x6,4),OnPC) * 0x18
		Ability = ReadShort(BAR(Sys3,0x6,StatOffset+Ability[Staff]),OnPC) --Currently-equipped staff's ability
		if Ability == 0x0A5 then --Donald Fire
			WriteShort(Save+0x26F6,0x80A5)
			WriteByte(BAR(Sys3,0x6,0x168F),0,OnPC)
		elseif Ability == 0x0A6 then --Donald Blizzard
			WriteShort(Save+0x26F6,0x80A6)
			WriteByte(BAR(Sys3,0x6,0x16A7),0,OnPC)
		elseif Ability == 0x0A7 then --Donald Thunder
			WriteShort(Save+0x26F6,0x80A7)
			WriteByte(BAR(Sys3,0x6,0x16BF),0,OnPC)
		elseif Ability == 0x0A8 then --Donald Cure
			WriteShort(Save+0x26F6,0x80A8)
			WriteByte(BAR(Sys3,0x6,0x16D7),0,OnPC)
		elseif ReadShort(Save+0x26F6) ~= 0 then
			WriteShort(Save+0x26F6,0) --Remove Ability Slot 80
			WriteByte(BAR(Sys3,0x6,0x168F),2,OnPC) --Restore Original AP Costs
			WriteByte(BAR(Sys3,0x6,0x16A7),2,OnPC)
			WriteByte(BAR(Sys3,0x6,0x16BF),2,OnPC)
			WriteByte(BAR(Sys3,0x6,0x16D7),3,OnPC)
		end
	end
end
--Goofy's Shield Active Abilities
if true then
	local Shield  = ReadShort(Save+0x2718)
	local Ability = {} --Offset for shield's ability within 03system.bar's item
	Ability[0x031] = 0x53A --Knight's Shield
	Ability[0x08B] = 0x54A --Adamant Shield
	Ability[0x08C] = 0x55A --Chain Gear
	Ability[0x08E] = 0x57A --Falling Star
	Ability[0x08F] = 0x58A --Dreamcloud
	Ability[0x090] = 0x59A --Knight Defender
	Ability[0x08D] = 0x56A --Ogre Shield
	Ability[0x091] = 0x5AA --Genji Shield
	Ability[0x092] = 0x5BA --Akashic Record
	Ability[0x259] = 0x96A --Akashic Record+
	Ability[0x093] = 0x5CA --Nobody Guard
	Ability[0x228] = 0x8DA --Frozen Pride
	Ability[0x229] = 0x8EA --Frozen Pride+
	Ability[0x1E3] = 0x6EA --Save the King
	Ability[0x1F8] = 0x83A --Save the King+
	Ability[0x22A] = 0x8FA --Joyous Mushroom
	Ability[0x22B] = 0x90A --Joyous Mushroom+
	Ability[0x22C] = 0x91A --Majestic Mushroom
	Ability[0x22D] = 0x92A --Majestic Mushroom+
	Ability[0x22E] = 0x93A --Ultimate Mushroom
	Ability[0x032] = 0x5DA --Detection Shield
	Ability[0x033] = 0x5EA --Test the King
	if Ability[Shield] ~= nil then
		local StatOffset = 0x8 + ReadInt(BAR(Sys3,0x6,4),OnPC) * 0x18
		Ability = ReadShort(BAR(Sys3,0x6,StatOffset+Ability[Shield]),OnPC) --Currently-equipped shield's ability
		if Ability == 0x1A7 then --Goofy Tornado
			WriteShort(Save+0x280A,0x81A7)
			WriteByte(BAR(Sys3,0x6,0x16EF),0,OnPC)
		elseif Ability == 0x1AD then --Goofy Bash
			WriteShort(Save+0x280A,0x81AD)
			WriteByte(BAR(Sys3,0x6,0x1707),0,OnPC)
		elseif Ability == 0x1A9 then --Goofy Turbo
			WriteShort(Save+0x280A,0x81A9)
			WriteByte(BAR(Sys3,0x6,0x171F),0,OnPC)
		elseif ReadShort(Save+0x280A) ~= 0 then
			WriteShort(Save+0x280A,0) --Remove Ability Slot 80
			WriteByte(BAR(Sys3,0x6,0x16EF),2,OnPC) --Restore Original AP Costs
			WriteByte(BAR(Sys3,0x6,0x1707),2,OnPC)
			WriteByte(BAR(Sys3,0x6,0x171F),2,OnPC)
		end
	end
end
--Show all items in shops (ASSEMBLY edit)
if not OnPC then
	WriteInt(0x264250,0)
elseif ReadLong(0x2FAD62) == 0x43B70F0D74D68541 then --Epic Global
	WriteByte(0x2FAD66,0)
elseif ReadLong(0x2FABA2) == 0x43B70F0D74D68541 then --Epic JP
	WriteByte(0x2FABA6,0)
elseif ReadLong(0x2FB8A2) == 0x43B70F0D74D68541 then --Steam Global
	WriteByte(0x2FB8A6,0)
elseif ReadLong(0x2FB622) == 0x43B70F0D74D68541 then --Steam JP
	WriteByte(0x2FB626,0)
end
--Navigational Map Unlocks Valor Form
if ReadByte(Save+0x36C0)&0x80 == 0x80 then
	BitOr(Save+0x36C0,0x02)
end
--Window of Time Map 2 Unlocks Final Form
if ReadByte(Save+0x36C2)&0x02 == 0x02 then
	BitOr(Save+0x36C0,0x10)
end
--[[Enable Anti Form Forcing
if ReadByte(Save+0x3524) == 6 then --In Anti Form
	BitOr(Save+0x36C0,0x20) --Unlocks Anti Form
end--]]
--Anti Form Costs Max Drive Instead of a Static 9.
if ReadByte(BAR(Sys3,0x2,0x0264),OnPC) >= 5 and ReadByte(Slot1+0x1B2) >= 5 then
	WriteByte(BAR(Sys3,0x2,0x0264),ReadByte(Slot1+0x1B2),OnPC)
end
end

function TWtNW()
--Data Xemnas -> The World that Never Was
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1EDE)
	local Progress = ReadByte(Save+0x1EDF)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --[1st Visit, Before Entering Castle that Never Was]
			WarpRoom = 0x01
			WriteInt(Save+0x357C,0x12020100)
		elseif Progress == 1 then --Before Xigbar
			WarpRoom = 0x04
			WriteInt(Save+0x357C,0x12020100)
		elseif Progress == 2 then --[After Xigbar, After Reunion with Riku & Kairi]
			WarpRoom = 0x09
			WriteInt(Save+0x357C,0x12020100)
		elseif Progress == 3 then --[Before Luxord, After Saix]
			WarpRoom = 0x0D
			WriteInt(Save+0x357C,0x12020100)
		elseif Progress == 4 then --[After Riku Joins the Party, Before Xemnas I]
			WarpRoom = 0x0D
		end
	elseif PostSave == 1 then --Alley to Between
		WarpRoom = 0x01
	elseif PostSave == 2 then --The Brink of Despair
		WarpRoom = 0x04
	elseif PostSave == 3 then --Twilight's View
		WarpRoom = 0x09
	elseif PostSave == 4 then --Proof of Existence
		WarpRoom = 0x0D
	elseif PostSave == 5 then --The Altar of Naught
		WarpRoom = 0x12
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x010),WarpRoom,OnPC)
end
--World Progress
if Place == 0x0412 and Events(Null,Null,0x02) then --The Path to the Castle
	WriteByte(Save+0x1EDF,1)
elseif Place == 0x1012 and Events(Null,Null,0x01) then --Riku!
	WriteByte(Save+0x1EDF,2)
elseif Place == 0x1012 and Events(Null,Null,0x02) then --Ansem's Wager
	WriteByte(Save+0x1EDF,3)
elseif Place == 0x1012 and Events(Null,Null,0x05) then --Back to His Old Self
	WriteByte(Save+0x1EDF,4)
elseif Place == 0x1212 and Events(Null,Null,0x03) then --The Door to Kingdom Hearts
	WriteByte(Save+0x1EDE,5) --Post-Story Save
elseif Place == 0x0001 and ReadInt(Save+0x000C) == 0x631212 then --END
	WriteInt(Save+0x000C,0x321A04) --Post-Game Save at Garden of Assemblage
end
--The World that Never Was Post-Story Save
if ReadByte(Save+0x1EDE) > 0 then
	if PrevPlace == 0x0112 and not Events(0x40,0x40,0x40) then --Alley to Between (except TT2)
		WriteByte(Save+0x1EDE,1)
	elseif PrevPlace == 0x0412 then --The Brink of Despair
		WriteByte(Save+0x1EDE,2)
	elseif PrevPlace == 0x0912 then --Twilight's View
		WriteByte(Save+0x1EDE,3)
	elseif PrevPlace == 0x0D12 then --Proof of Existence
		WriteByte(Save+0x1EDE,4)
	elseif PrevPlace == 0x1212 then --The Altar of Naught
		WriteByte(Save+0x1EDE,5)
	end
end

--Final Door Requirements
if ReadShort(Save+0x1B7C) == 0x04 and SeedCleared then
	WriteShort(Save+0x1B7C, 0x0D) --The Altar of Naught MAP (Door RC Available)
end
end

function LoD()
--Data Xigbar -> The Land of Dragons
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1D9E)
	local Progress = ReadByte(Save+0x1D9F)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --[1st Visit, Before Mountain Climb]
			WarpRoom = 0x00
		elseif Progress == 1 then --Before Village Cave Heartless
			WarpRoom = 0x04
		elseif Progress == 2 then --Before Summit Rapid Heartless
			WarpRoom = 0x0C
		elseif Progress == 3 then --[After Summit Heartless, Before Shan Yu]
			WarpRoom = 0x00
		elseif Progress == 4 then --Post 1st Visit
			WarpRoom = 0x0C
		elseif Progress == 5 then --[2nd Visit, Before Riku]
			WarpRoom = 0x0C
		elseif Progress == 6 then --[Before Imperial Square Heartless II, Before Antechamber Nobodies]
			WarpRoom = 0x00
		elseif Progress == 7 then --Before Storm Rider
			WarpRoom = 0x0B
		elseif Progress == 8 then --Post 2nd Visit
			WarpRoom = 0x04
		end
	elseif PostSave == 1 then --Bamboo Grove
		WarpRoom = 0x00
	elseif PostSave == 2 then --Village (Intact)
		WarpRoom = 0x04
	elseif PostSave == 3 then --Throne Room
		WarpRoom = 0x0B
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x030),WarpRoom,OnPC)
end
--World Progress
if Place == 0x0308 and Events(0x47,0x47,0x47) then --Mountain Climb
	WriteByte(Save+0x1D9F,1)
elseif Place == 0x0C08 and Events(Null,Null,0x01) then --Attack on the Camp
	WriteByte(Save+0x1D9F,2)
elseif Place == 0x0608 and Events(Null,Null,0x02) then --Shan Yu Lives
	WriteByte(Save+0x1D9F,3)
elseif Place == 0x0908 and Events(0x69,0x69,0x69)  then --The Hero Who Saved the Day
	WriteByte(Save+0x1D9F,4)
elseif ReadByte(Save+0x1D9F) == 4 and ReadShort(Save+0x0C5C) == 0x0A then --2nd Visit
	WriteByte(Save+0x1D9F,5)
elseif Place == 0x0608 and Events(Null,Null,0x0C) then --The City is in Trouble!
	WriteByte(Save+0x1D9F,6)
elseif Place == 0x0B08 and Events(Null,Null,0x0A) then --To the Emperor
	WriteByte(Save+0x1D9F,7)
elseif Place == 0x0B08 and Events(Null,Null,0x0B) then --The Ultimate Reward
	WriteByte(Save+0x1D9E,2) --Post-Story Save
elseif ReadByte(Save+0x1D9F) == 8 and ReadShort(Save+0x0C14) == 0x01 then --1st Visit
	WriteByte(Save+0x1D9F,0)
end
--The Land of Dragons Post-Story Save
if ReadByte(Save+0x1D9E) > 0 then
	if PrevPlace == 0x0008 then --Bamboo Grove
		WriteByte(Save+0x1D9E,1)
	elseif PrevPlace == 0x0408 then --Village (Intact)
		WriteByte(Save+0x1D9E,2)
	elseif PrevPlace == 0x0B08 then --Throne Room
		WriteByte(Save+0x1D9E,3)
	end
end
end

function BC()
--Data Xaldin -> Beast's Castle
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1D3E)
	local Progress = ReadByte(Save+0x1D3F)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x00
		elseif Progress == 1 then --[After Parlor Heartless, Before Meeting Belle]
			WarpRoom = 0x01
		elseif Progress == 2 then --After Meeting Belle
			WarpRoom = 0x02
		elseif Progress == 3 then --[Before the Wardrobe, After Thresholder]
			WarpRoom = 0x01
		elseif Progress == 4 then --[Before Talking to Cogsworth, Before Beast]
			WarpRoom = 0x0A
		elseif Progress == 5 then --[After Beast, After Talking to the Wardrobe]
			WarpRoom = 0x02
		elseif Progress == 6 then --Before Shadow Stalker
			WarpRoom = 0x01
		elseif Progress == 7 then --Post 1st Visit
			WarpRoom = 0x01
		elseif Progress == 8 then --2nd Visit
			WarpRoom = 0x02
		elseif Progress == 9 then --[Before Ballroom Nobodies, After Ballroom Nobodies]
			WarpRoom = 0x01
		elseif Progress == 10 then --Before Talking to Beast
			WarpRoom = 0x03
		elseif Progress == 11 then --[Before Entrance Hall Nobodies, Before Xaldin]
			WarpRoom = 0x01
		elseif Progress == 12 then --Post 2nd Visit
			WarpRoom = 0x01
		end
	elseif ReadByte(Save+0x1D3E) == 1 then --Parlor
		WarpRoom = 0x01
	elseif ReadByte(Save+0x1D3E) == 2 then --Belle's Room
		WarpRoom = 0x02
	elseif ReadByte(Save+0x1D3E) == 3 then --Dungeon
		WarpRoom = 0x0A
	elseif ReadByte(Save+0x1D3E) == 4 then --Beast's Room
		WarpRoom = 0x03
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x050),WarpRoom,OnPC)
end
--World Progress
if Place == 0x0105 and Events(Null,Null,0x01) then --The Parlor Ambush
	WriteByte(Save+0x1D3F,1)
elseif Place == 0x0205 and Events(Null,Null,0x02) then --A Familiar Voice
	WriteByte(Save+0x1D3F,2)
elseif Place == 0x0805 and Events(Null,Null,0x02) then --Belle's Worries
	WriteByte(Save+0x1D3F,3)
elseif Place == 0x0A05 and Events(Null,Null,0x01) then --The Castle's Residents
	WriteByte(Save+0x1D3F,4)
elseif Place == 0x0305 and Events(Null,Null,0x01) then --Organization XIII's Ploy
	WriteByte(Save+0x1D3F,5)
elseif Place == 0x0005 and Events(Null,Null,0x03) then --Damsel in Distress
	WriteByte(Save+0x1D3F,6)
elseif Place == 0x0E05 and Events(Null,Null,0x01) then --Things are Just Beginning
	WriteByte(Save+0x1D3F,7)
elseif ReadByte(Save+0x1D3F) == 7 and ReadShort(Save+0x07A0) == 0x0A then --2nd Visit
	WriteByte(Save+0x1D3F,8)
elseif Place == 0x0205 and Events(Null,Null,0x0A) then --Dressing Up
	WriteByte(Save+0x1D3F,9)
elseif Place == 0x0305 and Events(Null,Null,0x0A) then --The Missing Rose
	WriteByte(Save+0x1D3F,10)
elseif Place == 0x0305 and Events(Null,Null,0x14) then --Don't Give Up
	WriteByte(Save+0x1D3F,11)
elseif Place == 0x0605 and Events(Null,Null,0x0B) then --Stay With Me
	WriteByte(Save+0x1D3E,1) --Post-Story Save
elseif ReadByte(Save+0x1D3F) == 12 and ReadShort(Save+0x0794) == 0x01 then --1st Visit
	WriteByte(Save+0x1D3F,0)
end
--Beast's Castle Post-Story Save
if ReadByte(Save+0x1D3E) > 0 then
	if PrevPlace == 0x0105 then --Parlor
		WriteByte(Save+0x1D3E,1)
	elseif PrevPlace == 0x0205 then --Belle's Room
		WriteByte(Save+0x1D3E,2)
	elseif PrevPlace == 0x0A05 then --Dungeon
		WriteByte(Save+0x1D3E,3)
	elseif PrevPlace == 0x0305 then --Beast's Room
		WriteByte(Save+0x1D3E,4)
	end
end
end

function HT()
--Data Vexen -> Halloween Town
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1E5E)
	local Progress = ReadByte(Save+0x1E5F)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x04
		elseif Progress == 1 then --[Before Halloween Town Square Heartless, Before Entering Christmas Town]
			WarpRoom = 0x01
		elseif Progress == 2 then --[Before Candy Cane Lane Heartless, After Candy Cane Lane Heartless]
			WarpRoom = 0x05
		elseif Progress == 3 then --After Entering Santa's House
			WarpRoom = 0x08
		elseif Progress == 4 then --[After Leaving Santa's House, Before Prison Keeper]
			WarpRoom = 0x05
		elseif Progress == 5 then --After Prison Keeper
			WarpRoom = 0x01
		elseif Progress == 6 then --Before Oogie Boogie
			WarpRoom = 0x08
		elseif Progress == 7 then --Post 1st Visit
			WarpRoom = 0x05
		elseif Progress == 8 then --2nd Visit
			WarpRoom = 0x01
		elseif Progress == 9 then --Before Lock, Shock, Barrel
			WarpRoom = 0x08
		elseif Progress == 10 then --Before Halloween Town Square Presents
			WarpRoom = 0x05
		elseif Progress == 11 then --[Before Gift Wrapping, Before the Experiment]
			WarpRoom = 0x08
		elseif Progress == 12 then --Before Vexen
			WarpRoom = 0x05
		elseif Progress == 13 then --Post 2nd Visit
			WarpRoom = 0x05
		end
	elseif PostSave == 1 then --Dr. Finklestein's Lab
		WarpRoom = 0x01
	elseif PostSave == 2 then --Yuletide Hill
		WarpRoom = 0x05
	elseif PostSave == 3 then --Santa's House
		WarpRoom = 0x08
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x070),WarpRoom,OnPC)
end
--World Progress
if Place == 0x010E and Events(Null,Null,0x01) then --The Professor's Experiment
	WriteByte(Save+0x1E5F,1)
elseif Place == 0x050E and Events(Null,Null,0x01) then --Christmas Town
	WriteByte(Save+0x1E5F,2)
elseif Place == 0x080E and Events(Null,Null,0x01) then --Santa's Home
	WriteByte(Save+0x1E5F,3)
elseif Place == 0x060E and Events(Null,Null,0x03) then --Follow the Footprints
	WriteByte(Save+0x1E5F,4)
elseif Place == 0x040E and Events(0x3A,0x3A,0x3A) then --Maleficent and Oogie
	WriteByte(Save+0x1E5F,5)
elseif Place == 0x050E and Events(Null,Null,0x03) then --Where There's Smoke...
	WriteByte(Save+0x1E5F,6)
elseif Place == 0x060E and Events(Null,Null,0x05) then --Everyone Has a Job to Do
	WriteByte(Save+0x1E5F,7)
elseif ReadByte(Save+0x1E5F) == 7 and ReadShort(Save+0x151A) == 0x0A then --2nd Visit
	WriteByte(Save+0x1E5F,8)
elseif Place == 0x080E and Events(Null,Null,0x14) then --The Stolen Presents
	WriteByte(Save+0x1E5F,9)
elseif Place == 0x0A0E and Events(Null,Null,0x0A) then --The Three Culprits
	WriteByte(Save+0x1E5F,10)
elseif Place == 0x000E and Events(Null,Null,0x0A) then --Retrieving the Presents
	WriteByte(Save+0x1E5F,11)
elseif Place == 0x000E and Events(Null,Null,0x0B) then --Merry Christmas!
	WriteByte(Save+0x1E5F,12)
	WriteByte(Save+0x1E5E,2) --Post-Story Save
elseif Place == 0x2004 and Events(0x79,0x79,0x79) then --Vexen Defeated
elseif ReadByte(Save+0x1E5F) == 13 and ReadShort(Save+0x152C) == 0x01 then --1st Visit
	WriteByte(Save+0x1E5F,0)
end
--Halloween Town Post-Story Save
if ReadByte(Save+0x1E5E) > 0 then
	if PrevPlace == 0x010E then --Dr. Finklestein's Lab
		WriteByte(Save+0x1E5E,1)
	elseif PrevPlace == 0x050E then --Yuletide Hill
		WriteByte(Save+0x1E5E,2)
	elseif PrevPlace == 0x080E then --Santa's House
		WriteByte(Save+0x1E5E,3)
	end
end
end

function Ag()
--Data Lexaeus -> Agrabah
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1D7E)
	local Progress = ReadByte(Save+0x1D7F)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x00
		elseif Progress == 1 then --Before Meeting Jasmine & Aladdin
			WarpRoom = 0x02
		elseif Progress == 2 then --[Before Entering Cave of Wonders, Before Abu Escort]
			WarpRoom = 0x06
		elseif Progress == 3 then --Before Chasm of Challenges
			WarpRoom = 0x09
		elseif Progress == 4 then --[After Chasm of Challenges, Before Treasure Room Heartless]
			WarpRoom = 0x0D
		elseif Progress == 5 then --Before Volcanic Lord & Blizzard Lord
			WarpRoom = 0x02
		elseif Progress == 6 then --Post 1st Visit
			WarpRoom = 0x06
		elseif Progress == 7 then --2nd Visit
			WarpRoom = 0x04
		elseif Progress == 8 then --Start of 2nd Visit
			WarpRoom = 0x0F
		elseif Progress == 9 then --[Before Entering Sandswept Ruins, Sandswept Ruins Crystals]
			WarpRoom = 0x06
		elseif Progress == 10 then --Before Carpet Escape
			WarpRoom = 0x0B
		elseif Progress == 11 then --[Before Genie Jafar, Before Lexaeus]
			WarpRoom = 0x0F
		elseif Progress == 12 then --Post 2nd Visit
			WarpRoom = 0x06
		end
	elseif PostSave == 1 then --The Peddler's Shop (Rich)
		WarpRoom = 0x0F
	elseif PostSave == 2 then --Palace Walls
		WarpRoom = 0x06
	elseif PostSave == 3 then --The Cave of Wonders: Stone Guardians
		WarpRoom = 0x09
	elseif PostSave == 4 then --The Cave of Wonders: Chasm of Challenges
		WarpRoom = 0x0D
	elseif PostSave == 5 then --Ruined Chamber
		WarpRoom = 0x0B
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x090),WarpRoom,OnPC)
end
--World Progress
if Place == 0x0007 and Events(Null,Null,0x01) then --Turning Over a New Feather
	WriteByte(Save+0x1D7F,1)
elseif Place == 0x0007 and Events(Null,Null,0x03) then --Aladdin and Abu
	WriteByte(Save+0x1D7F,2)
elseif Place == 0x0907 and Events(Null,Null,0x03) then --A Path is Revealed
	WriteByte(Save+0x1D7F,3)
elseif Place == 0x0D07 and Events(Null,Null,0x02) then --Beyond the Doors
	WriteByte(Save+0x1D7F,4)
elseif Place == 0x0207 and Events(Null,Null,0x03) then --Behind the Curtain
	WriteByte(Save+0x1D7F,5)
elseif Place == 0x0307 and Events(Null,Null,0x03) then --See You Again
	WriteByte(Save+0x1D7F,6)
elseif ReadByte(Save+0x1D7F) == 6 and ReadByte(Save+0x0AAC) == 0x0A then --2nd Visit
	WriteByte(Save+0x1D7F,7)
elseif Place == 0x0407 and Events(Null,Null,0x0A) then --Jafar's Return
	WriteByte(Save+0x1D7F,8)
elseif Place == 0x0607 and Events(Null,Null,0x0A) then --Genie Works His Magic
	WriteByte(Save+0x1D7F,9)
elseif Place == 0x0B07 and Events(Null,Null,0x0A) then --Iago's Confession
	WriteByte(Save+0x1D7F,10)
elseif Place == 0x0607 and Events(Null,Null,0x0B) then --A Successful Escape
	WriteByte(Save+0x1D7F,11)
elseif Place == 0x0007 and Events(Null,Null,0x0A) then --Cosmic Razzle-Dazzle
	WriteByte(Save+0x1D7E,2) --Post-Story Save
elseif Place == 0x2104 and Events(0x7B,0x7B,0x7B) then --Lexaeus Defeated
elseif ReadByte(Save+0x1D7F) == 12 and ReadByte(Save+0x0A94) == 0x01 then --1st Visit
	WriteByte(Save+0x1D7F,0)
end
--Agrabah Post-Story Save
if ReadByte(Save+0x1D7E) > 0 then
	if PrevPlace == 0x0F07 then --The Peddler's Shop (Rich)
		WriteByte(Save+0x1D7E,1)
	elseif PrevPlace == 0x0607 then --Palace Walls
		WriteByte(Save+0x1D7E,2)
	elseif PrevPlace == 0x0907 then --The Cave of Wonders: Stone Guardians
		WriteByte(Save+0x1D7E,3)
	elseif PrevPlace == 0x0D07 then --The Cave of Wonders: Chasm of Challenges
		WriteByte(Save+0x1D7E,4)
	elseif PrevPlace == 0x0B07 then --Ruined Chamber
		WriteByte(Save+0x1D7E,5)
	end
end
end

function OC()
--Data Zexion -> Olympus Coliseum
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1D6E)
	local Progress = ReadByte(Save+0x1D6F)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x00
		elseif Progress == 1 then --[Before Helping Megara Up, Chasing after Demyx]
			WarpRoom = 0x03
		elseif Progress == 2 then --[Before Entering Valley of the Dead, Before Cerberus]
			WarpRoom = 0x0A
		elseif Progress == 3 then --[After Cerberus, Before Seeing Hercules]
			WarpRoom = 0x03
		elseif Progress == 4 then --[Before Seeing Phil, After Phil's Training]
			WarpRoom = 0x04
		elseif Progress == 5 then --[Before Hercules Fights Hydra, Before Demyx's Clones]
			WarpRoom = 0x03
		elseif Progress == 6 then --[After Demyx's Water Clones, Before Pete]
			WarpRoom = 0x0C
		elseif Progress == 7 then --Before Hydra
			WarpRoom = 0x03
		elseif Progress == 8 then --Post 1st Visit
			WarpRoom = 0x03
		elseif Progress == 9 then --[2nd Visit, Before Talking to Auron]
			WarpRoom = 0x03
		elseif Progress == 10 then --[After Talking to Auron, Before Hades' Chamber Nobodies]
			WarpRoom = 0x0A
		elseif Progress == 11 then --Before Hades
			WarpRoom = 0x03
		elseif Progress == 12 then --Before Zexion
			WarpRoom = 0x0A
		elseif Progress == 13 then --Post 2nd Visit
			WarpRoom = 0x03
		end
	elseif PostSave == 1 then --Underworld Entrance
		WarpRoom = 0x03
	elseif PostSave == 2 then --Cave of the Dead: Inner Chamber
		WarpRoom = 0x0A
	elseif PostSave == 3 then --The Lock
		WarpRoom = 0x0C
	elseif PostSave == 4 then --Coliseum Gates
		WarpRoom = 0x02
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x0B0),WarpRoom,OnPC)
end
--World Progress
if Place == 0x0306 and Events(Null,Null,0x02) then --Megara
	WriteByte(Save+0x1D6F,1)
elseif Place == 0x0A06 and Events(Null,Null,0x01) then --A Fleeing Member of the Organization
	WriteByte(Save+0x1D6F,2)
elseif Place == 0x0406 and Events(Null,Null,0x01) then --The Exhausted Hero
	WriteByte(Save+0x1D6F,3)
elseif Place == 0x0106 and Events(Null,Null,0x02) then --The Reunion
	WriteByte(Save+0x1D6F,4)
elseif Place == 0x0306 and Events(Null,Null,0x05) then --Arriving in the Underworld
	WriteByte(Save+0x1D6F,5)
elseif Place == 0x1106 and Events(0x7B,0x7B,0x7B) then --Regained Power
	WriteByte(Save+0x1D6F,6)
elseif Place == 0x0806 and Events(Null,Null,0x01) then --Persistent Ol' Pete
	WriteByte(Save+0x1D6F,7)
elseif Place == 0x1206 and Events(0xAB,0xAB,0xAB) then --The Aftermath
	WriteByte(Save+0x1D6F,8)
elseif ReadByte(Save+0x1D6F) == 8 and (ReadShort(Save+0x0926) == 0x0B or ReadShort(Save+0x0926) == 0x0C) then --2nd Visit
	WriteByte(Save+0x1D6F,9)
elseif Place == 0x0306 and Events(Null,Null,0x14) then --Sneaking into Hades' Chambers
	WriteByte(Save+0x1D6F,10)
elseif Place == 0x0606 and Events(Null,Null,0x0A) then --Voices from the Past
	WriteByte(Save+0x1D6F,11)
elseif Place == 0x0E06 and Events(Null,Null,0x0A) then --The Constellation of Heroes
	WriteByte(Save+0x1D6F,12)
	WriteByte(Save+0x1D6E,1) --Post-Story Save
elseif Place == 0x2204 and Events(0x7D,0x7D,0x7D) then --Zexion Defeated
elseif ReadByte(Save+0x1D6F) == 13 and ReadShort(Save+0x0914) == 0x01 then --1st Visit
	WriteByte(Save+0x1D6F,0)
end
--Olympus Coliseum Post-Story Save
if ReadByte(Save+0x1D6E) > 0 then
	if PrevPlace == 0x0306 then --Underworld Entrance
		WriteByte(Save+0x1D6E,1)
	elseif PrevPlace == 0x0A06 then --Cave of the Dead: Inner Chamber
		WriteByte(Save+0x1D6E,2)
	elseif PrevPlace == 0x0C06 then --The Lock
		WriteByte(Save+0x1D6E,3)
	elseif PrevPlace == 0x0206 then --Coliseum Gates
		WriteByte(Save+0x1D6E,4)
	end
end
--Enable Drive with Olympus Stone
if ReadByte(Save+0x3644) > 0 then
	if Place == 0x0306 then --Underworld Entrance
		WriteShort(BAR(ARD,0x0F,0x01C),0,OnPC) --BTL 0x16
	elseif Place == 0x0506 then --Valley of the Dead
		WriteShort(BAR(ARD,0x06,0x060),0,OnPC) --BTL 0x01
		WriteShort(BAR(ARD,0x06,0x08C),0,OnPC) --BTL 0x02
		WriteShort(BAR(ARD,0x06,0x10C),0,OnPC) --BTL 0x6F (Hades Escape)
	elseif Place == 0x0606 then --Hades' Chamber
		WriteShort(BAR(ARD,0x05,0x014),0,OnPC) --BTL 0x16
		WriteShort(BAR(ARD,0x05,0x064),0,OnPC) --BTL 0x70 (Invincible Hades)
	elseif Place == 0x0706 then --Cave of the Dead: Entrance
		WriteShort(BAR(ARD,0x07,0x0B0),0,OnPC) --BTL 0x01
		WriteShort(BAR(ARD,0x07,0x10C),0,OnPC) --BTL 0x02
		WriteShort(BAR(ARD,0x07,0x1A0),0,OnPC) --BTL 0x72 (Cerberus)
	elseif Place == 0x0A06 then --Cave of the Dead: Inner Chamber
		WriteShort(BAR(ARD,0x0A,0x010),0,OnPC) --BTL 0x16
	elseif Place == 0x0B06 then --Underworld Caverns: Entrance
		WriteShort(BAR(ARD,0x09,0x044),0,OnPC) --BTL 0x01
	elseif Place == 0x0F06 then --Cave of the Dead: Passage
		WriteShort(BAR(ARD,0x0B,0x0AC),0,OnPC) --BTL 0x01
		WriteShort(BAR(ARD,0x0B,0x0F4),0,OnPC) --BTL 0x02
	elseif Place == 0x1006 then --Underworld Caverns: The Lost Road
		WriteShort(BAR(ARD,0x09,0x040),0,OnPC) --BTL 0x01
	elseif Place == 0x1106 then --Underworld Caverns: Atrium
		WriteShort(BAR(ARD,0x08,0x034),0,OnPC) --BTL 0x16
		WriteShort(BAR(ARD,0x08,0x078),0,OnPC) --BTL 0x7B (Demyx's Water Clones)
	end
end
--Softlock Prevention Without Cups Unlocked
if Place == 0x0306 and ReadShort(Save+0x239C)&0x07BA == 0 then
	WriteShort(BAR(ARD,0x2E,0x05C),0x0E4,OnPC) --Before 2nd Visit Text
	WriteShort(BAR(ARD,0x2E,0x060),0x01F,OnPC) --Before 2nd Visit RC
	WriteShort(BAR(ARD,0x30,0x05C),0x32B,OnPC) --During 2nd Visit Text
	WriteShort(BAR(ARD,0x30,0x060),0x01F,OnPC) --During 2nd Visit RC
end
--Unlock All Cups with Hades Cups Trophy
if ReadByte(Save+0x3696) > 0 then
	BitOr(Save+0x239C,0x02) --Pain & Panic
	BitOr(Save+0x239D,0x02) --Cerberus
	BitOr(Save+0x239C,0x08) --Titan
	BitOr(Save+0x239C,0x10) --Goddess of Fate
	BitOr(Save+0x239C,0x20) --Pain & Panic Paradox
	BitOr(Save+0x239D,0x04) --Cerberus Paradox
	BitOr(Save+0x239C,0x80) --Titan Paradox
	BitOr(Save+0x239D,0x01) --Hades Paradox
	if ReadByte(Save+0x1D6E) > 0 then --Make Hades Appear in His Chamber after 2nd Visit
		WriteShort(Save+0x0936,0x15) --Hades' Chamber BTL
		WriteShort(Save+0x0938,0x14) --Hades' Chamber EVT
		BitOr(Save+0x1D5E,0x04) --HE_HADES_ON
	end
end
end

function PL()
--Data Saix -> Pride Lands
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1DDE)
	local Progress = ReadByte(Save+0x1DDF)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x10
		elseif Progress == 1 then --[Before Elephant Graveyard Heartless, After Elephant Graveyard Heartless]
			WarpRoom = 0x06
		elseif Progress == 2 then --After Entering Pride Rock
			WarpRoom = 0x01
		elseif Progress == 3 then --[After Leaving Pride Rock, After Learning Dash]
			WarpRoom = 0x06
		elseif Progress == 4 then --[After Entering Oasis, Before Talking to Simba]
			WarpRoom = 0x09
		elseif Progress == 5 then --After Talking to Simba
			WarpRoom = 0x06
		elseif Progress == 6 then --[Before Hyenas I, Before Scar]
			WarpRoom = 0x01
		elseif Progress == 7 then --Post 1st Visit
			WarpRoom = 0x01
		elseif Progress == 8 then --2nd Visit
			WarpRoom = 0x04
		elseif Progress == 9 then --[Before Meeting Up with Simba & Nala, Before Groundshaker]
			WarpRoom = 0x01
		elseif Progress == 10 then --Post 2nd Visit
			WarpRoom = 0x01
		end
	elseif PostSave == 1 then --Gorge
		WarpRoom = 0x06
	elseif PostSave == 2 then --Oasis
		WarpRoom = 0x09
	elseif PostSave == 3 then --Stone Hollow
		WarpRoom = 0x01
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x0D0),WarpRoom,OnPC)
end
--World Progress
if Place == 0x060A and Events(Null,Null,0x01) then --The Wild Kingdom
	WriteByte(Save+0x1DDF,1)
elseif Place == 0x000A and Events(Null,Null,0x01) then --Rafiki's Verdict
	WriteByte(Save+0x1DDF,2)
elseif Place == 0x040A and Events(Null,Null,0x01) then --His Majesty, Scar
	WriteByte(Save+0x1DDF,3)
elseif Place == 0x090A and Events(Null,Null,0x02) then --There's Simba!
	WriteByte(Save+0x1DDF,4)
elseif Place == 0x0C0A and Events(Null,Null,0x01) then --Simba's Strength
	WriteByte(Save+0x1DDF,5)
elseif Place == 0x000A and Events(Null,Null,0x04) then --The Truth Comes Out
	WriteByte(Save+0x1DDF,6)
elseif Place == 0x000A and Events(Null,Null,0x05) then --A New King
	WriteByte(Save+0x1DDF,7)
elseif ReadByte(Save+0x1DDF) == 7 and ReadShort(Save+0x0F2C) == 0x0A then --2nd Visit
	WriteByte(Save+0x1DDF,8)
elseif Place == 0x000A and Events(Null,Null,0x0A) then --Scar's Ghost
	WriteByte(Save+0x1DDF,9)
elseif Place == 0x000A and Events(Null,Null,0x0E) then --The Circle of Life
	WriteByte(Save+0x1DDE,3) --Post-Story Save
elseif ReadByte(Save+0x1DDF) == 10 and ReadShort(Save+0x0F74) == 0x01 then --1st Visit
	WriteByte(Save+0x1DDF,0)
end
--Pride Lands Post-Story Save
if ReadByte(Save+0x1DDE) > 0 then
	if PrevPlace == 0x060A then --Gorge
		WriteByte(Save+0x1DDE,1)
	elseif PrevPlace == 0x090A then --Oasis
		WriteByte(Save+0x1DDE,2)
	elseif PrevPlace == 0x010A then --Stone Hollow
		WriteByte(Save+0x1DDE,3)
	end
end
end

function TT()
--Data Axel -> Twilight Town
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1CFD)
	local Progress = ReadByte(Save+0x1D0D)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x75
		elseif Progress == 1 then --Before Station Plaza Nobodies
			WarpRoom = 0x02
		elseif Progress == 2 then --After Station Plaza Nobodies
			WarpRoom = 0x09
		elseif Progress == 3 then --[After The Tower Heartless, After Moon Chamber Heartless]
			WarpRoom = 0x1A
		elseif Progress == 4 then --Before Talking to Yen Sid
			WarpRoom = 0x1B
		elseif Progress == 5 then --After Talking to Yen Sid
			WarpRoom = 0x1B
		elseif Progress == 6 then --Post 1st Visit
			WarpRoom = 0x1A
		elseif Progress == 7 then --2nd Visit
			WriteShort(BAR(ARD,0x0A,GoAOffset+0x0EE),0x12,OnPC) --Start in TWtNW
			WarpRoom = 0x40
		elseif Progress == 8 then --Before Sandlot Nobodies II
			WarpRoom = 0x02
		elseif Progress == 9 then --After Sandlot Nobodies II
			WarpRoom = 0x02
		elseif Progress == 10 then --Post 2nd Visit
			WarpRoom = 0x1A
		elseif Progress == 11 then --3rd Visit
			WarpRoom = 0x77
		elseif Progress == 12 then --[Before The Old Mansion Nobodies, After The Old Mansion Nobodies]
			WarpRoom = 0x09
		elseif Progress == 13 then --After Entering the Mansion Foyer
			WarpRoom = 0x12
		elseif Progress == 14 then --[After Entering the Computer Room, Before Betwixt and Between Nobodies]
			WarpRoom = 0x15
		elseif Progress == 15 then --Post 3rd Visit
			WarpRoom = 0x02
		end
	elseif PostSave == 1 then --The Usual Spot
		WarpRoom = 0x02
	elseif PostSave == 2 then --Central Station
		WarpRoom = 0x09
	elseif PostSave == 3 then --Sunset Station
		WarpRoom = 0x0B
	elseif PostSave == 4 then --Mansion: The White Room
		WarpRoom = 0x12
	elseif PostSave == 5 then --Mansion: Computer Room
		WarpRoom = 0x15
	elseif PostSave == 6 then --Tower: Entryway
		WarpRoom = 0x1A
	elseif PostSave == 7 then --Tower: Sorcerer's Loft
		WarpRoom = 0x1B
	end
	if WarpRoom <= 50 then
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x0F0),WarpRoom,OnPC)
	else
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x0EC),0x02,OnPC)
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x0F4),WarpRoom,OnPC)
	end
end
--World Progress
if Place == 0x0202 and Events(Null,Null,0x01) then --A Message from Pence and Olette
	WriteByte(Save+0x1D0D,1)
elseif Place == 0x0902 and Events(Null,Null,0x03) then --Matching Pouches
	WriteByte(Save+0x1D0D,2)
elseif Place == 0x1902 and Events(Null,Null,0x01) then --My Name Is Pete
	WriteByte(Save+0x1D0D,3)
elseif Place == 0x1B02 and Events(Null,Null,0x01) then --Master Yen Sid
	WriteByte(Save+0x1D0D,4)
elseif Place == 0x1B02 and Events(Null,Null,0x03) then --The Journey Begins
	WriteByte(Save+0x1D0D,5)
elseif Place == 0x1C02 and Events(0x97,0x97,0x97) then --The Evil Fairy's Revival
	WriteByte(Save+0x1D0D,6)
elseif ReadByte(Save+0x1D0D) == 6 and ReadShort(Save+0x032C) == 0x01 then --2nd Visit
	WriteByte(Save+0x1D0D,7)
elseif Place == 0x0702 and Events(0x6B,0x6B,0x6B) then --A Frantic Vivi
	WriteByte(Save+0x1D0D,8)
elseif Place == 0x0402 and Events(Null,Null,0x01) then --Leave It to Us!
	WriteByte(Save+0x1D0D,9)
elseif Place == 0x0012 and Events(0x75,0x75,0x75) then --Saix's Report
	WriteByte(Save+0x1D0D,10)
elseif ReadByte(Save+0x1D0D) == 10 and ReadShort(Save+0x0368) == 0x05 then --3rd Visit
	WriteByte(Save+0x1D0D,11)
elseif Place == 0x0902 and Events(0x77,0x77,0x77) then --The Photograph
	WriteByte(Save+0x1D0D,12)
elseif Place == 0x0E02 and Events(Null,Null,0x08) then --Reuniting with the King
	WriteByte(Save+0x1D0D,13)
elseif Place == 0x1502 and Events(Null,Null,0x02) then --The Password Is...
	WriteByte(Save+0x1D0D,14)
elseif Place == 0x0012 and Events(0x77,0x77,0x77) then --Those Who Remain
	WriteByte(Save+0x1CFD,1) --Post-Story Save
elseif ReadByte(Save+0x1D0D) == 15 and ReadShort(Save+0x0368) == 0x12 then --1st Visit
	WriteByte(Save+0x1D0D,0)
end
--Twilight Town Post-Story Save
if ReadByte(Save+0x1CFD) > 0 and ReadByte(Save+0x1CFF) == 8 then
	if PrevPlace == 0x0202 then --The Usual Spot
		WriteByte(Save+0x1CFD,1)
	elseif PrevPlace == 0x0902 then --Central Station
		WriteByte(Save+0x1CFD,2)
	elseif PrevPlace == 0x0B02 then --Sunset Station
		WriteByte(Save+0x1CFD,3)
	elseif PrevPlace == 0x1202 then --Mansion: The White Room
		WriteByte(Save+0x1CFD,4)
	elseif PrevPlace == 0x1502 then --Mansion: Computer Room
		WriteByte(Save+0x1CFD,5)
	elseif PrevPlace == 0x1A02 then --Tower: Entryway
		WriteByte(Save+0x1CFD,6)
	elseif PrevPlace == 0x1B02 then --Tower: Sorcerer's Loft
		WriteByte(Save+0x1CFD,7)
	end
end
--Spawn IDs
if ReadByte(Save+0x1CFF) == 8 and Place == 0x1A04 then
	WriteByte(Save+0x1CFF,0)
elseif ReadShort(TxtBox) == 0x768 and PrevPlace == 0x1A04 and ReadByte(Save+0x1CFF) == 0 and (World == 0x02 or Place == 0x0112) then --Load Spawn ID upon Entering TT
	WriteInt(Save+0x353C,0x12020100) --Full Party
	WriteByte(Save+0x1CFF,8) --TT Flag
	WriteArray(Save+0x0310,ReadArray(Save+0x01A0,144)) --Load Spawn ID
	WriteArray(Save+0x03E8,ReadArray(Save+0x0310,6))   --The Empty Realm -> Tunnelway
	if Evt <= 50 then --Not a Special Event
		WriteArray(Now+0x4,ReadArray(Save+0x310+Room*6,6)) --Load the Proper Spawn ID
	end
	local PostSave = ReadByte(Save+0x1CFD)
	local Progress = ReadByte(Save+0x1D0D)
	local Visit --Battle Level & Blocks
	RemoveTTBlocks()
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			Visit = 7
		elseif Progress == 1 then --Before Station Plaza Nobodies
			Visit = 7
			WriteShort(Save+0x20E4,0xCB74) --Underground Concourse Block
			WriteShort(Save+0x2120,0xC54A) --Mansion Foyer Block
		elseif Progress == 2 then --After Station Plaza Nobodies
			Visit = 7
			WriteShort(Save+0x207C,0xCA3F) --Sunset Station Block
			WriteShort(Save+0x20E4,0xCB74) --Underground Concourse Block
			WriteShort(Save+0x20F4,0xCC6A) --The Tower Block
			WriteShort(Save+0x2120,0xC54A) --Mansion Foyer Block
		elseif Progress == 3 then --[After The Tower Heartless, After Moon Chamber Heartless]
			Visit = 8
			WriteShort(Save+0x20F4,0xC54E) --The Tower Block
		elseif Progress == 4 then --Before Talking to Yen Sid
			Visit = 8
			WriteShort(Save+0x20F4,0xC54E) --The Tower Block
			WriteShort(Save+0x20F8,0x9F4E) --Tower: Wardrobe Block
		elseif Progress == 5 then --After Talking to Yen Sid
			Visit = 8
			WriteShort(Save+0x20F4,0xC54E) --The Tower Block
		elseif Progress == 6 then --Post 1st Visit
			Visit = 8
			WriteShort(Save+0x207C,0xCA3F) --Sunset Station Block
			WriteShort(Save+0x20E4,0xCB74) --Underground Concourse Block
			WriteShort(Save+0x2120,0xC54A) --Mansion Foyer Block
		elseif Progress == 7 then --2nd Visit
			Visit = 9
		elseif Progress == 8 then --Before Sandlot Nobodies II
			Visit = 9
			WriteShort(Save+0x2080,0xC663) --Central Station Block
			WriteShort(Save+0x20E4,0xC66D) --Underground Concourse Block
			WriteShort(Save+0x2120,0xC665) --Mansion Foyer Block
		elseif Progress == 9 then --After Sandlot Nobodies II
			Visit = 9
			WriteShort(Save+0x20E4,0xC66F) --Underground Concourse Block
			WriteShort(Save+0x2120,0xC667) --Mansion Foyer Block
		elseif Progress == 10 then --Post 2nd Visit
			Visit = 9
			WriteShort(Save+0x20E4,0xCB74) --Underground Concourse Block
			WriteShort(Save+0x2120,0xC54A) --Mansion Foyer Block
		elseif Progress == 11 then --3rd Visit
			Visit = 10
		elseif Progress == 12 or Progress == 13 or Progress == 14 then --[Before The Old Mansion Nobodies, Before Betwixt and Between Nobodies]
			Visit = 10
			WriteShort(Save+0x20EC,0xCB76) --Sandlot Block
		elseif Progress == 15 then --Post 3rd Visit
			Visit = 10
		end
	else
		Visit = 10
	end
	WriteByte(Save+0x3FF5,Visit)
	WriteByte(Save+0x23EE,1) --TT Music: The Afternoon Streets & Working Together
elseif ReadByte(Save+0x1CFF) == 8 then --Save Spawn ID within TT
	WriteArray(Save+0x0310,ReadArray(Save+0x03E8,6))   --Tunnelway -> The Empty Realm
	WriteArray(Save+0x01A0,ReadArray(Save+0x0310,144)) --Save Spawn ID
end
--Save Points -> World Points (1st Visit)
if ReadByte(Save+0x1CFF) == 8 and ReadByte(Save+0x3640) > 0 then --Trigger with Poster for now
	if Place == 0x0202 then --The Usual Spot
		WriteShort(BAR(ARD,0x06,0x034),0x239,OnPC)
	elseif Place == 0x0902 then --Central Station
		WriteShort(BAR(ARD,0x11,0x034),0x239,OnPC)
	elseif Place == 0x1A02 then --Tower: Entryway
		WriteShort(BAR(ARD,0x07,0x034),0x239,OnPC)
	elseif Place == 0x1B02 then --Tower: Sorcerer's Loft
		WriteShort(BAR(ARD,0x09,0x034),0x239,OnPC)
	end
end
end

function HB()
--Save Merlin's House's & Borough's Spawn IDs
if Place == 0x1A04 then
	WriteArray(Save+0x066A,ReadArray(Save+0x0646,6)) --Save Borough Spawn ID
	WriteArray(Save+0x0664,ReadArray(Save+0x065E,6)) --Save Merlin's House Spawn ID
end
--Data Demyx -> Hollow Bastion
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1D2E)
	local Progress = ReadByte(Save+0x1D2F)
	local WarpRoom, Visit
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x00
			Visit = 1
		elseif Progress == 1 then --Before Bailey Nobodies
			WarpRoom = 0x0D
			Visit = 1
		elseif Progress == 2 then --Post 1st Visit
			WarpRoom = 0x0D
			Visit = 1
		elseif Progress == 3 then --4th Visit
			WarpRoom = 0x0A
			Visit = 4
		elseif Progress == 4 then --[Before Meeting YRP, After Meeting YRP]
			WarpRoom = 0x0D
			Visit = 4
		elseif Progress == 5 then --[After Entering Postern, Before Entering Ansem's Study]
			WarpRoom = 0x06
			Visit = 4
		elseif Progress == 6 then --[After Talking to Leon, Before Corridors Fight]
			WarpRoom = 0x05
			Visit = 4
		elseif Progress == 7 then --[Before Restoration Site Nobodies, Before Demyx]
			WarpRoom = 0x06
			Visit = 4
		elseif Progress == 8 then --After Demyx
			WarpRoom = 0x06
			Visit = 4
		elseif Progress == 9 then --Before 1000 Heartless
			WarpRoom = 0x03
			Visit = 4
		elseif Progress == 10 then --Post 4th Visit
			WarpRoom = 0x06
			Visit = 4
		elseif Progress == 11 then --5th Visit
			WarpRoom = 0x0A
			Visit = 5
		elseif Progress == 12 then --After Borough Heartless III
			WarpRoom = 0x06
			Visit = 5
		elseif Progress == 13 then --Post 5th Visit
			WarpRoom = 0x03
			Visit = 5
		end
	elseif PostSave == 1 then --Merlin's House
		WarpRoom = 0x0D
		Visit = 5
	elseif PostSave == 2 then --Postern
		WarpRoom = 0x06
		Visit = 5
	elseif PostSave == 3 then --Ansem's Study
		WarpRoom = 0x05
		Visit = 5
	elseif PostSave == 4 then --Crystal Fissure
		WarpRoom = 0x03
		Visit = 5
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x110),WarpRoom,OnPC)
	WriteByte(Save+0x3FFD,Visit)
end
--World Progress
if Place == 0x0D04 and Events(Null,Null,0x01) then --The Hollow Bastion Restoration Committee
	WriteByte(Save+0x1D2F,1)
elseif Place == 0x0012 and Events(0x74,0x74,0x74) then --The Keyblade's Hero
	WriteByte(Save+0x1D2F,2)
elseif ReadByte(Save+0x1D2F) == 2 and ReadShort(Save+0x0650) == 0x02 then --4th Visit
	WriteByte(Save+0x1D2F,3)
elseif Place == 0x0D04 and Events(Null,Null,0x02) then --Cid's Report
	WriteByte(Save+0x1D2F,4)
elseif Place == 0x0604 and Events(Null,Null,0x01) then --The Underground Corridor
	WriteByte(Save+0x1D2F,5)
elseif Place == 0x0504 and Events(Null,Null,0x03) then --Transportation Device
	WriteByte(Save+0x1D2F,6)
elseif Place == 0x0604 and Events(Null,Null,0x02) then --Sephiroth
	WriteByte(Save+0x1D2F,7)
elseif Place == 0x0404 and Events(Null,Null,0x01) then --Demyx
	WriteByte(Save+0x1D2F,8)
elseif Place == 0x0304 and Events(Null,Null,0x01) then --Goofy's Awake!
	WriteByte(Save+0x1D2F,9)
elseif Place == 0x0104 and Events(0x5C,0x5C,0x5C) then --A Box of Memories
	WriteByte(Save+0x1D2F,10)
elseif ReadByte(Save+0x1D2F) == 10 then --5th Visit
	if ReadShort(Save+0x0650) == 0x0A then
		WriteByte(Save+0x1D2F,11)
	elseif ReadShort(Save+0x061A) == 0x16 then --Skipped
		WriteByte(Save+0x1D2F,13)
		WriteByte(Save+0x1D2E,2) --Post-Story Save
	end
elseif Place == 0x0904 and Events(Null,Null,0x0B) then --The Rogue Security System
	WriteByte(Save+0x1D2F,12)
elseif Place == 0x0604 and Events(0x5E,0x5E,0x5E) then --Radiant Garden
	WriteByte(Save+0x1D2F,13)
	WriteByte(Save+0x1D2E,2) --Post-Story Save
elseif Place == 0x0104 and Events(Null,Null,0x13) then --The Battle
elseif Place == 0x1904 and Events(Null,0x05,0x04) then --Transport to Remembrance Cleared
end
--Hollow Bastion Post-Story Save
if ReadByte(Save+0x1D2E) > 0 then
	if PrevPlace == 0x0D04 then --Merlin's House
		if ReadByte(Save+0x3FFD) == 2 then --100AW
		elseif Events(Null,Null,0x03) then --DC
		else
			WriteByte(Save+0x1D2E,1)
		end
	elseif PrevPlace == 0x0604 then --Postern
		WriteByte(Save+0x1D2E,2)
	elseif PrevPlace == 0x0504 then --Ansem's Study
		WriteByte(Save+0x1D2E,3)
	elseif PrevPlace == 0x0304 then --Crystal Fissure
		WriteByte(Save+0x1D2E,4)
	end
end
--Heartless Manufactory Early Access with Unknown Disk/DUMMY 15
if ReadByte(Save+0x365F) > 0 then
	BitOr(Save+0x1CF1,0x02)
	if ReadShort(Save+0x062E) == 0x08 then
		WriteShort(Save+0x062E,0x0E) --Ansem's Study MAP
		WriteShort(Save+0x20D4,0) --Heartless Manufactory Unblock
	elseif ReadShort(Save+0x062E) == 0x0D then
		WriteShort(Save+0x062E,0x10) --Ansem's Study MAP
		WriteShort(Save+0x20D4,0) --Heartless Manufactory Unblock
	elseif ReadShort(Save+0x062E) == 0x0F then
		WriteShort(Save+0x062E,0x11) --Ansem's Study MAP
		WriteShort(Save+0x20D4,0) --Heartless Manufactory Unblock
	end
elseif ReadByte(Save+0x1CF1)&0x02 == 0x02 then --Unknown Disk taken by Moogle
	WriteByte(Save+0x365F,1) --Add it back to inventory
end
--[[Skip Hollow Bastion 5th Visit
if ReadShort(Save+0x0650) == 0x0A then
	WriteByte(Save+0x1D2E,2) --Post-Story Save
	WriteShort(Save+0x0618,0x00) --The Dark Depths BTL
	WriteShort(Save+0x061A,0x16) --The Dark Depths EVT
	WriteShort(Save+0x061E,0x02) --The Great Maw BTL
	WriteShort(Save+0x0620,0x03) --The Great Maw EVT
	WriteShort(Save+0x062A,0x01) --Castle Gate BTL
	WriteShort(Save+0x062E,0x0E) --Ansem's Study MAP (Heartless Manufactory Door Opened)
	WriteShort(Save+0x0648,0x0B) --Borough BTL
	WriteShort(Save+0x0650,0x06) --Marketplace EVT
	WriteShort(Save+0x0654,0x0B) --Corridors BTL
	WriteShort(Save+0x065C,0x16) --Heartless Manufactory EVT
	WriteShort(Save+0x0662,0x10) --Merlin's House EVT
	WriteShort(Save+0x0672,0x0B) --Ravine Trail BTL
	WriteShort(Save+0x067C,0x0D) --Restoration Site (Destroyed) MAP (Data Door)
	WriteShort(Save+0x067E,0x0B) --Restoration Site (Destroyed) BTL
	WriteShort(Save+0x0684,0x0B) --Bailey (Destroyed) BTL
	WriteShort(Save+0x20D4,0) --Heartless Manufactory Unblock
	BitOr(Save+0x1D19,0x10) --HB_508_END
	BitOr(Save+0x1D1C,0x10) --HB_509_END
	BitOr(Save+0x1D1C,0x20) --HB_hb09_ms501
	BitOr(Save+0x1D1C,0x40) --HB_511_END
	BitOr(Save+0x1D22,0x20) --HB_hb_event_512
	BitOr(Save+0x1D1D,0x01) --HB_513_END
	BitOr(Save+0x1D1D,0x02) --HB_514_END
	BitOr(Save+0x1D22,0x40) --HB_hb_event_515
	BitOr(Save+0x1D1D,0x08) --HB_516_END
	BitOr(Save+0x1D1D,0x10) --HB_517_END
	BitOr(Save+0x1D1D,0x20) --HB_518_END
	BitOr(Save+0x1D1D,0x40) --HB_519_END
	BitOr(Save+0x1D19,0x20) --HB_TR_202_END
	BitOr(Save+0x1D19,0x40) --HB_501_END
	BitOr(Save+0x1D21,0x04) --HB_hb_event_502
	BitOr(Save+0x1D1A,0x04) --HB_503_END
	BitOr(Save+0x1D1A,0x08) --HB_TR_tr09_ms205
	BitOr(Save+0x1D1A,0x10) --HB_504_END
	BitOr(Save+0x1D1A,0x20) --HB_505_END
	BitOr(Save+0x1D1A,0x40) --HB_506_END
	BitOr(Save+0x1D21,0x08) --HB_hb_event_507 (Hollow Bastion -> Radiant Garden)
	BitOr(Save+0x1D24,0x02) --HB_ROXAS_KINOKO_ON
end--]]
--Unlock Mushroom XIII
if Place == 0x0204 and Events(Null,0x02,0x03) and ReadByte(Save+0x36B4) > 0 then
	WriteShort(Save+0x3E94,3) --Mushroom I
	WriteShort(Save+0x3E98,70)
	WriteShort(Save+0x3E9C,3) --Mushroom II
	WriteShort(Save+0x3EA0,80)
	WriteShort(Save+0x3EA4,3) --Mushroom III
	WriteShort(Save+0x3EA8,450)
	WriteShort(Save+0x3EAC,3) --Mushroom IV
	WriteShort(Save+0x3EB0,85)
	WriteShort(Save+0x3EB4,4) --Mushroom V
	WriteShort(Save+0x3EB8,600)
	WriteShort(Save+0x3EBC,4) --Mushroom VI
	WriteShort(Save+0x3EC0,2700)
	WriteShort(Save+0x3EC4,4) --Mushroom VII
	WriteShort(Save+0x3EC8,600)
	WriteShort(Save+0x3ECC,3) --Mushroom VIII
	WriteShort(Save+0x3ED0,85)
	WriteShort(Save+0x3ED4,3) --Mushroom IX
	WriteShort(Save+0x3ED8,75)
	WriteShort(Save+0x3EDC,4) --Mushroom X
	WriteShort(Save+0x3EE0,3300)
	WriteShort(Save+0x3EE4,4) --Mushroom XI
	WriteShort(Save+0x3EE8,1140)
	WriteShort(Save+0x3EEC,3) --Mushroom XII
	WriteShort(Save+0x3EF0,40)
end
end

function PR()
--Data Luxord -> Port Royal
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1E9E)
	local Progress = ReadByte(Save+0x1E9F)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --[1st Visit, Before Talking to Will]
			WarpRoom = 0x00
		elseif Progress == 1 then --After Talking to Will
			WarpRoom = 0x04
		elseif Progress == 2 then --Before Cave Mouth Pirates
			WarpRoom = 0x08
		elseif Progress == 3 then --[Before The Interceptor Pirates, Before The Interceptor Barrels]
			WarpRoom = 0x04
		elseif Progress == 4 then --Before Barbossa
			WarpRoom = 0x08
		elseif Progress == 5 then --Post 1st Visit
			WarpRoom = 0x06
		elseif Progress == 6 then --2nd Visit
			WarpRoom = 0x0A
		elseif Progress == 7 then --Before Harbor Pirates II
			WarpRoom = 0x00
		elseif Progress == 8 then --[After Harbor Pirates II, Before Grim Reaper I]
			WarpRoom = 0x06
		elseif Progress == 9 then --After Grim Reaper I
			WarpRoom = 0x0B
		elseif Progress == 10 then --[Medallion Collection, Before Grim Reaper II]
			WarpRoom = 0x06
		elseif Progress == 11 then --Post 2nd Visit
			WarpRoom = 0x06
		end
	elseif PostSave == 1 then --Rampart
		WarpRoom = 0x00
	elseif PostSave == 2 then --The Black Pearl: Captain's Stateroom
		WarpRoom = 0x06
	elseif PostSave == 3 then --Isla De Muerta: Rock Face
		WarpRoom = 0x10
	elseif PostSave == 4 then --Ship Graveyard: The Interceptor's Hold
		WarpRoom = 0x0B
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x130),WarpRoom,OnPC)
end
--World Progress
if Place == 0x1710 and Events(0x4F,0x4F,0x4F) then --The Cursed Medallion
	WriteByte(Save+0x1E9F,1)
elseif Place == 0x1110 and Events(0x3D,0x3D,0x3D) then --The Blood Will Be Repaid
	WriteByte(Save+0x1E9F,2)
elseif Place == 0x1110 and Events(Null,Null,0x01) then --On the Island
	WriteByte(Save+0x1E9F,3)
elseif Place == 0x0310 and Events(0x38,0x38,0x38) then --To Isla de Muerta
	WriteByte(Save+0x1E9F,4)
elseif Place == 0x0810 and Events(Null,Null,0x04) then --Parting Ways
	WriteByte(Save+0x1E9F,5)
elseif ReadByte(Save+0x1E9F) == 5 and ReadShort(Save+0x1850) == 0x0A then --2nd Visit
	WriteByte(Save+0x1E9F,6)
elseif Place == 0x0A10 and Events(Null,Null,0x0A) then --A Looming Shadow
	WriteByte(Save+0x1E9F,7)
elseif Place == 0x0110 and Events(Null,Null,0x0A) then --The Jack Sparrow Way
	WriteByte(Save+0x1E9F,8)
elseif Place == 0x0B10 and Events(Null,Null,0x0A) then --The Ship Graveyard
	WriteByte(Save+0x1E9F,9)
elseif Place == 0x0E10 and Events(Null,Null,0x0A) then --Retrieve the Medallion!
	WriteByte(Save+0x1E9F,10)
elseif Place == 0x0510 and Events(Null,Null,0x0E) then --Into the Ocean
	WriteByte(Save+0x1E9E,2) --Post-Story Save
elseif ReadByte(Save+0x1E9F) == 11 and ReadShort(Save+0x1814) == 0x01 then --1st Visit
	WriteByte(Save+0x1E9F,0)
end
--Port Royal Post-Story Save
if ReadByte(Save+0x1E9E) > 0 then
	if PrevPlace == 0x0010 then --Rampart
		WriteByte(Save+0x1E9E,1)
	elseif PrevPlace == 0x0610 then --The Black Pearl: Captain's Stateroom
		WriteByte(Save+0x1E9E,2)
	elseif PrevPlace == 0x1010 then --Isla De Muerta: Rock Face
		WriteByte(Save+0x1E9E,3)
	elseif PrevPlace == 0x0B10 then --Ship Graveyard: The Interceptor's Hold
		WriteByte(Save+0x1E9E,4)
	end
end
--The Interceptor Pirates End Screen
if Place == 0x0710 and ReadInt(CutLen) == 0x000F and ReadByte(BtlEnd) == 0x04 then
	WriteByte(BtlEnd,0x03) --Delay Fade-Out after Winning Fight
end
end

function DC()
--Data Marluxia -> Disney Castle
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1E1E)
	local Progress = ReadByte(Save+0x1E1F)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x35
		elseif Progress == 1 then --Before Entering Courtyard
			WarpRoom = 0x06
		elseif Progress == 2 then --[After Entering Courtyard, Before Minnie Escort]
			WarpRoom = 0x01
		elseif Progress == 3 then --[Before Entering Timeless River, After Entering Timeless River]
			WarpRoom = 0x04
		end
	elseif PostSave == 1 then --Gummi Hangar
		WarpRoom = 0x06
	elseif PostSave == 2 then --Library
		WarpRoom = 0x01
	elseif PostSave == 3 then --Hall of the Cornerstone (Light)
		WarpRoom = 0x05
	end
	if WarpRoom <= 50 then
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x150),WarpRoom,OnPC)
	else
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x14C),0x02,OnPC)
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x154),WarpRoom,OnPC)
	end
end
--World Progress
if Place == 0x060C and Events(Null,Null,0x01) then --There's Something Strange Going On
	WriteByte(Save+0x1E1F,1)
elseif Place == 0x030C and Events(Null,Null,0x01) then --Welcome to Disney Castle
	WriteByte(Save+0x1E1F,2)
elseif Place == 0x040C and Events(Null,Null,0x01) then --The Cornerstone of Light
	WriteByte(Save+0x1E1F,3)
elseif Place == 0x040C and Events(Null,Null,0x02) then --The Strange Door
	WriteArray(Save+0x065E,ReadArray(Save+0x0664,6)) --Load Merlin's House Spawn ID
elseif Place == 0x000D and Events(Null,Null,0x07) then --Back to Their Own World
elseif Place == 0x050C and Events(Null,Null,0x01) then --The Castle is Secure
	WriteByte(Save+0x1E1E,3) --Post-Story Save
elseif Place == 0x2604 and Events(0x7F,0x7F,0x7F) then --Marluxia Defeated
elseif ReadByte(Save+0x36B2) > 0 and ReadByte(Save+0x1E1E) > 0 and ReadShort(Save+0x1232) == 0x00 then --Proof of Connection, DC Cleared, Terra Locked
	WriteShort(Save+0x121A,0x11) --Library EVT
	WriteShort(Save+0x1232,0x02) --Hall of the Cornerstone (Light) EVT
	WriteShort(Save+0x1238,0x12) --Gummi Hangar EVT
	BitOr(Save+0x1CB1,0x02) --ES_FM_URA_MOVIE (BBS Movie 1) (Show Prompt in TWtNW)
	BitOr(Save+0x1E13,0x80) --DC_FM_NAZO_ON
end
--Disney Castle Post-Story Save
if ReadByte(Save+0x1E1E) > 0 then
	if PrevPlace == 0x060C then --Gummi Hangar
		WriteByte(Save+0x1E1E,1)
	elseif PrevPlace == 0x010C then --Library
		WriteByte(Save+0x1E1E,2)
	elseif PrevPlace == 0x050C then --Hall of the Cornerstone (Light)
		WriteByte(Save+0x1E1E,3)
	end
end
--Restore Royal Summons Taken by Moogles
if ReadByte(Save+0x365D) > ReadByte(Save+0x1CF7) then --Obtained new copies
	WriteByte(Save+0x1CF7, ReadByte(Save+0x365D)) --Store amount
elseif ReadByte(Save+0x365D) < ReadByte(Save+0x1CF7) then --Taken in synth shop
	WriteByte(Save+0x365D, ReadByte(Save+0x1CF7)) --Restore amount
end
end

function SP()
--Data Larxene -> Space Paranoids
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1EBE)
	local Progress = ReadByte(Save+0x1EBF)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x01
		elseif Progress == 1 then --[Before Dataspace Monitors, After Dataspace Monitors]
			WarpRoom = 0x00
		elseif Progress == 2 then --Before Hostile Program
			WarpRoom = 0x05
		elseif Progress == 3 then --Post 1st Visit
			WarpRoom = 0x00
		elseif Progress == 4 then --2nd Visit
			WarpRoom = 0x01
		elseif Progress == 5 then --[Before Game Grid Heartless, Before Hallway Heartless]
			WarpRoom = 0x00
		elseif Progress == 6 then --Before Solar Sailer Heartless
			WarpRoom = 0x05
		elseif Progress == 7 then --[Before Sark & MCP, Before Larxene]
			WarpRoom = 0x08
		elseif Progress == 8 then --Post 2nd Visit
			WarpRoom = 0x08
		end
	elseif PostSave == 1 then --Pit Cell
		WarpRoom = 0x00
	elseif PostSave == 2 then --I/O Tower: Communications Room
		WarpRoom = 0x05
	elseif PostSave == 3 then --Central Computer Mesa
		WarpRoom = 0x08
	end
	WriteShort(BAR(ARD,0x0A,GoAOffset+0x170),WarpRoom,OnPC)
end
--World Progress
if Place == 0x0011 and Events(Null,Null,0x01) then --Tron
	WriteByte(Save+0x1EBF,1)
elseif Place == 0x0511 and Events(0x02,0x00,0x16) then --Facing Danger
	WriteByte(Save+0x1EBF,2)
elseif Place == 0x0511 and Events(Null,Null,0x04) then --To Hollow Bastion
	WriteByte(Save+0x1EBF,3)
elseif ReadByte(Save+0x1EBF) == 3 and ReadShort(Save+0x199A) == 0x0A then --2nd Visit
	WriteByte(Save+0x1EBF,4)
elseif Place == 0x0011 and Events(Null,Null,0x0A) then --To the Game Grid
	WriteByte(Save+0x1EBF,5)
elseif Place == 0x0511 and Events(Null,Null,0x0A) then --Package Retrieved
	WriteByte(Save+0x1EBF,6)
elseif Place == 0x0811 and Events(Null,Null,0x0A) then --The System's Core
	WriteByte(Save+0x1EBF,7)
elseif Place == 0x0911 and Events(0x3B,0x3B,0x3B) then --Destroying the MCP
	WriteByte(Save+0x1EBE,2) --Post-Story Save
elseif Place == 0x2104 and Events(0x81,0x81,0x81) then --Larxene Defeated
elseif ReadByte(Save+0x1EBF) == 8 and ReadShort(Save+0x199A) == 0x01 then --1st Visit
	WriteByte(Save+0x1EBF,0)
end
--Space Paranoids Post-Story Save
if ReadByte(Save+0x1EBE) > 0 then
	if PrevPlace == 0x0011 then --Pit Cell
		WriteByte(Save+0x1EBE,1)
	elseif PrevPlace == 0x0511 then --I/O Tower: Communications Room
		WriteByte(Save+0x1EBE,2)
	elseif PrevPlace == 0x0811 then --Central Computer Mesa
		WriteByte(Save+0x1EBE,3)
	end
end
--[[Skip Light Cycle
if ReadShort(Save+0x1994) == 0x04 then
	WriteShort(Save+0x1990,0x03) --Pit Cell MAP (Despawn Party Members)
	WriteShort(Save+0x1994,0x16) --Pit Cell EVT
	WriteShort(Save+0x1998,0x01) --Canyon BTL
	WriteShort(Save+0x19A2,0x02) --Dataspace MAP (Access Computer RC)
	WriteShort(Save+0x19A6,0x01) --Dataspace EVT
	WriteShort(Save+0x2128,0) --Dataspace Unblock
	BitOr(Save+0x1EB0,0x80) --TR_107_END
	BitOr(Save+0x1EB4,0x10) --TR_hb_304_END
	BitOr(Save+0x1EB1,0x02) --TR_108_END
	BitOr(Save+0x1EB1,0x04) --TR_109_END
	BitOr(Save+0x1EB5,0x08) --TR_tr02_ms102a
	BitOr(Save+0x1EB5,0x10) --TR_tr02_ms102b
	BitOr(Save+0x1EB1,0x10) --TR_110_END
end--]]
end

function STT()
--Data Roxas -> Simulated Twilight Town
if Place == 0x1A04 then
	local PostSave = ReadByte(Save+0x1CFE)
	local Progress = ReadByte(Save+0x1D0E)
	local WarpRoom
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			WarpRoom = 0x34
		elseif Progress == 1 then --Before Munny Collection
			WarpRoom = 0x02
		elseif Progress == 2 then --Munny Collection
			WarpRoom = 0x02
		elseif Progress == 3 then --Before Sandlot Dusk
			WarpRoom = 0x02
		elseif Progress == 4 then --Before Twilight Thorn
			WarpRoom = 0x20
		elseif Progress == 5 then --[Start of Day 4, Before Setzer]
			WarpRoom = 0x05
		elseif Progress == 6 then --Start of Day 5
			WarpRoom = 0x02
		elseif Progress == 7 then --Before Vivi's Wonder
			WarpRoom = 0x0B
		elseif Progress == 8 then --[After Vivi's Wonder, After Seven Wonders]
			WarpRoom = 0x0B
		elseif Progress == 9 then --Before Namine's Wonder
			WarpRoom = 0x02
		elseif Progress == 10 then --[Before Back Street Nobodies, Before Entering the Mansion]
			WarpRoom = 0x02
		elseif Progress == 11 then --[Before Entering the Library, Before Entering Computer Room]
			WarpRoom = 0x12
		elseif Progress == 12 then --Before Axel II
			WarpRoom = 0x15
		elseif Progress == 13 then --After Axel II
			WarpRoom = 0x15
		end
	elseif PostSave == 1 then --The Usual Spot
		WarpRoom = 0x02
	elseif PostSave == 2 then --Central Station
		WarpRoom = 0x09
	elseif PostSave == 3 then --Sunset Station
		WarpRoom = 0x0B
	elseif PostSave == 4 then --Mansion: The White Room
		WarpRoom = 0x12
	elseif PostSave == 5 then --Mansion: Computer Room
		WarpRoom = 0x15
	end
	if WarpRoom <= 50 then
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x190),WarpRoom,OnPC)
	else
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x18C),0x02,OnPC)
		WriteShort(BAR(ARD,0x0A,GoAOffset+0x194),WarpRoom,OnPC)
	end
end
--World Progress
if Place == 0x0102 and Events(0x39,0x39,0x39) then --Just Another Morning
	WriteByte(Save+0x1D0E,1)
elseif Place == 0x0602 and Events(Null,Null,0x01) then --It's a Promise
	WriteByte(Save+0x1D0E,2)
elseif Place == 0x1502 and Events(0x8B,0x8B,0x8B) then --Meanwhile, in the Darkness
elseif Place == 0x0102 and Events(0x3A,0x3A,0x3A) then --Awakened by an Illusion
	WriteByte(Save+0x1D0E,3)
elseif Place == 0x2002 and Events(0x9C,0x9C,0x9C) then --Station of Awakening
	WriteByte(Save+0x1D0E,4)
elseif Place == 0x0102 and Events(0x3B,0x3B,0x3B) then --A Troubled Awakening
	WriteByte(Save+0x1D0E,5)
elseif Place == 0x0102 and Events(0x3C,0x3C,0x3C) then --A Hazy Morning
	WriteByte(Save+0x1D0E,6)
elseif Place == 0x0902 and Events(Null,Null,0x0C) then --Seeking Out the Wonders
	WriteByte(Save+0x1D0E,7)
elseif Place == 0x2402 and Events(Null,Null,0x02) then --Moans from the Tunnel
	WriteByte(Save+0x1D0E,8)
elseif Place == 0x0802 and Events(0x73,0x73,0x73) then --The Seventh Wonder
	WriteByte(Save+0x1D0E,9)
elseif Place == 0x0102 and Events(0x3D,0x3D,0x3D) then --Shadow of Another
	WriteByte(Save+0x1D0E,10)
elseif Place == 0x1202 and Events(Null,Null,0x01) then --Sketches
	WriteByte(Save+0x1D0E,11)
elseif Place == 0x1502 and Events(Null,Null,0x01) then --The Computer System
	WriteByte(Save+0x1D0E,12)
elseif Place == 0x1302 and Events(0x88,0x88,0x88) then --In the Next Life
	WriteByte(Save+0x1D0E,13)
elseif Place == 0x1702 and Events(Null,Null,0x02) then --My Summer Vacation Is Over
	WriteByte(Save+0x1CFE,5) --Post-Story Save
end
--Simulated Twilight Town Post-Story Save
if ReadByte(Save+0x1CFE) > 0 and ReadByte(Save+0x1CFF) == 13 then
	if PrevPlace == 0x0202 then --The Usual Spot
		WriteByte(Save+0x1CFE,1)
	elseif PrevPlace == 0x0902 then --Central Station
		WriteByte(Save+0x1CFE,2)
	elseif PrevPlace == 0x0B02 then --Sunset Station
		WriteByte(Save+0x1CFE,3)
	elseif PrevPlace == 0x1202 then --Mansion: The White Room
		WriteByte(Save+0x1CFE,4)
	elseif PrevPlace == 0x1502 then --Mansion: Computer Room
		WriteByte(Save+0x1CFE,5)
	end
end
--Spawn IDs
if ReadByte(Save+0x1CFF) == 13 and (Place == 0x1A04 or Place == 0x1512) then
	WriteByte(Save+0x1CFF,0)
	BitOr(Save+0x1CEA,0x01) --TT_ROXAS_END (Play as Sora)
	BitOr(Save+0x239E,0x08) --Show Journal
elseif ReadShort(TxtBox) == 0x76D and PrevPlace == 0x1A04 and ReadByte(Save+0x1CFF) == 0 and World == 0x02 then --Load Spawn ID upon Entering STT
	BitNot(Save+0x1CEA,0x01) --TT_ROXAS_END (Play as Roxas)
	BitNot(Save+0x239E,0x08) --Hide Journal
	WriteInt(Save+0x353C,0x12121200) --Roxas Only
	WriteByte(Save+0x1CFF,13) --STT Flag
	WriteArray(Save+0x0310,ReadArray(Save+0x0230,144)) --Load Spawn ID
	WriteArray(Save+0x03E8,ReadArray(Save+0x0310,6))   --The Empty Realm -> Tunnelway
	if Evt <= 50 then --Not a Special Event
		WriteArray(Now+0x4,ReadArray(Save+0x310+Room*6,6)) --Load the Proper Spawn ID
	end
	local PostSave = ReadByte(Save+0x1CFE)
	local Progress = ReadByte(Save+0x1D0E)
	local Visit --Battle Level & Blocks
	local BGMSet = 0
	RemoveTTBlocks()
	if PostSave == 0 then
		if Progress == 0 then --1st Visit
			Visit = 1
		elseif Progress == 1 then --Before Munny Collection
			Visit = 2
			WriteShort(Save+0x20EC,0xC449) --Sandlot Block
		elseif Progress == 2 then --Munny Collection
			Visit = 2
			WriteShort(Save+0x2080,0xC44B) --Central Station Block
			WriteShort(Save+0x20E8,0x9F4A) --The Woods Block
			WriteShort(Save+0x20EC,0x9F49) --Sandlot Block
		elseif Progress == 3 then --Before Sandlot Dusk
			Visit = 3
			WriteShort(Save+0x20EC,0xC44C) --Sandlot Block
		elseif Progress == 4 then --Before Twilight Thorn
			Visit = 3
		elseif Progress == 5 then --[Start of Day 4, Before Setzer]
			Visit = 4
			WriteShort(Save+0x20E8,0xC542) --The Woods Block
			WriteShort(Save+0x2114,0xC540) --Station Plaza Block
		elseif Progress == 6 then --Start of Day 5
			Visit = 5
		elseif Progress == 7 then --Before Vivi's Wonder
			Visit = 5
			WriteShort(Save+0x2110,0xB791) --Tunnelway Block
		elseif Progress == 8 then --[After Vivi's Wonder, After Seven Wonders]
			Visit = 5
		elseif Progress == 9 then --Before Namine's Wonder
			Visit = 5
			WriteShort(Save+0x2080,0xC544) --Central Station Block
		elseif Progress == 10 then --[Before Back Street Nobodies, Before Entering the Mansion]
			Visit = 6
			BGMSet = 2
			WriteShort(Save+0x2114,0xC546) --Station Plaza Block
		elseif Progress == 11 then --[Before Entering the Library, Before Entering Computer Room]
			Visit = 6
			BGMSet = 2
			WriteShort(Save+0x211C,0xC548) --The Old Mansion Block
		elseif Progress == 12 then --Before Axel II
			Visit = 6
			BGMSet = 2
			WriteShort(Save+0x211C,0xC548) --The Old Mansion Block
		elseif Progress == 13 then --After Axel II
			Visit = 6
			BGMSet = 2
		end
	else
		Visit = 6
	end
	WriteByte(Save+0x3FF5,Visit)
	WriteByte(Save+0x23EE,BGMSet) --STT Music: Lazy Afternoons & Sinister Sundowns
	WriteShort(Save+0x20E4,0x9F42) --Underground Concourse Block
elseif ReadByte(Save+0x1CFF) == 13 then --Save Spawn ID within STT
	WriteArray(Save+0x0310,ReadArray(Save+0x03E8,6))   --Tunnelway -> The Empty Realm
	WriteArray(Save+0x0230,ReadArray(Save+0x0310,144)) --Save Spawn ID
end
--Save Points -> World Points
if ReadByte(Save+0x1CFF) == 13 then
	if Place == 0x0202 then --The Usual Spot
		if Events(0x02,0x02,0x02) then --Forced Save Menu
			WriteShort(BAR(ARD,0x06,0x034),0x23A,OnPC)
		else
			WriteShort(BAR(ARD,0x06,0x034),0x239,OnPC)
		end
	elseif Place == 0x2002 then --Station of Serenity
		WriteShort(BAR(ARD,0x04,0x034),0x239,OnPC)
	elseif Place == 0x0502 then --Sandlot (Day 4)
		WriteShort(BAR(ARD,0x06,0x034),0x239,OnPC)
	elseif Place == 0x0B02 then --Sunset Station
		WriteShort(BAR(ARD,0x09,0x034),0x239,OnPC)
	elseif Place == 0x0902 then --Central Station
		WriteShort(BAR(ARD,0x11,0x034),0x239,OnPC)
	elseif Place == 0x1202 then --The White Room
		WriteShort(BAR(ARD,0x06,0x034),0x239,OnPC)
	elseif Place == 0x1502 then --Computer Room
		WriteShort(BAR(ARD,0x09,0x034),0x239,OnPC)
	end
end
--Simulated Twilight Town Adjustments
if ReadByte(Save+0x1CFF) == 13 then --STT Removals
	if ReadByte(BAR(Sys3,0x2,0x3345),OnPC) == 0xB7 then --Better STT disabled (value is 0x93 when enabled, address is Twilight Thorn RC flag)
		if ReadShort(Save+0x25D2)&0x8000 == 0x8000 then --Dodge Roll
			BitNot(Save+0x25D3,0x80)
			BitOr(Save+0x1CF1,0x01)
		end
		WriteShort(BAR(Sys3,0x2,0x072A),0x00,OnPC) --Fire
		WriteShort(BAR(Sys3,0x2,0x075A),0x00,OnPC) --Thunder
		WriteShort(BAR(Sys3,0x2,0x078A),0x00,OnPC) --Blizzard
		WriteShort(BAR(Sys3,0x2,0x07BA),0x00,OnPC) --Cure
		WriteShort(BAR(Sys3,0x2,0x132A),0x00,OnPC) --Fira
		WriteShort(BAR(Sys3,0x2,0x135A),0x00,OnPC) --Firaga
		WriteShort(BAR(Sys3,0x2,0x138A),0x00,OnPC) --Blizzara
		WriteShort(BAR(Sys3,0x2,0x13BA),0x00,OnPC) --Blizzaga
		WriteShort(BAR(Sys3,0x2,0x13EA),0x00,OnPC) --Thundara
		WriteShort(BAR(Sys3,0x2,0x141A),0x00,OnPC) --Thundaga
		WriteShort(BAR(Sys3,0x2,0x144A),0x00,OnPC) --Cura
		WriteShort(BAR(Sys3,0x2,0x147A),0x00,OnPC) --Curaga
		WriteShort(BAR(Sys3,0x2,0x1C8A),0x00,OnPC) --Magnet
		WriteShort(BAR(Sys3,0x2,0x1CBA),0x00,OnPC) --Magnera
		WriteShort(BAR(Sys3,0x2,0x1CEA),0x00,OnPC) --Magnega
		WriteShort(BAR(Sys3,0x2,0x1D1A),0x00,OnPC) --Reflect
		WriteShort(BAR(Sys3,0x2,0x1D4A),0x00,OnPC) --Reflera
		WriteShort(BAR(Sys3,0x2,0x1D7A),0x00,OnPC) --Reflega
		WriteShort(BAR(Sys3,0x2,0x6DBA),0x00,OnPC) --Trinity (Solo)
	else --Better STT enabled
		if Events(0x5B,0x5B,0x5B) or Events(0xC0,0xC0,0xC0) then --Mail Delivery softlock fix
			WriteString(Obj0+0x15030,'F_TT010_ROXAS.mset\0',OnPC)
		else --Let Limit Form use skateboard
			WriteString(Obj0+0x15030,'F_TT010.mset\0',OnPC)
		end
	end
	local Equip = ReadShort(Save+0x24F0) --Currently equipped Keyblade
	local Store = ReadShort(Save+0x1CF9) --Last equipped Keyblade
	local Struggle
	if ReadByte(Save+0x1CF8) == 1 then
		Struggle = 0x180 --Struggle Sword
	elseif ReadByte(Save+0x1CF8) == 2 then
		Struggle = 0x1F5 --Struggle Wand
	elseif ReadByte(Save+0x1CF8) == 3 then
		Struggle = 0x1F6 --Struggle Hammer
	elseif not(Place == 0x0402 and Events(0x4C,0x4C,0x4C)) then --No Struggle Weapon Chosen
		WriteByte(Save+0x1CF8,math.random(3))
	end
	if Place == 0x0402 and Events(0x4C,0x4C,0x4C) then --Sandlot Weapons
		if not(Equip == 0x180 or Equip == 0x1F5 or Equip == 0x1F6) then
			WriteByte(Save+0x1CF8,0) --Reset Struggle Weapon Flag
		elseif ReadByte(Save+0x1CF8) == 0 then
			if Equip == 0x180 then --Struggle Sword
				WriteByte(Save+0x3651,ReadByte(Save+0x3651)+1)
				WriteByte(Save+0x1CF8,1)
			elseif Equip == 0x1F5 then --Struggle Wand
				WriteByte(Save+0x3690,ReadByte(Save+0x3690)+1)
				WriteByte(Save+0x1CF8,2)
			elseif Equip == 0x1F6 then --Struggle Hammer
				WriteByte(Save+0x3691,ReadByte(Save+0x3691)+1)
				WriteByte(Save+0x1CF8,3)
			end
		end
	elseif Place == 0x0402 and (Events(0x4D,0x4D,0x4D) or Events(0x4E,0x4E,0x4E) or Events(0x4F,0x4F,0x4F)) then --Tutorial Fights
		WriteShort(Save+0x24F0,Struggle)
	elseif Place == 0x0502 and (Events(0x54,0x54,0x54) or Events(0x55,0x55,0x55) or Events(0x58,0x58,0x58)) then --Struggle Fights
		WriteShort(Save+0x24F0,Struggle)
	elseif Place == 0x0502 and ReadShort(Now+0x32) ~= Door and (Door == 0x33 or Door == 0x35) then --Losing to Seifer or Vivi
		WriteShort(Save+0x24F0,Store)
	elseif Place == 0x0E02 and Events(0x7F,0x7F,0x7F) then --The Old Mansion Dusk
		WriteShort(Save+0x24F0,Struggle)
	elseif Place == 0x1402 then --Axel II (Oblivion is Equipped & Unequipped Automatically)
	elseif Equip ~= Store then
		if ReadByte(Cntrl) == 0 then
			WriteShort(Save+0x1CF9,Equip) --Change Stored Keyblade
		elseif Store > 0 then
			WriteShort(Save+0x24F0,Store) --Change Equipped Keyblade
		end
	end
elseif ReadShort(Save+0x1CF9) ~= 0 then --Restore Outside STT
	if ReadByte(Save+0x1CF1)&0x01 == 0x01 then --Dodge Roll
		BitOr(Save+0x25D3,0x80)
		BitNot(Save+0x1CF1,0x01)
	end
	WriteShort(BAR(Sys3,0x2,0x072A),0x02,OnPC) --Fire
	WriteShort(BAR(Sys3,0x2,0x075A),0x02,OnPC) --Thunder
	WriteShort(BAR(Sys3,0x2,0x078A),0x02,OnPC) --Blizzard
	WriteShort(BAR(Sys3,0x2,0x07BA),0x02,OnPC) --Cure
	WriteShort(BAR(Sys3,0x2,0x132A),0x02,OnPC) --Fira
	WriteShort(BAR(Sys3,0x2,0x135A),0x02,OnPC) --Firaga
	WriteShort(BAR(Sys3,0x2,0x138A),0x02,OnPC) --Blizzara
	WriteShort(BAR(Sys3,0x2,0x13BA),0x02,OnPC) --Blizzaga
	WriteShort(BAR(Sys3,0x2,0x13EA),0x02,OnPC) --Thundara
	WriteShort(BAR(Sys3,0x2,0x141A),0x02,OnPC) --Thundaga
	WriteShort(BAR(Sys3,0x2,0x144A),0x02,OnPC) --Cura
	WriteShort(BAR(Sys3,0x2,0x147A),0x02,OnPC) --Curaga
	WriteShort(BAR(Sys3,0x2,0x1C8A),0x02,OnPC) --Magnet
	WriteShort(BAR(Sys3,0x2,0x1CBA),0x02,OnPC) --Magnera
	WriteShort(BAR(Sys3,0x2,0x1CEA),0x02,OnPC) --Magnega
	WriteShort(BAR(Sys3,0x2,0x1D1A),0x02,OnPC) --Reflect
	WriteShort(BAR(Sys3,0x2,0x1D4A),0x02,OnPC) --Reflera
	WriteShort(BAR(Sys3,0x2,0x1D7A),0x02,OnPC) --Reflega
	WriteShort(BAR(Sys3,0x2,0x6DBA),0x51,OnPC) --Trinity (Solo)
	WriteShort(Save+0x1CF9,0) --Remove stored Keyblade
end
--Faster Twilight Thorn Reaction Commands
if Place == 0x2202 and Events(0x9D,0x9D,0x9D) then
	if ReadInt(CutLen) == 0x40 then --RC Start
		BitOr(Save+0x1CF1,0x10)
	elseif ReadInt(CutLen) == 0x16C and ReadInt(CutNow) == 0x16C then --Break Raid Succeed
		BitNot(Save+0x1CF1,0x10)
	elseif ReadInt(CutLen) == 0x260 and ReadInt(CutNow) == 0x260 then --Break Raid Failed
		BitNot(Save+0x1CF1,0x10)
	elseif ReadInt(CutLen) == 0x04D then --Break Raid Kill
		BitNot(Save+0x1CF1,0x10)
	end
	if ReadByte(Save+0x1CF1)&0x10 == 0x10 then
		Faster(true)
	else
		Faster(false)
	end
end
--[[Shorter Day 5
if Place == 0x0B02 and Events(0x01,0x00,0x0C) then
	WriteByte(Save+0x1D0E,8)
	WriteShort(Save+0x034C,0x02) --Sunset Terrace MAP (After Wonders)
	WriteShort(Save+0x0350,0x0D) --Sunset Terrace EVT
	WriteShort(Save+0x0356,0x13) --Sunset Station EVT
	WriteShort(Save+0x0358,0x03) --Sunset Hill MAP (After Wonder)
	WriteShort(Save+0x035C,0x01) --Sunset Hill EVT
	WriteShort(Save+0x03E8,0x03) --Tunnelway MAP (Spawn Skateboard)
	WriteShort(Save+0x03EC,0x00) --Tunnelway EVT
	WriteShort(Save+0x2110,0) --Tunnelway Unblock
	BitOr(Save+0x2394,0x1E) --Minigame Finished Flags
	BitOr(Save+0x1CDD,0x40) --TT_MISTERY_A_END (The Animated Bag)
	BitOr(Save+0x1CDD,0x80) --TT_MISTERY_B_END (The Friend from Beyond the Wall)
	BitOr(Save+0x1CDE,0x01) --TT_MISTERY_C_END (The Moans from the Tunnel)
	BitOr(Save+0x1CEF,0x80) --TT_MISTERY_C_OUT
	BitOr(Save+0x1CDE,0x02) --TT_MISTERY_D_END (The Doppelganger)
	BitOr(Save+0x1CDE,0x04) --TT_506_END_L
end--]]
end

function AW()
--0th Visit Adjustments
if Place == 0x0D04 and Events(0x65,0x65,0x65) and PrevPlace == 0x0209 then --Lost Memories
	WriteArray(Save+0x0646,ReadArray(Save+0x066A,6)) --Load Borough Spawn ID
	WriteArray(Save+0x065E,ReadArray(Save+0x0664,6)) --Load Merlin's House Spawn ID
end
--[[Skip 0th Visit
if ReadShort(Save+0x0D90) == 0x00 then
	WriteShort(Save+0x0D90,0x02) --The Hundred Acre Wood MAP (Pooh's House Only)
	WriteShort(Save+0x0DA0,0x16) --Pooh's House EVT
	BitOr(Save+0x1D16,0x02) --HB_START_pooh
	BitOr(Save+0x1D16,0x04) --HB_901_END
	BitOr(Save+0x1D16,0x08) --HB_902_END
	BitOr(Save+0x1D16,0x20) --HB_903_END
	BitOr(Save+0x1DB0,0x01) --PO_START
	BitOr(Save+0x1DB0,0x02) --PO_001_END
	BitOr(Save+0x1DB0,0x04) --PO_003_END
	BitOr(Save+0x1DB0,0x08) --PO_004_END
	BitOr(Save+0x1D16,0x10) --HB_po_004_END
	BitOr(Save+0x1D16,0x40) --HB_904_END
	BitOr(Save+0x1D17,0x08) --HB_905_END
	BitOr(Save+0x1D18,0x08) --HB_hb09_ms901
	BitOr(Save+0x1DB0,0x10) --PO_HB_BATTLE_END
	BitOr(Save+0x1DB0,0x20) --PO_005_END
	BitOr(Save+0x1DB0,0x40) --PO_007_END
	BitOr(Save+0x1DB0,0x80) --PO_008_END
	BitOr(Save+0x1D17,0x02) --HB_po_008_END
	BitOr(Save+0x1D17,0x08) --HB_907_END
end--]]
--Faster Minigames
if Place == 0x0609 then --A Blustery Rescue
	if ReadByte(Cntrl) == 0 then --Minigame Started
		Faster(true)
	end
elseif Place == 0x0409 then --Minigame Ended
	Faster(false)
elseif Place == 0x0709 then --Hunny Slider
	if ReadByte(Cntrl) == 0 then --Minigame Started
		Faster(true)
	end
elseif Place == 0x0309 then --Minigame Ended
	Faster(false)
end
end

function At()
end

function Data()
--Music Change - Final Fights
if ReadShort(Save+0x03D6) == 0x02 then
	if Place == 0x1B12 then --Part I
		WriteShort(BAR(ARD,0x07,0x059A),0x09C,OnPC) --Guardando nel buio
		WriteShort(BAR(ARD,0x07,0x1C46),0x09C,OnPC)
		WriteShort(BAR(ARD,0x06,0x0A4),0x09C,OnPC)
		WriteShort(BAR(ARD,0x06,0x0A6),0x09C,OnPC)
	elseif Place == 0x1C12 then --Part II
		WriteShort(BAR(ARD,0x07,0x008),0x09C,OnPC)
		WriteShort(BAR(ARD,0x07,0x00A),0x09C,OnPC)
	elseif Place == 0x1A12 then --Cylinders
		WriteShort(BAR(ARD,0x07,0x008),0x09C,OnPC)
		WriteShort(BAR(ARD,0x07,0x00A),0x09C,OnPC)
	elseif Place == 0x1912 then --Core
		WriteShort(BAR(ARD,0x07,0x008),0x09C,OnPC)
		WriteShort(BAR(ARD,0x07,0x00A),0x09C,OnPC)
	elseif Place == 0x1812 then --Armor Xemnas I
		WriteShort(BAR(ARD,0x06,0x008),0x09C,OnPC)
		WriteShort(BAR(ARD,0x06,0x00A),0x09C,OnPC)
		WriteShort(BAR(ARD,0x06,0x034),0x09C,OnPC)
		WriteShort(BAR(ARD,0x06,0x036),0x09C,OnPC)
	elseif Place == 0x1D12 then --Pre-Dragon Xemnas
		WriteShort(BAR(ARD,0x03,0x010),0x09C,OnPC)
		WriteShort(BAR(ARD,0x03,0x012),0x09C,OnPC)
	end
end
end

--[[Unused Bytes Repurposed:
[Save+0x01A0,Save+0x022F] TT Spawn IDs
[Save+0x0230,Save+0x02BF] STT Spawn IDs
[Save+0x0664,Save+0x0669] Merlin's House Spawn IDs
[Save+0x066A,Save+0x066F] Borough Spawn IDs
Save+0x06B2 Genie Crash Fix
Save+0x1CF1 STT Dodge Roll, Unknown Disk, Twilight Thorn
Save+0x1CF7 Royal Summons
Save+0x1CF8 STT Struggle Weapon
[Save+0x1CF9,Save+0x1CFA] STT Keyblade
Save+0x1CFD TT Post-Story Save
Save+0x1CFE STT Post-Story Save
Save+0x1CFF STT/TT Flag
Save+0x1D0D TT Progress
Save+0x1D0E STT Progress
Save+0x1D2E HB Post-Story Save
Save+0x1D2F HB Progress
Save+0x1D3E BC Post-Story Save
Save+0x1D3F BC Progress
Save+0x1D6E OC Post-Story Save
Save+0x1D6F OC Progress
Save+0x1D7E Ag Post-Story Save
Save+0x1D7F Ag Progress
Save+0x1D9E LOD Post-Story Save
Save+0x1D9F LOD Progress
Save+0x1DDE PL Post-Story Save
Save+0x1DDF PL Progress
Save+0x1E1E DC Post-Story Save
Save+0x1E1F DC Progress
Save+0x1E5E HT Post-Story Save
Save+0x1E5F HT Progress
Save+0x1E9E PR Post-Story Save
Save+0x1EBE SP Post-Story Save
Save+0x1EBF SP Progress
Save+0x1EDE TWtNW Post-Story Save
Save+0x1EDF TWtNW Progress
Save+0x35C4 Ollete's Munny Pouch
Save+0x35C5 Mickey's Munny Pouch
--]]
