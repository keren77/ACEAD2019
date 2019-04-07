<div class="content-wrapper">

  <section class="content-header">

    <h1>

      Gestión Académica

    </h1>

    <ol class="breadcrumb">

      <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Administrar Gestión Académica</li>

    </ol>

  </section>

  <section class="content">

    <div class="box">

      <div class="box-body">

       <table class="table table-bordered table-striped dt-responsive tablas">

        <thead>

         <tr>

           <th style="width:10px">#</th>
           <th style="width:10px">Id</th>
           <th>Alumno</th>
           <th>Modalidad</th>
           <th>Orientacion</th>
           <th>Clase</th>
           <th>Seccion</th>
           <th>Período Académico</th>
           <th>Acciones</th>

         </tr>

        </thead>

        <tbody>

        <?php

	//Keren & Yeimi XD was here! y Estoy probando varias cosas (Att: Yeimi. Te quiero Keren ;* // A vos Tambien Nico. XD)



        $matricula = ControladorMatricula::ctrMostrarmatricula();

       foreach ($matricula as $key => $value){

          echo ' <tr>
                  <td>'.($key+1).'</td>
                  <td>'.$value["IDMAT"].'</td>
                  <td>'.$value["Alum"].'</td>
                  <td>'.$value["DMOD"].'</td>
                  <td>'.$value["DORI"].'</td>
                  <td>'.$value["DCLASE"].'</td>
                  <td>'.$value["DSEC"].'</td>
                  <td>'.$value["DPER"].'</td>';


                  echo '  <td>

                     <div class="btn-group">

                     <button class="btn btn-danger btnEliminarMatricula" idMatricula="'.$value["IDMAT"].'"><i class="fa fa-times"></i></button>

                     </div>

                   </td>

                 </tr>';
        }


        ?>


        </tbody>

       </table>

      </div>

    </div>

  </section>

</div>
