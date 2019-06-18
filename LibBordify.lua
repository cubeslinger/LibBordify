--
-- Addon       LibBordify.lua
-- Author      marcob@marcob.org
-- StartDate   18/06/2019
--

function Library.LibBordify.addborders(frametomodify)

	--	widths
	local size				=	{}
	size.height				=	{}
	size.height.corner	=	12
	size.height.top 		=	size.height.corner
	size.height.bottom 	=	size.height.corner
	size.width				=	{}
	size.width.corner		=	12
	size.width.left 		=	size.width.corner
	size.width.right 		=	size.width.corner

	local parent 			=	{}
	parent.obj				=	frametomodify
	parent.layer			=	parent.obj:GetLayer()
	parent.name				=	parent.obj:GetName()
	parent.bgcolor			=	{}
	parent.bgcolor.r, parent.bgcolor.g, parent.bgcolor.b, parent.bgcolor.a	=	parent.obj:GetBackgroundColor()

	local obj				=	{}

	--	long	borders
	obj.t		=	UI.CreateFrame("Texture", "border_" .. parent.name .. "_top", 				parent.obj)
	obj.b		=	UI.CreateFrame("Texture", "border_" .. parent.name .. "_bottom", 			parent.obj)
	obj.l		=	UI.CreateFrame("Texture", "border_" .. parent.name .. "_left", 			parent.obj)
	obj.r		=	UI.CreateFrame("Texture", "border_" .. parent.name .. "_right",			parent.obj)
	--	corners
	obj.tl	=	UI.CreateFrame("Texture", "corner_" .. parent.name .. "_topleft", 		parent.obj)
	obj.tr	=	UI.CreateFrame("Texture", "corner_" .. parent.name .. "_topright", 		parent.obj)
	obj.bl	=	UI.CreateFrame("Texture", "corner_" .. parent.name .. "_bottomleft", 	parent.obj)
	obj.br	=	UI.CreateFrame("Texture", "corner_" .. parent.name .. "_bottomright",	parent.obj)

	obj.t:SetLayer(parent.layer)
	obj.b:SetLayer(parent.layer)
	obj.l:SetLayer(parent.layer)
	obj.r:SetLayer(parent.layer)
	--
	obj.tl:SetLayer(parent.layer)
	obj.tr:SetLayer(parent.layer)
	obj.bl:SetLayer(parent.layer)
	obj.br:SetLayer(parent.layer)

	obj.t:SetTexture("LibBordify", 	Library.LibBordify.gfx.t)
	obj.b:SetTexture("LibBordify", 	Library.LibBordify.gfx.b)
	obj.l:SetTexture("LibBordify", 	Library.LibBordify.gfx.l)
	obj.r:SetTexture("LibBordify", 	Library.LibBordify.gfx.r)
	--
	obj.tl:SetTexture("LibBordify", Library.LibBordify.gfx.tl)
	obj.tr:SetTexture("LibBordify", Library.LibBordify.gfx.tr)
	obj.bl:SetTexture("LibBordify", Library.LibBordify.gfx.bl)
	obj.br:SetTexture("LibBordify", Library.LibBordify.gfx.br)
	--
	--
	--	top
	obj.t:SetPoint( 'BOTTOMLEFT', 	parent.obj, 'TOPLEFT')
	obj.t:SetPoint( 'BOTTOMRIGHT', 	parent.obj, 'TOPRIGHT')
	--	top left
	obj.tl:SetPoint( 'BOTTOMRIGHT', 	parent.obj, 'TOPLEFT')
	--	top right
	obj.tr:SetPoint( 'BOTTOMLEFT', 	parent.obj, 'TOPRIGHT')
	--	left
	obj.l:SetPoint( 'TOPRIGHT', 		parent.obj, 'TOPLEFT')
	obj.l:SetPoint( 'BOTTOMRIGHT', 	parent.obj, 'BOTTOMLEFT')
	--	right
	obj.r:SetPoint( 'TOPLEFT', 		parent.obj, 'TOPRIGHT')
	obj.r:SetPoint( 'BOTTOMLEFT', 	parent.obj, 'BOTTOMRIGHT')
	--	bottom
	obj.b:SetPoint( 'TOPLEFT', 		parent.obj, 'BOTTOMLEFT')
	obj.b:SetPoint( 'TOPRIGHT', 		parent.obj, 'BOTTOMRIGHT')
	--	bottom left
	obj.bl:SetPoint( 'TOPRIGHT', 		parent.obj, 'BOTTOMLEFT')
	obj.br:SetPoint( 'TOPLEFT', 		parent.obj, 'BOTTOMRIGHT')

	return
end



