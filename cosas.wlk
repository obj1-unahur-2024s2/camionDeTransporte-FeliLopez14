object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultosOcupados() = 1
    method sufrirCambios(){}
}


object bumblebee {
    var modoAuto = true
    method peso() = 800
    method peligrosidad() = if(modoAuto) 15 else 30 
    method transformarseEnAuto() {modoAuto = true}
    method transformarseEnRobot() {modoAuto = false}
    method bultosOcupados() = 1
    method sufrirCambios(){self.transformarseEnRobot()}
}


object paqueteLadrillos {
    var property cantidad = 0
    method peso() = cantidad * 2
    method peligrosidad() = 2
    method bultosOcupados() = if(cantidad >= 301) 3 else if(cantidad.between(101,300)) 2 else 1
    method sufrirCambios() {cantidad = cantidad + 12}
}


object arena {
    var property peso = 0
    method peligrosidad() = 1
    method bultosOcupados() = 1
    method sufrirCambios() {peso = peso - 10}
}


object bateriaAntiaerea {
    var property tieneMisiles = true
    method peso() = if(tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0
    method bultosOcupados() = if(tieneMisiles) 2 else 1
    method cargarMisiles() {if(!tieneMisiles) tieneMisiles = true}
    method sufrirCambios(){self.cargarMisiles()}
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
    method bultosOcupados() = 1 + carga.sum({b => b.bultosOcupados()})
    method sufrirCambios(){carga.forEach({c => c.sufrirCambios()})}
}


object residuosRadioactivos {
    var property peso = 100
    method peligrosidad() = 200
    method bultosOcupados() = 1
    method sufrirCambios() {peso = peso + 15}
}


object embalajeSeguridad {
    var property cosaEnvuelta = bumblebee
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5
    method bultosOcupados() = 2
    method sufrirCambios() {}
}