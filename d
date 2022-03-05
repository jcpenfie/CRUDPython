<div class="container">
        <div class="card p-3 m-5">
            <form action="/update" method="POST">
                <div class="form-group p-2">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="{{Joyas[0]["nombre"]}}">
                </div>
                <div class="form-group p-2">
                    <label for="descripcion">Descripción:</label>
                    <textarea class="form-control" id="descripcion" name="descripcion" 
                        cols="30" rows="10">{{Joyas[0]["descripcion"]}}</textarea>
                </div>
                <div class="form-group p-2">
                    <label for="estado">Estado:</label>
                    <select class="form-select" aria-label="Default select example" name="estado" id="estado">
                        <option selected>Estado</option>
                        <option value="revision">Revisión</option>
                        <option value="fabricando">Fabricando</option>
                        <option value="fabricado">Fabricado</option>
                        <option value="en venta">En venta</option>
                    </select>
                </div>
                <div class="form-group p-2">
                    <input type="number" min="0.01" name="precio" step="any" class="form-control" value="{{Joyas[0]["precio"]}}"
                        required>
                </div>
                <div class="form-group p-2">
                    <input type="number" min="1" name="stock" class="form-control" value="{{Joyas[0]["cantidadStock"]}}" required> </td>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>