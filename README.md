# MinifyingIonicSourceCode
just minify ionic source code with shell script
## Methods
### [一、Using shell command](#1)
### [二、Using node auto](#2)

<h2 id = '1'>一、Using shell command</h2>
### Command description
```js
#  	Command					Desc
#	-i  					install module only if it does not exist.
#   -f  					install module whether exists or not.
#   -c						copy **01_jshint.js** file to ./hooks/before_prepare/ only if it does not exist.
#   -m  					copy **01_jshint.js** file to ./hooks/before_prepare/ whether exists or not.
```

### Install 

1、download the `minifying.sh` to your project folder and  make sure to give it execute permissions if you’re using Linux or Mac

2、download `01_jshint.js` and move it to somewhere as you like.

3、run command like below:

```shell
./minifying.sh -i jshint -i async -i cordova-uglify -c ../01_jshint.js
```

### Note(Also important to method 2)
* if you uglify the source code, you should make sure that the modules' pathes that `uglify.js` depends on are creact, or you will get some error like below:

```js
module.js:327
    throw err;
    ^

Error: Cannot find module 'src/to/project/node_modules/cordova-uglify/node_modules/1/uglify-js'

```
<h2 id = '2'>二、Using node auto</h2>

### Description

What you should do is below:

1、 Download the `01_minify.sh` and `02_jshint.js` and put them to `hooks/before_prepare/` folder under your project.

2、Make sure to give the both files execute permissions if you're using Linux or Mac

### **Note**

```
* You should make sure that the number in the *.sh* file is less than *.js* file, you can find *01* is less than *02* above.

* Make sure to give them execu permission
```
