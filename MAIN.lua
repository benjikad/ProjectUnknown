local lib = loadstring(game:HttpGet(''))()
local conf = {
    ['GuiToggle'] = Enum.KeyCode.Insert,
}

local FileSupport = isfile and isfolder and writefile and readfile
local myNameIs = 'Project-UNKNOWN' --what? who? huh? what? excuse me?

if FileSupport then
    if not isfolder(myNameIs) then
        makefolder(myNameIs)
    end

    if not isfolder(`{myNameIs}/Plugins`) then
        makefolder(`{myNameIs}/Plugins`)
    end

    if not isfile(`{myNameIs}/Prefix.ini`) then
        writefile(`{myNameIs}/Prefix.ini`, ';')
    end
end

--// Functions \\--

function ColoredPrint(Text:string, color:Color3, Icon:table)
    task.spawn(function()
        local TextFinder = "‎" .. Text .. (string.sub(game:GetService("HttpService"):GenerateGUID(false), 1, 10))
        print(TextFinder)
        game.CoreGui:WaitForChild("DevConsoleMaster", 1000)
            :WaitForChild("DevConsoleWindow", 1000)
            :WaitForChild("DevConsoleUI", 1000)
            :WaitForChild("MainView", 1000)
        
        local function update(Parent)
            local loadingLabel = nil
            for index, label in pairs(Parent:GetDescendants()) do
                if label:IsA("TextLabel") and string.find(label.Text, TextFinder, 1, true) ~= nil then
                    loadingLabel = label
                    loadingLabel:SetAttribute("hasbefore", true)
                    loadingLabel.RichText = true
                    local originalTime = string.sub(label.Text, 1, 11)
                    loadingLabel.Text = string.format(
                        "<font color='rgb(%s,%s,%s)' size='15'>%s %s </font>",
                        math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255),
                        originalTime, Text
                    )
                    
                    if Icon ~= nil then
                        if type(Icon[1]) == type(0) then
                            if Icon[2] == false then
                                loadingLabel.Parent.image.Image = "rbxassetid://" .. tostring(Icon[1])
                                loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                            else
                                loadingLabel.Parent.image.Image = "rbxassetid://" .. tostring(Icon[1])
                                loadingLabel.Parent.image.ImageColor3 = color
                            end
                        elseif Icon[1]:lower() == "error" or Icon[1]:lower() == "err" or Icon[1]:lower() == "fail" then
                            if Icon[2] == false then
                                loadingLabel.Parent.image.Image = "rbxasset://textures/DevConsole/Error.png"
                                loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                            else
                                loadingLabel.Parent.image.Image = "rbxassetid://97467062933153"
                                loadingLabel.Parent.image.ImageColor3 = color
                            end
                        elseif Icon[1]:lower() == "information" or Icon[1]:lower() == "info" then
                            if Icon[2] == false then
                                loadingLabel.Parent.image.Image = "rbxasset://textures/DevConsole/Info.png"
                                loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                            else
                                loadingLabel.Parent.image.Image = "rbxassetid://98895588220731"
                                loadingLabel.Parent.image.ImageColor3 = color
                            end
                        elseif Icon[1]:lower() == "warning" or Icon[1]:lower() == "warn" then
                            if Icon[2] == false then
                                loadingLabel.Parent.image.Image = "rbxasset://textures/DevConsole/Warning.png"
                                loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                            else
                                loadingLabel.Parent.image.Image = "rbxassetid://129253285072281"
                                loadingLabel.Parent.image.ImageColor3 = color
                            end
                        elseif Icon[1]:lower() == "plus" or Icon[1]:lower() == "extra" then
                            loadingLabel.Parent.image.Image = "rbxassetid://127360009371476"
                            loadingLabel.Parent.image.ImageColor3 = color
                        elseif Icon[1]:lower() == "success" or Icon[1]:lower() == "check" or Icon[1]:lower() == "tick" then
                            if Icon[2] == false then
                                loadingLabel.Parent.image.Image = "rbxassetid://75097763556603"
                                loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                            else
                                loadingLabel.Parent.image.Image = "rbxassetid://87889653826033"
                                loadingLabel.Parent.image.ImageColor3 = color
                            end
                        end
                    end
                    
                    loadingLabel.Parent.image:GetPropertyChangedSignal("Image"):Once(function()
                        loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                    end)
                    break
                end
            end
        end
        
        task.wait(0.009)
        update(game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"))
        local Done = 0
        
        task.spawn(function()
            if game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"):WaitForChild("ClientLog", 5).CanvasSize.Y.Offset >= 8500 then
                game:GetService("LogService").MessageOut:Connect(function(message, messageType)
                    if Done < 22 then
                        task.wait(0.01)
                        Done = Done + 1
                        update(game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"))
                    end
                end)
            end
        end)
        
        game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"):WaitForChild("ClientLog", 5).ChildAdded:Connect(function(child2)
            update(child2)
        end)
        
        game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI.ChildAdded:Connect(function(child)
            if child.Name == "MainView" then
                task.wait()
                update(child)
                child:WaitForChild("ClientLog", 5).ChildAdded:Connect(function(child2)
                    update(child2)
                end)
            end
        end)
    end)
end

--// Main \\--
