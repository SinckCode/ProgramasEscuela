let animales = ["Perro", "Gato"];

animales.push("Conejo"); //agrega elemento al final

animales.unshift("Perico")//agrega elemento al inicio

animales.pop()//elimina el ultimo elemento

animales.shift(); //elimina el primer elemento

animales[animales.length]="Perico"; // toma la ongitud del arreglo y coloca el valor en el siguiente espacio

animales[3]="Caballo" // agrega caballo en el tercer lugar

let an = animales[0];
animales[0]=animales[2];
animales[2]=an;

//console.log(animales);

/*
for (let i= 0; i<animales.length;i++){
    console.log(animales[i])
}
*/


/*
let buscar="Gato";
for(let i=0;i<animales.length;i++){
    if (animales[i]==buscar){
        indice=i;
    }
}

console.log("El",buscar, "esta en el indice", (indice))

*/

/*
let buscar = "Gato";
let indice = animales.indexOf(buscar); // busca el indice de un elemnto en el arreglo
//console.log("El",buscar, "esta en el indice", (indice))


mascotas = animales; //mascotas depende de animales
let animales2=animales.slice(2); //realiza copia
console.log(mascotas);

animales.splice(indice,2)//elimina dos elementos a partir del indice

animales.push("Elefante")
console.log(animales)
console.log(mascotas)
console.log(animales2)
*/

console.log(animales.sort());//Organiza alfabeticamente un arreglo

console.log(animales.reverse())

for (let elemento of animales) { // Ciclo muestra elementos del arreglo
    console.log(elemento);
}

let mascota=["pez","Hamster"];
let otro = ["pajaro"]

let anim = mascota.concat(animales,otro);
console.log(anim);

/*
anim.forEach(muestra);

function muestra(elem){
    console.log(elem)
}

anim.forEach(function(elem){
  console.log(elem);
})
*/

anim.forEach(elem => console.log(elem));