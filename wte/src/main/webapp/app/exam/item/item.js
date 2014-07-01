function action_item(url,para){
  $.ajax({
         type:"POST",
         url: "exam_item_"+url,
         data:"id="+para,
         cache: false,
         success: function(html){
        	 document.getElementById('div_item_table').innerHTML=html;
           }
  });  
}


