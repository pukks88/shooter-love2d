function love.load()
  Object = require "classic"
  require "player"
  require "enemy"
  require "bullet"
  listOfBullets = {}
  enemy = Enemy()
  player=Player()  love.graphics.setBackgroundColor(0,0,150)
  score = 0

end
function love.update(dt)
player:update(dt)
enemy:update(dt)
for i,v in ipairs(listOfBullets) do
  v:update(dt)
  v:checkCollision(enemy)
  if v.dead then
    
    table.remove(listOfBullets,i)
    end
end
end
function love.draw()
  enemy:draw()
  player:draw()
  love.graphics.print("score: " .. score,30,550,0,2,2)
  for i,v in ipairs(listOfBullets) do
  v:draw(dt)
 
end
end

function love.keypressed(key)
  player:keyPressed(key)
  end