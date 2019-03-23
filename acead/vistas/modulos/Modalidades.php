<div class="content-wrapper">

  <section class="content-header">

    <h1>

      Administrar Modalidades

    </h1>

    <ol class="breadcrumb">

      <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Mantenimiento Academico</li>

    </ol>

  </section>

  <!-- FORMULARIO DE MODALIDADES -->

  <section class="content" style="width:550px">

    <div class="box">

      <!-- BOTON AGREGAR MODALIDAD -->
        <div class="box-header with-border">

              <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarModalidad">

                Agregar Modalidades

              </button>

            </div>


              <div class="box-body">

                <table class="table table-bordered table-striped dt-responsive tablas">

                  <thead>

                   <tr>

                     <th style="width:10px">#</th>
                     <th style="width:10px">Id</th>
                     <th>Modalidad</th>
                     <th>Acciones</th>


                   </tr>

                  </thead>

                  <tbody>

                      <?php



                      $item = null;
                      $valor = null;
                      $modalidades = ControladorModalidades::ctrMostrarModalidades($item, $valor);

                     foreach ($modalidades as $key => $value){

                        echo ' <tr>
                                <td>'.($key+1).'</td>
                                <td>'.$value["Id_Modalidad"].'</td>
                                <td>'.$value["DescripModalidad"].'</td>

                                <td>

                                  <div class="btn-group">

                                    <button class="btn btn-warning btnEditarModalidad" idModalidad="'.$value["Id_Modalidad"].'" data-toggle="modal" data-target="#modalEditarModalidad"><i class="fa fa-pencil"></i></button>
                                    <button class="btn btn-danger btnEliminarModalidad" idModalidad="'.$value["Id_Modalidad"].'"><i class="fa fa-times"></i></button>


                                  </div>

                                </td>

                              </tr>';
                      }


                      ?>


                  </tbody>

                </table>

              </div>

              <!-- /.content -->
    </div>

    <!-- /.box -->

  </section>


<!--=====================================
MODAL AGREGAR MODALIDAD
======================================-->

<<div id="modalAgregarModalidad" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Agregar Modalidad</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA EL NOMBRE DE LA MODALIDAD -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-user"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoDescripModalidad" id="nuevoDescripModalidad" placeholder="Nombre de la Modalidad" pattern="|^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$|" style="text-transform: uppercase" maxlength="" required>

              </div>

            </div>

           </div>

         </div>



        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Guardar Modalidad</button>

        </div>

        <?php

          $crearModalidad = new ControladorModalidades();
          $crearModalidad -> ctrCrearModalidad();

        ?>


        <?php

          $borrarModalidad = new ControladorModalidades();
          $borrarModalidad -> ctrBorrarModalidad();

        ?>


      </form>

    </div>

  </div>

</div>

<!--=====================================
MODAL EDITAR MODALIDAD
======================================-->

<div id="modalEditarModalidad" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#f39c12; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Editar Modalidad</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">


            <!-- ID DE MODALIDAD -->

             <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-id-badge"></i></span>


                  <input type="text" class="form-control input-lg" id="editarIdModalidad" name="editarIdModalidad" readonly value="">


                </div>

              </div>

            <!-- ENTRADA PARA EL NOMBRE -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-user"></i></span>

                <input type="text" class="form-control input-lg" name="editarModalidad" id="editarModalidad" value="" pattern="|^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$|" style="text-transform: uppercase" maxlength="40" required>

              </div>

            </div>

          </div>



        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Modificar Modalidad</button>

        </div>

        <?php

          $editarModalidad = new ControladorModalidades();
          $editarModalidad -> ctrEditarModalidad();

        ?>

         </form>

        </div>

      </div>

     </div>

    </div>




  <!-- FORMULARIO DE CLASES -->


  <section class="content" style="width:550px">

    <div class="box">

      <!-- BOTON AGREGAR MODALIDAD -->
        <div class="box-header with-border">

              <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarClases">

                Agregar Clases

              </button>

            </div>


              <div class="box-body">

                <table class="table table-bordered table-striped dt-responsive tablas">

                  <thead>

                   <tr>

                     <th style="width:10px">#</th>
                     <th style="width:10px">Id</th>
                     <th>Clase</th>
                     <th>Duración</th>
                     <th>Id Orientación</th>

                     <th>Acciones</th>


                   </tr>

                  </thead>

                  <tbody>

                      <?php



                      $item = null;
                      $valor = null;
                      $clases = ControladorClases::ctrMostrarClases($item, $valor);

                     foreach ($clases as $key => $value){

                        echo ' <tr>
                                <td>'.($key+1).'</td>
                                <td>'.$value["Id_Clase"].'</td>
                                <td>'.$value["DescripClase"].'</td>
                                <td>'.$value["Duracion"].'</td>
                                <td>'.$value["Id_orientacion"].'</td>

                                <td>

                                  <div class="btn-group">

                                    <button class="btn btn-warning btnEditarClase" idClase="'.$value["Id_Clase"].'" data-toggle="modal" data-target="#modalEditarClase"><i class="fa fa-pencil"></i></button>
                                    <button class="btn btn-danger btnEliminarClase" idClase="'.$value["Id_Clase"].'"><i class="fa fa-times"></i></button>


                                  </div>

                                </td>

                              </tr>';
                      }


                      ?>


                  </tbody>

                </table>

              </div>

              <!-- /.content -->
    </div>

    <!-- /.box -->

  </section>


<!--=====================================
MODAL AGREGAR MODALIDAD
======================================-->

<div id="modalAgregarClases" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Agregar Clase</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA EL NOMBRE DE LA CLASE -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-user"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoDescripClase" id="nuevoDescripClase" placeholder="Nombre de la Clase" pattern="|^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$|" style="text-transform: uppercase" maxlength="20" required>

              </div>

            </div>

            <!-- ENTRADA PARA LA DURACIÓN DE LA CLASE -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-user"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoDuracion" id="nuevoDuracion" placeholder="hh:mm:ss"  pattern="|^[a-zA-Z]*$|" maxlength="8" required>

              </div>

            </div>

           </div>

         </div>


        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Guardar Clase</button>

        </div>

        <?php

          $crearClase = new ControladorClases();
          $crearClase -> ctrCrearClases();

        ?>


      </form>

    </div>

  </div>

</div>

<!--=====================================
MODAL EDITAR MODALIDAD
======================================-->

<div id="modalEditarModalidad" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#f39c12; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Editar Modalidad</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">


            <!-- ID DE MODALIDAD -->

             <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-id-badge"></i></span>


                  <input type="text" class="form-control input-lg" id="editarUsuario" name="editarUsuario" readonly value="">


                </div>

              </div>

            <!-- ENTRADA PARA EL NOMBRE -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-user"></i></span>

                <input type="text" class="form-control input-lg" name="editarNombre1" id="editarNombre1" value="" pattern="|^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$|" maxlength="15" required>

              </div>

            </div>


        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Modificar usuario</button>

        </div>

        <?php

          $editarUsuario = new ControladorUsuarios();
          $editarUsuario -> ctrEditarUsuario();

        ?>

      </form>

      </div>

    </div>

  </div>
