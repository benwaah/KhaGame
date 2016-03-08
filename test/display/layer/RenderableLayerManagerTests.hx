package display.layer;

import display.layer.RenderableLayerManager.RendererContainer;
import display.two.TwoDimDisplayNodeContainer;
import massive.munit.Assert;
import mockatoo.Mockatoo.*;

using mockatoo.Mockatoo;

class RenderableLayerManagerTests 
{
	private var layerManager:LayerManager;
	private var bottomContainer:DisplayNodeContainer;
	private var topContainer:DisplayNodeContainer;
	private var renderer:Renderer;
	
	public function new() {}
	
	@Before
	public function setup():Void
	{
		topContainer = new TwoDimDisplayNodeContainer();
		topContainer.init();

		layerManager = new RenderableLayerManager(topContainer);
		layerManager.init();

		bottomContainer = new TwoDimDisplayNodeContainer();
		bottomContainer.init();

		renderer = mock(Renderer);
	}
	
	@After
	public function tearDown():Void
	{
		layerManager = null;
		bottomContainer = null;
		renderer = null;
	}
	
	@Test
	public function shouldAddLayerByName():Void
	{
		layerManager.addLayerByName("bottom", bottomContainer, renderer);
		var layers:Map<String, RendererContainer> = layerManager.getLayerMap();
		Assert.isNotNull(layers);
		Assert.areEqual(bottomContainer, layers.get("bottom").container);
		Assert.areEqual(renderer, layers.get("bottom").renderer);
	}

	@Test
	public function shouldAddLayerToTopLevelContainer():Void
	{
		layerManager.addLayerByName("bottom", bottomContainer, renderer);
		Assert.areEqual(topContainer, bottomContainer.parent);
		Assert.areEqual(1, topContainer.numChildren);
	}

	@Test
	public function shouldNotAddNullContainer():Void
	{
		layerManager.addLayerByName("bottom", null, renderer);
		Assert.areEqual(0, topContainer.numChildren);
	}

	@Test
	public function shouldNotAddANullRenderer():Void
	{
		layerManager.addLayerByName("bottom", bottomContainer, null);
		Assert.areEqual(0, topContainer.numChildren);
	}

	@Test
	public function shoudAddContainerToTheTopOfPreviousContainer():Void
	{
		var top:DisplayNodeContainer = new TwoDimDisplayNodeContainer();
		top.init();
		layerManager.addLayerByName("bottom", bottomContainer, renderer);
		layerManager.addLayerByName("top", top, renderer);

		Assert.areEqual(2, topContainer.numChildren);
		Assert.areEqual(bottomContainer, topContainer.getChildAt(0));
		Assert.areEqual(top, topContainer.getChildAt(1));
	}

	@Test
	public function shouldGetLayerByName():Void
	{
		var top:DisplayNodeContainer = new TwoDimDisplayNodeContainer();
		top.init();
		layerManager.addLayerByName("bottom", bottomContainer, renderer);
		layerManager.addLayerByName("top", top, renderer);
		Assert.areEqual(bottomContainer, layerManager.getLayerByName("bottom"));
		Assert.areEqual(top, layerManager.getLayerByName("top"));
	}

	@Test
	public function shouldReturnNullIfNoLayerFoundByName():Void
	{
		layerManager.addLayerByName("bottom", bottomContainer, renderer);
		var retVal = layerManager.getLayerByName("top");
		Assert.isNull(retVal);
	}

	@Test
	public function shouldReturnLayerName():Void
	{
		var top:DisplayNodeContainer = new TwoDimDisplayNodeContainer();
		top.init();
		layerManager.addLayerByName("bottom", bottomContainer, renderer);
		layerManager.addLayerByName("top", top, renderer);
		Assert.areEqual("bottom", layerManager.getLayerName(bottomContainer));
		Assert.areEqual("top", layerManager.getLayerName(top));
		Assert.isNull(layerManager.getLayerName(null));
	}

	@Test
	public function shouldReturnNullAsLayerNameWhenNodeIsNotFound():Void
	{
		var top:DisplayNodeContainer = new TwoDimDisplayNodeContainer();
		top.init();
		layerManager.addLayerByName("bottom", bottomContainer, renderer);
		Assert.isNull(layerManager.getLayerName(top));
	}

	@Test
	public function shouldRemoveLayerByName():Void
	{
		var top:DisplayNodeContainer = new TwoDimDisplayNodeContainer();
		top.init();
		layerManager.addLayerByName("bottom", bottomContainer, renderer);
		layerManager.addLayerByName("top", top, renderer);
		layerManager.removeLayerByName("bottom");
		Assert.areEqual(1, topContainer.numChildren);
		Assert.isNull(bottomContainer.parent);
		Assert.areEqual(top, topContainer.getChildAt(0));
		Assert.isNull(layerManager.getLayerName(bottomContainer));
	}

	@Test
	public function shouldNotRemoveLayerIfNameIsNotFound():Void
	{
		var top:DisplayNodeContainer = new TwoDimDisplayNodeContainer();
		top.init();
		layerManager.addLayerByName("top", top, renderer);
		layerManager.removeLayerByName("bottom");
		Assert.areEqual(1, topContainer.numChildren);
		Assert.isNull(bottomContainer.parent);
		Assert.areEqual(top, topContainer.getChildAt(0));
		Assert.isNull(layerManager.getLayerName(bottomContainer));
	}
}
