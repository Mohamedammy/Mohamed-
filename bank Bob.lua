if text == 'بنك' or text == 'البنك' then
bot.sendText(msg.chat_id,msg.id,[[
✠ اوامر البنك

⌯ انشاء حساب بنكي  ↢ تفتح حساب وتقدر تحول فلوس مع مزايا ثانيه

⌯ مسح حساب بنكي  ↢ تلغي حسابك البنكي

⌯ تحويل ↢ تطلب رقم حساب الشخص وتحول له فلوس

⌯ حسابي  ↢ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك

⌯ فلوسي ↢ يعلمك كم فلوسك

⌯ راتب ↢ يعطيك راتب كل ١٠ دقائق

⌯ بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق

⌯ زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق

⌯ استثمار ↢ تستثمر بالمبلغ اللي تبيه مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜

⌯ حظ ↢ تلعبها بأي مبلغ ياتدبله ياتخسره انت وحظك

⌯ مضاربه ↢ تضارب بأي مبلغ تبيه والنسبة من ٩٠٪؜ الى -٩٠٪؜ انت وحظك

⌯ قرض ↢ تاخذ قرض من البنك

⌯ تسديد القرض ↢ بتسدد القرض اذا عليك 

⌯ هجوم ↢ تهجم عالخصم مع زيادة نسبة كل هجوم

⌯ كنز ↢ يعطيك كنز بسعر مختلف انتا وحظك

⌯ مراهنه ↢ تحط مبلغ وتراهن عليه

⌯ توب الفلوس ↢ يطلع توب اكثر ناس معهم فلوس بكل الكروبات

⌯ توب الحراميه ↢ يطلع لك اكثر ناس زرفوا

⌯ زواج  ↢ تكتبه بالرد على رسالة شخص مع المهر ويزوجك

⌯ زواجي  ↢ يطلع وثيقة زواجك اذا متزوج

⌯ طلاق ↢ يطلقك اذا متزوج

⌯ خلع  ↢ يخلع زوجك ويرجع له المهر

⌯ زواجات ↢ يطلع اغلى ٣٠ زواجات

⌯ ترتيبي ↢ يطلع ترتيبك باللعبة

✦
]],"md",true)  
return false
end

if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' or text == "انشاء حساب" or text == "فتح حساب بنكي" then
cobnum = tonumber(Redis:get("bandid"..msg.sender_id.user_id))
if cobnum == msg.sender_id.user_id then
return bot.sendText(msg.chat_id,msg.id, "⇜ حسابك محظور من لعبة البنك","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
creditcc = math.random(500000000000,599999999999);
creditvi = math.random(400000000000,499999999999);
creditex = math.random(600000000000,699999999999);
balas = 50
if Redis:sismember("booob",msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id, "⇜ لديك حساب بنكي مسبقاً\n\n⇜ لعرض معلومات حسابك اكتب\n⇠ `حسابي`","md",true)
end
Redis:setex("booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
bot.sendText(msg.chat_id,msg.id,[[
✠┊عليك اختيار نوع البطاقة للحفاظ على فلوسك 

• `بنك الرشيد`
• `بنك الرافدين`
• `بنك الدولي`

- اضغط للنسخ

- اختر اسم البنك اضغط للنسخ بعدها ارسل :
]],"md",true)  
return false
end
if Redis:get("booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
if text == "بنك الرشيد" then
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set("bobna"..msg.sender_id.user_id,news)
Redis:set("boob"..msg.sender_id.user_id,balas)
Redis:set("boobb"..msg.sender_id.user_id,creditcc)
Redis:set("bbobb"..msg.sender_id.user_id,text)
Redis:set("boballname"..creditcc,news)
Redis:set("boballbalc"..creditcc,balas)
Redis:set("boballcc"..creditcc,creditcc)
Redis:set("boballban"..creditcc,text)
Redis:set("boballid"..creditcc,banid)
Redis:sadd("booob",msg.sender_id.user_id)
Redis:del("booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
bot.sendText(msg.chat_id,msg.id, "\n• وعملنالك لك حساب في بنك فلاش 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..creditcc.."` )\n⇜ نوع البطاقة ↢ ( بنك الرشيد 💳 )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )  ","md",true)  
end 
if text == "بنك الرافدين" then
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set("bobna"..msg.sender_id.user_id,news)
Redis:set("boob"..msg.sender_id.user_id,balas)
Redis:set("boobb"..msg.sender_id.user_id,creditvi)
Redis:set("bbobb"..msg.sender_id.user_id,text)
Redis:set("boballname"..creditvi,news)
Redis:set("boballbalc"..creditvi,balas)
Redis:set("boballcc"..creditvi,creditvi)
Redis:set("boballban"..creditvi,text)
Redis:set("boballid"..creditvi,banid)
Redis:sadd("booob",msg.sender_id.user_id)
Redis:del("booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
bot.sendText(msg.chat_id,msg.id, "\n• وعملنالك لك حساب في بنك فلاش 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..creditvi.."` )\n⇜ نوع البطاقة ↢ ( بنك الرافدين 💳 )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )  ","md",true)   
end 
if text == "بنك الدولي" then
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set("bobna"..msg.sender_id.user_id,news)
Redis:set("boob"..msg.sender_id.user_id,balas)
Redis:set("boobb"..msg.sender_id.user_id,creditex)
Redis:set("bbobb"..msg.sender_id.user_id,text)
Redis:set("boballname"..creditex,news)
Redis:set("boballbalc"..creditex,balas)
Redis:set("boballcc"..creditex,creditex)
Redis:set("boballban"..creditex,text)
Redis:set("boballid"..creditex,banid)
Redis:sadd("booob",msg.sender_id.user_id)
Redis:del("booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
bot.sendText(msg.chat_id,msg.id, "\n• وعملنالك لك حساب في بنك فلاش 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..creditex.."` )\n⇜ نوع البطاقة ↢ ( بنك الدولي💳 )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )  ","md",true)   
end 
end
if text == 'مسح حساب بنكي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" or text == "مسح حسابي" then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender_id.user_id) then
Redis:srem("booob", msg.sender_id.user_id)
Redis:del("boob"..msg.sender_id.user_id)
Redis:del("boobb"..msg.sender_id.user_id)
Redis:del("rrfff"..msg.sender_id.user_id)
Redis:srem("rrfffid", msg.sender_id.user_id)
Redis:srem("roogg1", msg.sender_id.user_id)
Redis:srem("roogga1", msg.sender_id.user_id)
Redis:del("roog1"..msg.sender_id.user_id)
Redis:del("rooga1"..msg.sender_id.user_id)
Redis:del("rahr1"..msg.sender_id.user_id)
Redis:del("rahrr1"..msg.sender_id.user_id)
bot.sendText(msg.chat_id,msg.id, "⇜ مسحت حسابك البنكي 🏦","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تثبيت النتائج' or text == 'تثبيت نتائج' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
time = os.date("*t")
month = time.month
day = time.day
local_time = month.."/"..day
local bank_users = Redis:smembers("booob")
if #bank_users == 0 then
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get("boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇",
"🥈",
"🥉"
}
for k,v in pairs(mony_list) do
local user_name = bot.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set("medal"..v[2],convert_mony)
Redis:set("medal2"..v[2],emo)
Redis:set("medal3"..v[2],local_time)
Redis:sadd("medalid",v[2])
Redis:set("medal"..v[2],convert_mony)
Redis:set("medal2"..v[2],emo)
Redis:set("medal3"..v[2],local_time)
Redis:sadd("medalid",v[2])
local user_name = bot.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set("medal"..v[2],convert_mony)
Redis:set("medal2"..v[2],emo)
Redis:set("medal3"..v[2],local_time)
Redis:sadd("medalid",v[2])
if num == 4 then
return end
end
bot.sendText(msg.chat_id,msg.id, "⇜ ثبتت النتائج","md",true)
end
end
if text == 'مسح كل الفلوس' or text == 'مسح كل فلوس' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
local bank_users = Redis:smembers("booob")
for k,v in pairs(bank_users) do
Redis:del("boob"..v)
Redis:del("kreednum"..v)
Redis:del("kreed"..v)
Redis:del("rrfff"..v)
end
local bank_usersr = Redis:smembers("rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del("boob"..v)
Redis:del("rrfff"..v)
end
bot.sendText(msg.chat_id,msg.id, "⇜ مسحت كل فلوس اللعبة 🏦","md",true)
end
end

if text == 'تصفير النتائج' or text == 'مسح لعبه البنك' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
local bank_users = Redis:smembers("booob")
for k,v in pairs(bank_users) do
Redis:del("boob"..v)
Redis:del("kreednum"..v)
Redis:del("kreed"..v)
Redis:del("rrfff"..v)
Redis:del("numattack"..v)
end
local bank_usersr = Redis:smembers("rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del("boob"..v)
Redis:del("rrfff"..v)
end
Redis:del("rrfffid")
Redis:del("booob")
bot.sendText(msg.chat_id,msg.id, "⇜ مسحت لعبه البنك 🏦","md",true)
end
end
if text == 'ميدالياتي' or text == 'ميداليات' then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("medalid",msg.sender_id.user_id) then
local medaa2 = Redis:get("medal2"..msg.sender_id.user_id)
if medaa2 == "🥇" then
local medaa = Redis:get("medal"..msg.sender_id.user_id)
local medaa2 = Redis:get("medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get("medal3"..msg.sender_id.user_id)
bot.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💵\nالمركز : "..medaa2.." كونكر "..medaa2.."\n✦","md",true)
elseif medaa2 == "🥈" then
local medaa = Redis:get("medal"..msg.sender_id.user_id)
local medaa2 = Redis:get("medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get("medal3"..msg.sender_id.user_id)
bot.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💵\nالمركز : "..medaa2.." ايس "..medaa2.."\n✦","md",true)
else
local medaa = Redis:get("medal"..msg.sender_id.user_id)
local medaa2 = Redis:get("medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get("medal3"..msg.sender_id.user_id)
bot.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💵\nالمركز : "..medaa2.." تاج "..medaa2.."\n✦","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك ميداليات","md",true)
end
end

if text == 'فلوسي' or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender_id.user_id) then
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 1 then
return bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك فلوس ارسل الالعاب وابدأ بجمع الفلوس \n✦","md",true)
end
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك `"..convert_mony.."` جنيه 💵","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'فلوسه' or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
if Redis:sismember("booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
bot.sendText(msg.chat_id,msg.id, "⇜ فلوسه `"..convert_mony.."` جنيه 💵","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي ","md",true)
end
end

if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember("booob",msg.sender_id.user_id) then
cccc = Redis:get("boobb"..msg.sender_id.user_id)
uuuu = Redis:get("bbobb"..msg.sender_id.user_id)
pppp = Redis:get("rrfff"..msg.sender_id.user_id) or 0
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..cccc.."`\n⇜ بنك ↢ ( فلاش )\n⇜ نوع ↢ ( "..uuuu.." )\n⇜ الرصيد ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ الزرف ( "..pppp.." جنيه 💵 )\n✦","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'مسح حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember("booob",Remsg.sender_id.user_id) then
ccccc = Redis:get("boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get("bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get("rrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem("booob", Remsg.sender_id.user_id)
Redis:del("boob"..Remsg.sender_id.user_id)
Redis:del("boobb"..Remsg.sender_id.user_id)
Redis:del("rrfff"..Remsg.sender_id.user_id)
Redis:del("numattack"..Remsg.sender_id.user_id)
Redis:srem("rrfffid", Remsg.sender_id.user_id)
Redis:srem("roogg1", Remsg.sender_id.user_id)
Redis:srem("roogga1", Remsg.sender_id.user_id)
Redis:del("roog1"..Remsg.sender_id.user_id)
Redis:del("rooga1"..Remsg.sender_id.user_id)
Redis:del("rahr1"..Remsg.sender_id.user_id)
Redis:del("rahrr1"..Remsg.sender_id.user_id)
bot.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..ccccc.."`\n⇜ بنك ↢ ( فلاش )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الرصيد ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ الزرف ↢ ( "..ppppp.." جنيه 💵 )\n⇜ مسكين مسحت حسابه \n✦","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي اصلاً ","md",true)
end
end
end

if text == 'حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember("booob",Remsg.sender_id.user_id) then
ccccc = Redis:get("boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get("bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get("rrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
bot.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..ccccc.."`\n⇜ بنك ↢ ( فلاش )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الرصيد ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ الزرف ↢ ( "..ppppp.." جنيه 💵 )\n✦","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي ","md",true)
end
end

if text and text:match('^مسح حساب (.*)$') or text and text:match('^مسح حسابه (.*)$') then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
local UserName = text:match('^مسح حساب (.*)$') or text:match('^مسح حسابه (.*)$')
local coniss = coin(UserName)
local ban = bot.getUser(coniss)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
if Redis:sismember("booob",coniss) then
ccccc = Redis:get("boobb"..coniss)
uuuuu = Redis:get("bbobb"..coniss)
ppppp = Redis:get("rrfff"..coniss) or 0
ballanceed = Redis:get("boob"..coniss) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem("booob", coniss)
Redis:del("boob"..coniss)
Redis:del("boobb"..coniss)
Redis:del("rrfff"..coniss)
Redis:srem("roogg1", coniss)
Redis:srem("roogga1", coniss)
Redis:del("roog1"..coniss)
Redis:del("rooga1"..coniss)
Redis:del("rahr1"..coniss)
Redis:del("rahrr1"..coniss)
Redis:del("numattack"..coniss)
Redis:srem("rrfffid", coniss)
bot.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..ccccc.."`\n⇜ بنك ↢ ( فلاش )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الرصيد ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ الزرف ↢ ( "..ppppp.." جنيه 💵 )\n⇜ مسكين مسحت حسابه \n✦","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي اصلاً ","md",true)
end
end
end

if text and text:match('^حساب (.*)$') or text and text:match('^حسابه (.*)$') then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^حساب (.*)$') or text:match('^حسابه (.*)$')
local coniss = coin(UserName)
if Redis:get("boballcc"..coniss) then
local yty = Redis:get("boballname"..coniss)
local bobpkh = Redis:get("boballid"..coniss)
ballancee = Redis:get("boob"..bobpkh) or 0
local convert_mony = string.format("%.0f",ballancee)
local dfhb = Redis:get("boballbalc"..coniss)

local fsvhh = Redis:get("boballban"..coniss)
bot.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..yty.."\n⇜ الحساب ↢ `"..coniss.."`\n⇜ بنك ↢ ( فلاش )\n⇜ نوع ↢ ( "..fsvhh.." )\n⇜ الرصيد ↢ ( "..convert_mony.." جنيه 💵 )\n✦","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يوجده حساب بنكي كذا","md",true)
end
end

if text == 'مضاربه' then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl("iiooooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("iiooooo" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك تضارب حاليا\n⇜ تعال بعد ( "..time.." دقيقة )","md",true)
end
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`مضاربه` المبلغ","md",true)
end

if text and text:match('^مضاربه (.*)$') or text and text:match('^مضاربة (.*)$') then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^مضاربه (.*)$') or text:match('^مضاربة (.*)$')
local coniss = coin(UserName)
if Redis:sismember("booob",msg.sender_id.user_id) then
if Redis:ttl("iiooooo" .. msg.sender_id.user_id) >= 60 then
  local time = Redis:ttl("iiooooo" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك تضارب حاليا\n⇜ تعال بعد ( "..time.." دقيقة )","md",true)
end
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return bot.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 100 جنيه 💵\n✦","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
local modarba = {"1", "2", "3", "4️",}
local Descriptioontt = modarba[math.random(#modarba)]
local modarbaa = math.random(1,90);
if Descriptioontt == "1" or Descriptioontt == "3" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee - ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set("boob"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex("iiooooo" .. msg.sender_id.user_id,900, true)
bot.sendText(msg.chat_id,msg.id, "⇜ مضاربة فاشلة 📉\n⇜ نسبة الخسارة ↢ "..modarbaa.."%\n⇜ المبلغ الذي خسرته ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ فلوسك صارت ↢ ( "..convert_mony1.." جنيه 💵 )\n✦","md",true)
elseif Descriptioontt == "2" or Descriptioontt == "4" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee + ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set("boob"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex("iiooooo" .. msg.sender_id.user_id,900, true)
bot.sendText(msg.chat_id,msg.id, "⇜ مضاربة ناجحة 📈\n⇜ نسبة الربح ↢ "..modarbaa.."%\n⇜ المبلغ الذي ربحته ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ فلوسك صارت ↢ ( "..convert_mony1.." جنيه 💵 )\n✦","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'استثمار' then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl("iioooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("iioooo" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك تستثمر حاليا\n⇜ تعال بعد ( "..time.." دقيقة )","md",true)
end
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`استثمار` المبلغ","md",true)
end

if text and text:match('^استثمار (.*)$') then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^استثمار (.*)$')
local coniss = coin(UserName)
if Redis:sismember("booob",msg.sender_id.user_id) then
if Redis:ttl("iioooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("iioooo" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك تستثمر حاليا\n⇜ تعال بعد ( "..time.." دقيقة )","md",true)
end
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return bot.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 100 جنيه 💵\n✦","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
if tonumber(ballancee) < 100000 then
local hadddd = math.random(10,15);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set("boob"..msg.sender_id.user_id , math.floor(ballanceekkk))
Redis:setex("iioooo" .. msg.sender_id.user_id,1200, true)
bot.sendText(msg.chat_id,msg.id, "⇜ استثمار ناجح 💰\n⇜ نسبة الربح ↢ "..hadddd.."%\n⇜ مبلغ الربح ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ فلوسك صارت ↢ ( "..convert_mony1.." جنيه 💵 )\n✦","md",true)
else
local hadddd = math.random(1,9);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set("boob"..msg.sender_id.user_id , math.floor(ballanceekkk))
Redis:setex("iioooo" .. msg.sender_id.user_id,1200, true)
bot.sendText(msg.chat_id,msg.id, "⇜ استثمار ناجح 💰\n⇜ نسبة الربح ↢ "..hadddd.."%\n⇜ مبلغ الربح ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ فلوسك صارت ↢ ( "..convert_mony1.." جنيه 💵 )\n✦","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'حظ' then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl("iiooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("iiooo" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك تلعب لعبة الحظ حاليا\n⇜ تعال بعد ( "..time.." دقيقة )","md",true)
end
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`حظ` المبلغ","md",true)
end

if text and text:match('^حظ (.*)$') then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^حظ (.*)$')
local coniss = coin(UserName)
if Redis:sismember("booob",msg.sender_id.user_id) then
if Redis:ttl("iiooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("iiooo" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك تلعب لعبة الحظ حاليا\n⇜ تعال بعد ( "..time.." دقيقة )","md",true)
end
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
local daddd = {"1", "2",}
local haddd = daddd[math.random(#daddd)]
if haddd == "1" then
local ballanceek = ballancee + coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceek)
Redis:set("boob"..msg.sender_id.user_id , math.floor(ballanceek))
Redis:setex("iiooo" .. msg.sender_id.user_id,900, true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك فزت بالحظ 🎉\n⇜ فلوسك قبل ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ فلوسك حاليا ↢ ( "..convert_mony1.." جنيه 💵 )\n✦","md",true)
else
local ballanceekk = ballancee - coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceekk)
Redis:set("boob"..msg.sender_id.user_id , math.floor(ballanceekk))
Redis:setex("iiooo" .. msg.sender_id.user_id,900, true)
bot.sendText(msg.chat_id,msg.id, "⇜ للاسف خسرت بالحظ 😬\n⇜ فلوسك قبل ↢ ( "..convert_mony.." جنيه 💵 )\n⇜ فلوسك حاليا ↢ ( "..convert_mony1.." جنيه 💵 )\n✦","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تحويل' then
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`تحويل` المبلغ","md",true)
end

if text and text:match('^تحويل (.*)$') then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` لكي تستطيع التحويل","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^تحويل (.*)$')
local coniss = coin(UserName)
if not Redis:sismember("booob",msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ","md",true)
end
if tonumber(coniss) < 100 then
return bot.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح به هو 100 جنيه \n✦","md",true)
end
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end

if tonumber(coniss) > tonumber(ballancee) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي\n✦","md",true)
end

Redis:set("transn"..msg.sender_id.user_id,coniss)
Redis:setex("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
bot.sendText(msg.chat_id,msg.id,[[
⇜ ارسل حاليا رقم الحساب البنكي الي تبي تحول له

– معاك دقيقة وحدة والغي طلب التحويل .
✦
]],"md",true)  
return false
end
if Redis:get("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
cccc = Redis:get("boobb"..msg.sender_id.user_id)
uuuu = Redis:get("bbobb"..msg.sender_id.user_id)
if text ~= text:match('^(%d+)$') then
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del("transn" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ ارسل رقم حساب بنكي ","md",true)
end
if text == cccc then
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del("transn" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك تحول لنفسك ","md",true)
end
if Redis:get("boballcc"..text) then
local UserNamey = Redis:get("transn"..msg.sender_id.user_id)
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
local fsvhhh = Redis:get("boballid"..text)
local bann = bot.getUser(fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد "
end
local fsvhh = Redis:get("boballban"..text)
UserNameyr = UserNamey / 10
UserNameyy = UserNamey - UserNameyr
local convert_mony = string.format("%.0f",UserNameyy)
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
deccde = ballancee - UserNamey
Redis:set("boob"..msg.sender_id.user_id , math.floor(deccde))
-----------
decdecb = Redis:get("boob"..fsvhhh) or 0
deccde2 = decdecb + UserNameyy
Redis:set("boob"..fsvhhh , math.floor(deccde2))

bot.sendText(msg.chat_id,msg.id, "حوالة صادرة من بنك فلاش\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nالحساب رقم : `"..text.."`\nنوع البطاقة : "..fsvhh.."\nخصمت 10% رسوم تحويل\nالمبلغ : "..convert_mony.." جنيه 💵","md",true)
bot.sendText(fsvhhh,0, "حوالة واردة من بنك فلاش\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..convert_mony.." جنيه 💵","md",true)
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del("transn" .. msg.sender_id.user_id)
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يوجده حساب بنكي كذا","md",true)
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del("transn" .. msg.sender_id.user_id)
end
end


if text == "ترتيبي" then
if Redis:sismember("booob",msg.sender_id.user_id) then
local bank_users = Redis:smembers("booob")
my_num_in_bank = {}
for k,v in pairs(bank_users) do
local mony = Redis:get("boob"..v)
table.insert(my_num_in_bank, {math.floor(tonumber(mony)) , v})
end
table.sort(my_num_in_bank, function(a, b) return a[1] > b[1] end)
for k,v in pairs(my_num_in_bank) do
if tonumber(v[2]) == tonumber(msg.sender_id.user_id) then
local mony = v[1]
return bot.sendText(msg.chat_id,msg.id,"⇜ ترتيبك ( "..k.." )","md",true)
end
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == "توب فلوس" or text == "توب الفلوس" then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local bank_users = Redis:smembers("booob")
if #bank_users == 0 then
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 30 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get("boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
}
for k,v in pairs(mony_list) do
if num <= 30 then
local user_name = bot.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." "..convert_mony.." 💵 ꗝ "..user_name.."\n"
end
end
top_monyy = top_mony.."\n\nاي اسم مخالف او غش باللعب راح يتصفر وينحظر اللاعب"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Barbi', url="t.me/B_L_Y"},
},
}
}
return bot.sendText(msg.chat_id,msg.id,top_monyy,"html",false, false, false, false, reply_markup)
end

if text == "توب الحراميه" or text == "توب الحرامية" or text == "توب حراميه" or text == "توب الزرف" or text == "توب زرف" then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local ty_users = Redis:smembers("rrfffid")
if #ty_users == 0 then
return bot.sendText(msg.chat_id,msg.id,"⇜ لا يوجد احد","md",true)
end
ty_anubis = "توب 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get("rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = bot.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
ty_anubis = ty_anubis..emoo.." "..convert_mony.." 💵 ꗝ "..user_name.."\n"
end
end
ty_anubiss = ty_anubis.."\n\nاي اسم مخالف او غش باللعب راح يتصفر وينحظر اللاعب"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Barbi', url="t.me/B_L_Y"},
},
}
}
return bot.sendText(msg.chat_id,msg.id,ty_anubiss,"html",false, false, false, false, reply_markup)
end

if text == 'تسديد قرضه' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
if Redis:sismember("booob",Remsg.sender_id.user_id) then
if Redis:get("kreed"..msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id, "⇜ سدد قرضك اول شي بعدين اعمل راعي النشامى ","md",true)
end
if not Redis:get("kreed"..Remsg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id, "⇜ ماعليه قرض","md",true)
else
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..Remsg.sender_id.user_id))
if tonumber(ballanceed) < tonumber(krses) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
nshme = ballanceed - krses
Redis:set("boob"..msg.sender_id.user_id,math.floor(nshme))
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
Redis:del("kreed"..Remsg.sender_id.user_id)
Redis:del("kreednum"..Remsg.sender_id.user_id)
local convert_mony = string.format("%.0f",ballanceed)
bot.sendText(msg.chat_id,msg.id, "⇜ اشعار تسديد قرض عن "..news.."\n\nالقرض : "..krses.." جنيه 💵\nتم اقتطاع المبلغ من فلوسك\nفلوسك حاليا : "..convert_mony.." جنيه 💵 ","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي ","md",true)
end
end

if text == 'تسديد قرض' or text == 'تسديد القرض' or text == 'تسديد قرضي' and tonumber(msg.reply_to_message_id) == 0 then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender_id.user_id) then
if not Redis:get("kreed"..msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id, "⇜ ماعليك قرض ","md",true)
end
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if tonumber(ballanceed) < tonumber(krses) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
tsded = ballanceed - krses
Redis:set("boob"..msg.sender_id.user_id,math.floor(tsded))
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
Redis:del("kreed"..msg.sender_id.user_id)
Redis:del("kreednum"..msg.sender_id.user_id)
local convert_mony = string.format("%.0f",ballanceed)
bot.sendText(msg.chat_id,msg.id, "⇜ اشعار تسديد قرض\n\nالقرض : "..krses.." جنيه 💵\nتم اقتطاع المبلغ من فلوسك\nفلوسك حاليا : "..convert_mony.." جنيه 💵","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'القرض' or text == 'قرض' then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id, "⇜ سحبت قرض قبل بقيمة "..krses.." جنيه 💵","md",true)
end
if Redis:sismember("booob",msg.sender_id.user_id) then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(ballanceed) < 100000 then
kredd = tonumber(ballanceed) + 900000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,900000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 900000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 200000 then
kredd = tonumber(ballanceed) + 800000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,800000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 800000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 300000 then
kredd = tonumber(ballanceed) + 700000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,700000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 700000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 400000 then
kredd = tonumber(ballanceed) + 600000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,600000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 600000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 500000 then
kredd = tonumber(ballanceed) + 500000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,500000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 500000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 600000 then
kredd = tonumber(ballanceed) + 400000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,400000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 400000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 700000 then
kredd = tonumber(ballanceed) + 300000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,300000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 300000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 800000 then
kredd = tonumber(ballanceed) + 200000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,200000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 200000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 900000 then
kredd = tonumber(ballanceed) + 100000
Redis:set("boob"..msg.sender_id.user_id,kredd)
Redis:set("kreednum"..msg.sender_id.user_id,100000)
Redis:set("kreed"..msg.sender_id.user_id,true)
bot.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 100000 جنيه 💵","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك فوق المليون مايطلعلك قرض","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'بخشيش' or text == 'بقشيش' then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender_id.user_id) then
if Redis:ttl("iioo" .. msg.sender_id.user_id) >=1 then
local hours = Redis:ttl("iioo" .. msg.sender_id.user_id) / 60
return bot.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بخشيش استنى "..math.floor(hours).." دقيقة","md",true)
end

local jjjo = math.random(200,1000);
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
bakigcj = ballanceed + jjjo
Redis:set("boob"..msg.sender_id.user_id , bakigcj)
bot.sendText(msg.chat_id,msg.id,"⇜ دلعتك اديتك بخشيش "..jjjo.." جنيه 💵","md",true)
Redis:setex("iioo" .. msg.sender_id.user_id,600, true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'زرف' and tonumber(msg.reply_to_message_id) == 0 then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زرف` بالرد","md",true)
end

if text == 'زرف' or text == 'زرفو' or text == 'زرفه' and tonumber(msg.reply_to_message_id) ~= 0 then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender_id.user_id) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ عايز تزرف نفسك 🤡*","md",true)  
return false
end
if Redis:ttl("polic" .. msg.sender_id.user_id) >= 280 then
return bot.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 5 دقائق )","md",true)
elseif Redis:ttl("polic" .. msg.sender_id.user_id) >= 240 then
return bot.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 4 دقائق )","md",true)
elseif Redis:ttl("polic" .. msg.sender_id.user_id) >= 180 then
return bot.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 3 دقائق )","md",true)
elseif Redis:ttl("polic" .. msg.sender_id.user_id) >= 120 then
return bot.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 2 دقيقة )","md",true)
elseif Redis:ttl("polic" .. msg.sender_id.user_id) >= 60 then
return bot.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 1 دقيقة )","md",true)
end
if Redis:ttl("hrame" .. Remsg.sender_id.user_id) >= 60 then
local time = Redis:ttl("hrame" .. Remsg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ الشخص مزروف من شويه\n⇜ يمكنك تزرفه بعد ( "..time.." دقيقة )","md",true)
end
if Redis:sismember("booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
if tonumber(ballanceed) < 199 then
return bot.sendText(msg.chat_id,msg.id, "⇜ لا يمكنك تزرفه فلوسه اقل من 200 جنيه 💵","md",true)
end
local hrame = math.floor(math.random() * 200) + 1;
local hramee = math.floor(math.random() * 5) + 1;
if hramee == 1 or hramee == 2 or hramee == 3 or hramee == 4 then
local ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get("boob"..msg.sender_id.user_id) or 0
zrfne = ballanceed - hrame
zrfnee = ballancope + hrame
Redis:set("boob"..msg.sender_id.user_id , math.floor(zrfnee))
Redis:set("boob"..Remsg.sender_id.user_id , math.floor(zrfne))
Redis:setex("hrame" .. Remsg.sender_id.user_id,900, true)
local zoropeo = Redis:get("rrfff"..msg.sender_id.user_id) or 0
zoroprod = zoropeo + hrame
Redis:set("rrfff"..msg.sender_id.user_id,zoroprod)
Redis:sadd("rrfffid",msg.sender_id.user_id)
bot.sendText(msg.chat_id,msg.id, "⇜ خذ يالحرامي زرفته "..hrame.." جنيه 💵\n✦","md",true)
else
Redis:setex("polic" .. msg.sender_id.user_id,300, true)
bot.sendText(msg.chat_id,msg.id, "⇜ مسكتك الشرطة وانتا تزرف 🚔\n✦","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي ","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'راتب' or text == 'راتبي' then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender_id.user_id) then
if Redis:ttl("iiioo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("iiioo" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ راتبك بينزل بعد ( "..time.." ثانية )","md",true)
end

local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if Descriptioont == "1" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : كابتن كريم 🚙\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "2" then
local ratpep = ballancee + 3500
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 جنيه 💵\nوظيفتك : شرطي 👮🏻‍♂️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "3" then
local ratpep = ballancee + 3500
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 جنيه 💵\nوظيفتك : بياع حبوب 🍻\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "4" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : سواق تاكسي 🚕\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "5" then
local ratpep = ballancee + 5000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 جنيه 💵\nوظيفتك : قاضي 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "6" then
local ratpep = ballancee + 2500
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2500 جنيه 💵\nوظيفتك : نوم 🛌\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "7" then
local ratpep = ballancee + 2700
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2700 جنيه 💵\nوظيفتك : مغني 🎤\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "8" then
local ratpep = ballancee + 2900
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2900 جنيه 💵\nوظيفتك : كوفيره 💆\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "9" then
local ratpep = ballancee + 2500
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2500 جنيه 💵\nوظيفتك : ربة منزل 🤷\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "10" then
local ratpep = ballancee + 2900
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2900 جنيه 💵\nوظيفتك : مربيه اطفال 💁\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "11" then
local ratpep = ballancee + 3700
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3700 جنيه 💵\nوظيفتك : كهربائي 💡\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "12" then
local ratpep = ballancee + 3600
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3600 جنيه 💵\nوظيفتك : نجار ⛏\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "13" then
local ratpep = ballancee + 2400
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2400 جنيه 💵\nوظيفتك : متذوق طعام 🍕\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "14" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : فلاح 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "15" then
local ratpep = ballancee + 5000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 جنيه 💵\nوظيفتك : كاشير بنده 🙋\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "16" then
local ratpep = ballancee + 6000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 جنيه 💵\nوظيفتك : ممرض 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "17" then
local ratpep = ballancee + 3100
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3100 جنيه 💵\nوظيفتك : مهرج 🤹\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "18" then
local ratpep = ballancee + 3300
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3300 جنيه 💵\nوظيفتك : عامل توصيل 🚴\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "19" then
local ratpep = ballancee + 4800
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4800 جنيه 💵\nوظيفتك : عسكري 👮\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "20" then
local ratpep = ballancee + 6000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 جنيه 💵\nوظيفتك : مهندس 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "21" then
local ratpep = ballancee + 8000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 8000 جنيه 💵\nوظيفتك : وزير 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "22" then
local ratpep = ballancee + 5500
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5500 جنيه 💵\nوظيفتك : محامي ⚖️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "23" then
local ratpep = ballancee + 5500
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5500 جنيه 💵\nوظيفتك : تاجر 💵\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "24" then
local ratpep = ballancee + 7000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7000 جنيه 💵\nوظيفتك : دكتور 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "25" then
local ratpep = ballancee + 2600
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2600 جنيه 💵\nوظيفتك : حفار قبور ⚓\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "26" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : حلاق ✂\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "27" then
local ratpep = ballancee + 5000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 جنيه 💵\nوظيفتك : إمام مسجد 📿\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "28" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : صياد 🎣\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "29" then
local ratpep = ballancee + 2300
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2300 جنيه 💵\nوظيفتك : خياط 🧵\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "30" then
local ratpep = ballancee + 7100
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7100 جنيه 💵\nوظيفتك : طيار 🛩\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "31" then
local ratpep = ballancee + 5300
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5300 جنيه 💵\nوظيفتك : مودل 🕴\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "32" then
local ratpep = ballancee + 10000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 10000 جنيه 💵\nوظيفتك : ملك 👑\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "33" then
local ratpep = ballancee + 2700
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2700 جنيه 💵\nوظيفتك : سباك 🔧\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "34" then
local ratpep = ballancee + 3900
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3900 جنيه 💵\nوظيفتك : موزع 🗺\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "35" then
local ratpep = ballancee + 4100
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4100 جنيه 💵\nوظيفتك : سكيورتي 👮\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "36" then
local ratpep = ballancee + 3500
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 جنيه 💵\nوظيفتك : معلم شاورما 🌯\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه ??","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "37" then
local ratpep = ballancee + 6700
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6700 جنيه 💵\nوظيفتك : دكتور ولاده 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "38" then
local ratpep = ballancee + 6600
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6600 جنيه 💵\nوظيفتك : مذيع 🗣\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "39" then
local ratpep = ballancee + 3400
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3400 جنيه 💵\nوظيفتك : عامل مساج 💆\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "40" then
local ratpep = ballancee + 6300
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6300 جنيه 💵\nوظيفتك : ممثل 🤵\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "41" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : جزار 🥩\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "42" then
local ratpep = ballancee + 7000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7000 جنيه 💵\nوظيفتك : مدير بنك 💳\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "43" then
local ratpep = ballancee + 6000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 جنيه 💵\nوظيفتك : مبرمج 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "44" then
local ratpep = ballancee + 5000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 جنيه 💵\nوظيفتك : رقاصه 💃\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "45" then
local ratpep = ballancee + 4900
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4900 جنيه 💵\nوظيفتك : 👩🏼‍💻 صحفي\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "46" then
local ratpep = ballancee + 5300
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5300 جنيه 💵\nوظيفتك : 🥷 حرامي\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "47" then
local ratpep = ballancee + 6000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 جنيه 💵\nوظيفتك : 🔮 ساحر\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "48" then
local ratpep = ballancee + 6500
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6500 جنيه 💵\nوظيفتك : ⚽ لاعب️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "49" then
local ratpep = ballancee + 4000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4000 جنيه 💵\nوظيفتك : 🖼 مصور\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "50" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : ☎️ عامل مقسم\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "51" then
local ratpep = ballancee + 3200
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3200 جنيه 💵\nوظيفتك : 📖 كاتب\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "52" then
local ratpep = ballancee + 4000
Redis:set("boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4000 جنيه 💵\nوظيفتك : 🧪 مخبري\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex("iiioo" .. msg.sender_id.user_id,600, true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'هجوم' then
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`هجوم` المبلغ ( بالرد )","md",true)
end
if text and text:match("^هجوم (%d+)$") and msg.reply_to_message_id == 0 then
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`هجوم` المبلغ ( بالرد )","md",true)
end

if text and text:match('^هجوم (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^هجوم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender_id.user_id) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ تهاجم نفسك 🤡*","md",true)  
return false
end
if Redis:ttl("attack" .. msg.sender_id.user_id) >= 60 then
  local time = Redis:ttl("attack" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ خسرت بأخر معركة استنى ( "..time.." دقيقة )","md",true)
end
if Redis:ttl("defen" .. Remsg.sender_id.user_id) >= 60 then
local time = Redis:ttl("defen" .. Remsg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ الخصم خسر بأخر معركة\n⇜ يمكنك تهاجمه بعد ( "..time.." دقيقة )","md",true)
end
if Redis:sismember("booob",Remsg.sender_id.user_id) then
ballancope = Redis:get("boob"..msg.sender_id.user_id) or 0
ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
if tonumber(ballancope) < 100000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ لا يمكنك تهجم فلوسك اقل من 100000 جنيه 💵","md",true)
end
if tonumber(ballanceed) < 100000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ لا يمكنك تهجم عليه فلوسه اقل من 100000 جنيه 💵","md",true)
end
if tonumber(coniss) < 9999 then
return bot.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 10000 جنيه 💵\n✦","md",true)
end
if tonumber(ballancope) < tonumber(coniss) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
if tonumber(ballanceed) < tonumber(coniss) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسه لا تكفي \n✦","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local bann = bot.getUser(Remsg.sender_id.user_id)
if bann.first_name then
neewss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
neewss = " لا يوجد "
end
if Descriptioont == "1" or Descriptioont == "3" then
local ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get("boob"..msg.sender_id.user_id) or 0
zrfne = ballancope - coniss
zrfnee = ballanceed + coniss
Redis:set("boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set("boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex("attack" .. msg.sender_id.user_id,600, true)
local convert_mony = string.format("%.0f",coniss)
bot.sendText(msg.chat_id,msg.id, "⇜ لقد خسرت في المعركة "..neews.." 🛡\nالفائز : "..neewss.."\nالخاسر : "..neews.."\nالجائزة : "..convert_mony.." جنيه 💵\n✦","md",true)
elseif Descriptioont == "2" or Descriptioont == "4" or Descriptioont == "5" or  Descriptioont == "6" or Descriptioont == "8" then
local ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get("boob"..msg.sender_id.user_id) or 0
begaatt = Redis:get("numattack"..msg.sender_id.user_id) or 1000
numattackk = tonumber(begaatt) - 1
if numattackk == 0 then
numattackk = 1
end
attack = coniss / numattackk
zrfne = ballancope + math.floor(attack)
zrfnee = ballanceed - math.floor(attack)
Redis:set("boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set("boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex("defen" .. Remsg.sender_id.user_id,1800, true)
Redis:set("numattack"..msg.sender_id.user_id , math.floor(numattackk))
local convert_mony = string.format("%.0f",math.floor(attack))
bot.sendText(msg.chat_id,msg.id, "⇜ لقد فزت في المعركة\nودمرت قلعة "..neewss.." 🏰\nالفائز : "..neews.."\nالخاسر : "..neewss.."\nالجائزة : "..convert_mony.." جنيه 💵\nنسبة قوة المهاجم اصبحت "..numattackk.." 🩸\n✦","md",true)
elseif Descriptioont == "7" then
local ballanceed = Redis:get("boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get("boob"..msg.sender_id.user_id) or 0
halfzrf = coniss / 2
zrfne = ballancope - halfzrf
zrfnee = ballanceed + halfzrf
Redis:set("boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set("boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex("attack" .. msg.sender_id.user_id,600, true)
local convert_mony = string.format("%.0f",math.floor(halfzrf))
bot.sendText(msg.chat_id,msg.id, "⇜ لقد خسرت في المعركة "..neews.." 🛡\nولكن استطعت اعادة نصف الموارد\nالفائز : "..neewss.."\nالخاسر : "..neews.."\nالجائزة : "..convert_mony.." جنيه 💵\n✦","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي ","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مسح لعبه الزواج' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
local zwag_users = Redis:smembers("roogg1")
for k,v in pairs(zwag_users) do
Redis:del("roog1"..v)
Redis:del("rooga1"..v)
Redis:del("rahr1"..v)
Redis:del("rahrr1"..v)
Redis:del("roogte1"..v)
end
local zwaga_users = Redis:smembers("roogga1")
for k,v in pairs(zwaga_users) do
Redis:del("roog1"..v)
Redis:del("rooga1"..v)
Redis:del("rahr1"..v)
Redis:del("rahrr1"..v)
Redis:del("roogte1"..v)
end
Redis:del("roogga1")
Redis:del("roogg1")
bot.sendText(msg.chat_id,msg.id, "⇜ مسحت لعبه الزواج","md",true)
end
end
if text == 'زواج' then
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زواج` المهر","md",true)
end
if text and text:match("^زواج (%d+)$") and msg.reply_to_message_id == 0 then
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زواج` المهر ( بالرد )","md",true)
end
if text and text:match("^زواج (.*)$") and msg.reply_to_message_id ~= 0 then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^زواج (.*)$')
local coniss = coin(UserName)
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ زوجتك نفسي 🤣😒*","md",true)  
return false
end
if tonumber(coniss) < 10000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح به هو 10000 جنيه \n✦","md",true)
end
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 10000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
if tonumber(coniss) > tonumber(ballancee) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي\n✦","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ مش الزواج*","md",true)  
return false
end
if Redis:get("roog1"..msg.sender_id.user_id) then
bot.sendText(msg.chat_id,msg.id, "⇜ انت بالفعل متزوج !!","md",true)
return false
end
if Redis:get("rooga1"..msg.sender_id.user_id) then
bot.sendText(msg.chat_id,msg.id, "⇜ انت بالفعل متزوج !!","md",true)
return false
end
if Redis:get("roog1"..Remsg.sender_id.user_id) then
bot.sendText(msg.chat_id,msg.id, "⇜ ابعد بعيد متلفش وتدور حول المتزوجين","md",true)
return false
end
if Redis:get("rooga1"..Remsg.sender_id.user_id) then
bot.sendText(msg.chat_id,msg.id, "⇜ ابعد بعيد متلفش وتدور حول المتزوجين","md",true)
return false
end
local bandd = bot.getUser(msg.sender_id.user_id)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
if Redis:sismember("booob",msg.sender_id.user_id) then
local hadddd = tonumber(coniss)
ballanceekk = tonumber(coniss) / 100 * 15
ballanceekkk = tonumber(coniss) - ballanceekk
local convert_mony = string.format("%.0f",ballanceekkk)
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
ballanceea = Redis:get("boob"..Remsg.sender_id.user_id) or 0
zogtea = ballanceea + ballanceekkk
zeugh = ballancee - tonumber(coniss)
Redis:set("boob"..msg.sender_id.user_id , math.floor(zeugh))
Redis:set("boob"..Remsg.sender_id.user_id , math.floor(zogtea))
Redis:sadd("roogg1",msg.sender_id.user_id)
Redis:sadd("roogga1",Remsg.sender_id.user_id)
Redis:set("roog1"..msg.sender_id.user_id,msg.sender_id.user_id)
Redis:set("rooga1"..msg.sender_id.user_id,Remsg.sender_id.user_id)
Redis:set("roogte1"..Remsg.sender_id.user_id,Remsg.sender_id.user_id)
Redis:set("rahr1"..msg.sender_id.user_id,tonumber(coniss))
Redis:set("rahr1"..Remsg.sender_id.user_id,tonumber(coniss))
Redis:set("roog1"..Remsg.sender_id.user_id,msg.sender_id.user_id)
Redis:set("rahrr1"..msg.sender_id.user_id,math.floor(ballanceekkk))
Redis:set("rooga1"..Remsg.sender_id.user_id,Remsg.sender_id.user_id)
Redis:set("rahrr1"..Remsg.sender_id.user_id,math.floor(ballanceekkk))
bot.sendText(msg.chat_id,msg.id, "كولولولولويششش\nاليوم عقدنا قران :\n\nالزوج "..neews.." 🤵🏻\n   💗\nالزوجة "..newws.." 👰🏻‍♀️\nالمهر : "..convert_mony.." جنيه بعد الضريبة 15%\nعشان تشوفون وثيقة زواجكم اكتبوا : *زواجي*","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == "توب زواج" or text == "توب متزوجات" or text == "توب زوجات" or text == "توب زواجات" or text == "زواجات" or text == "الزواجات" then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
  local zwag_users = Redis:smembers("roogg1")
  if #zwag_users == 0 then
  return bot.sendText(msg.chat_id,msg.id,"⇜ لا يوجد زواجات حاليا","md",true)
  end
  top_zwag = "توب 30 اغلى زواجات :\n\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get("rahr1"..v)
  local zwga = Redis:get("rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 30 then
  local zwg_name = bot.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
  local zwga_name = bot.getUser(v[3]).first_name or Redis:get(v[3].."first_name:") or "لا يوجد اسم"
  local mahr = v[1]
  local convert_mony = string.format("%.0f",mahr)
  local emo = zwag_emoji[k]
  znum = znum + 1
  top_zwag = top_zwag..emo.." "..convert_mony.." 💵 ꗝ "..zwg_name.." 👫 "..zwga_name.."\n"
  end
  end
  local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Barbi', url="t.me/B_L_Y"},
},
}
}
return bot.sendText(msg.chat_id,msg.id,top_zwag,"html",false, false, false, false, reply_markup)
  end

if text == 'زواجي' then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("roogg1",msg.sender_id.user_id) or Redis:sismember("roogga1",msg.sender_id.user_id) then
local zoog = Redis:get("roog1"..msg.sender_id.user_id)
local zooga = Redis:get("rooga1"..msg.sender_id.user_id)
local mahr = Redis:get("rahr1"..msg.sender_id.user_id)
local convert_mony = string.format("%.0f",mahr)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
bot.sendText(msg.chat_id,msg.id, "وثيقة الزواج حقتك :\n\nالزوج "..neews.." 🤵🏻\nالزوجة "..newws.." 👰🏻‍♀️\nالمهر : "..convert_mony.." جنيه 💵","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت اعزب","md",true)
end
end

if text == 'زوجها' or text == "زوجته" or text == "جوزها" or text == "زوجتو" or text == "زواجه" and msg.reply_to_message_id ~= 0 then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ لا تكشف نفسك وتخسر فلوس عالفاضي\n اكتب `زواجي`*","md",true)  
return false
end
if Redis:sismember("roogg1",Remsg.sender_id.user_id) or Redis:sismember("roogga1",Remsg.sender_id.user_id) then
if Redis:sismember("booob",msg.sender_id.user_id) then
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*⇜ هذا الشخص غير متزوج*","md",true)  
return false
end
local zoog = Redis:get("roog1"..Remsg.sender_id.user_id)
local zooga = Redis:get("rooga1"..Remsg.sender_id.user_id)
local mahr = Redis:get("rahr1"..Remsg.sender_id.user_id)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
local otheka = ballancee - 100
local convert_mony = string.format("%.0f",mahr)
Redis:set("boob"..msg.sender_id.user_id , math.floor(otheka))
bot.sendText(msg.chat_id,msg.id, "وثيقة الزواج حقته :\n\nالزوج "..neews.." 🤵🏻\nالزوجة "..newws.." 👰🏻‍♀️\nالمهر : "..convert_mony.." جنيه 💵","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ مسكين اعزب مش متزوج","md",true)
end
end

if text == 'طلاق' then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("roogg1",msg.sender_id.user_id) or Redis:sismember("roogga1",msg.sender_id.user_id) then
local zoog = Redis:get("roog1"..msg.sender_id.user_id)
local zooga = tonumber(Redis:get("rooga1"..msg.sender_id.user_id))
if tonumber(zoog) == msg.sender_id.user_id then
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
Redis:srem("roogg1", msg.sender_id.user_id)
Redis:srem("roogga1", msg.sender_id.user_id)
Redis:del("roog1"..msg.sender_id.user_id)
Redis:del("rooga1"..msg.sender_id.user_id)
Redis:del("rahr1"..msg.sender_id.user_id)
Redis:del("rahrr1"..msg.sender_id.user_id)
Redis:srem("roogg1", zooga)
Redis:srem("roogga1", zooga)
Redis:del("roog1"..zooga)
Redis:del("rooga1"..zooga)
Redis:del("rahr1"..zooga)
Redis:del("rahrr1"..zooga)
return bot.sendText(msg.chat_id,msg.id, "⇜ تم طلاقك من زوجتك "..newws.."","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ الطلاق للزوج فقط","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت اعزب","md",true)
end
end
if text == 'خلع' then
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("roogg1",msg.sender_id.user_id) or Redis:sismember("roogga1",msg.sender_id.user_id) then
local zoog = Redis:get("roog1"..msg.sender_id.user_id)
local zooga = Redis:get("rooga1"..msg.sender_id.user_id)
if tonumber(zooga) == msg.sender_id.user_id then
local mahrr = Redis:get("rahrr1"..msg.sender_id.user_id)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
ballancee = Redis:get("boob"..zoog) or 0
kalea = ballancee + mahrr
Redis:set("boob"..zoog , kalea)
local convert_mony = string.format("%.0f",mahrr)
bot.sendText(msg.chat_id,msg.id, "⇜ خلعت زوجك "..neews.."\n⇜ ورجعت له المهر ( "..convert_mony.." جنيه 💵 )","md",true)
Redis:srem("roogg1", zoog)
Redis:srem("roogga1", zoog)
Redis:del("roog1"..zoog)
Redis:del("rooga1"..zoog)
Redis:del("rahr1"..zoog)
Redis:del("rahrr1"..zoog)
Redis:srem("roogg1", msg.sender_id.user_id)
Redis:srem("roogga1", msg.sender_id.user_id)
Redis:del("roog1"..msg.sender_id.user_id)
Redis:del("rooga1"..msg.sender_id.user_id)
Redis:del("rahr1"..msg.sender_id.user_id)
Redis:del("rahrr1"..msg.sender_id.user_id)
else
bot.sendText(msg.chat_id,msg.id, "⇜ الخلع للزوجات فقط","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت اعزب","md",true)
end
end
if text == 'مراهنه' or text == 'مراهنة' then
bot.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`مراهنه` المبلغ","md",true)
end
if text and text:match('^مراهنه (.*)$') or text and text:match('^مراهنة (.*)$') then
local UserName = text:match('^مراهنه (.*)$') or text:match('^مراهنة (.*)$')
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local coniss = coin(UserName)
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return bot.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
Redis:del(MisTiri..'List_rhan'..msg.chat_id)  
Redis:set(MisTiri.."playerrhan"..msg.chat_id,msg.sender_id.user_id)
Redis:set(MisTiri.."playercoins"..msg.chat_id..msg.sender_id.user_id,coniss)
Redis:set(MisTiri.."raeahkam"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(MisTiri..'List_rhan'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(MisTiri.."Start_rhan"..msg.chat_id,3600,true)
Redis:set(MisTiri.."allrhan"..msg.chat_id..12345 , coniss)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
rehan = tonumber(ballancee) - tonumber(coniss)
Redis:set("boob"..msg.sender_id.user_id , rehan)
return bot.sendText(msg.chat_id,msg.id,"• تم بدء المراهنة وتم تسجيلك \n• اللي بده يشارك يرسل ( انا والمبلغ ) .","md",true)
end
if text == 'نعم' and Redis:get(MisTiri.."Witting_Startrhan"..msg.chat_id) then
rarahkam = Redis:get(MisTiri.."raeahkam"..msg.chat_id)
if tonumber(rarahkam) == msg.sender_id.user_id then
local list = Redis:smembers(MisTiri..'List_rhan'..msg.chat_id) 
if #list == 1 then 
return bot.sendText(msg.chat_id,msg.id,"• عذراً لم يشارك احد بالرهان","md",true)  
end 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
else
ls = '@['..UserId_Info.username..']'
end
benrahan = Redis:get(MisTiri.."allrhan"..msg.chat_id..12345) or 0
local ballancee = Redis:get("boob"..UserName) or 0
rehan = tonumber(ballancee) + tonumber(benrahan)
Redis:set("boob"..UserName , rehan)

local rhan_users = Redis:smembers(MisTiri.."List_rhan"..msg.chat_id)
for k,v in pairs(rhan_users) do
Redis:del(MisTiri..'playercoins'..msg.chat_id..v)
end
Redis:del(MisTiri..'allrhan'..msg.chat_id..12345) 
Redis:del(MisTiri..'playerrhan'..msg.chat_id) 
Redis:del(MisTiri..'raeahkam'..msg.chat_id) 
Redis:del(MisTiri..'List_rhan'..msg.chat_id) 
Redis:del(MisTiri.."Witting_Startrhan"..msg.chat_id)
Redis:del(MisTiri.."Start_rhan"..msg.chat_id)
local ballancee = Redis:get("boob"..UserName) or 0
local convert_mony = string.format("%.0f",benrahan)
local convert_monyy = string.format("%.0f",ballancee)
return bot.sendText(msg.chat_id,msg.id,'⇜ فاز '..ls..' بالرهان 🎊\nالمبلغ : '..convert_mony..' جنيه 💵\nرصيدك حاليا : '..convert_monyy..' جنيه 💵\n✦',"md",true)
end
end
if text == 'كنز' then
ballanceed = Redis:get("boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender_id.user_id))
if Redis:get("kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return bot.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = bot.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender_id.user_id) then
if Redis:ttl("yiioooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("yiioooo" .. msg.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,"⇜ فرصة ايجاد كنز آخر بعد ( "..time.." دقيقة )","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22","23",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
if Descriptioont == "1" then
local knez = ballancee + 40000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : قطعة اثرية 🗳\nسعره : 40000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "2" then
local knez = ballancee + 35000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : حجر الليدري 💎\nسعره : 35000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "3" then
local knez = ballancee + 10000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : لباس قديم 🥻\nسعره : 10000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "4" then
local knez = ballancee + 23000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : عصى سحرية 🪄\nسعره : 23000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "5" then
local knez = ballancee + 8000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جوال نوكيا 📱\nسعره : 8000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "6" then
local knez = ballancee + 27000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : صدف 🏝\nسعره : 27000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "7" then
local knez = ballancee + 18000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : ابريق صدئ ⚗️\nسعره : 18000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "8" then
local knez = ballancee + 100000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : قناع فرعوني 🗿\nسعره : 100000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "9" then
local knez = ballancee + 50000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جرة ذهب 💰\nسعره : 50000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "10" then
local knez = ballancee + 36000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : مصباح فضي 🔦\nسعره : 36000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "11" then
local knez = ballancee + 29000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : لوحة نحاسية 🌇\nسعره : 29000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "12" then
local knez = ballancee + 1000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جوارب قديمة 🧦\nسعره : 1000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "13" then
local knez = ballancee + 16000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : اناء فخاري ⚱️\nسعره : 16000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "14" then
local knez = ballancee + 12000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : خوذة محارب 🪖\nسعره : 12000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "15" then
local knez = ballancee + 19000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : سيف جدي مرزوق 🗡\nسعره : 19000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "16" then
local knez = ballancee + 14000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : مكنسة جدتي رقية 🧹\nسعره : 14000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "17" then
local knez = ballancee + 26000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : فأس ارطغرل 🪓\nسعره : 26000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "18" then
local knez = ballancee + 22000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : بندقية 🔫\nسعره : 22000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "19" then
local knez = ballancee + 11000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : كبريت ناري 🪔\nسعره : 11000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "20" then
local knez = ballancee + 33000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : فرو ثعلب 🦊\nسعره : 33000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "21" then
local knez = ballancee + 40000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جلد تمساح 🐊\nسعره : 40000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "22" then
local knez = ballancee + 17000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : باقة ورود 💐\nسعره : 17000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "23" then
local Textinggtt = {"1", "2",}
local Descriptioontt = Textinggtt[math.random(#Textinggtt)]
if Descriptioontt == "1" then
local knez = ballancee + 17000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : باقة ورود 💐\nسعره : 17000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioontt == "2" then
local Textinggttt = {"1", "2",}
local Descriptioonttt = Textinggttt[math.random(#Textinggttt)]
if Descriptioonttt == "1" then
local knez = ballancee + 40000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جلد تمساح 🐊\nسعره : 40000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioonttt == "2" then
local knez = ballancee + 10000000
Redis:set("boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : حقيبة محاسب البنك 💼\nسعره : 10000000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex("yiioooo" .. msg.sender_id.user_id,1800, true)
end
end
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^حظر حساب (.*)$') then
local UserName = text:match('^حظر حساب (.*)$')
local coniss = coin(UserName)
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
Redis:set("bandid"..coniss,coniss)
bot.sendText(msg.chat_id,msg.id, "⇜ تم حظر الحساب "..coniss.." من لعبة البنك\n✦","md",true)
end
end
if text and text:match('^الغاء حظر حساب (.*)$') then
local UserName = text:match('^الغاء حظر حساب (.*)$')
local coniss = coin(UserName)
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
Redis:del("bandid"..coniss)
bot.sendText(msg.chat_id,msg.id, "⇜ تم الغاء حظر الحساب "..coniss.." من لعبة البنك\n✦","md",true)
end
end
if text and text:match('^اضف كوبون (.*)$') then
local UserName = text:match('^اضف كوبون (.*)$')
local coniss = coin(UserName)
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
numcobo = math.random(1000000000000,9999999999999);
Redis:set("cobonum"..numcobo,numcobo)
Redis:set("cobon"..numcobo,coniss)
bot.sendText(msg.chat_id,msg.id, "⇜ وصل كوبون \n\nالمبلغ : "..coniss.." جنيه 💵\nرقم الكوبون : `"..numcobo.."`\n\n⇜ طريقة استخدام الكوبون :\nتكتب ( كوبون + رقمه )\nمثال : كوبون 4593875\n✦","md",true)
end
end
if text == "كوبون" or text == "الكوبون" then
bot.sendText(msg.chat_id,msg.id, "⇜ طريقة استخدام الكوبون :\nتكتب ( كوبون + رقمه )\nمثال : كوبون 4593875\n\n- ملاحظة : الكوبون يستخدم لمرة واحدة ولشخص واحد\n✦","md",true)
end
if text and text:match('^كوبون (.*)$') then
local UserName = text:match('^كوبون (.*)$')
local coniss = coin(UserName)
if Redis:sismember("booob",msg.sender_id.user_id) then
cobnum = Redis:get("cobonum"..coniss)
if coniss == tonumber(cobnum) then
cobblc = Redis:get("cobon"..coniss)
ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
cobonplus = ballancee + cobblc
Redis:set("boob"..msg.sender_id.user_id , cobonplus)
local ballancee = Redis:get("boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:del("cobon"..coniss)
Redis:del("cobonum"..coniss)
bot.sendText(msg.chat_id,msg.id, "⇜ وصل كوبون \n\nالمبلغ : "..cobblc.." جنيه 💵\nرقم الكوبون : `"..coniss.."`\nفلوسك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
else
bot.sendText(msg.chat_id,msg.id, "⇜ لا يوجد كوبون بهذا الرقم `"..coniss.."`\n✦","md",true)
end
else
bot.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ","md",true)
end
end
if text == "توب" or text == "التوب" then
local toptop = "⇜ اهلين فيك في قوائم التوب\nللمزيد من التفاصيل - [@B_L_Y]\n✦"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الزرف', data = msg.sender_id.user_id..'/topzrf'},{text = 'الفلوس', data = msg.sender_id.user_id..'/topmon'},
},
{
{text = 'Barbi', url="t.me/B_L_Y"},
},
}
}
return bot.sendText(msg.chat_id,msg.id,toptop,"md",false, false, false, false, reply_markup)
end



--------------
--callback
-------------
if Text and Text:match('(%d+)/topzrf') then
local UserId = Text:match('(%d+)/topzrf')
if tonumber(IdUser) == tonumber(UserId) then
local ty_users = Redis:smembers("rrfffid")
if #ty_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد احد","md",true)
end
ty_anubis = "توب 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get("rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = bot.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
ty_anubis = ty_anubis..emoo.." "..convert_mony.." 💵 | "..user_name.."\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Barbi',url="t.me/B_L_Y"}, 
},
}
}
edit(ChatId,Msg_id,ty_anubis, 'html', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/topmon') then
local UserId = Text:match('(%d+)/topmon')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local bank_users = Redis:smembers("booob")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 20 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get("boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." "..convert_mony.." 💵 | "..user_name.."\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Barbi',url="t.me/B_L_Y"}, 
},
}
}
edit(ChatId,Msg_id,top_mony, 'html', true, false, reply_markup)
end
end