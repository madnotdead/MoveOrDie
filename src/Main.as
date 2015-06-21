package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.Intro;
	import worlds.Sorry;

	/**
	 * ...
	 * @author madnotdead
	 */
	public class Main extends Engine 
	{
		
		public function Main() 
		{
			super(800, 600);
		}
		
		override public function init():void 
		{
			super.init();
			
			FP.world = new Intro();
			//FP.console.toggleKey = 188;
			//FP.console.enable();
		}
	}
	
}