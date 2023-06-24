function eliminarProducto(id) {
  Swal.fire({
    title: '¿Desea eliminar esté producto?',
    icon: 'success',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Confirmar'
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire('Eliminado!','Producto Eliminado Correctamente','success').then(function() {
          window.location.href = "/delete/"+id+"/";
      })
    }
  })
}

function eliminarEmpleado(id) {
  Swal.fire({
    title: '¿Desea eliminar esté Empleado?',
    icon: 'success',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Confirmar'
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire('Eliminado!','Empleado Eliminado Correctamente','success').then(function() {
          window.location.href = "/deleteEmpleado/"+id+"/";
      })
    }
  })
}

function eliminarProductoCarrito(id) {
  Swal.fire({
    title: '¿Desea eliminar esté Producto del carrito?',
    icon: 'success',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Confirmar'
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire('Eliminado!','Empleado Eliminado Correctamente','success').then(function() {
          window.location.href = "/eliminar_del_carrito/"+id+"/";
      })
    }
  })
}

function eliminarSuscripcion() {
  Swal.fire({
    title: '¿Está seguro que desea desuscribirse?',
    icon: 'success',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Confirmar'
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire('Listo!','Ya no eres suscritor','success').then(function() {
          window.location.href = "/desuscribirse/";
      })
    }
  })
}

function highlightRow(button) {
  // Obtén la fila padre del botón seleccionado
  var row = button.parentNode.parentNode;

  // Agrega o elimina la clase CSS 'highlight-row' para cambiar el color de fondo
  if (row.classList.contains('highlight-row')) {
    row.classList.remove('highlight-row');
  } else {
    row.classList.add('highlight-row');
  }
}


function mensaje(titulo,texto,icono) {
    Swal.fire({
      title: titulo,
      text: texto,
      icon: icono,
      showCancelButton: false,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'success'
    })
}
