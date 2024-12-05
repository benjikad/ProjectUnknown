local lib = {}

local themes = {
    ['default'] = {
        ['base'] = Color3.fromRGB(25,25,25),
    },
}

function lib.new(theme)
    theme = themes[theme or ''] or themes['default']

    local g = Instance.new('ScreenGui')
    g.Parent = game:GetService('CoreGui')

    local f = Instance.new('Frame')
    f.Size = UDim2.new(.25,0,.25,0)
    f.BackgroundColor3 = theme.base

    f.Parent = g

    return f
end

return lib
