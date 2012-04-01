class Ant
    construct:(anthillX,anthillY)->
        @x=0
        @y=0
        @anthillX = anthillX
        @anthillY = anthillY
        
    smell:(odor)->
      console.log("i smell #(odor)")
      switch odor
        when "eat"  then goBackHome
        when "nothing" then @randomMove()
        when "eatTrack" then followTrack
        else findANewWayOfLife

    randonMove:->
        randomX = Math.round( Math.random()*2-1)
        randomY = Math.round( Math.random()*2-1)
        @x = @x + randomX
        @y = @y + randomY

    findANewWayOfLife:->
        message = "I need to find a new way of life before dieing"
        console.log(msg)
        return msg
    goBackHome:()->
        message = "go back"
        console.log(msg)
        return msg
    followTrack:()->
        msg = "follow track"
        console.log(msg)
        return msg
exports.Ant = Ant