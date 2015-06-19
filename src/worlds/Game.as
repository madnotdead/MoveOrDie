package worlds 
{
	import entities.Background;
	import levelHelpers.Level;
	import misc.Assets;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Game extends World
	{
		
		public function Game() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			add(new Background());
			add(new Level(Assets.LEVEL_01));
		}
		
	}

}