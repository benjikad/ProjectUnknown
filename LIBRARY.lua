local lib = {}

local themes = {
    ['default'] = {
        ['base'] = Color3.fromRGB(25,25,25),
        ['med'] = Color3.fromRGB(45,45,45),
        ['light'] = Color3.fromRGB(75,75,75),
    },
}
local HttpService = game:GetService('HttpService')

function lib.new(theme)
    theme = themes[theme or ''] or themes['default']

    local g = Instance.new('ScreenGui')
    g.Name = HttpService:GenerateGUID(false)
    g.Parent = game:GetService('CoreGui')

    local f = Instance.new('Frame')
    f.Size = UDim2.new(0,400,0,300)
    f.Position = UDim2.new(.25,0,.25,0)
    f.BackgroundColor3 = theme.base

    local sels = Instance.new('Frame')
    sels.Size = UDim2.new(0,50,0,300)
    sels.AnchorPoint = Vector2.new(1,0)
    sels.Position = UDim2.new(1,0,0,0)
    sels.BackgroundColor3 = theme.light

    local uic = Instance.new('UICorner')
    uic.Parent = sels

    local container = Instance.new('Frame')
    container.Size = UDim2.new(0,330,0,280)
    container.Position = UDim2.new(0,10,0,10)
    container.BackgroundColor3 = theme.med

    local uic = Instance.new('UICorner')
    uic.Parent = container

    local title = Instance.new('TextLabel')
    title.Size = UDim2.new(1,0,0,30)
    title.Position = UDim2.new(0,0,0,0)
    title.AnchorPoint = Vector2.new(0,1)
    title.Text = 'Project UNKNOWN'
    title.BackgroundTransparency = 1
    title.TextTransparency = 0
    title.TextColor3 = Color3.new(1,1,1)
    
    title.Parent = f
    container.Parent = f
    sels.Parent = f
    f.Parent = g

    return f
end

return lib
