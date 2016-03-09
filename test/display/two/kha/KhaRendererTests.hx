package display.two.kha;

import massive.munit.Assert;
import mockatoo.Mockatoo.*;

using mockatoo.Mockatoo;

class KhaRendererTests 
{
	private var renderer:KhaRenderer;
	private var graphics:Graphics;

	public function new() 
	{
	}
	
	@Before
	public function setup():Void
	{
		renderer = new KhaRenderer();
		renderer.init();
		graphics = mock(Graphics);

		renderer.graphics = graphics;
	}
	
	@After
	public function tearDown():Void
	{
		renderer = null;
		graphics = null;
	}
	
	@Test
	public function shouldInjectGraphics():Void
	{
		Assert.areEqual(graphics, renderer.graphics);
	}
}
