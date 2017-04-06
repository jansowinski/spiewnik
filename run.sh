#!/bin/bash
export LANG=C.UTF-8

adobe_script_path='/Users/janko/Library/Preferences/Adobe\ InDesign/Version\ 8.0/en_US/Scripts/Scripts\ Panel'

cp scripts/PageBreaks.js $adobe_script_path
mkdir -p generated

echo "Generating XML..."

echo "<root>" > generated/spiewnik.xml
awk -F '```' '{for (i=1; i<NF; i++) {OFS=c%2?"<\/text>\n<\/song>\n<Pagebreak><\/Pagebreak>":FS; printf "%s%s", $i, OFS; c++}
    print $NF}' spiewnik.md | gsed 's/```/<\/tytul><text>/' | gsed 's/## /<song><tytul>/' |  gsed '/# /a <\/file_title>' | gsed 's/# /<file_title>/'>> generated/spiewnik.xml
echo '</root>' >> generated/spiewnik.xml


echo "Generating HTML..."

echo '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Śpiewnik Błękitnej XIV</title><link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"><link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><style>' > generated/spiewnik.html
node scripts/minify.js >> generated/spiewnik.html
echo '</style></head><body class="dark"><a class="scheme" href="#"><i class="fa fa-adjust fa-2x" aria-hidden="true"></i></a><div class="container"><div class="row"><div class="col-md-6 col-md-offset-3">' >> generated/spiewnik.html
awk -F '```' '{for (i=1; i<NF; i++) {OFS=c%2?"</code></pre>":FS; printf "%s%s", $i, OFS; c++}
    print $NF}' spiewnik.md | gsed 's/```/<\/h2><pre><code>/' | gsed 's/## /<h2>/' | gsed '/# /a <\/h1>' | gsed 's/# /<h1>/' >> generated/spiewnik.html
echo '</div></div></div><script src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script><script type="text/javascript">$(document).ready(function(){$(".scheme").click(function(){$("body").toggleClass("light")});});</script></body></html>' >> generated/spiewnik.html

cp generated/spiewnik.html server/

echo "Generating EPUB..."

echo '\% Śpiewnik\n% Błękitna Czternastka\n\n' > generated/spiewnik.txt
gsed 's/# Śpiewnik//' spiewnik.md | gsed 's/##/#/' >> generated/spiewnik.txt

cd generated && pandoc spiewnik.txt -o spiewnik.epub && rm spiewnik.txt

echo "Generating MOBI..."
kindlegen spiewnik.epub >/dev/null

echo "DONE 🎶"
