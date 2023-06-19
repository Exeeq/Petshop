function actualizarSuscriptor() {
  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/actualizar_suscriptor/', true);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      console.log('Campo suscriptor actualizado');
    }
  };
  xhr.send();
}