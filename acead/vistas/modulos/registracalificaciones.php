<div class="content-wrapper">

    <section class="content-header">

        <h1>

            CALIFICACIONES

            <small>Registro por Secciones</small>

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Tablero</li>

        </ol>

    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">


                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                            title="Collapse">
                        <i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <form role="form">
                    <!-- text input -->
                    <div class="form-group">
                        <label>DOCENTE</label>
                        <label id="nombredocente"></label>
                    </div>

                    <!-- select -->
                    <div class="form-group">
                        <label>SECCIONES ASIGNADAS</label>
                        <select class="form-control" id="cbosecciones">
                            <option value="" selected="" disabled="">Seleccione una Seccion...</option>

                        </select>
                    </div>



                </form>
                <!-- TABLA 000000000000000000000000000000000000000000000000000000000000000-->
                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">

                    <div class="row">
                        <div class="col-sm-12">
                            <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 182px;" >
                                            NOMBRE ALUMNO
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 224px;">
                                           NOTA
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 199px;">
                                           OBSERVACION
                                        </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                                <tfoot>
                                    <tr>
<!--                                        <th rowspan="1" colspan="1">
                                            NOMBRE ALUMNO
                                        </th>
                                        <th rowspan="1" colspan="1">
                                            NOTA
                                        </th>
                                        <th rowspan="1" colspan="1">
                                            OBSERVACION
                                        </th>-->
                                        
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    </div>
                <!-- FIN TABLA 00000000000000000000000000000000000000000000000000000000000-->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                Footer
            </div>
            <!-- /.box-footer-->
        </div>
        <!-- /.box -->

    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    $(function () {
        $('#example1').DataTable()
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': false
        })
    })
</script>

<script src="../acead/vistas/js/registracalificaciones.js"></script>