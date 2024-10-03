object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}


object bumblebee {
    var modoAuto = true

    method peso() = 800
    method peligrosidad() = if(modoAuto) 15 else 30 
    method transformarseEnAuto() {modoAuto = true}
    method transformarseEnRobot() {modoAuto = false}
}


object paqueteLadrillos {
    var property cantidad = 0
    method peso() = cantidad * 2
    method peligrosidad() = 2
}


object arena {
    var property peso = 0
    method peligrosidad() = 1
}


object bateriaAntiaerea {
    var property tieneMisiles = true
    method peso() = if(tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0
}


object contenedor {
    const carga = []
    method agregarCosa(unaCosa){
        carga.add(unaCosa)
    }
    method eliminarCosa(unaCosa){
        carga.remove(unaCosa)
    }
    method peso() = 100 + carga.sum({c => c.peso()})
    method peligrosidad() = if(carga.isEmpty()) 0 else carga.max({c => c.peligrosidad()}).peligrosidad()
}


object residuosRadioactivos {
    var property peso = 100
    method peligrosidad() = 200
}


object embalajeSeguridad {
    var property cosaEnvuelta = bumblebee
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5
}