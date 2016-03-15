package display.two.kha;

class Kha2DRenderer implements Renderer
{
#if test
	@inject
	public var graphics:MockKha2DGraphics;

	public static var fonts:Map<String, MockKhaFont>;
#else
	@inject
	public var graphics:kha.graphics2.Graphics;

	public static var fonts:Map<String, kha.Font>;
#end

	private var container:KhaSprite;

	public function new(container:KhaSprite)
	{
		this.container = container;
	}

	public function init():Void
	{
	}

	public function dispose():Void
	{
	}

	public function render():Void
	{
		renderChildren(container, container.x, container.y);
	}

	private function renderChildren(container:KhaSprite, xPos:Float, yPos:Float):Void
	{
		for (child in container.children)
		{
			if (Std.is(child, KhaSprite))
			{
				renderChildren(cast(child, KhaSprite), child.x + xPos, child.y + yPos);
			}
			else
			{
				if (Std.is(child, KhaBitmapNode))
				{
					var bitmap:KhaBitmapNode = cast(child, KhaBitmapNode);
					graphics.drawSubImage(bitmap.imageData, bitmap.x, bitmap.y,
					bitmap.sx, bitmap.sy, bitmap.sw, bitmap.sh);
				}
				else
				{
					var textfield:KhaTextfieldNode = cast(child, KhaTextfieldNode);
					graphics.fontSize = textfield.fontSize;
					graphics.color = getColorFromValue(textfield.fontColor);
					graphics.font = fonts.get(textfield.fontName);
					graphics.drawString(textfield.text, textfield.x, textfield.y);
					graphics.color = getColorFromValue(0xffffffff);
				}
			}
		}
	}

#if test
	private inline function getColorFromValue(value:UInt):MockKhaColor
	{
		return null;
	}
#else
	private inline function getColorFromValue(value:UInt):kha.Color
	{
		return kha.Color.fromValue(value);
	}
#end
}
