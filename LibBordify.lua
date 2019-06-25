--
-- Addon       LibBordify.lua
-- Author      marcob@marcob.org
-- StartDate   18/06/2019
--

--
--	Sintax:	Library.LibBordify.addborders(<frametomodify> [, position])
--
--				<frametomodify>=	object to attach borders to
--				[position]		=	"inside"|"outside", default="outside",
--										where to put borders relative to frametomodify.
--
function Library.LibBordify.addborders(frametomodify, position)

	offset	=	"inside"
	if	position ~= nil and position == 'outside' then	offset	=	"outside"	end

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
	if	offset	==	"outside"	then
		obj.t:SetPoint(	'BOTTOMLEFT', 	parent.obj,	'TOPLEFT')
		obj.t:SetPoint( 	'BOTTOMRIGHT', parent.obj, 'TOPRIGHT')
		--	corner top left
		obj.tl:SetPoint( 	'BOTTOMRIGHT', parent.obj, 'TOPLEFT')
		--	corner top right
		obj.tr:SetPoint( 	'BOTTOMLEFT', 	parent.obj, 'TOPRIGHT')
		--	left
		obj.l:SetPoint( 	'TOPRIGHT', 	parent.obj, 'TOPLEFT')
		obj.l:SetPoint( 	'BOTTOMRIGHT', parent.obj, 'BOTTOMLEFT')
		--	right
		obj.r:SetPoint( 	'TOPLEFT', 		parent.obj, 'TOPRIGHT')
		obj.r:SetPoint( 	'BOTTOMLEFT', 	parent.obj, 'BOTTOMRIGHT')
		--	bottom
		obj.b:SetPoint( 	'TOPLEFT', 		parent.obj, 'BOTTOMLEFT')
		obj.b:SetPoint( 	'TOPRIGHT', 	parent.obj, 'BOTTOMRIGHT')
		--	corner bottom left
		obj.bl:SetPoint( 	'TOPRIGHT', 	parent.obj, 'BOTTOMLEFT')
		--	corner bottom right
		obj.br:SetPoint( 	'TOPLEFT',		parent.obj, 'BOTTOMRIGHT')
	else
		--	corner top left
		obj.tl:SetPoint( 	'TOPLEFT', 		parent.obj, 'TOPLEFT')
		--	corner top right
		obj.tr:SetPoint( 	'TOPRIGHT', 	parent.obj, 'TOPRIGHT')
		--	top stright element
		obj.t:SetPoint(	'TOPLEFT', 		obj.tl,		'TOPRIGHT')
		obj.t:SetPoint( 	'TOPRIGHT', 	obj.tr, 		'TOPLEFT')
		--	corner bottom left
		obj.bl:SetPoint( 	'BOTTOMLEFT', 	parent.obj, 'BOTTOMLEFT')
		--	corner bottom right
		obj.br:SetPoint( 	'BOTTOMRIGHT',	parent.obj, 'BOTTOMRIGHT')
		--	left stright element
		obj.l:SetPoint( 	'TOPLEFT', 		obj.tl, 		'BOTTOMLEFT')
		obj.l:SetPoint( 	'BOTTOMLEFT', 	obj.bl, 		'TOPLEFT')
		--	right stright element
		obj.r:SetPoint( 	'TOPRIGHT', 	obj.tr, 		'BOTTOMRIGHT')
		obj.r:SetPoint( 	'BOTTOMRIGHT', obj.br, 		'TOPRIGHT')
		--	bottom stright element
		obj.b:SetPoint( 	'BOTTOMLEFT', 	obj.bl, 		'BOTTOMRIGHT')
		obj.b:SetPoint( 	'BOTTOMRIGHT', obj.br, 		'BOTTOMLEFT')
	end

	return
end



