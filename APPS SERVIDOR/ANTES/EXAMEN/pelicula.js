let datos=document.querySelector("#peliculas");

document.querySelector("#mostrar").addEventListener('click',()=>{

    fetch('pelicula.json')
    .then(respuesta => respuesta.json())
    .then(json =>{
        datos.innerHTML="";
        for (dat of json){

           
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

