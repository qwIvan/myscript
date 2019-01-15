// https://regex101.com/r/yX5xS8/73

const html = `
<ImG 

sTyle=""

src="http://t.cn/EqRt9Eh"

class=">"

Style=""

/>

<ImG 

style=""

src="http://t.cn/EqRt9Eh"

class=">"

STYLE=""

>
`.replace(/<img((?:"[^"]*"['"]*|'[^']*'['"]*|[^'">\/])+)\/?>/gi, '<img style="max-width: 100%" $1 style="max-width: 100%" >');
console.log(html)
