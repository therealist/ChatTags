--Chat Tags by Tyguy
CreateClientConVar("chat_tags_color_r", 255, true, false)
CreateClientConVar("chat_tags_color_g", 255, true, false)
CreateClientConVar("chat_tags_color_b", 255, true, false)
CreateClientConVar("chat_tags_color_a", 255, true, false)

local Tags = 
{
--Group    --Tag     --Color
{"admin", "[ADMIN] ", Color(0, 100, 255, 255) },
{"superadmin", "[SERVER ADMIN] ", Color(0, 200, 255, 255) },
{"owner", "[OWNER] ", Color(255, 200, 0, 255) },
{"moderator", "[MODERATOR] ", Color(255, 0, 0, 255) },
{"operator", "[OPERATOR] ", Color(0, 150, 0, 255) },
{"donator", "[DONATOR] ", Color(0, 200, 75, 255) },
{"vip", "[VIP] ", Color(50, 200, 0, 255) },
{"stream", "[STREAMER] ", Color(0, 255, 0, 255) },
{"dumbass", "[DUMB ASS] ", Color(0, 255, 0, 255) },
{"wizard", "[SERVER WIZARD] ", Color(0, 200, 255, 255) }
}

hook.Add("OnPlayerChat", "Tags", function(ply, strText, bTeamOnly)
	for k,v in pairs(Tags) do
	if not ply:IsValid() then return end
	if not ply:IsPlayer() then return end
	if not ply:Alive() then
		ded = "*DEAD* "
	else
		ded = ""
	end
		if not ply:IsPlayer() then return end
		if ply:IsUserGroup(v[1]) then
			local R = 255
			local G = 255
			local B = 255
			local A = 255
			local nickteam = team.GetColor(ply:Team())
				if !bTeamOnly then
					chat.AddText(Color(255, 0, 0, 255), ded, v[3], v[2], nickteam, ply:Nick(), color_white, ": ", Color(R, G, B, A), strText)
					return true
				else
					chat.AddText(Color(255, 0, 0, 255), ded, v[3], v[2], nickteam, "(TEAM) ", ded, ply:Nick(), color_white, ": ", Color(R, G, B, A), strText)
					return true
			end
		end
	end
end )
