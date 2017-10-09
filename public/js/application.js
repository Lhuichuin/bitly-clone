$(document).ready(function(){
  // this ID here refers to the form where the 
  //usesr types in a URL, 
  // you may have a different name for the ID. 
  //Edit the code accordingly.
  
  $('#url-form').on("submit", function(e){
    console.log('hello');
    e.preventDefault();         
    $.ajax({
      url: '/urls', //this refers to the route post '/urls'
      method: 'POST',
      data: $(this).serialize(),
      //dataType: 'json',
      success: function(data){
        sqlObject = JSON.parse(data);
        //console.log(sqlObject, sqlObject.long_url, sqlObject.short_url);

        var long = sqlObject.long_url;
        var short = "http://localhost:9393/"+ sqlObject.short_url;


      $("#table").append("<tr>"
                           + "<td>"+ "<a href='" + long + "'>" + long + "</a></td>"+ "<td>"+ "<a href='" + short + "'>" + short + "</a></td>"
                           + "</tr>");

        
      // write some code here to display the shortened URL
     }
    }); // end of function .ajax
    return false;
  }); // end of function .submit
}); // end of function document.ready

