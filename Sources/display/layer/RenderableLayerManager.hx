package display.layer;

class RenderableLayerManager implements LayerManager
{
	public var topContainer(get, null):DisplayNodeContainer;
	private var layerMap:Map<String, RendererContainer>;

	public function new(topContainer:DisplayNodeContainer)
	{
		this.topContainer = topContainer;
	}

	public function init():Void
	{
		layerMap = new Map<String, RendererContainer>();
	}

	public function dispose():Void
	{
		layerMap = null;
	}

	public function addLayerByName(layerName:String, container:DisplayNodeContainer, renderer:Renderer):Void
	{
		if (container == null || renderer == null)
			return;
		topContainer.addChild(container);
		layerMap.set(layerName, {container: container, renderer: renderer});
	}

	public function getLayerByName(layerName:String):DisplayNodeContainer
	{
		var rendererContainer:RendererContainer = layerMap.get(layerName);
		if (rendererContainer == null)
			return null;
		return rendererContainer.container;
	}

	public function getLayerName(displayNode:DisplayNodeContainer):String
	{
		for (key in layerMap.keys())
		{
			var rendererContainer:RendererContainer = layerMap.get(key);
			if (rendererContainer.container == displayNode)
				return key;
		}
		return null;
	}

	public function removeLayerByName(layerName:String):Void
	{
		var rendererContainer:RendererContainer = layerMap.get(layerName);
		if (rendererContainer == null)
			return;
		topContainer.removeChild(rendererContainer.container);
		layerMap.remove(layerName);
	}

	public function getLayers():Array<DisplayNodeContainer>
	{
		var retVal:Array<DisplayNodeContainer> = new Array<DisplayNodeContainer>();
		for (layer in layerMap)
		{
			retVal.push(layer.container);
		}
		return retVal;
	}

	public function getLayerMap():Map<String, RendererContainer>
	{
		return layerMap;
	}

	private function get_topContainer():DisplayNodeContainer
	{
		return topContainer;
	}
}

typedef RendererContainer =
{
	container:DisplayNodeContainer,
	renderer:Renderer
}
