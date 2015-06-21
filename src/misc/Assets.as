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
		
		[Embed(source = "../../assets/levels/L_02.oel", mimeType = "application/octet-stream")]
		public static const LEVEL_02:Class;
		
		[Embed(source="../../assets/images/tiles.png")]
		public static const TILES:Class;
		
		[Embed(source="../../assets/images/background.png")]
		public static const BACKGROUND:Class;
		
		[Embed(source="../../assets/images/player_mask.png")]
		public static const PLAYER_MASK:Class;
		
		[Embed(source="../../assets/images/player_2.png")]
		public static const PLAYER_SS:Class;
		
		[Embed(source="../../assets/images/turret.png")]
		public static const TURRET:Class;
		
		[Embed(source="../../assets/images/bullet.png")]
		public static const BULLET:Class;
		
		[Embed(source="../../assets/images/bullet_tileset.png")]
		public static const BULLET_BLUE_ANIM:Class;
		
		[Embed(source="../../assets/images/bullet_red_tileset.png")]
		public static const BULLET_RED_ANIM:Class;
		
		[Embed(source = "../../assets/images/intro.png")]
		public static const INTRO:Class;
		
		[Embed(source = "../../assets/images/nomorelevels.png")]
		public static const NO_MORE_LEVELS:Class;
		
		[Embed(source="../../assets/audio/song.mp3")]
		public static const MAIN:Class;
		
	}

}