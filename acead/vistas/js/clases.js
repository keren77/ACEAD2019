
/*=============================================
EDITAR CLASES
=============================================*/

$(".tablas").on("click", ".btnEditarClase", function(){

	var idClase = $(this).attr("idClase");

	var datos = new FormData();

	datos.append("idClase", idClase);

	$.ajax({

		url:"ajax/clases.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(respuesta){

                        //alert(respuesta);
			$("#editarIdClase").val(respuesta["Id_Clase"]);
			$("#editarClase").val(respuesta["DescripClase"]);

		},
                error: function(xhr, status){
                    alert("ERROR: " + xhr + " >> " + status);
                }

	});

})

/*=============================================
ELIMINAR CLASE
=============================================*/
$(".tablas").on("click", ".btnEliminarClase", function(){

  var idClase = $(this).attr("idClase");


  swal({
    title: '¿Está seguro de borrar esta Clase?',
    text: "¡Si no lo está puede cancelar la accíón!",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: 'Cancelar',
      confirmButtonText: 'Si, borrar clase!'
  }).then((result)=>{

    if(result.value){


      window.location = "index.php?ruta=clases&idClase="+idClase;


    }

  })

})
