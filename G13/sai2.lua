--------------------------------------------------------------------------------------------------
-- KEY_WAIT_MSEC ms以上Gキーを押し下げてから話すと「直前のキー」が押された状態になるようにするスクリプト．
--------------------------------------------------------------------------------------------------
-- 使い方
--- （１）このソースの関数 GtoKeys() を好きなように編集する．
--- （２）Logicool ゲームソフトウェア　⇒　編集したいプロファイルを右クリックして「スクリプト」を選ぶ．
--- （３）テキストエリアにこのソースをペーストして保存する．
--------------------------------------------------------------------------------------------------
KEY_WAIT_MSEC = 1500; --単位はミリセカンド．
-- ・この時間より短くキーを押すとキーが確定する．
-- ・この時間より長くキーを押し込んでいた場合，キーを離すと直前のキーが押された状態に遷移する．

--[[
関数 GtoKeys 編集のためのヒント．

・ Gn(n=1,...,29)を押したときの挙動は g[n] で編集する．
・例： G3 を押したときに 'A'が押されて欲しい場合  g[3] = "a";
・例： G4 を押したときに'左シフト I' が押されて欲しい場合　g[4] = {"lshift", "i"}
]]

--[[
キー名一覧　
"escape", "f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9", "f10"
"f11", "f12", "f13", "f14", "f15", "f16", "f17", "f18", "f19", "f20"
"f21", "f22", "f23", "f24", 
"printscreen", "scrolllock", "pause", "tilde", 
"1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
"minus", "equal", "backspace", "tab",
"q", "w", "e", "r", ...., "m",
"lbracket", "rbracket", "backslash", "capslock"
"semicolon", "quote", "enter", "lshift"
"non_us_slash"
"comma", "period", "slash", "rshift", "lctrl"
"lgui", "lalt", "spacebar", "ralt", "rgui"
"appkey", "rctrl", "insert", "home", "pageup"
"delete", "end", "pagedown", "up", "left",
"down", "right", "numlock", "numslash", "numminus"
"num7", "num8", "num9", "numplus",
"num4", "num5", "num6",
"num1", "num2", "num3", "numenter"
"num0", "numperiod"
]]

function GtoKeys(arg)
    local g = {};
    g[1] = "t";  g[2] = "b";  g[3] = "c";  g[4] = "d";  g[5] = "e";  g[6] = "g";  g[7] = "g";
    g[8] = "w";  g[9] = "i";  g[10] = "j"; g[11] = "k"; g[12] = "l"; g[13] = "m"; g[14] = "n";
      g[15] = "h";            g[16] = "rbracket"; g[17] = "backslash"; g[18] = "r"; g[19] = "s";
                         g[20] = "q";     g[21] = "q";  g[22] = "v";
                                                                   g[23] = "spacebar";                             g[26] = {"lalt", "v", "i"};
                                                                   g[24] = "a";      g[29] = {"lalt", "v", "i"};   g[25] = {"lshift", "home"};  g[27] = {"lalt", "v", "o"};
                                                                                                                   g[28] = {"lalt", "v", "o"};
    return g[arg];
end

function PressGKey(arg)
    local keys = GtoKeys(arg);
    if (type(keys) == "string") then 
        PressKey(keys);
    end 
    if (type(keys) == "table") then 
        PressKey(unpack(keys));
    end
end

function ReleaseGKey(arg)
  local keys = GtoKeys(arg);
  if (type(keys) == "string") then 
      ReleaseKey(keys);
  end 
  if (type(keys) == "table") then 
      ReleaseKey(unpack(keys));
  end
end

oldTime = 0;
newTime = GetRunningTime();

currentKey = 0;

function OnEvent(event, arg)
  if (event == "PROFILE_ACTIVATED") then
    OutputLogMessage("!!ACTIVATED!!\n");
  end
  if (event == "PROFILE_DEACTIVATED") then
    OutputLogMessage("--Bye--\n\n");
  end
  if (event == "G_PRESSED") then
    mes = string.format("G%d pressed\n", arg);
    OutputLogMessage(mes);
    
    oldTime = GetRunningTime(); -- キーが押された時刻を取得
    PressGKey(arg);
  end
  if (event == "G_RELEASED") then
    mes = string.format("G%d released\n", arg);
    OutputLogMessage(mes);
    newTime = GetRunningTime(); -- キーが離された時刻を取得
    local diffMsec = newTime - oldTime;
    mes = string.format("%d msec\n", diffMsec);
    OutputLogMessage(mes);

    ReleaseGKey(arg);
    if (diffMsec > KEY_WAIT_MSEC and currentKey ~= 0) then 
        PressGKey(currentKey);
        ReleaseGKey(currentKey);
    else 
        currentKey = arg; -- 押されたキーを記録
    end
  end
  if (event == "M_PRESSED") then
    mes = string.format("M%d pressed\n", arg);
    OutputLogMessage(mes);
  end
  if (event == "M_RELEASED") then
    mes = string.format("M%d released\n", arg);
    OutputLogMessage(mes);
  end
end