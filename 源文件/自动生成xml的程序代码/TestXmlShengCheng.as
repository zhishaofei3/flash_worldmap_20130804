package {

	import flash.display.Sprite;

	public class TestXmlShengCheng extends Sprite {
		private var ids:String = "C001 C002 C003 C004 C005 C006 C007 C008 C009 C010 C011 C012 C013 C014 C015 C016 C017 C018 C019 C020 C021 C022 C023 C024 C025 C026 C027 C028 C029 C030 C031 C032 C033 C034 C035 C036 C037 C038 C039 C040 C041 C042 C043 C044 C045 C046 C047 C048 C049 C050 C051 C052 C053 C054 C055 C056 C057 C058 C059 C060 C061 C062 C063 C064 C065 C066 C067 C068 C069 C070 C071 C072 C073 C074 C075 C076 C077 C078 C079 C080 C081 C082 C083 C084 C085 C086 C087 C088 C089 C090 C091 C092 C093 C094 C095 C096 C097 C098 C099 C100 C101 C102 C103 C104 C105 C106 C107 C108 C109 C110 C111 C112 C113 C114 C115 C116 C117 C118 C119 C120 C121 C122 C123 C124 C125 C126 C127 C128 C129 C130 C131 C132 C133 C134 C135 C136 C137 C138 C139 C140 C141 C142 C143 C144 C145 C146 C147 C148 C149 C150 C151 C152 C153 C154 C155 C156 C157 C158 C159 C160 C161 C162 C163 C164 C165 C166 C167 C168 C169 C170 C171 C172 C173 C174 C175 C176 C177 C178 C179 C180 C181 C182 C183 C184 C185 C186 C187 C188 C189 C190 C191 C192 C193 C194 C195 C196 C197 C198 C199 C200 C201 C202 C203 C204 C205 C206 C207 C208 C209 C210 C211 C212 C213 C214 C216 C217";
		private var resultStr:String = "";

		public function TestXmlShengCheng() {
			var idArr:Array = ids.split(" ");
			for each(var countryId:String in idArr) {
				shengchengString(countryId);
			}
			trace(resultStr);
		}

		private function shengchengString(countryId:String):void {
			var color:String = "0x" + (0xFFFFFF * Math.random()).toString(16).toUpperCase();
			resultStr += '<country id="' + countryId + '"><color>' + color + '</color><infos><ul>1.' + getRandomString(4) + '</ul><ul>2' + getRandomString(5) + '</ul><ul>3.' + getRandomString(6) + '</ul><ul>4.' + getRandomString(7) + '</ul></infos></country>\n';
		}

		private function getRandomString(len:int = 32):String {
			var chars:String = "ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678";
			var maxPos:int = chars.length;
			var resultStr:String = "";
			for (var i:int = 0; i < len; i++) {
				resultStr += chars.charAt(Math.floor(Math.random() * maxPos));
			}
			return resultStr;
		}
	}
}
