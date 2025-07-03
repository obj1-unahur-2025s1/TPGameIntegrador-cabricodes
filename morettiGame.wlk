import wollok.game.*
import imagenes.*





object dificultadFacil{

  method camarasRatio(){
     game.onTick(4000, "lluvia", {juego.agregarCamaraDeVideoAVelocidad(600)})
  }

  method billetesRatio(){
    game.onTick(2500, "lluvia", {juego.agregarFajoDeDineroAVelocidad(1000)})
    game.onTick(8000, "lluvia", {juego.agregarFajoDoradoAVelocidad(400)})
  }
}

object dificultadDificil{

  method camarasRatio(){
     game.onTick(1000, "lluvia", {juego.agregarCamaraDeVideoAVelocidad(200)})
  }

  method billetesRatio(){
    game.onTick(2000, "lluvia", {juego.agregarFajoDeDineroAVelocidad(500)})
    game.onTick(8000, "lluvia", {juego.agregarFajoDoradoAVelocidad(100)})
  }
}





object juego {

  var dificultad = dificultadFacil

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
    dificultad.billetesRatio()
    dificultad.camarasRatio()
    
  }
  /*
  method empezarLluviaDeCamaras() {
    game.onTick(2500, "lluvia", {self.agregarCamaraDeVideo()})
  }
  method empezarLluviaDeDinero(){
    game.onTick(2300, "lluvia", {self.agregarFajoDeDineroAVelocidad(2000)})
    game.onTick(10000, "lluvia", {self.agregarFajoDoradoAVelocidad()})
  }
  */
  method agregarCamaraDeVideoAVelocidad(unaVelocidad) {
    const camara = new Camara()
    game.addVisual(camara)
    camara.iniciar(unaVelocidad)
    camara.eliminarsePorTiempo()
  }

  method agregarFajoDeDineroAVelocidad(unaVelocidad) {
    const dinero = new FajoDeDinero()
    game.addVisual(dinero)
    dinero.iniciar(unaVelocidad)
    dinero.eliminarsePorTiempo()
  }

  method agregarFajoDoradoAVelocidad(unaVelocidad) {
    const dineroEspecial = new FajoDeDineroEspecial()
    game.addVisual(dineroEspecial)
    dineroEspecial.iniciar(unaVelocidad)
    dineroEspecial.eliminarsePorTiempo()
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

class FajoDeDinero {
  var property position = game.at(0.randomUpTo(150).truncate(0), 80)
  method image() = "plataChica.png" 
  method iniciar(unaVelocidad) {
  game.onTick(unaVelocidad, "moverse", {self.movimiento()})
  } 
  method movimiento() {
    position = game.at(position.x(), position.y() - 5)
    }
  method serRecogido() {
    moretti.recogerDinero(self)
    self.eliminar()
  }
  method cantidadQueDa() = 1000

  method eliminar(){
    game.removeVisual(self)
  }

  method eliminarsePorTiempo(){
  game.onTick(15000, "eliminarse", {self.eliminar()})
  }

  method sonidoRecoleccion(){
    const sonido = game.sound("sonidoDinero.wav")
    sonido.volume(0.05)
    
    game.sound("sonidoDinero.wav").play()
  }
}

class FajoDeDineroEspecial inherits FajoDeDinero {
   override method image() = "dorado.png"
   override method cantidadQueDa() = super() * 5 
}

class Camara {
  var property position = game.at(0.randomUpTo(150).truncate(0), 80) 
  method image() = "camaraChica.png" 
  method iniciar(unaVelocidad) {game.onTick(unaVelocidad, "moverse", {self.movimiento()})}
  method movimiento() {
    position = game.at(position.x(), position.y() - 7)
  }


  method serRecogido() {
    moretti.recogerDinero(self)
    self.eliminar()
  }

  method eliminar(){
    game.removeVisual(self)
  }

  method cantidadQueDa() = - 500

  method eliminarsePorTiempo(){
  game.onTick(20000, "eliminarse", {self.eliminar()})
  }

  method sonidoRecoleccion(){
    game.sound("sonidoCamara.wav").play()
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