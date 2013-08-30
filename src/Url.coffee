# Rewriten from https://github.com/vojtech-dobes/nette.ajax.js/blob/master/extensions/fidRemove.ajax.js

isSupported = ->
	return window.history && window.history.pushState && window.history.replaceState && !navigator.userAgent.match(/((iPod|iPhone|iPad).+\bOS\s+[1-4]|WebApps\/.+CFNetwork)/)


remove = (url, param) ->
	parts = url.split('&')
	del = []
	for part, i in parts
		reg = new RegExp('\^' + param + '=.*$')
		if part.match(reg) != null
			del.push(i)

	for d in del
		parts.splice(d, 1)

	return parts.join('&')

module.exports = (parameters = [], timeout = 0) ->
	if !isSupported()
		return false

	window.setTimeout( ->
		parts = window.location.toString().split('?')
		if typeof parts[1] != 'undefined'
			sub = parts[1].split('#')

			url = parts[0]
			query = sub[0]
			hash = if typeof sub[1] == 'undefined' then null else sub[1]

			for param in parameters
				if query.indexOf("#{param}=") != -1
					query = remove(query, param)

			if query != ''
				url += '?' + query

			if hash != null
				url += '#' + hash

			window.history.replaceState({}, null, url)
	, timeout)