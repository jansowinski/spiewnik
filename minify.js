// https://github.com/jakubpawlowicz/clean-css
fs = require('fs');
file = fs.readFile('style.css', 'utf-8', function(err,data){
  //console.log(data)
  var CleanCSS = require('clean-css');
  var output = new CleanCSS().minify(data)
  console.log(output.styles)
});
