import core.ObjectFactoryTests;
import display.layer.RenderableLayerManagerTests;
import display.two.TwoDimDisplayNodeContainerTests;
import display.two.kha.KhaRendererTests;
import massive.munit.TestSuite;

class TestSuite extends massive.munit.TestSuite
{
	public function new()
	{
		super();
		add(ObjectFactoryTests);
		add(TwoDimDisplayNodeContainerTests);
		add(RenderableLayerManagerTests);
		add(KhaRendererTests);
	}
}
