function hacerFetch() { // Definimos la función "hacerFetch", se va a ejecutar cada vez que le pulsemos al botón, ya que el id ejecuta esto
    fetch("./sources/productos.xml") // Cargamos el archivo.xml externo con fetch , ponemos la ruta
        .then(response => response.text()) // Utilizamos .then, un método con promesas, cuando se resuelva, la respuesta la devuelve en texto
        .then(str => { // El texto plano que recibimos del fetch lo llamamos string, ahora le decimos con => lo que hacer cuando se resuelva
            const parser = new DOMParser(); // Creamos una variable const que es inmutable, no puede ser reasignada, así no tenemos problemas, esto contiene un DOMParser, un objeto que convierte cadenas de texto a un documento DOM
            const xml = parser.parseFromString(str, "application/xml"); // Utilizamos parseFromString()  método de DOMParser() que convierte la cadena de texto (str, que es el XML como texto) en un documento XML

            const productos = xml.querySelectorAll("Producto"); // Seleccionamos todos los nodos <Producto> que hay en el XML, y los guardamos en una lista
            const contenedor = document.getElementById("productos"); // Aquí le asignamos a la constante el contenedor div del HTML
            contenedor.innerHTML = ""; // Limpiamos el div por si le damos más veces al botón

            productos.forEach((producto, index) => { //Recorremos uno por uno los productos
                const nombre = producto.querySelector("Nombre").textContent; //Seleccionamos el nombre
                const precio = producto.querySelector("Precio").textContent; //Seleccionamos el texto
                const etiquetas = Array.from(producto.querySelectorAll("Etiqueta")).map(et => et.textContent); // Ponemos cada una de las etiquetas en un array

                // Creamos elementos del DOM
                const div = document.createElement("div"); //Creamos el div
                div.classList.add("producto"); // Le damos unos estilos y lo ponemos como lista

                // Apendamos el resto
                const h2 = document.createElement("h2"); // Creamos el h2
                h2.textContent = `Producto ${index + 1}`; // Le formateamos el texto
                div.appendChild(h2); // Lo apendamos

                const pNombre = document.createElement("p"); // Creamos el p de nombre
                pNombre.innerHTML = `<strong>Nombre:</strong> ${nombre}`; // Formateamos la salida
                div.appendChild(pNombre);  // Lo apendamos

                const pPrecio = document.createElement("p"); // Creamos el p de precio
                pPrecio.innerHTML = `<strong>Precio:</strong> ${precio}`; // Formateamos la salida
                div.appendChild(pPrecio); // Lo apendamos

                const pEtiquetas = document.createElement("p"); // Creamos el p de etiquetas
                pEtiquetas.innerHTML = `<strong>Etiquetas:</strong> ${etiquetas.join(", ")}`; // Formateamos la salida, los juntamos por comas
                div.appendChild(pEtiquetas); // Lo apendamos

                const hr = document.createElement("hr"); // Creamos una línea separadora
                div.appendChild(hr); // Lo apendamos

                // Lo añadimos al contenedor
                contenedor.appendChild(div); // Apendamos este div al div princpal "contenedor"
            });
        })

        // Si hay un error salta
        .catch(error => {
            console.error("Error al cargar el XML:", error);
        });
}
