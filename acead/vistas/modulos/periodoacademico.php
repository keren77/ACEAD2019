<div class="content-wrapper">

  <section class="content-header">

    <h1>

      Administrar Configuracion

    </h1>

    <ol class="breadcrumb">

      <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Configuracion</li>

    </ol>

  </section>

  <!-- Main content -->
  <section class="content">

    <div class="box">

      <!-- BOTON AGREGAE USUARIO -->
        <div class="box-header with-border">

              <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarParametro"><i class="fa fa-plus"></i>

                Agregar Parametro

              </button>

            </div>


              <div class="box-body">

                <table class="table table-bordered table-striped dt-responsive tablas">

                  <thead>

                   <tr>


                     <th>Descripcion</th>
                     <th>Fecha de Inicio</th>
                     <th>Fecha Final</th>
                     <th>Estado</th>
                     <th>Acciones</th>


                   </tr>

                  </thead>

                  <tbody>

                      <?php



                      $item = null;
                      $valor = null;
                      $modalidades = ControladorPeriodoAcm::ctrMostrarOeriodoAcm($item, $valor);

                     foreach ($modalidades as $key => $value){

                        echo ' <tr>

                                <td>'.$value["DescripPeriodo"].'</td>
                                <td>'.$value["FechaInicio"].'</td>
                                <td>'.$value["FechaFin"].'</td>
                                <td>'.$value["Activo"].'</td>

                                <td>

                                  <div class="btn-group">

                                    <button class="btn btn-warning btnEditarParametro" idPeriodo="'.$value["Id_PeriodoAcm"].'" data-toggle="modal" data-target="#modalEditarParametro"><i class="fa fa-pencil"></i></button>



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

</div>
<!-- /.content-wrapper -->


<!--=====================================
MODAL AGREGAR USUARIO
======================================-->

<div id="modalAgregarParametro" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Agregar Nuevo Parametro</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA EL NOMBRE DEL PARAMETRO -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-cog"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoParametro" id="nuevoParametro" placeholder="Nombre del Parametro"  style="text-transform: uppercase" maxlength="30" required>

              </div>

            </div>


          <!-- ENTRADA PARA EL VALOR DEL PARAMETRO -->

          <div class="form-group">

            <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoVal" id="nuevoVal" placeholder="Valor del Parametro" maxlength="100">

              </div>

          </div>

          </div>

        </div>
        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Guardar Parametro</button>

        </div>

        <?php

          $crearUsuario = new ControladorConfiguracion();
          $crearUsuario -> ctrCrearParametro();

        ?>
        <script src="vistas/js/ctrespacios.js"></script>

      </form>

    </div>

  </div>

</div>

<!--=====================================
MODAL EDITAR PARAMETRO
======================================-->

<div id="modalEditarParametro" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#f39c12; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Editar Parametro</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA EL NOMBRE DEL PARAMETRO -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-cog"></i></span>

                <input type="text" class="form-control input-lg" name="editarParametro" id="editarParametro" placeholder="Nombre del Parametro" style="text-transform: uppercase" maxlength="30" required>

              </div>

            </div>


          <!-- ENTRADA PARA EL VALOR DEL PARAMETRO -->

          <div class="form-group">

            <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>

                <input type="text" class="form-control input-lg" name="editarVal" id="editarVal" placeholder="Valor del Parametro" maxlength="15">

              </div>

          </div>

          </div>

        </div>
        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Guardar Parametro</button>

        </div>

        <?php

          $crearUsuario = new ControladorConfiguracion();
          $crearUsuario -> ctrEditarParametro();

        ?>
        <script src="vistas/js/ctrespacios.js"></script>

      </form>

    </div>

  </div>

</div>
