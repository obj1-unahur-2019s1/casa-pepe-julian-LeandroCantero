import cosas.*
import cuentas.*

object casaDePepeYJulian {
	const cosas = []
	var cuenta
	//const lista = [heladera, cama, paqueteDeFideos, tiraDeAsado, paqueteDeFideos, 
		//plancha, kgMilanesasRebozadas, botellaSalsaTomate, microondas, kgDeCebollas,computadora,packDeComida]
	
	method elegirCuenta(cuentas){cuenta = cuentas}
	method gastar(importe){cuenta.extraer(importe)}
	method dineroDisponible(){return cuenta.saldo()}
	
	method comprar(cosa){
		cosas.add(cosa)
		cuenta.extraer(cosa.precio())
	}
	method cantidadDeCosasCompradas(){return cosas.size()}
	method tieneComida(){
		return cosas.any({cosa => cosa.esComida()})
	}
	
	method vieneDeEquiparse(){
		return cosas.last().esElectrodomestico() or cosas.last().precio() > 5000
	}
	
	method esDerrochona(){
		return cosas.sum({cosa => cosa.precio()}) > 8999
	}
	
	method compraMasCara(){
		return cosas.max({cosa => cosa.precio()})
	}
	
	method electrodomesticosComprados(){
		return cosas.filter({cosa => cosa.esElectrodomestico()})
	}
	
	method malaEpoca(){
		return cosas.all({cosa => cosa.esComida()})
	}
	
	method queFaltaComprar(listaCompras){
		return listaCompras.asSet().difference(cosas)
	} 
	
	method faltaComida(){
		return cosas.count({cosa => cosa.esComida()}) < 2
	}
//1
}
