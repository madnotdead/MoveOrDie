package worlds 
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Intro extends World 
	{
		
		public function Intro() 
		{
			super();
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.ANY))
				FP.world = new Game();
		}
	}

}