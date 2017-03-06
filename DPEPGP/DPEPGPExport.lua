function DPEPGP_exportData()
	DPEPGPExportData = {}	
	EPGPexportDataDB  = {}	
	epgpextract = "^(%d+)/(%d+)"

	for i = 1, GetNumGuildMembers(true) do
		local name, _, _, _, class, _, _, officernote, _, _ = GetGuildRosterInfo(i)
		local _, _, ep, gp = string.find(officernote, epgpextract)
		ratio = ep / gp
		DPEPGPExportData[name] = "EP: " .. ep.. " - GP: " .. gp .. " - Ratio: " .. ratio
		
		EPGPexportDataDB[i] = {}	
		EPGPexportDataDB[i].name = name
		EPGPexportDataDB[i].ep = ep
		EPGPexportDataDB[i].gp = gp
		EPGPexportDataDB[i].ratio = ratio
	end
	
	guild = GetGuildInfo("player")
	EPGPexportDataFrame = "EPGP export for " .. guild .. " at " .. date("%y-%m-%d %H:%M:%S") .. "\r\n"  .. "\r\n"
	
	table.sort(EPGPexportDataDB, function(a,b) return a.name < b.name end)
		
	for i in EPGPexportDataDB do
		EPGPexportDataFrame = EPGPexportDataFrame .. EPGPexportDataDB[i].name .. ": " .. EPGPexportDataDB[i].ep .. "/" .. EPGPexportDataDB[i].gp .. " - " .. EPGPexportDataDB[i].ratio .. "\r\n"
	end
	
	DPEPGP_ExportRaidFrameEditBox1:SetFont("Fonts\\FRIZQT__.TTF", "8")
	DPEPGP_ExportRaidFrameEditBox1Left:Hide()
	DPEPGP_ExportRaidFrameEditBox1Middle:Hide()
	DPEPGP_ExportRaidFrameEditBox1Right:Hide()
	DPEPGP_ExportRaidFrameEditBox1:SetText(EPGPexportDataFrame)
		
	ShowUIPanel(DPEPGP_ExportRaidFrame, 1)
	
	DEFAULT_CHAT_FRAME:AddMessage("EP GP exported to WTF\\Account\\ACCOUNTNAME\\SavedVariables\\DPEPGP.lua", 1, 1, 0)
	DEFAULT_CHAT_FRAME:AddMessage("Reload UI or Logout to save the file", 1, 1, 0)
end 

function DPEPGP_exportDataRatio()
	DPEPGPExportData = {}	
	EPGPexportDataDB  = {}	
	epgpextract = "^(%d+)/(%d+)"

	for i = 1, GetNumGuildMembers(true) do
		local name, _, _, _, class, _, _, officernote, _, _ = GetGuildRosterInfo(i)
		local _, _, ep, gp = string.find(officernote, epgpextract)
		ratio = ep / gp
		DPEPGPExportData[name] = "EP: " .. ep.. " - GP: " .. gp .. " - Ratio: " .. ratio
		
		EPGPexportDataDB[i] = {}	
		EPGPexportDataDB[i].name = name
		EPGPexportDataDB[i].ep = ep
		EPGPexportDataDB[i].gp = gp
		EPGPexportDataDB[i].ratio = ratio
	end
	
	guild = GetGuildInfo("player")
	EPGPexportDataFrame = "EPGP export for " .. guild .. " at " .. date("%y-%m-%d %H:%M:%S") .. "\r\n"  .. "\r\n"
	
	table.sort(EPGPexportDataDB, function(a,b) return a.ratio > b.ratio end)
		
	for i in EPGPexportDataDB do
		EPGPexportDataFrame = EPGPexportDataFrame .. EPGPexportDataDB[i].name .. ": " .. EPGPexportDataDB[i].ep .. "/" .. EPGPexportDataDB[i].gp .. " - " .. EPGPexportDataDB[i].ratio .. "\r\n"
	end
	
	DPEPGP_ExportRaidFrameEditBox1:SetFont("Fonts\\FRIZQT__.TTF", "8")
	DPEPGP_ExportRaidFrameEditBox1Left:Hide()
	DPEPGP_ExportRaidFrameEditBox1Middle:Hide()
	DPEPGP_ExportRaidFrameEditBox1Right:Hide()
	DPEPGP_ExportRaidFrameEditBox1:SetText(EPGPexportDataFrame)
		
	ShowUIPanel(DPEPGP_ExportRaidFrame, 1)
	
	DEFAULT_CHAT_FRAME:AddMessage("EP GP exported to WTF\\Account\\ACCOUNTNAME\\SavedVariables\\DPEPGP.lua", 1, 1, 0)
	DEFAULT_CHAT_FRAME:AddMessage("Reload UI or Logout to save the file", 1, 1, 0)
end 