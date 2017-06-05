$('.dropdown-menu').click(function(e) {
  e.stopPropagation();
});

$('.botonSalir').click(function() {
  var ttk = $(this).attr("token");
  var dataString = 'ttk='+ttk;
  $.ajax({
    type: "POST",
    url: "<?php echo URL; ?>controlador/logout",
    data: dataString,
    beforeSend: function() {
      //alert('Datos serializados: '+dataString);
    },
    success: function(data) {
      //alert(data);
      if(data == 'adios') {
        window.location.href = "<?php echo URL; ?>login";
      } else {
        alert(data);
      }
    }
  });
});