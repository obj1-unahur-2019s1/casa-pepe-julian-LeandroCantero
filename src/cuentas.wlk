object cuentaCorriente {
	var saldo = 3000
	method depositar(importe) {saldo += importe}
	method extraer(importe) {saldo -= importe}
	method saldo() {return saldo}
}

object cuentaConGastos {
	var saldo = 200000
	method depositar(importe) {saldo += importe-20}
	method extraer(importe) {if (importe < 1001){saldo -= importe+20} else{saldo -= importe/50}}
	method saldo() {return saldo}
}

object cuentaCombinada {
	var saldo
	method depositar(importe) {cuentaCorriente.depositar(importe)}
	method extraer(importe) {
		if (cuentaCorriente.saldo() >= importe){
			cuentaCorriente.extraer(importe)
		}
		else {
			cuentaConGastos.extraer(importe)
		}
	}
	method saldo(){
		saldo = cuentaCorriente.saldo()+cuentaConGastos.saldo() 
		return saldo
	}
}
