package worlds 
{
	import entities.Background;
	import entities.Bullet;
	import entities.Player;
	import entities.Timer;
	import entities.Turret;
	import flash.system.Capabilities;
	import levelHelpers.Level;
	import misc.Assets;
	import misc.Constants;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Game extends World
	{
		
		private var timer:Timer = null;
		private var preventer:Number = 0;
		private var _speedModifierAc:Number = 1;
		private var _playerAlive:Boolean = true;

		private var _deathText:Text = null;
		private var _pressText:Text = null;
		
		private var _deathOwner:Entity = null;
		private var _pressOwner:Entity = null;
	
		private var _currentLevel:Class;
		private var _win:Boolean = false;
		private var _playTime:Number = 30;
		
		private var _levelArray:Vector.<Class> = new Vector.<Class>();
		
		private var _main:Sfx = null;
		public function Game() 
		{
			timer = new Timer(122, 90, _playTime);
			_currentLevel = Assets.LEVEL_01;
			
			_levelArray.push(Assets.LEVEL_02);
			_levelArray.push(Assets.LEVEL_01);
			
			_currentLevel = _levelArray.pop();
			
			_main = new Sfx(Assets.MAIN);
			_main.loop();
		}
				
		public function get SpeedModifier():Number
		{
			return _speedModifierAc;
		}
		
		public function set isPlayerAlive(alive:Boolean):void
		{
			_playerAlive = alive;
		}
		override public function begin():void 
		{
			super.begin();
			

			add(new Level(_currentLevel));
			add(new Background());
			add(timer);	
			
			FP.camera.x = 125;
			FP.camera.y = 100;
			FP.screen.scale = 1.5;
		}
		
		private var finished:Boolean = false;
		
		private var turrets:Array = null;
		private var bullets:Array = null
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.ESCAPE))
				FP.world = new Intro();
					
			if ((timer.Time - 1) % 5 == 0)
			{
				preventer += FP.elapsed;
				if (preventer >= 1)
				{
					trace("_speedModifierAc: " + _speedModifierAc);	
					preventer = 0;
					_speedModifierAc += Constants.SPEED_MODIFIER;
				}
			}
			
			if (!_playerAlive)
			{
 				if (!finished)
				{
				   	turrets = new Array();
					getType("turret", turrets);
					//trace("bulletCount: " +turrets.length);

					for each(var b:Turret in turrets)
					{
						b.StopSpawning();
					}

					timer.Stop();
					finished = true;
					
					_deathText = new Text("you're dead");
					_deathText.scale = 2;
					_deathText.x = (FP.screen.width - _deathText.scaledWidth) / 2;
					_deathText.y = FP.screen.height - 300;
					_deathText.color = 0xCC0000;
					_deathOwner = addGraphic(_deathText);
					
					_pressText = new Text("press SPACE to restart");
					_pressText.scale = 2;
					_pressText.x = (FP.screen.width - _pressText.scaledWidth) / 2;
					_pressText.y = FP.screen.height - 150 ;
					_pressOwner = addGraphic(_pressText);
				}
				
				if (Input.pressed(Key.SPACE))
				{
					removeAll();
					remove(_pressOwner);
					remove(_deathOwner);
										
					add(new Level(_currentLevel));
					add(new Background());
					timer = new Timer(122, 90, _playTime);
					add(timer);
					_speedModifierAc = 1;
					_playerAlive = true;
					finished = false;
				}
				
			}
			
			if (timer.TimeUp)
			{
				if (!_win)
				{
				   	turrets = new Array();
					getType("turret", turrets);
					//trace("bulletCount: " +turrets.length);

					for each(var t:Turret in turrets)
					{
						t.StopSpawning();
					}

//					timer.Stop();
							
					bullets = new Array();
					getType("bullet", bullets);
					//trace("bulletCount: " +turrets.length);

					for each(var bullet:Bullet in bullets)
					{
						bullet.collidable = false;
						bullet.visible = false;
					}
					
					_win = true;
					
					_deathText = new Text("you're alive");
					_deathText.scale = 2;
					_deathText.x = (FP.screen.width - _deathText.scaledWidth) / 2;
					_deathText.y = FP.screen.height - 300;
					_deathText.color = 0xCC0000;
					_deathOwner = addGraphic(_deathText);
					
					_pressText = new Text("press space to next level");
					_pressText.scale = 2;
					_pressText.x = (FP.screen.width - _pressText.scaledWidth) / 2;
					_pressText.y = FP.screen.height - 150 ;
					_pressOwner = addGraphic(_pressText);
				}
				
				

				if (Input.pressed(Key.SPACE))
				{
					removeAll();
					remove(_pressOwner);
					remove(_deathOwner);

					if(_levelArray.length > 0)
						_currentLevel = _levelArray.pop();
					else
					{
						removeAll();
						FP.world = new Sorry();
					}
					
					add(new Level(_currentLevel));
					add(new Background());
					timer = new Timer(122, 90, _playTime);
					add(timer);
					_speedModifierAc = 1;
					_playerAlive = true;
					finished = false;
					_win = false;
				}
				

			}
			
		}
		
		private function getNextLevel():Class
		{
			return Assets.LEVEL_02;
		}
		
	}

}