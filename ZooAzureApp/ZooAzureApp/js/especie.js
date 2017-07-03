$(document).ready(
    function GetEspecie() {
        var urlAPI = 'http://localhost:55910/api/especie';

        $.get(urlAPI, function (respuesta, estado) {
            if (estado === 'success') {
                var listaEspecie = '<ul class="listadoEspecie">';
                $.each(respuesta.data, function (indice, elemento) {
                    listaEspecie += '<li>(' + elemento.especie.nombre;
                    listaEspecie + ') ' + elemento.idEspecie + '</li>';
                });
                listaEspecie += '</ul>';
                $('#listaEspecie').append(listaEspecie);
            }
        })
    }
);