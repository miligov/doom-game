#!/bin/bash
set -e
cd /home/user/doom-game
cat src/00-head.html src/10-core.js src/20-art.js src/30-level.js \
    src/40-render.js src/50-combat.js src/60-loop.js src/70-game.js > index.html
node -e "
const fs=require('fs');const h=fs.readFileSync('index.html','utf8');
const i=h.indexOf('<script>\n(function');const j=h.lastIndexOf('</script>');
fs.writeFileSync('/tmp/dchk.js',h.slice(i+8,j));"
node --check /tmp/dchk.js
echo "СБОРКА OK  $(du -h index.html | cut -f1)"
