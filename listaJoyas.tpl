<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <title>Joyas</title>
</head>

<body style="background-color: #508bfc;">
    <div class="container">
    <nav class="navbar navbar-light bg-light rounded">
        <div class="container-fluid">
            <a class="navbar-brand" href="/joyas">
                <i class='bx bxs-diamond'></i>
                Joyería
            </a>
            <a href="/" class="btn btn-danger">Cerra Sesión</a>
        </div>
    </nav>
    <table class="table mt-2 rounded" style="background-color: white;">
        <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">Nombre</th>
                <th scope="col">Descripción</th>
                <th scope="col">Estado</th>
                <th scope="col">Precio</th>
                <th scope="col">Stock</th>
                <th scope="col" colspan="2"></th>
            </tr>
        </thead>
        <tbody>
            %for joya in joyas:
            <tr>
                <th scope="row">{{joya["id"]}}</th>
                <td>{{joya["nombre"]}}</td>
                <td>{{joya["descripcion"]}}</td>
                <td>{{joya["estado"]}}</td>
                <td>{{joya["precio"]}}€</td>
                <td>{{joya["cantidadStock"]}}</td>
                <td>
                    <div class="d-flex gap-2 justify-content-center">
                        <a href="/delete/{{joya["_id"]}}" class="btn btn-danger"> Eliminar </a>
                        <a href="/edit/{{joya["_id"]}}" class="btn btn-primary"> Editar <i
                                class="fa-solid fa-pen"></i> </a>
                    </div>
                </td>
            </tr>
            %end
            <tr>
                <form action="/insert" method="POST">
                    <td> <input type="text" name="id" placeholder="JY0000" class="form-control" required> </td>
                    <td> <input type="text" name="nombre" placeholder="Nombre" class="form-control" required> </td>
                    <td> <input type="text" name="descripcion" placeholder="Descripción" class="form-control" required>
                    </td>
                    <td> 
                        <select class="form-select" aria-label="Default select example" name="estado">
                            <option selected>Estado</option>
                            <option value="revision">Revisión</option>
                            <option value="fabricando">Fabricando</option>
                            <option value="fabricado">Fabricado</option>
                            <option value="en venta">En venta</option>
                        </select> 
                    </td>
                    <td>
                        <div class="input-group" style="min-width: 100px;">
                            <input type="number" min="0.01" name="precio" placeholder="Precio" step="any"
                                class="form-control" required>
                            <span class="input-group-text">€</span>
                        </div>
                    </td>
                    <td> <input type="number" min="1" name="stock" placeholder="Stock" class="form-control"
                            required> </td>
                    <th> <input type="submit" value="Añadir producto" class="btn btn-success"> </th>
                </form>
            </tr>
        </tbody>
    </table>
    </div>
</body>

</html>