$(document).ready(function () {

    function GetTiposAnimales() {
        var urlAPI = 'http://localhost:55910/api/tipos';


        $.get(urlAPI, function (respuesta, estado) {

            $('#resultados').html('');

            if (estado === 'success') {
                var relleno = '';

                relleno += '<table>';
                relleno += '<tr>';
                relleno += '    <th>Id</th>';
                relleno += '    <th>Denominación</th>';
                relleno += '    <th colspan="2">Acciones</th>';
                relleno += '</tr>';

                $.each(respuesta.data, function (indice, elemento) {
                    relleno += '  <tr>';
                    relleno += '      <td>' + elemento.id + '</td>';
                    relleno += '      <td>' + elemento.denominacion + '</td>';
                    relleno += '      <td><button id="btnEliminar" data-id="' + elemento.id + '">X</button></td>';
                    relleno += '      <td><button id="btnUpdateTipoAnimal" data-id="' + elemento.id + '">Editar</button></td>';
                    relleno += '  </tr>';
                });
                relleno += '</table>';
                $('#resultados').append(relleno);
            }
        });
    }

    $('#resultados').on('click', '#btnEliminar', function () {
        var urlAPI = 'http://localhost:55910/api/tipos';
        var idTipoAnimal = $(this).attr('data-id');

        $.ajax({
            url: urlAPI + '/' + idTipoAnimal,
            type: "DELETE",
            success: function (respuesta) {
                GetTiposAnimales();
            },
            error: function (respuesta) {
                //debugger;
                console.log(respuesta);
            }
        });

    });
    
    $('#btnAddTipoAnimal').click(function () {
        //debugger;
        var nuevoTipoAnimal = $('#txtTipoAnimalDenominacion').val();
        var urlAPI = 'http://localhost:55910/api/tipos';
        var dataNuevoTipoAnimal = {
            id: 0,
            denominacion: nuevoTipoAnimal
        };
        //debugger;

        $.ajax({
            url: urlAPI,
            type: "POST",
            dataType: 'json',
            data: dataNuevoTipoAnimal,
            success: function (respuesta) {
                //debugger;
                GetTiposAnimales();
                console.log(respuesta);
            },
            error: function (respuesta) {
                //debugger;
                console.log(respuesta);
            }
        });
    });

    $('#resultados').on('click', '#btnUpdateTipoAnimal', function () {

        var urlAPI = 'http://localhost:55910/api/tipos';
        var idTipoAnimal = $(this).attr('data-id');
        var nuevoTipoAnimal = $('#txtNuevoTipoAnimal').val();

        var dataTipoAnimalModificar = {
            denominacion: nuevoTipoAnimal
        };

        $.ajax({
            url: urlAPI + '/' + idTipoAnimal,
            type: "PUT",
            dataType: 'json',
            data: dataTipoAnimalModificar,
            success: function (respuesta) {
                GetTiposAnimales();
                console.log(respuesta);
            },
            error: function (respuesta) {
                //debugger;
                console.log(respuesta);
            }
        });
    });

    
    GetTiposAnimales();

});

