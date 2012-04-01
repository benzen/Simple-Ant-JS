class Ant
    construct:(anthillX,anthillY)->
        @x=0
        @y=0
        @anthillX = anthillX
        @anthillY = anthillY
        
    smell:(odor)->
      console.log("i smell #{odor}")
      switch odor
        when "eat"  then @goBackHome
        when "nothing" then @randomMove()
        when "eatTrack" then @followTrack()
        else @findANewWayOfLife()

    randomMove:->
        randomX = Math.round( Math.random()*2-1)
        randomY = Math.round( Math.random()*2-1)
        @x = @x + randomX
        @y = @y + randomY
        console.log "random move to #{@x}-#{@y}"
        
    findANewWayOfLife:->
        console.log "I need to find a new way of life...to late i'm die'ng"
        
    goBackHome:->
        console.log "go back home"
        
    followTrack:->
        console.log "follow track"
exports.Ant = Ant