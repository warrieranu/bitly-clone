(document).ready(function(){
  $('#url-form').submit(function(e){ 
    e.preventDefault();         
    $.ajax({
      url: '/url_changer', 
      method: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
     success: function(data){
     parsed_data = JSON.parse(data);
     debugger
     }
    }); // end of function .ajax
  }); // end of function .submit
}); // end of function document.ready

// var btn = document.getElementById("submitbtn")

// btn.addEventListener("click", function (){
    
// })
