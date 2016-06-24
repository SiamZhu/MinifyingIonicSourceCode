# !/bin/shell

# 命令行参数说明：
#  	命令选项					说明
#	-i  					安装依赖组件:(当前会判断node_modules目录下是否包含该组件，如果包含，则不下载，否则，下载该依赖组件，区别于：-if),若安装的是cordova_uglify组件，则会自动赋予/hooks/after_prepare/uglify.js文件可执行权限
#   -f  					强制安装依赖组件，不管是否已按钮该组件,若安装的是cordova_uglify组件，则会自动赋予/hooks/after_prepare/uglify.js文件可执行权限
#   -c						拷贝jshint.js文件到:./hooks/before_prepare/目录下(该文件已存在01_jshint.js，则忽略),同时给予该文件可执行权限
#   -m  					拷贝jshint.js文件到:./hooks/before_prepare/目录下(该文件已存在01_jshint.js，则覆盖),同时给予该文件可执行权限
# echo $*
# getopts ":a:" opt
# echo $OPTARG

# 取出命令行选项参数
beforPrepare="./hooks/before_prepare"
afterPrepare="./hooks/after_prepare"
jshintFileName="01_jshint.js"
# 组件是否存在
function moduleExist() {
	# echo $1
	if [[ ! -d "./node_modules/$1" ]]; then
		return 0
	else
		return 1
	fi
}

# 文件是否存在
function fileExist() {
	if [[ ! -f "$1" ]]; then
		return 0
	else 
		return 1
	fi
}

# 文件是否有可执行权限
function fileCanExecu() {
	if [[ ! -x "$1" ]]; then
		return 0
	else 
		return 1
	fi
}

# 赋予文件可执行权限
function fileToExecu() {
	echo "chmod +x $1"
	chmod +x $1
}

# 组件安装
function moduleInstall() {
	echo "npm install $1 --save-dev"
	npm install $1 --save-dev

	if [[ $1 == "cordova-uglify" ]]; then
		local uglifyFile="./hooks/after_prepare/uglify.js"
		fileToExecu $uglifyFile

		echo "请打开文件uglify.js文件，判断其路径是否正确，否则会遇到一些错误："
		# open $uglifyFile
	fi
}

# 取出所有参数，分别进行校验
while getopts ":i:f:c:m:" opt 
do
	case $opt in
		i) 	
			moduleExist $OPTARG
			if [[ $? -eq 0 ]]; then
				moduleInstall $OPTARG
		    fi
		;;
		f)	moduleInstall $OPTARG
		;;
		c)  
			if [[ ! -d "$beforPrepare" ]]; then
				mkdir $beforPrepare
			fi

			if ! fileExist $OPTARG
			then
				cp $OPTARG "$beforPrepare/$jshintFileName"
				fileToExecu "$beforPrepare/$jshintFileName"
			else 
				if ! fileCanExecu $OPTARG 
					then
					fileToExecu "$beforPrepare/$jshintFileName"
				fi
			fi
		;;
		m)  
			if [[ ! -d "$beforPrepare" ]]; then
				mkdir $beforPrepare
			fi
			cp $OPTARG "$beforPrepare/$jshintFileName"
			fileToExecu "$beforPrepare/$jshintFileName"
		;;
	esac
done

# 请打开文件uglify.js文件，判断其路径是否正确，否则会遇到一些错误：
# open $uglifyFile

# 将该执行文件拷贝到工程目录并赋予执行权限
# chomod +x minifying.sh

# 安装依赖包，取决于工程目录里gulpfile.js使用到的，根据自己的需要放开

# npm install gulp --save-dev
# npm install gulp-util --save-dev
# npm install bower --save-dev
# npm install gulp-concat --save-dev
# npm install gulp-sass --save-dev
# npm install gulp-minify-css --save-dev
# npm install gulp-rename --save-dev
# npm install shelljs --save-dev
# npm install gulp-angular-templatecache --save-dev
# npm install gulp-ng-annotate --save-dev
# npm install gulp-useref --save-dev

