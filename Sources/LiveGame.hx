package;

import core.InjectionSettings;
import kha.Image;
import kha.Font;
import kha.Assets;
import kha.Framebuffer;

@:build(com.dongxiguo.continuation.Continuation.cpsByMeta(":async"))
class LiveGame
{
	private var initialized:Bool = false;

	private var fonts:Map<String, Font>;
	private var backbuffer:Image;
	private var framebuffer:Framebuffer;

	public function new()
	{
		backbuffer = Image.createRenderTarget(800, 600);
	}

	function update():Void
	{
	}

	function render(framebuffer:Framebuffer): Void
	{
		if (initialized)
		return;

		initialized = true;
		this.framebuffer = framebuffer;

		loadFonts(function ():Void {
			new InjectionSettings(backbuffer, this.framebuffer, fonts);
		});
	}

	@:async
	private function loadFonts():Void
	{
		fonts = new Map<String, Font>();
		fonts.set("AnonymousProB", @await Assets.loadFont("AnonymousProB"));
	}
}
