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
    method position() =position  
}

object pantallaDeInicio {
  const position = game.at(58, 25)

  method image() = "menu.png"
  method position() = position

}

object volumen{
     const position = game.at(-5, 80)

  method image() = "volumen.png"
  method position() = position
}

object dificultad2{
    const position = game.at(20, 80)

  method image() = "dificultad2.png"
  method position() = position
}


