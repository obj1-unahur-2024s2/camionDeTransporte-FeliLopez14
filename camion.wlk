object camion {
    const carga = []

    method peso() = 1000 + carga.sum({c => c.peso()})

    method cargarUnaCosa(cosa){
        carga.add(cosa)
    }
    method descargarUnaCosa(cosa){
        carga.remove(cosa)
    }
    method pesosDeLaCarga() = carga.map({c => c.peso()})

    method todoPesoImpar() = self.pesosDeLaCarga().all({p => p.odd()})

    method algoPesa(unPeso) = carga.any({c => c.peso() == unPeso})

    method primerCosaConPeligrosidad(nivelPeligrosidad) = if(carga.any({c => c.peligrosidad() == nivelPeligrosidad})) carga.find({c => c.peligrosidad() == nivelPeligrosidad})

    method cosasQueSuperanPeligrosidad(nivelPeligrosidad) = carga.filter({c => c.peligrosidad() > nivelPeligrosidad})

    method cosasMasPeligrosasQue(unaCosa) = carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})

    method estaExedidoDePeso() = self.peso() > 2500

    method algoSuperaPeligrosidad(nivelPeligrosidad) = carga.any({c => c.peligrosidad() > nivelPeligrosidad})

    method puedeCircularEnRuta(nivelPeligrosidad) = !self.estaExedidoDePeso() && !self.algoSuperaPeligrosidad(nivelPeligrosidad)

    method hayAlgoConPesoEntre(minPeso, maxPeso) = carga.any({c => c.peso().between(minPeso, maxPeso)})

    method cosaMasPesadaCargada() = carga.max({c => c.peso()})
}