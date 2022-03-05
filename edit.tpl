<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <title>Editar Joya {{Joyas[0]["nombre"]}}</title>
</head>

<body>
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
                <input type="hidden" name="id" value="{{Joyas[0]["_id"]}}">
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</body>

</html>