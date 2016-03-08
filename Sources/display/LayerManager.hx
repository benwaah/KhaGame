package display;

import display.layer.RenderableLayerManager.RendererContainer;
import core.BaseObject;

interface LayerManager extends BaseObject
{
	function addLayerByName(layerName:String, container:DisplayNodeContainer, renderer:Renderer):Void;
	function getLayerByName(layerName:String):DisplayNodeContainer;
	function getLayerName(displayNode:DisplayNodeContainer):String;
	function removeLayerByName(layerName:String):Void;
	function getLayers():Array<DisplayNodeContainer>;
	function getLayerMap():Map<String, RendererContainer>;
}
