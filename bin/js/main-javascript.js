// Generated by Haxe 3.3.0
(function () { "use strict";
var HxOverrides = function() { };
HxOverrides.remove = function(a,obj) {
	var i = a.indexOf(obj);
	if(i == -1) {
		return false;
	}
	a.splice(i,1);
	return true;
};
var Main = function() { };
Main.main = function() {
	console.log("main()");
	console.log("main()");
	console.log("main()");
	console.log("main()");
	console.log("NewClass.x: " + package01_package02_NewClass.x);
	var fields = Type.getClassFields(package01_package02_NewClass);
	var _g = 0;
	while(_g < fields.length) {
		var field = fields[_g];
		++_g;
		console.log(field);
	}
};
var Reflect = function() { };
Reflect.fields = function(o) {
	var a = [];
	if(o != null) {
		var hasOwnProperty = Object.prototype.hasOwnProperty;
		for( var f in o ) {
		if(f != "__id__" && f != "hx__closures__" && hasOwnProperty.call(o,f)) {
			a.push(f);
		}
		}
	}
	return a;
};
var Type = function() { };
Type.getClassFields = function(c) {
	var a = Reflect.fields(c);
	HxOverrides.remove(a,"__name__");
	HxOverrides.remove(a,"__interfaces__");
	HxOverrides.remove(a,"__properties__");
	HxOverrides.remove(a,"__super__");
	HxOverrides.remove(a,"__meta__");
	HxOverrides.remove(a,"prototype");
	return a;
};
var package01_package02_NewClass = function() { };
package01_package02_NewClass.callSomething = function() {
	console.log("x");
};
package01_package02_NewClass.x = "What the fuck? It still does not work.";
Main.main();
})();