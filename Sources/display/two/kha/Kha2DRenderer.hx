package display.two.kha;

import kha.Color;
import kha.Font;
class Kha2DRenderer implements Renderer
{
	@inject
	public var graphics:kha.graphics2.Graphics;

	public static var fonts:Map<String, Font>;

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
				renderChildren(child, child.x + xPos, child.y + yPos);
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
					graphics.color = Color.fromValue(textfield.fontColor);
					graphics.font = fonts.get(textfield.fontName);
					graphics.drawString(textfield.text, textfield.x, textfield.y);
				}
			}
		}
	}

}
