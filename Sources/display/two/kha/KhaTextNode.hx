package display.two.kha;

class KhaTextNode extends TwoDimDisplayNode implements TextfieldNode
{
	public var text(get, set):String;

	public var fontSize(get, set):UInt;

	public var fontColor(get, set):UInt;

	public var fontName(get, set):String;

	public function new()
	{
	}

	private function get_text():String
	{
		return text;
	}

	private function set_text(value:String):String
	{
		return this.text = value;
	}

	private function get_fontSize():UInt
	{
		return fontSize;
	}

	private function set_fontSize(value:UInt):UInt
	{
		return this.fontSize = value;
	}

	private function get_fontColor():UInt
	{
		return fontColor;
	}

	private function set_fontColor(value:UInt):UInt
	{
		return this.fontColor = value;
	}

	private function get_fontName():String
	{
		return fontName;
	}

	private function set_fontName(value:String):String
	{
		return this.fontName = value;
	}
}
