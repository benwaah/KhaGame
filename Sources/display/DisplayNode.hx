package display;

import core.BaseObject;

interface DisplayNode extends BaseObject
{
	var name(default, default):String;

	var x(default, default):Float;
	var y(default, default):Float;
	var z(default, default):Float;

	var width(default, default):Float;
	var heigth(default, default):Float;
	var depth(default, default):Float;

	var scaleX(default, default):Float;
	var scaleY(default, default):Float;
	var scaleZ(default, default):Float;

	var parent(get, null):DisplayNodeContainer;
}
