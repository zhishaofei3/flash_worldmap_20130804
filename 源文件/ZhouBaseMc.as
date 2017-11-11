package {

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;

	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;

	public class ZhouBaseMc extends MovieClip {
		private var colorTransform:ColorTransform;

		public function ZhouBaseMc() {
			colorTransform = new ColorTransform();
			for (var i:int = 0; i < numChildren; i++) {
				var countryMc:DisplayObjectContainer = getChildAt(i) as DisplayObjectContainer;
				if (countryMc) {
					countryMc.mouseChildren = false;
					countryMc.mouseEnabled = false;
				}
			}
		}

		public function updateColorAndInfo(countryList:XMLList, needFilters = false, canInteractive = false):void {
			for (var i in countryList) {
				var countryId:String = countryList[i].@id;
				var countryCanClick:Boolean = countryList[i].@canClick == "1";
				var countryColor:uint = uint(countryList[i].color);
				var countryInfos:String = countryList[i].infos;
				var countryMc:Sprite = getChildByName(countryId) as Sprite;
				if (countryMc && contains(countryMc)) {
					colorTransform.color = countryColor;
					countryMc.transform.colorTransform = colorTransform;
					if (needFilters) {
						setGlowFilters(countryMc, colorTransform.color);
					}
					if (canInteractive && countryCanClick) {
						(countryMc as Object).txt = countryInfos;
						countryMc.buttonMode = true;
						countryMc.mouseChildren = true;
						countryMc.mouseEnabled = true;
						countryMc.addEventListener(MouseEvent.ROLL_OVER, onCountryOver);
						countryMc.addEventListener(MouseEvent.ROLL_OUT, onCountryOut);
					}
				}
			}
		}

		private function onCountryOver(e:MouseEvent):void {
			var zhouMc:MovieClip = e.currentTarget as MovieClip;
			TweenLite.to(zhouMc, 0.5, {alpha: 0.6, onUpdate: setGlowFilters, onUpdateParams: [zhouMc, zhouMc.transform.colorTransform.color, zhouMc.alpha]});
			dispatchEvent(new UIEvent(UIEvent.INFOPANEL_SHOW, zhouMc));
		}

		private function onCountryOut(e:MouseEvent):void {
			var zhouMc:MovieClip = e.currentTarget as MovieClip;
			TweenLite.to(zhouMc, 0.5, {alpha: 1, onUpdate: setGlowFilters, onUpdateParams: [zhouMc, zhouMc.transform.colorTransform.color, zhouMc.alpha]});
			dispatchEvent(new UIEvent(UIEvent.INFOPANEL_HIDE));
		}

		private function setGlowFilters(displayObject:DisplayObject, color:Number, alpha:Number = 0.8):void {
			var blurX:Number = 1.2;
			var blurY:Number = 1.2;
			var strength:Number = 255;
			var inner:Boolean = false;
			var knockout:Boolean = false;
			var quality:Number = BitmapFilterQuality.LOW;
			displayObject.filters.push(new GlowFilter(color, alpha, blurX, blurY, strength, quality, inner, knockout));
		}
	}
}
