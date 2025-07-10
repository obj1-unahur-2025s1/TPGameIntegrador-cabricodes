import morettiGame.*

object contador{

//	const position = game.at(game.height(), game.width() - 1)

const position = (game.origin())
  method image(){
		return "contadorEn0.png"
	}

	method position(){
    return position
		
	}

}
//////////////////////////////////////////////////////////

object corazon1  {
   var property position = game.at(14, 90)
   method image() = "vidaNueva1.png"
}

object corazon2  {
   var property position = game.at(24, 90)
   method image() = "vidaNueva2.png"
}

object corazon3  {
   var property position = game.at(33, 90)
   method image() = "vidaNueva3.png"
}




object final{

    const position = (game.at(58, 25))
    method image(){
        return "final.png"
    }

    method position(){
        return position
    }
}

object tutorial {
    const position = game.at(67, 19)

    method image() = "tutorial.png"
    method position() = position  
}

object pantallaDeInicio {
  const position = game.at(58, 25)

  method image() = "menu.png"
  method position() = position

}

object volumenMute{
     const position = game.at(3, 90)

  method image() = "musicaMute.png"
  method position() = position
}

object volumenUnmute {
    const position = game.at(3, 90)

    method image() = "musicaUnmute.png"
    method position() = position  
}

object dificultad2{
    const position = game.at(20, 80)

  method image() = "dificultad2.png"
  method position() = position
}


