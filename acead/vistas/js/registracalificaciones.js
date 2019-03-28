var ida, ids;
var idalumno;
var notafinal;



$('#modalagregarnota').css('display','none');

param={
    "":""
};
$.ajax({
    type: "POST",
    url: "../acead/modelos/alumnos.modelo.php?caso=llenaselect",
    data: param,
    dataType: 'json',
    success: function(data){
       $.each(data, function(i, item){
           $('#cbosecciones').append('<option value="'+item.IDS+'">'+item.DS+'</option>');
       });
    },
     error: function(xhr, status){
        alert("ERROR: " + xhr + " >> " + status);
    }
});

$('#cbosecciones').change(function(){
    ids=$(this).val();
    if(ids!==null && ids!==undefined){
        param1={
            "id_seccion":ids      
        };
    }else{
        param1={
            "id_seccion":'0'   
        };
    }
    
    $.ajax({
        type: "POST",
        url: "../acead/modelos/alumnos.modelo.php?caso=cargaalumnos",
        data: param1,
        dataType: 'json',
        success: function(data){
            
            $('#tblalumnos tbody').html('');
             
                $.each(data, function(i, item){
//                    $('#cbosecciones').append('<option value="'+item.IDS+'">'+item.DS+'</option>');
                    $('#tblalumnos tbody').append('<tr style="text-align: center;"><td>'+item.IDA+'</td><td>'+item.nombre+'</td><td>'+item.CE+'</td><td>'+item.TEL+'</td><td><button class="btn btn-warning" name="btnnota" data-toggle="modal" data-target="#modalagregarnota"><i class="fa fa-pencil"></i></button></td></tr>');
                });
          

             },
        error: function(xhr, status){
                 alert("ERROR: " + xhr + " >> " + status);
         }
    });
    

});


$('#tblalumnos tbody').on('click','button[name=btnnota]',function(){
    var obj=$(this).parent().parent();
    var objid=$('td',obj).eq(0).text();
    idalumno=objid;
});


$('#btnagrega').on('click', function(){
    notafinal=$('#txtnota').val();
    
    
});


// 
////
//param={
//    "":""
//};
//
//$.ajax({
//    type: "POST",
//    url: "../acead/modelos/alumnos.modelo.php?caso=registracali",
//    data: param,
//    dataType: 'json',
//    success: function(data){
//       
//       
//        $.each(data, function(i, item){
//           // alert(item.NC);                
//            //aqui va el codigo para insertar los datos en la tabla
//            $('#tblhistorial tbody').append('<TR><td>'+item.EST+'</td><td>'+item.ID+'</td><td>'+item.NC+'</td><td>'+item.NF+'</td><td>'+item.STATUS+'</td></TR>');
//        });
//    },
//    error: function(xhr, status){
//        alert("ERROR: " + xhr + " >> " + status);
//    }
//});