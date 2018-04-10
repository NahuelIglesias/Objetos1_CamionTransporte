object camion {
	var carga = #{}
	const tara = 1000
	
	method cargar(cosa) {
		carga.add(cosa)
	}
	method descargar(cosa) {
		carga.remove(cosa)
	}
	method pesoTotal() {
		return carga.sum({cosa => cosa.peso()}) + tara
	}
	method excedidoDePeso() {
		return 2500 > self.pesoTotal()
	}
	method objetosPeligrosos(n) {
		return carga.filter({cosa => cosa.nivelPeligrosidad() > n})
	}
	method objetosMasPeligrososQue(cosa) {
		return self.objetosPeligrosos(cosa.nivelPeligrosidad())
	}
	method puedoCircularEnRuta(nivelMaxPeligrosidad) {
		return carga.all({cosa => cosa.nivelPeligrosidad() < nivelMaxPeligrosidad})
	}
}

object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object bumblebee {
	var esAuto = true
	method transformar() {
		esAuto = !esAuto
	}
	
	method peso() = 800
	method nivelPeligrosidad() {
		return if (esAuto) {
			15
		} else {
			30
		}
	}
}