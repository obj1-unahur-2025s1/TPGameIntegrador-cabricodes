object sonidos {
  method ejecutarElSonido(nombreDelSonido) {
    if(!nombreDelSonido.sonidos().played()){
        nombreDelSonido.sonidos().play()
        nombreDelSonido.configuracion()
    }
  }
}

class MusicaDelMenuPrincipal {

const property musica =  game.sound(MusicaDelMenuPrincipal)

    method cofiguracion() {
       musica.volume(0.2)
       musica.shouldLoop(true)
    }

}