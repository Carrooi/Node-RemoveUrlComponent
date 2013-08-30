# Remove url component

Remove some url parameter from url in browser.
Uses history API.

This will also work if you have got hash in your url.

## Usage

```
var remove = require('remove-url-component');

remove(['page']);
```

This will remove `page` parameter from your url.

False is returned if history API is not supported.

## Example

http://my.super-page.com/?arg1=aaaaa&page=2&arg2=bbbbb

will become:

http://my.super-page.com/?arg1=aaaaa&arg2=bbbbb

## Timeout

Maybe you will need to set timeout before removing, so you can set second argument in remove function.

```
remove(['arg1', 'arg2'], 3000);
```

## Changelog list

* 1.0.0
	+ Initial version