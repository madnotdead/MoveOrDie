package worlds 
{
	import misc.Assets;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Sorry extends World 
	{
		private var pressText:Text = null;
		public function Sorry() 
		{
			super();
			
				pressText = new Text("press any key to intro");
			pressText.scale = 2	;
			pressText.x = (FP.screen.width - pressText.scaledWidth) / 2;
			pressText.y = FP.screen.height - 75;

		}
		
		override public function begin():void 
		{
			super.begin();
			addGraphic(new Image(Assets.NO_MORE_LEVELS));
			addGraphic(pressText);
			FP.camera.x = 0;
			FP.camera.y = 0;
			FP.screen.scale = 1;
			FP.resetCamera();
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.ANY))
				FP.world = new Intro;
		}
	}

}