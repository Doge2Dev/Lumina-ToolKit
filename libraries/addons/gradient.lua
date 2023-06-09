function love.graphics.newGradient(filter, colors)
    local direction = colors.direction or "horizontal"
    if direction == "horizontal" then
        direction = true
    elseif direction == "vertical" then
        direction = false
    else
        error("Invalid direction '" .. tostring(direction) .. "' for gradient.  Horizontal or vertical expected.")
    end
    local result = love.image.newImageData(direction and 1 or #colors, direction and #colors or 1)
    for i, color in ipairs(colors) do
        local x, y
        if direction then
            x, y = 0, i - 1
        else
            x, y = i - 1, 0
        end
        result:setPixel(x, y, color[1] / 255, color[2] / 255, color[3] / 255, color[4] / 255 or 255)
    end
    result = love.graphics.newImage(result)
    result:setFilter(tostring(filter), tostring(filter))
    return result
end

return love.graphics.newGradient