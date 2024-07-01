
function _OnInit()
    GameVersion = 0
end
function _OnFrame()
    if true then --Define current values for common addresses
        if GameVersion==0 then 
            if ReadString(0x09A92F0,4) == 'KH2J' then --EGS
                drive1=0x3F1CCE
                drive2=0x400E64
                drive3=0x3E27AC
                drive4=0x400EB8
                drive5=0x3FFAF4
                drive6=0x3C1EFE
                drive7=0x3F1CEA
                GameVersion=1
                Now = 0x0716DF8
            end
            if ReadString(0x09A9830,4) == 'KH2J' then --Steam Global
                drive1=0x3F29EE
                drive2=0x401B84
                drive3=0x3E34CC
                drive4=0x401BD8
                drive5=0x400814
                drive6=0x3C2C1E
                drive7=0x3F2A0A   
                GameVersion=2
                Now = 0x0717008
            end
        end
        if GameVersion==0 then
            return
        end

        World  = ReadByte(Now+0x00)
        Room   = ReadByte(Now+0x01)
        Place  = ReadShort(Now+0x00)
        Door   = ReadShort(Now+0x02)
        Map    = ReadShort(Now+0x04)
        Btl    = ReadShort(Now+0x06)
        Evt    = ReadShort(Now+0x08)
        PrevPlace = ReadShort(Now+0x30)
    end
        
    -- if room is before datas and place is before datas and they are not in stt
	-- if world == 100aw then give ability to go into drive
	-- credit to ksx for the base of this lua script
    if World==9 or (Room==33 and Place==8450 and ReadShort(Save+0x1CF9)<1) then
        if ReadByte(drive1) == 0x74 then
            WriteByte(drive1, 0x77)
            WriteShort(drive2, 0x820F)
            WriteByte(drive3, 0x72)
            WriteShort(drive4, 0x820F)
            WriteByte(drive5, 0x7D)
            WriteByte(drive6, 0x7D)
            WriteByte(drive7, 0x03)
            end
    elseif ReadByte(drive1)==0x77 then
        WriteByte(drive1, 0x74)
        WriteShort(drive2, 0x850F)
        WriteByte(drive3, 0x78)
        WriteShort(drive4, 0x850F)
        WriteByte(drive5, 0x74)
        WriteByte(drive6, 0x74)
        WriteByte(drive7, 0x01)
    end
end
        
