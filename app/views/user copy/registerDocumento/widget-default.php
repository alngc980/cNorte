<?php 
    $dataVista = $data["dataVista"]; 
?>
<div class="col-xl-12 order-xl-2">
    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-8">
                    <h3 class="mb-0">Nuevo Documento </h3>
                </div>

            </div>
        </div>
        <div class="card-body">
            <form role="form" class="form" id="fnRegisterDocumentoCab">
                <h6 class="heading-small text-muted mb-4">Datos del Programa</h6>
                <div class="pl-lg-4">
                    <div class="row">
                    <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-idTipo">Tipo</label>
                                 <select class="form-control" id="idTipo" name="tipo" required>
                                    <?php foreach($dataVista["datTipo_documento"] as $dat) :?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                        <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-idInputPrograma">Programa</label>
                                <select class="form-control" id="idInputPrograma" name="programa" required>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-idInputCodigo">Código</label>
                                <input type="text" id="idInputCodigo" class="form-control" placeholder="Ingrese el código" readOnly>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-idInputVersion">Versión Actual</label>
                                <input type="text" id="idInputVersion" class="form-control" placeholder="Ingrese la Versión" readOnly>
                            </div>
                        </div>
                       
                    </div>
                    
                </div>
                <h6 class="heading-small text-muted mb-4">Datos de Evaluación</h6>
                <div class="pl-lg-4">
                    <div class="row">
                        
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">Tarea</label>
                                <select class="form-control" id="idTarea" name="tarea" required>
                                <?php foreach($dataVista["datTarea"] as $dat) :?>
                                    <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                    
                                </select>
                                
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-empresa">Empresa</label>
                                <select class="form-control" id="idEmpresa" name="empresa" required>
                                <?php foreach($dataVista["datOtrasEmpresa"] as $dat) :?>
                                    <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">UUNN</label>
                                <select class="form-control" id="iduunn" name="uunn" required>
                                <?php foreach($dataVista["datUUNN"] as $dat) :?>
                                    <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        
                       
                    </div>
                    <div class="row">
                       
                       <div class="col-lg-6">
                           <div class="form-group">
                               <label class="form-control-label">Actividad</label>
                               <textarea rows="3" id="idActividad" name="actividad" class="form-control" placeholder="Ingrese la Actividad."></textarea>
                           </div>
                       </div>
                       <div class="col-lg-6">
                           <div class="form-group">
                               <label class="form-control-label">Obra</label>
                               <textarea rows="3" id="idObra" name="obra" class="form-control" placeholder="Ingrese el detalle de la obra"></textarea>
                           </div>
                       </div>
                       <div class="col-lg-3">
                           <div class="form-group">
                               <label class="form-control-label" for="input-lugar">Lugar</label>
                               <input type="text" id="idLugar" name="lugar" class="form-control" placeholder="Ingrese Lugar"   maxlength="500" required>
                           </div>
                       </div>
                       <div class="col-lg-3">
                           <div class="form-group">
                               <label class="form-control-label" for="input-area">Area</label>
                               <input type="text" id="idArea" name="area" class="form-control" placeholder="Ingrese el área"   maxlength="220" required>
                           </div>
                       </div>
                       <div class="col-lg-3">
                           <div class="form-group">
                               <label class="form-control-label" for="input-responsable">Responsable</label>
                               <select class="form-control" id="idInputResponsable" name="responsable" required>
                                <?php foreach($dataVista["datEmpleados"] as $dat) :?>
                                    <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombres." ".$dat->cApellidos ?></option>
                                    <?php endforeach ?>
                                </select>
                           </div>
                       </div>
                       <div class="col-lg-3">
                           <div class="form-group">
                               <label class="form-control-label" for="input-cargo">Cargo</label>
                               <select class="form-control" id="idCargo" name="cargo" required>
                                <?php foreach($dataVista["datCargos"] as $dat) :?>
                                    <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cCargo ?></option>
                                    <?php endforeach ?>
                                    
                                </select>
                           </div>
                       </div>
                       <div class="col-lg-4">
                           <div class="form-group">
                               <label class="form-control-label" for="input-supervision">Tipo de Supervisión</label>
                               <select class="form-control" id="idSupervision" name="supervision" required>
                                <?php foreach($dataVista["datSupervision"] as $dat) :?>
                                    <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                    
                                </select>
                           </div>
                       </div>
                       <div class="col-lg-4">
                           <div class="form-group">
                               <label class="form-control-label" for="input-acta">N° Acta</label>
                               <input type="number" id="idActa" name="acta" class="form-control" placeholder="Ingrese númerp de acta" required>
                           </div>
                       </div>
                       <div class="col-lg-4">
                           <div class="form-group">
                               <label class="form-control-label" for="input-sasd">Em. Superv. al Servicio de</label>
                               <input type="text" id="idSasd" name="sasd" class="form-control" placeholder="" value=""  maxlength="250" required>
                           </div>
                       </div>
                   </div>
                </div>
            
                <div class="custom-control custom-control-alternative custom-checkbox">
                    <div class="imgLoad" style="display:none">
                        <img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />
                    </div>
                    <span class="advertencia text-center">
                        <div class="text-success" id="smslog" ></div>
                        <div class="text-danger" id="smslogerror" ></div>
                    </span>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary my-4" type="submit">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="res/dtgsk/js/user/registroDocumento.js"></script>
