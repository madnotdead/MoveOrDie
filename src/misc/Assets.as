package misc 
{
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Assets 
	{
		
		[Embed(source = "../../assets/levels/L_01.oel", mimeType = "application/octet-stream")]
		public static const LEVEL_01:Class;
		[Embed(source="../../assets/images/tiles.png")]
		public static const TILES:Class;
		[Embed(source="../../assets/images/background.png")]
		public static const BACKGROUND:Class;
	}

}