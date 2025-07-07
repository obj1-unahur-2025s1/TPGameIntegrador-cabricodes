import wollok.game.*
import imagenes.*
import objetosConGravedad.*


object dificultadFacil{
  method camarasRatio(){
    juego.empezarLluviaDeCamaras(600)
  }
  method billetesRatio(){
    juego.empezarLluviaDeDinero(2500, 8000)
  }
}

object dificultadDificil{
  method camarasRatio(){
    juego.empezarLluviaDeCamaras(200)
  }
  method billetesRatio(){
    juego.empezarLluviaDeDinero(500, 100)
  }
}


object juego {
  var dificultad = dificultadFacil
  const billetesNormales = []
  const billetesDorados = []
  const camaras = []
  method billetesNormales() = billetesNormales
  method billetesDorados() = billetesDorados
  method camaras() = camaras

  method teclado() {
    keyboard.enter().onPressDo({ self.iniciar() })
    keyboard.space().onPressDo({game.say(moretti, "tengo" +  moretti.dinero().toString() )})
    keyboard.up().onPressDo({moretti.subir()})
    keyboard.right().onPressDo({moretti.derecha()})
    keyboard.left().onPressDo({moretti.izquierda()})
    keyboard.down().onPressDo({moretti.bajar()})
    keyboard.num1().onPressDo({self.ponerDificultadFacil()})
    keyboard.num2().onPressDo({self.ponerDificultadDificil()})    
  }

  method musica(){
    const cancha = game.sound("music.mp3")
    cancha.volume(0.03)
      cancha.shouldLoop(true)
      game.schedule(500, {cancha.play()})

    keyboard.m().onPressDo({cancha.pause()})
    keyboard.n().onPressDo({cancha.resume()})
  }

  method iniciar(){

    self.musica()
    game.removeVisual(pantallaDeInicio)
    game.removeVisual(tutorial)
    game.removeVisual(dificultad2)
    game.addVisualCharacter(moretti)
    game.addVisual(invisible)
    game.addVisual(invisible2)
    game.addVisual(invisible3)
    game.addVisual(invisible4)
    game.addVisual(contador)
    self.agregarObjetosInicio()  
  }

  method agregarObjetosInicio(){
    /*5.times({
    billetesNormales.add(new FajoDeDinero());
    billetesDorados.add(new FajoDeDineroEspecial());
    camaras.add(new Camara());
    })
   
  */
    billetesNormales.add(new FajoDeDinero())
    billetesDorados.add(new FajoDeDineroEspecial())
    camaras.add(new Camara())
    
    billetesNormales.add(new FajoDeDinero())
    billetesDorados.add(new FajoDeDineroEspecial())
    camaras.add(new Camara())
    
    billetesNormales.add(new FajoDeDinero())
    billetesDorados.add(new FajoDeDineroEspecial())
    camaras.add(new Camara())
    
    billetesNormales.add(new FajoDeDinero())
    billetesDorados.add(new FajoDeDineroEspecial())
    camaras.add(new Camara())

    billetesNormales.add(new FajoDeDinero())
    billetesDorados.add(new FajoDeDineroEspecial())
    camaras.add(new Camara())
    
    camaras.forEach({c=> game.addVisual(c)})
    billetesDorados.forEach({d=> game.addVisual(d)})
    billetesNormales.forEach({n=> game.addVisual(n)})

    dificultad.billetesRatio()
    dificultad.camarasRatio()
  }
 
  method empezarLluviaDeCamaras(tiempoCamara) {
    var timeInicio = tiempoCamara
    camaras.forEach({ c => c.iniciar(timeInicio); timeInicio += 1000 })
  }

  method empezarLluviaDeDinero(tiempoDineroNomral, tiempoDineroDorado){
    var timeInicio = tiempoDineroNomral
    var timeInicioDorado = tiempoDineroDorado

    billetesNormales.forEach({ bn => bn.iniciar(timeInicio); timeInicio += 1000 })
    billetesDorados.forEach({ bd => bd.iniciar(timeInicioDorado); timeInicioDorado += 1000 })  
  }
  
  method terminarJuego(){
    if(moretti.ganar()){
      game.stop()
      game.addVisual(final)
    }
  }

  method ponerDificultadFacil(){
    dificultad = dificultadFacil
  }

  method ponerDificultadDificil(){
    dificultad = dificultadDificil
  }
  
}
object moretti {
    var dinero = 0
    var position = game.at(68, -1)
    method position() = position
    method dinero() = dinero 
    method position(nueva) {
      position = nueva
    }

    method subir() {
      position = position.up(3)
    }

    method derecha() {
      position = position.right(3)
    }

    method izquierda() {
      position = position.left(3)
    }

    method bajar(){
      position = position.down(3)
    }

    method recogerDinero(unFajo) {
      dinero += unFajo.cantidadQueDa().min(25000)
    }
    method image() = "morettito.png" 
    method comentario() = game.say(self, dinero.toString())

    method ganar(){
      return dinero == 25000
    }
}


object invisible{
  method position(){
    return moretti.position().right(1)
  } 
}


object invisible2{
  method position(){
  return moretti.position().left(1)
  } 
}

object invisible3{
  method position(){
    return moretti.position().right(2)
  } 
}

object invisible4{
  method position(){
    return moretti.position().left(2)
  } 
}