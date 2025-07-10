import morettiGame.*

object contador{

var plataActual = moretti.dinero() 

const position = (game.origin())
  
    method text(){
        return 
            "Dinero: $" + plataActual
    }

	method position(){
    return position
		
	}

}
//////////////////////////////////////////////////////////

object corazon1  {
   
   var vidasActuales = moretti.vidas()
   var imagenActual = "vidas3.png"
   const property position = game.at(14, 90)

   method image(){

    imagenActual = "vidas" + vidasActuales + ".png"

   }
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


