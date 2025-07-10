import morettiGame.*
import imagenes.*

class ObjetoConGravedad{
  var property position = game.at(0.randomUpTo(130).truncate(0), 80)
  
  method movimientoEnEjeY()
  method cantidadQueDa()
  method sonidoRecoleccion() 
  method image() 

  method iniciar(unaVelocidad) {
    game.say(self, "inicie movimiento")
    game.onTick(unaVelocidad, "moverse", {self.movimiento()})
  } 
  
  method movimiento() {
    var posiciony = position.y() - self.movimientoEnEjeY();
    var posicionx = position.x();
    if(posiciony <= 0) {
       posiciony = 80
       posicionx = 0.randomUpTo(130).truncate(0);
    }
    position = game.at(posicionx, posiciony)
  } 
  
  method serRecogido() {
    moretti.recogerDinero(self)
    self.eliminar()
  }

  method eliminar(){
    position = game.at(0.randomUpTo(130).truncate(0), 80)
  }

}
class FajoDeDinero inherits ObjetoConGravedad{
  override method image() = "plataVerde.png" 
  override method cantidadQueDa() = 1000 
  override method sonidoRecoleccion() {
    const sonido = game.sound("sonidoDinero.wav")
    sonido.volume(0.05)    
    game.sound("sonidoDinero.wav").play()
  }
  override method movimientoEnEjeY() = 10
}

class FajoDeDineroEspecial inherits ObjetoConGravedad{
   override method image() = "plataDorada.png"
   override method cantidadQueDa() = 5000
   override method sonidoRecoleccion() {
    const sonido = game.sound("sonidoDinero.wav")
    sonido.volume(0.05)    
    game.sound("sonidoDinero.wav").play()
  }
  override method movimientoEnEjeY() = 5
}

class Camara inherits ObjetoConGravedad{
  override method image() = "camarita.png" 
  override method cantidadQueDa() = - 1000
  override method sonidoRecoleccion(){
    game.sound("sonidoCamara.wav").play()
  }



  override method movimientoEnEjeY() = 3
}


