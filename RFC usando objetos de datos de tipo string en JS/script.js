let nombre=document.getElementById("tunombre");
let paterno=document.getElementById("paterno");
let materno=document.getElementById("materno");
let year=document.getElementById("year");
let mes=document.getElementById("mes");
let dia=document.getElementById("dia");
let rfc;

enviar.addEventListener("DOMContentLoad",elano());

function elano(){

    switch (mes) {
        case "1": mes = "01"; break;
        case "2": mes = "02"; break;
        case "3": mes = "03"; break;
        case "4": mes = "04"; break;
        case "5": mes = "05"; break;
        case "6": mes = "06"; break;
        case "7": mes = "07"; break;
        case "8": mes = "08"; break;
        case "9": mes = "09"; break;
        case "10": mes = "10"; break;
        case "11": mes = "11"; break;
        case "12": mes = "12"; break;
    
        default:
            break;
    }

   
}

function creaLibro(nombre,precio){
this.nombre=nombre;
this.precio=precio;
}

agregar.addEventListener('click',()=>{
    let libros;
    if (localStorage.getItem("libros")==null) {
        libros=[];
    }else{
        libros=JSON.parse(localStorage.getItem("libros"))
    }


    let lib = new creaLibro(nombre.value, precio.value)

    libros.push(lib);
    datos.innerHTML+=` ${nombre.value} -- ${precio.value}<br> `
    localStorage.setItem("libros",JSON.stringify(libros))
})


eliminar.addEventListener('click',()=>{
localStorage.removeItem("libros")
datos.innerHTML="";

})


let datos=document.querySelector("#peliculas");

document.querySelector("#mostrar").addEventListener('click',()=>{

    fetch('pelicula.json')
    .then(respuesta => respuesta.json())
    .then(json =>{
        datos.innerHTML="";
        for (dat of json){

            let cont;
            contador
            datos.innerHTML+=`
            <tr>
            <td>${dat.Title}</td>
            <td>${dat.Director}</td>
            <td>${dat.Actors}</td>
            <td>${dat.Year}</td>
            <td>
            <img src="${dat.Images[1]} alt="imagen" widht="200px" height="200px" "></td>
            </tr>
            `
        }
    })

})

document.querySelector("#eliminar").addEventListener('click',()=>{

    fetch('pelicula.json')
    .then(respuesta => respuesta.json())
    .then(json =>{
        datos.innerHTML="";
        
    })

})



document.querySelector("#peliculas1012").addEventListener('click',()=>{
 
    fetch('pelicula.json')


    
    .then(respuesta => respuesta.json())
    .then(json =>{
        
        datos.innerHTML="";
        
         for (dat of json){

            let year = parseInt(dat.Year);
            if (year >= 2010 && year <= 2012) {
                
            
            datos.innerHTML+=`
            
            <tr>
            <td>${dat.Title}</td>
            <td>${dat.Director}</td>
            <td>${dat.Actors}</td>
            <td>${dat.Year}</td>
            <td>
            <img src="${dat.Images[1]} alt="imagen" widht="200px" height="200px" "></td>
            </tr>
            `
        }
        }
    
    
    })

  

})
