package display.two;

class TwoDimDisplayNode implements DisplayNode
{
	@:isVar
	public var name(get, set):String;

	@:isVar
	public var x(get, set):Float;

	@:isVar
	public var y(get, set):Float;

	@:isVar
	public var z(get, set):Float;

	@:isVar
	public var width(get, set):Float;

	@:isVar
	public var height(get, set):Float;

	@:isVar
	public var depth(get, set):Float;

	@:isVar
	public var scaleX(get, set):Float;

	@:isVar
	public var scaleY(get, set):Float;

	@:isVar
	public var scaleZ(get, set):Float;

	@:isVar
	public var parent(get, null):DisplayNodeContainer;

	public function new()
	{

	}
	public function init():Void
	{
	}

	public function dispose():Void
	{
		name = null;
	}

	private function get_name():String
	{
		return name;
	}

	private function set_name(value:String):String
	{
		return this.name = value;
	}

	private function get_x():Float
	{
		return x;
	}

	private function set_x(value:Float):Float
	{
		return this.x = value;
	}

	private function get_y():Float
	{
		return y;
	}

	private function set_y(value:Float):Float
	{
		return this.y = value;
	}

	private function get_z():Float
	{
		return z;
	}

	private function set_z(value:Float):Float
	{
		return this.z = value;
	}

	private function get_width():Float
	{
		return width;
	}

	private function set_width(value:Float):Float
	{
		return this.width = value;
	}

	private function get_height():Float
	{
		return height;
	}

	private function set_height(value:Float):Float
	{
		return this.height = value;
	}

	private function get_depth():Float
	{
		return depth;
	}

	private function set_depth(value:Float):Float
	{
		return this.depth = value;
	}

	private function get_scaleX():Float
	{
		return scaleX;
	}

	private function set_scaleX(value:Float):Float
	{
		return this.scaleX = value;
	}

	private function get_scaleY():Float
	{
		return scaleY;
	}

	private function set_scaleY(value:Float):Float
	{
		return this.scaleY = value;
	}

	private function get_scaleZ():Float
	{
		return scaleZ;
	}

	private function set_scaleZ(value:Float):Float
	{
		return this.scaleZ = value;
	}

	private function set_parent(value:DisplayNodeContainer):DisplayNodeContainer
	{
		return this.parent = value;
	}

	private function get_parent():DisplayNodeContainer
	{
		return this.parent;
	}
}
