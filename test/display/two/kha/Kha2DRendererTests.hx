package display.two.kha;

import massive.munit.Assert;
import mockatoo.Mockatoo.*;

using mockatoo.Mockatoo;

class Kha2DRendererTests
{
	private var renderer:Kha2DRenderer;
	private var graphics:MockKha2DGraphics;

	private var container:KhaSprite;

	public function new() 
	{
	}
	
	@Before
	public function setup():Void
	{
		container = new KhaSprite();
		renderer = new Kha2DRenderer(container);
		renderer.init();
		graphics = mock(MockKha2DGraphics);

		renderer.graphics = graphics;
	}
	
	@After
	public function tearDown():Void
	{
		renderer = null;
		graphics = null;
		container = null;
	}
	
	@Test
	public function shouldInjectGraphics():Void
	{
		Assert.areEqual(graphics, renderer.graphics);
	}
}
