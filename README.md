# MinifyingIonicSourceCode
just minify ionic source code with shell script

## Command description
```js
#  	Command					Desc
#	-i  					install module only if it does not exist.
#   -f  					install module whether exists or not.
#   -c						copy **01_jshint.js** file to ./hooks/before_prepare/ only if it does not exist.
#   -m  					copy **01_jshint.js** file to ./hooks/before_prepare/ whether exists or not.
```

## Install 

1、download the `minifying.sh` to your project folder and  make sure to give it execute permissions if you’re using Linux or Mac

2、download `01_jshint.js` and move it to somewhere as you like.

3、run command like below:

```shell
./minifying.sh -i jshint -i async -i cordova-uglify -c ../01_jshint.js
```

## Note
* if you uglify the source code, you should make sure that the modules' pathes that `uglify.js` depends on are creact, or you will get some error like below:

```js
module.js:327
    throw err;
    ^

Error: Cannot find module 'src/to/project/node_modules/cordova-uglify/node_modules/1/uglify-js'

```
