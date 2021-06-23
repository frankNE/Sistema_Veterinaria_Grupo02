<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Mantenimiento de Producto </title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
	<div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudProducto">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  class="simple_form" id="defaultForm2"  method="post">

					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary"  id="id_btn_filtrar" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
						</div>
						<div class="col-md-4">
							<c:if test="${sessionScope.MENSAJE != null }">
									<div class="alert alert-success" id="success-alert">
							 		   <button type="button" class="close" data-dismiss="alert">x</button>
										${sessionScope.MENSAJE}				
									</div>
							</c:if>
							<c:remove var="MENSAJE"/>
						</div>
					</div>
					
					<%-- <div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablePaginacion" class="table table-striped table-bordered" >
										<thead>
											<tr>
															<th>Id</th>
															<th>Nombre</th>
															<th>Descripcion</th>
															<th>Detalles</th>
															<th>Marca</th>
															<th>Serie</th>
															<th>Proveedor</th>
															<th>Precio</th>
															<th>Stock</th>
															<th>Categoria</th>
																																									
															<th></th>
															<th></th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.productos}" var="x">
													<tr>
														<td>${x.idProducto}</td>
														<td>${x.nombre}</td>
														<td>${x.descripcion}</td>
														<td>${x.des_detalles}</td>
														<td>${x.marca.nombre}</td>
														<td>${x.serie}</td>
														<td>${x.proveedor.descripcion}</td>
														<td>${x.precio}</td>
														<td>${x.stock}</td>													
														<td>${x.categoria.nombre}</td>
														
														
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idProducto}','${x.nombre}','${x.descripcion}','${x.des_detalles}','${x.marca.idMarca}','${x.serie}','${x.proveedor.idProveedor}','${x.precio}','${x.stock}','${x.categoria.idCategoria}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idProducto}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div> --%>
		 		
		 		<div class="row" > 
						<div class="table-responsive">
						
									<table id="id_table" class="table table-bordered" >
										<thead>
											<tr>
												<th style="width: 10%">ID</th>
												<th style="width: 20%">Nombre</th>
												<th style="width: 10%">Descripcion</th>
												<th style="width: 10%">detalles</th>
												<th style="width: 10%">Marca</th>
												<th style="width: 20%">Serie</th>
												<th style="width: 20%">Proveedor</th>
												<th style="width: 15%">Precio</th>
												<th style="width: 20%">Stock</th>
												<th style="width: 20%">Categoria</th>
												<th style="width: 10%">Actualiza </th>
												<th style="width: 10%">Elimina </th>
											</tr>
										</thead>
											<tbody>
											</tbody>
										</table>	
									
							
					</div>
		  </div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraProducto" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_descripcion">Descripcion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_descripcion" name="descripcion" placeholder="Ingrese la Descripcion" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_serie">Serie</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_serie" name="serie" placeholder="Ingrese la serie" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_stock">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_stock" name="stock" placeholder="Ingrese el stock" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_marca">Marca</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_marca" name="idMarca" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_proveedor">Proveedor</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_proveedor" name="idProveedor" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                       <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_categoria" name="idCategoria" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_foto">Foto</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_foto" name="foto" placeholder="Ingrese la foto" type="file"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary" id="id_btn_registra">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="actualizaProducto" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_idProducto">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="ac_idProducto" readonly="readonly" name="idProducto" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_serie">Serie</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_serie" name="serie" placeholder="Ingrese el Nombre" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_precio" name="precio" placeholder="Ingrese el Precio" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_stock">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_stock" name="stock" placeholder="Ingrese el Stock" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_marca">Marca</label>
		                                        <div class="col-lg-5">
													<select id="ac_marca" name="marca.idMarca" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>      
							                         </select>
		                                        </div>
		                                    </div>			                                                                        
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_proveedor">Proveedor</label>
		                                        <div class="col-lg-5">
													<select id="ac_proveedor" name="proveedor.idProveedor" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>      
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_categoria">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="ac_categoria" name="categoria.idCategoria" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>      
							                         </select>
		                                        </div>
		                                    </div>	
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		<div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Producto</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>



     </div>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$.getJSON("listaCategoria", {}, function(data, q,t){
	$.each(data, function(index,item){
		$("#id_reg_categoria").append("<option value="+item.idCategoria +">"+ item.nombre +"</option>");
		$("#ac_categoria").append("<option value="+item.idCategoria +">"+ item.nombre +"</option>");
	});
	
});
$.getJSON("listaProveedor", {}, function(data, q,t){
	$.each(data, function(index,item){
		$("#id_reg_proveedor").append("<option value="+item.idProveedor +">"+ item.descripcion +"</option>");
		$("#ac_proveedor").append("<option value="+item.idProveedor +">"+ item.descripcion +"</option>");
	});
	
});
$.getJSON("listaMarca", {}, function(data, q,t){
	$.each(data, function(index,item){
		$("#id_reg_marca").append("<option value="+item.idMarca +">"+ item.nombre +"</option>");
		$("#ac_marca").append("<option value="+item.idMarca +">"+ item.nombre +"</option>");
	});
	
});



$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});


function eliminar(id){	
	$('#idModalElimina').modal('show');
	$('#id_elimina').val(id);	
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}


$("#id_btn_registra").click(function() {
	var validator = $('#id_form_registra').data('bootstrapValidator');
	validator.validate();
		
	if(validator.isValid()) {
		var formData=new FormData();
		var file = $('#id_reg_foto')[0].files[0];
		
		formData.append("foto",file);
		formData.append("nombre",$("#id_reg_nombre").val());
		formData.append("descripcion",$("#id_reg_descripcion").val());
		formData.append("serie",$("#id_reg_serie").val());
		formData.append("precio",$("#id_reg_precio").val());
		formData.append("stock",$("#id_reg_stock").val());
		formData.append("idMarca","1");
		formData.append("idProveedor","1");
		formData.append("idCategoria","1");
		
		
		$.ajax({
			type: "POST",
			data: formData,
			enctype: 'multipart/form-data',
			url: "/registraProductoConFoto",
			processData: false,
			contentType: false,
			cache: false,
			success: function(data) {
				
				$('#idModalRegistra').modal("hide");
				mostrarMensaje(data.MENSAJE);
				//limpiar();
				validator.resetForm();
			},
			error: function() {
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
	
});





</script>


</body>
</html>