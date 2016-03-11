import core.ObjectFactoryTests;
import display.layer.RenderableLayerManagerTests;
import display.two.TwoDimDisplayNodeContainerTests;
import display.two.kha.Kha2DRendererTests;
import massive.munit.TestSuite;

class TestSuite extends massive.munit.TestSuite
{
	public function new()
	{
		super();
		add(ObjectFactoryTests);
		add(TwoDimDisplayNodeContainerTests);
		add(RenderableLayerManagerTests);
		add(Kha2DRendererTests);
	}
}
