$(document).ready(function() {
  
  $('#filter').keyup(function(event) {
    
    if (event.keyCode == 27 || $(this).val() == '') {
      
      $(this).val('');
      
      $('tbody tr').removeClass('visible').show().addClass('visible');
    }
    else {
      filter('ol li', $(this).val());
    }
  });
});

function filter(selector, query) {
  query = $.trim(query); 
  query = query.replace(/ /gi, '|'); 

  $(selector).each(function() {
    ($(this).text().search(new RegExp(query, 'i')) < 0) ? $(this).hide().removeClass('visible') : $(this).show().addClass('visible');
  });
}

function noenter() {
  return !(window.event && window.event.keyCode == 13); }