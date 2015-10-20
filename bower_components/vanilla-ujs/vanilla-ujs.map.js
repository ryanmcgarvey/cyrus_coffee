{"version":3,"file":"vanilla-ujs.min.js","sources":["vanilla-ujs.js"],"names":["window","document","matches","doc","matchesSelector","webkitMatchesSelector","mozMatchesSelector","oMatchesSelector","msMatchesSelector","documentElement","CustomEvent","event","params","bubbles","cancelable","detail","undefined","evt","createEvent","initCustomEvent","prototype","LiteAjax","options","method","url","location","href","async","ajax","xhr","XMLHttpRequest","addEventListener","dispatchEvent","success","status","error","open","beforeSend","send","data","form","input","element","target","call","getAttribute","toLowerCase","createElement","action","style","display","setAttribute","appendChild","body","submit","preventDefault","message","confirm","stopPropagation","stopImmediatePropagation","CSRF","token","querySelector","param","sameOrigin","origin","a","create","split","join","indexOf","e","setRequestHeader","toUpperCase"],"mappings":"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"}