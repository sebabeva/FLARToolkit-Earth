package {
	
	import flash.events.Event;
	import org.papervision3d.objects.parsers.DAE;
	
	//Creacion de un SWF para limitar las dimensiones de la aplicacion y los FPS.
	[SWF(width=640, height=480, backgroundColor=0x808080, frameRate=30)]
	
	public class Earth extends PV3DARApp {
		
		private var _earth:DAE;
		
		public function Earth() {
			addEventListener(Event.INIT, _onInit);
			//Carga de la configuracion de calibracion de la webcam y el marcador a usar.
			init('Data/camera_para.dat', 'Data/hiro.pat');
		}
		
		private function _onInit(e:Event):void {
			//Llamada la constructor de la clase DAE.
			_earth = new DAE();
			//Carga del modelo 3D (.dae).
			_earth.load('model/earth.dae');
			//Dimension del Objeto 3D.
			_earth.scale = 10;
			_earth.rotationX = 90;
			_markerNode.addChild(_earth);
			addEventListener(Event.ENTER_FRAME, _update);
		}
		
		private function _update(e:Event):void {
			//Velocidad de Rotacion del Objeto 3D.
			_earth.rotationZ -= 3
		}
	}
}