#!/usr/bin/env node

var exec = require('child_process').exec;
var fs = require('fs');

var moduleNames = [
	'jshint',
	'async',
	'cordova-uglify'
];

dependiciesMap(function(err, depen) {
	if (err) {
		console.error('Some error occured:' + err);
	} else {
		moduleNames.forEach(function(name) {
			if (!nodeExistByPackageJSONFile(name, depen)|| !nodeExistByFolderName(name)) {
				installModule(name);
			}
		});
	}
});


function dependiciesMap(callBack) {
	fs.readFile('package.json', function(err, data) {
		if (err) {
			callBack(err, null);
		} else {
			var jsonObj=JSON.parse(data);
			callBack(null, jsonObj.devDependencies);
		}
	});
}

function nodeExistByPackageJSONFile(name, depen) {
	var version = depen[name];
	if (version) {
		return true;
	} else {
		return false;
	}
}
function nodeExistByFolderName(name) {
	var filePath = './node_modules/' + name;
	return fs.existsSync(filePath);
}

function installModule(name) {
	var command = 'npm install ' + name + ' --dev-save';
	console.log('Start to install module ' + name);
	exec(command, function(error, stdout, stderr) {
		if (error) {
			console.error('install module ' + name + 'failed:' + error);
		} else {
			console.log('install module ' + name + ' successed');
			if (name == 'cordova-uglify') {
				console.warn('Just make sure that the `uglify.js` file\'s module\' path is right ');
				setFileExecuable('./hooks/after_prepare/uglify.js');
			}
		}
	});
}

function setFileExecuable(filePath) {
	var command = 'chmod +x ' + filePath;
	console.log(command);
	exec(command, function(error, stdout, stderr) {
		if (error) {
			console.error('set file ' + filePath + ' to execuable failed:' + error);
		} else {
			console.log('set file ' + filePath + ' to execuable successed');
		}
	});
}

