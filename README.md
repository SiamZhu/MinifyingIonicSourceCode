# MinifyingIonicSourceCode
just minify ionic source code with shell script

## Command description
```js
#  	命令选项				|	说明
#	-i  				|	安装依赖组件:(当前会判断node_modules目录下是否包含该组件，如果包含，则不下载，否则，下载该依赖组件，区别于：-if),若安装的是cordova_uglify组件，则会自动赋予/hooks/after_prepare/uglify.js文件可执行权限
#   -f  				|	强制安装依赖组件，不管是否已按钮该组件,若安装的是cordova_uglify组件，则会自动赋予/hooks/after_prepare/uglify.js文件可执行权限
#   -c					|	拷贝jshint.js文件到:./hooks/before_prepare/目录下(该文件已存在01_jshint.js，则忽略),同时给予该文件可执行权限
#   -m  				|	拷贝jshint.js文件到:./hooks/before_prepare/目录下(该文件已存在01_jshint.js，则覆盖),同时给予该文件可执行权限
```
