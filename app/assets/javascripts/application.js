// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require ace/ace
//= require ace/worker-html
//= require ace/theme-github
//= require ace/mode-python
//= require ace/mode-csharp
//= require ace/mode-ruby
//= require ace/mode-javascript
//= require ace/mode-latex
//= require ace/mode-c_cpp
//= require ace/mode-java
//= require ace/mode-scala
//= require ace/mode-html
//= require ace/mode-css

$(document).ready(function() {
  $('#save_button').click(function(){
      $('#prueba').empty();
      $('#prueba').append("<%= File.open(@archive.uploaded_file.path, 'w+:ISO-8859-1') { |l|" +
                            "l.write(" + $('.ace_line').text() + ")} %>");
  });
});