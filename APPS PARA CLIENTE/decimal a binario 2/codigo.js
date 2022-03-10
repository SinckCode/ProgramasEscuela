let datos = document.getElementById("datos");
let numero = document.getElementById("numero");
let mostrar = document.getElementById("mostrar");
let decimal = numero.value;

    

mostrar.addEventListener('click', () =>{
    binario()
})

function cambio(){
    let binario = getbinario();
    let octal = getOc();
    let hexa = getHex();

    binario(decimal);
    datos.innerHTML+= `
    
    <td>${numero.value}</td>
    <td>${binario}</td>
    <td>${octal}</td>
    <td>${hexa}</td>
    
    `
}

function getbinario(decimal){
    let binario = parseInt(numero.value).toString(2)
    return binario
}

function getOc(decimal){
    let oct = parseInt(numero.value).toString(8)
    return oct
}

function getHex(decimal){
    let hex = parseInt(numero.value).toString(16)
    return hex
}


function binario(decimal) {
    let binario = "";
    let res;
    decimal=numero.value;
    if (decimal >= 128) {
        res = decimal - 128;
        binario += "1";
    } else {
        binario += "0";
    }
 
    if (res >= 64) {
        res = res - 64;
        binario += "1";
    } else {
        binario += "0"
    }
 
    if (res >= 32) {
        res -= 32;
        binario += "1";
    } else {
        binario += "0";
    }
 
    if (res >= 16) {
        res -= 16;
        binario += "1";
    } else {
        binario += "0";
    }
 
    if (res >= 8) {
        res -= 8;
        binario += "1";
    } else {
        binario += "0";
    }
 
    if (res >= 4) {
        res -= 4;
        binario += "1";
    } else {
        binario += "0";
    }
 
    if (res >= 2) {
        res -= 2;
        binario += "1";
    } else {
        binario += "0";
    }
 
    if (res >= 1) {
        res -= 1;
        binario += "1";
    } else {
        binario += "0";
    }
 
    return alert(binario);
}
