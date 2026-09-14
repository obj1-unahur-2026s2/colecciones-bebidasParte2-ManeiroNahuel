object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}


object coctel{
  const composicion= []

  method composicion()=composicion
  method agregarAlCoctel(bebida){
    composicion.add(bebida)
  }

  method contiene(elemento){
    composicion.contains(elemento)
  }

  method rendimientoQueOtorga(dosisConsumida){
    return  composicion.map({bebida=> bebida.rendimientoQueOtorga(dosisConsumida)})
            composicion.fold(1,{ acumulador, rendimiento => acumulador * rendimiento })
  }
}
object licuadoDeFrutas{
  const composicion=[]

  method composicion() = composicion

  method agregarAlLicuado(fruta){
    composicion.add(fruta)
  }

  method totalDeNutrientes(){
    return composicion.sum({fruta=>fruta.nutrientesQueAporta()})
  }
  method rendimientoQueOtorga(dosisConsumida){
    return (dosisConsumida / 1000) * self.totalDeNutrientes()
  }
}

object aguaSaborizada{
  var bebidaBase = whisky

  method cambiarBebidaBase(nuevaBebida){
    bebidaBase=nuevaBebida
  }
  method rendimientoQueOtorga(dosisConsumida){
    return 1+(bebidaBase.rendimientoQueOtorga(dosisConsumida /4))
  }
}