package entities 
{
	import misc.Assets;
	import misc.Constants;
	import misc.Utils;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import worlds.Game;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Bullet extends Entity 
	{
		
		private var image:Image = null;
		private var bulletType:int = 0;
		
		private var speedX:int;
		private var speedY:int;
	
		private var parentTurret:String;
		private var spriteAnim:Spritemap;
		
		public function Bullet(x:Number=0, y:Number=0, turretType:String = "NONE", graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(Assets.BULLET);
			
			var num:Number = Utils.randomRange(1, 6);
			
			if(num>3)
				spriteAnim = new Spritemap(Assets.BULLET_BLUE_ANIM, 16, 16);
			else
				spriteAnim = new Spritemap(Assets.BULLET_RED_ANIM, 16, 16);
				
			spriteAnim.add("bullet", [0, 1, 2, 3], 10);
			
			graphic = spriteAnim;
			
			mask = new Pixelmask(Assets.BULLET);
			
			type = Constants.BULLET_TYPE;
			
			parentTurret = turretType;
			
			super(x, y, graphic, mask);
			
			
			//setHitbox(image.width, image.height);
		}
		
		override public function added():void 
		{
			super.added();
			
			if (parentTurret == Constants.LEFT_TYPE)
			{
				speedX = Constants.BULLET_SPEED;
				speedY = Utils.randomRange(-Constants.BULLET_SPEED,Constants.BULLET_SPEED);
			}
			
			if (parentTurret == Constants.RIGHT_TYPE)
			{
				speedX = -Constants.BULLET_SPEED;
				speedY = Utils.randomRange(-Constants.BULLET_SPEED,Constants.BULLET_SPEED);
			}
			
			if (parentTurret == Constants.UP_TYPE)
			{
				speedY = Constants.BULLET_SPEED;
				speedX = Utils.randomRange(-Constants.BULLET_SPEED,Constants.BULLET_SPEED);;
			}
			
			if (parentTurret == Constants.DOWN_TYPE)
			{
				speedY = -Constants.BULLET_SPEED;
				speedX = Utils.randomRange(-Constants.BULLET_SPEED,Constants.BULLET_SPEED);
			}
			
			spriteAnim.play("bullet");
		}
		
		override public function update():void 
		{
			super.update();
			
			var speedModifier:Number = Game(world).SpeedModifier;
			x += speedX * FP.elapsed * speedModifier;
			y += speedY * FP.elapsed * speedModifier;
			
			
			var e:Entity = collide("level", x, y);
			
			if (x < 0 || x > FP.screen.width || y < 0 || y > FP.screen.height || e)
				FP.world.remove(this);
		}
		
	}

}