$(document).ready(function () {

    function GetClasificacion() {
        var urlAPI = 'http://localhost:55910/api/clasificacion';


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
                    relleno += '      <td><button id="btnUpdateClasificacion" data-id="' + elemento.id + '">Editar</button></td>';
                    relleno += '  </tr>';
                });
                relleno += '</table>';
                $('#resultados').append(relleno);
            }
        });
    }

    $('#resultados').on('click', '#btnEliminar', function () {
        var urlAPI = 'http://localhost:55910/api/clasificacion';
        var idClasificacion = $(this).attr('data-id');

        $.ajax({
            url: urlAPI + '/' + idClasificacion,
            type: "DELETE",
            success: function (respuesta) {
                GetClasificacion();
            },
            error: function (respuesta) {
                //debugger;
                console.log(respuesta);
            }
        });

    });
    
    $('#btnAddClasificacion').click(function () {
        //debugger;
        var nuevaClasificacion = $('#txtClasificacionDenominacion').val();
        var urlAPI = 'http://localhost:55910/api/clasificacion';
        var dataNuevoClasificacion = {
            id: 0,
            denominacion: nuevaClasificacion
        };
        //debugger;

        $.ajax({
            url: urlAPI,
            type: "POST",
            dataType: 'json',
            data: dataNuevoClasificacion,
            success: function (respuesta) {
                //debugger;
                GetClasificacion();
                console.log(respuesta);
            },
            error: function (respuesta) {
                //debugger;
                console.log(respuesta);
            }
        });
    });

    $('#resultados').on('click', '#btnUpdateClasificacion', function () {

        var urlAPI = 'http://localhost:55910/api/clasificacion';
        var idClasificacion = $(this).attr('data-id');
        var nuevaClasificacion = $('#txtNuevoClasificacion').val();

        var dataClasificacionModificar = {
            denominacion: nuevaClasificacion
        };

        $.ajax({
            url: urlAPI + '/' + idClasificacion,
            type: "PUT",
            dataType: 'json',
            data: dataClasificacionModificar,
            success: function (respuesta) {
                GetClasificacion();
                console.log(respuesta);
            },
            error: function (respuesta) {
                //debugger;
                console.log(respuesta);
            }
        });
    });

    
    GetClasificacion();

});

