-- COLLECTEUR : Ramassez un maximum de pièces en 30 secondes !

function love.load()
    -- Position de la pièce
    pieceX = love.math.random(50, 750)
    pieceY = love.math.random(50, 550)

    -- Position du joueur
    joueurX = 400
    joueurY = 300

    -- Vitesse du joueur
    vitesse = 200

    -- Score
    score = 0
end

function nouvellepiece()
    pieceX = love.math.random(50, 750)
    pieceY = love.math.random(50, 550)
end

function love.update(dt)
    -- Flèche haut
    if love.keyboard.isDown("up") then
        joueurY = joueurY - vitesse * dt
    end

    -- Flèche bas
    if love.keyboard.isDown("down") then
        joueurY = joueurY + vitesse * dt
    end

    -- Flèche gauche
    if love.keyboard.isDown("left") then
        joueurX = joueurX - vitesse * dt
    end

    -- Flèche droite
    if love.keyboard.isDown("right") then
        joueurX = joueurX + vitesse * dt
    end

    -- Condition pour la collision
    -- Le joueur (carré 30x30) touche la pièce (cercle rayon 15) si :
    if
        joueurX < pieceX + 15 and      -- pas trop à gauche
        joueurX + 30 > pieceX - 15 and -- pas trop à droite
        joueurY < pieceY + 15 and      -- pas trop en haut
        joueurY + 30 > pieceY - 15     -- pas trop en bas
    then
        score = score + 1
        nouvellepiece()
    end
end

function love.draw()
    -- Dessiner la pièce
    love.graphics.setColor(1, 1, 0) -- Jaune
    love.graphics.circle("fill", pieceX, pieceY, 15)

    -- Dessiner le joueur
    love.graphics.setColor(0, 0.5, 1) -- Bleu
    love.graphics.rectangle("fill", joueurX, joueurY, 30, 30)

    -- Instructions
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Choppe la pièce !", 10, 20)

    -- Affichage du score
    love.graphics.print("Score: " .. score, 10, 35)
end
