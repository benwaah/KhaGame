package display.two.kha;

class KhaBitmapNode extends TwoDimDisplayNode implements BitmapNode
{
	public var imageData(get, set):Dynamic;

	public var sx(get, set):UInt;

	public var sy(get, set):UInt;

	public var sw(get, set):UInt;

	public var sh(get, set):UInt;

	public function new()
	{
	}

	private function get_imageData():Dynamic
	{
		return imageData;
	}

	private function set_imageData(value:Dynamic):Dynamic
	{
		return this.imageData = value;
	}

	private function get_sx():UInt
	{
		return sx;
	}

	private function set_sx(value:UInt):UInt
	{
		return this.sx = value;
	}

	private function get_sy():UInt
	{
		return sy;
	}

	private function set_sy(value:UInt):UInt
	{
		return this.sy = value;
	}

	private function get_sw():UInt
	{
		return sw;
	}

	private function set_sw(value:UInt):UInt
	{
		return this.sw = value;
	}

	private function get_sh():UInt
	{
		return sh;
	}

	private function set_sh(value:UInt):UInt
	{
		return this.sh = value;
	}
}
