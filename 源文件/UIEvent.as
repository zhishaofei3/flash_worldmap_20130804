package {

	import flash.events.Event;

	public class UIEvent extends Event {
		public static const INTO:String = "INTO";
		public static const GUNDONG:String = "GUNDONG";
		public static const INFOPANEL_SHOW:String = "INFOPANEL_SHOW";
		public static const INFOPANEL_HIDE:String = "INFOPANEL_HIDE";
		public function UIEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			this.data = data;
		}

		private var _data:Object = {};

		public function get data():Object {
			return _data;
		}

		public function set data(data:Object):void {
			_data = data;
		}

		override public function toString():String {
			return formatToString("UIEvent:", "type", "bubbles", "cancelable", "data");
		}

		override public function clone():Event {
			return new UIEvent(type, data, bubbles, cancelable);
		}
	}
}
