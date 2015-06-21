package entities 
{
	import flash.geom.Point;
	import misc.Assets;
	import misc.Constants;
	import misc.Utils;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Turret extends Entity 
	{
		
		private var _turretType:String;
		private var _shootTime:int;
		private var _shootTimeAc:Number = 0;
		private var _spawn:Boolean = true;
		
		public function Turret(x:Number=0, y:Number=0, turretType:String = "UP", graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(Assets.TURRET);
			
			type = Constants.TURRET_TYPE;
			
			_turretType = turretType;
			
			_shootTime = Utils.randomRange(1, 2);
			trace("turretType: " + _turretType);
			super(x, y, graphic, mask);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!_spawn) return;
			
			_shootTimeAc += FP.elapsed;
			
			if (_shootTimeAc >= _shootTime)
			{
				var spawnPoint:Point = CalculateSpawningPoing();
				FP.world.add(new Bullet(spawnPoint.x, spawnPoint.y, _turretType));
				_shootTimeAc = 0;
			}
		}
		
		
		private function CalculateSpawningPoing():Point
		{
			var spawnPoint:Point = new Point();
			
			if (_turretType == Constants.UP_TYPE)
			{
				spawnPoint.x = x ;
				spawnPoint.y = y + 16;
			}

			if (_turretType == Constants.DOWN_TYPE)
			{
				spawnPoint.x = x;
				spawnPoint.y = y - 16;
			}
			
			if (_turretType == Constants.LEFT_TYPE)
			{
				spawnPoint.x = x + 16;
				spawnPoint.y = y;
			}

			if (_turretType == Constants.RIGHT_TYPE)
			{
				spawnPoint.x = x - 16;
				spawnPoint.y = y;
			}
			
			return spawnPoint;
		}
		
		public function StopSpawning():void
		{
			_spawn = false;
		}
		
	}

}