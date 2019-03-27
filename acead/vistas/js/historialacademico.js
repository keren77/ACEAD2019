
param={
    "":""
};

$.ajax({
    type: "POST",
    url: "../acead/modelos/alumnos.modelo.php?caso=cargahistorial",
    data: param,
    dataType: 'json',
    success: function(data){
       
       
        $.each(data, function(i, item){
           // alert(item.NC);                
            //aqui va el codigo para insertar los datos en la tabla
            $('#tblhistorial tbody').append('<TR><td>'+item.EST+'</td><td>'+item.ID+'</td><td>'+item.NC+'</td><td>'+item.NF+'</td><td>'+item.STATUS+'</td></TR>');
        });
    },
    error: function(xhr, status){
        alert("ERROR: " + xhr + " >> " + status);
    }
});