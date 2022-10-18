(* raylib v4.5-dev

A simple and easy-to-use library to enjoy videogames programming ( www.raylib.com )
Pascal header by Gunko Vadim (@guvacode) *)

MODULE raylib;
(* $mode objfpc *)(* $H+ *)

(* Include configuration file *)
(* $I raylib.inc *)


(* INTERFACE *)
CONST
	cDllName = (* $IFDEF WINDOWS *) "raylib.dll" (* $IFEND *)
						(* $IFDEF DARWIN *) "libraylib.dylib" (* $IFEND *)
						(* $IFDEF LINUX *) "libraylib.so" (* $IFEND *);

CONST
	DEG2RAD = (PI / 180.0);
	RAD2DEG = (180.0 / PI);

	(* ---------------------------------------------------------------------------------- *)
(* Some basic Defines } *)
(* ---------------------------------------------------------------------------------- *)

(* Color, 4 components, R8G8B8A8 (32bit) *)
TYPE
	TColorB = RECORD
			r,g,b,a : UNSIGNED8; (* Color value *)
		END;
	PColorB = POINTER TO TColorB;
	TColor = TColorB;
	PColor = PColorB;

CONST
	(* Some Basic Colors *)
	(* NOTE: Custom raylib color palette for amazing visuals on WHITE background *)
	LIGHTGRAY:      TColorB = (r: 200; g: 200; b: 200; a: 255);  (* Light Gray *)
	GRAY:           TColorB = (r: 130; g: 130; b: 130; a: 255);  (* Gray *)
	DARKGRAY:       TColorB = (r: 80; g: 80; b: 80; a: 255);     (* Dark Gray *)
	YELLOW:         TColorB = (r: 253; g: 249; b: 0; a: 255);    (* Yellow *)
	GOLD:           TColorB = (r: 255; g: 203; b: 0; a: 255);    (* Gold *)
	ORANGE:         TColorB = (r: 255; g: 161; b: 0; a: 255);    (* Orange *)
	PINK:           TColorB = (r: 255; g: 109; b: 194; a: 255);  (* Pink *)
	RED:            TColorB = (r: 230; g: 41; b: 55; a: 255);    (* Red *)
	MAROON:         TColorB = (r: 190; g: 33; b: 55; a: 255);    (* Maroon *)
	GREEN:          TColorB = (r: 0; g: 228; b: 48; a: 255);     (* Green *)
	LIME:           TColorB = (r: 0; g: 158; b: 47; a: 255);     (* Lime *)
	DARKGREEN:      TColorB = (r: 0; g: 117; b: 44; a: 255);     (* Dark Green *)
	SKYBLUE:        TColorB = (r: 102; g: 191; b: 255; a: 255);  (* Sky Blue *)
	BLUE:           TColorB = (r: 0; g: 121; b: 241; a: 255);    (* Blue *)
	DARKBLUE:       TColorB = (r: 0; g: 82; b: 172; a: 255);     (* Dark Blue *)
	PURPLE:         TColorB = (r: 200; g: 122; b: 255; a: 255);  (* Purple *)
	VIOLET:         TColorB = (r: 135; g: 60; b: 190; a: 255);   (* Violet *)
	DARKPURPLE:     TColorB = (r: 112; g: 31; b: 126; a: 255);   (* Dark Purple *)
	BEIGE:          TColorB = (r: 211; g: 176; b: 131; a: 255);  (* Beige *)
	BROWN:          TColorB = (r: 127; g: 106; b: 79; a: 255);   (* Brown *)
	DARKBROWN:      TColorB = (r: 76; g: 63; b: 47; a: 255);     (* Dark beown *)
	WHITE:          TColorB = (r: 255; g: 255; b: 255; a: 255);  (* White *)
	BLACK:          TColorB = (r: 0; g: 0; b: 0; a: 255);        (* Black *)
	BLANK:          TColorB = (r: 0; g: 0; b: 0; a: 0);          (* Black(Transparent) *)
	MAGENTA:        TColorB = (r: 255; g: 0; b: 255; a: 255);    (* Magenta *)
	RAYWHITE:       TColorB = (r: 245; g: 245; b: 245; a: 255);  (* My own White (raylib logo) *)

	(* Vector2, 2 components *)
	TYPE
		PVector2 = POINTER TO TVector2;
		TVector2 = RECORD
				x : FLOAT32; (* Vector x component *)
				y : FLOAT32; (* Vector y component *)
			END;

		(* Vector3, 3 components *)
		PVector3 = POINTER TO TVector3;
		TVector3 = RECORD
				x : FLOAT32; (* Vector x component *)
				y : FLOAT32; (* Vector y component *)
				z : FLOAT32; (* Vector z component *)
			END;

		(* Vector4, 4 components *)
		PVector4 = POINTER TO TVector4;
		TVector4 = RECORD
				x : FLOAT32; (* Vector x component *)
				y : FLOAT32; (* Vector y component *)
				z : FLOAT32; (* Vector z component *)
				w : FLOAT32; (* Vector w component *)
			END;

		(* Quaternion, 4 components (Vector4 alias) *)
		PQuaternion = POINTER TO TQuaternion;
		TQuaternion = TVector4;

		(* Matrix, 4x4 components, column major, OpenGL style, right handed *)
		PMatrix = POINTER TO TMatrix;
		TMatrix = RECORD
				m0  : FLOAT32; (* Matrix first row (4 components) *)
				m4  : FLOAT32; (* Matrix first row (4 components) *)
				m8  : FLOAT32; (* Matrix first row (4 components) *)
				m12 : FLOAT32; (* Matrix first row (4 components) *)
				m1  : FLOAT32; (* Matrix second row (4 components) *)
				m5  : FLOAT32; (* Matrix second row (4 components) *)
				m9  : FLOAT32; (* Matrix second row (4 components) *)
				m13 : FLOAT32; (* Matrix second row (4 components) *)
				m2  : FLOAT32; (* Matrix third row (4 components) *)
				m6  : FLOAT32; (* Matrix third row (4 components) *)
				m10 : FLOAT32; (* Matrix third row (4 components) *)
				m14 : FLOAT32; (* Matrix third row (4 components) *)
				m3  : FLOAT32; (* Matrix fourth row (4 components) *)
				m7  : FLOAT32; (* Matrix fourth row (4 components) *)
				m11 : FLOAT32; (* Matrix fourth row (4 components) *)
				m15 : FLOAT32; (* Matrix fourth row (4 components) *)
			END;

		(* Rectangle, 4 components *)
		PPRectangle = POINTER TO PRectangle;
		PRectangle = POINTER TO TRectangle;
		TRectangle = RECORD
				x      : FLOAT32; (* Rectangle top-left corner position x *)
				y      : FLOAT32; (* Rectangle top-left corner position y *)
				width  : FLOAT32; (* Rectangle width *)
				height : FLOAT32; (* Rectangle height *)
			END;

		(* Image, pixel data stored in CPU memory (RAM) *)
		PImage = POINTER TO TImage;
		TImage = RECORD
				data    : ANY; (* Image raw data *)
				width   : SIGNED32; (* Image base width *)
				height  : SIGNED32; (* Image base height *)
				mipmaps : SIGNED32; (* Mipmap levels, 1 by default *)
				format  : SIGNED32; (* Data format (PixelFormat type) *)
			END;

		(* Texture, tex data stored in GPU memory (VRAM) *)
		PTexture = POINTER TO TTexture;
		TTexture = RECORD
				id      : LongWord;   (* OpenGL texture id *)
				width   : SIGNED32; (* Texture base width *)
				height  : SIGNED32; (* Texture base height *)
				mipmaps : SIGNED32; (* Mipmap levels, 1 by default *)
				format  : SIGNED32; (* Data format (PixelFormat type) *)
			END;

		(* Texture2D, same as Texture *)
		PTexture2D = POINTER TO TTexture2D;
		TTexture2D = TTexture;

		(* TextureCubemap, same as Texture *)
		PTextureCubemap = POINTER TO TTextureCubemap;
		TTextureCubemap = TTexture;

		(* RenderTexture, fbo for texture rendering *)
		PRenderTexture = POINTER TO TRenderTexture;
		TRenderTexture = RECORD
				id      : LongWord;    (* OpenGL framebuffer object id *)
				texture : TTexture; (* Color buffer attachment texture *)
				depth   : TTexture; (* Depth buffer attachment texture *)
			END;

		(* RenderTexture2D, same as RenderTexture *)
		PRenderTexture2D = POINTER TO TRenderTexture2D;
		TRenderTexture2D = TRenderTexture;

		(* NPatchInfo, n-patch layout info *)
		PNPatchInfo = POINTER TO TNPatchInfo;
		TNPatchInfo = RECORD
				source : TRectangle; (* Texture source rectangle *)
				left   : SIGNED32;    (* Left border offset *)
				top    : SIGNED32;    (* Top border offset *)
				right  : SIGNED32;    (* Right border offset *)
				bottom : SIGNED32;    (* Bottom border offset *)
				layout : SIGNED32;    (* Layout of the n-patch: 3x3, 1x3 or 3x1 *)
			END;

		(* GlyphInfo, font characters glyphs info *)
		PGlyphInfo = POINTER TO TGlyphInfo;
		TGlyphInfo = RECORD
				value    : SIGNED32; (* Character value (Unicode) *)
				offsetX  : SIGNED32; (* Character offset X when drawing *)
				offsetY  : SIGNED32; (* Character offset Y when drawing *)
				advanceX : SIGNED32; (* Character advance position X *)
				image    : TImage;  (* Character image data *)
			END;

			(* Font, font texture and GlyphInfo array data *)
			PFont = POINTER TO TFont;
			TFont = RECORD
					baseSize     : SIGNED32;    (* Base size (default chars height) *)
					glyphCount   : SIGNED32;    (* Number of glyph characters *)
					glyphPadding : SIGNED32;    (* Padding around the glyph characters *)
					texture      : TTexture2D; (* Texture atlas containing the glyphs *)
					recs         : PRectangle; (* Rectangles in texture for the glyphs *)
					glyphs       : PGlyphInfo; (* Glyphs info data *)
				END;

	(* Camera, defines position/orientation in 3d space *)
	TYPE
		PCamera3D = POINTER TO TCamera3D;
		TCamera3D = RECORD
				position   : TVector3; (* Camera position *)
				target     : TVector3; (* Camera target it looks-at *)
				up         : TVector3; (* Camera up vector (rotation over its axis) *)
				fovy       : FLOAT32;   (* Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic *)
				projection : SIGNED32;  (* Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC *)
			END;

		(* Camera type fallback, defaults to Camera3D *)
		PCamera = POINTER TO TCamera;
		TCamera = TCamera3D;

		(* Camera2D, defines position/orientation in 2d space *)
		PCamera2D = POINTER TO TCamera2D;
		TCamera2D = RECORD
				offset   : TVector2; (* Camera offset (displacement from target) *)
				target   : TVector2; (* Camera target (rotation and zoom origin) *)
				rotation : FLOAT32;   (* Camera rotation in degrees *)
				zoom     : FLOAT32;   (* Camera zoom (scaling), should be 1.0f by default *)
			END;

		(* Mesh, vertex data and vao/vbo *)
		PMesh = POINTER TO TMesh;
		TMesh = RECORD
				vertexCount   : SIGNED32;  (* Number of vertices stored in arrays *)
				triangleCount : SIGNED32;  (* Number of triangles stored (indexed or not) *)
				(* Vertex attributes data *)
				vertices      : PSingle;  (* Vertex position (XYZ - 3 components per vertex) (shader-location = 0) *)
				texcoords     : PSingle;  (* Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1) *)
				texcoords2    : PSingle;  (* Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5) *)
				normals       : PSingle;  (* Vertex normals (XYZ - 3 components per vertex) (shader-location = 2) *)
				tangents      : PSingle;  (* Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4) *)
				colors        : PByte;    (* Vertex colors (RGBA - 4 components per vertex) (shader-location = 3) *)
				indices       : PWord;    (* Vertex indices (in case vertex data comes indexed) *)
				(* Animation vertex data *)
				animVertices  : PSingle;  (* Animated vertex positions (after bones transformations) *)
				animNormals   : PSingle;  (* Animated normals (after bones transformations) *)
				boneIds       : PByte;    (* Vertex bone ids, up to 4 bones influence by vertex (skinning) *)
				boneWeights   : PSingle;  (* Vertex bone weight, up to 4 bones influence by vertex (skinning) *)
				(* OpenGL identifiers *)
				vaoId         : LongWord;    (* OpenGL Vertex Array Object id *)
				vboId         : PLongWord;   (* OpenGL Vertex Buffer Objects id (default vertex data) *)
			END;

		(* Shader *)
		PShader = POINTER TO TShader;
		TShader = RECORD
				id    : LongWord;    (* Shader program id *)
				locs  : PInteger;    (* Shader locations array (RL_MAX_SHADER_LOCATIONS) *)
			END;

		(* MaterialMap *)
		PMaterialMap = POINTER TO TMaterialMap;
		TMaterialMap = RECORD
				texture : TTexture2D; (* Material map texture *)
				color   : TColorB;  (* Material map color *)
				value   : FLOAT32;     (* Material map value *)
			END;

		(* Material, includes shader and maps *)
		PMaterial = POINTER TO TMaterial;
		TMaterial = RECORD
				shader  : TShader;                (* Material shader *)
				maps    : PMaterialMap;           (* Material maps array (MAX_MATERIAL_MAPS) *)
				params  : ARRAY[0..3] OF FLOAT32;  (* Material generic parameters (if required) *)
			END;

		(* Transform, verctex transformation data *)
		PTransform = POINTER TO TTransform;
		TTransform = RECORD
				translation : TVector3;     (* Translation *)
				rotation    : TQuaternion;  (* Rotation *)
				scale       : TVector3;     (* Scale *)
			END;

		(* Bone, skeletal animation bone *)
		PBoneInfo = POINTER TO TBoneInfo;
		TBoneInfo = RECORD
				name    : ARRAY[0..31] OF CHAR; (* Bone name *)
				parent  : SIGNED32;              (* Bone parent *)
			END;

		(* Model, meshes, materials and animation data *)
		PModel = POINTER TO TModel;
		TModel = RECORD
				transform        : TMatrix;     (* Local transform matrix *)
				meshCount        : SIGNED32;     (* Number of meshes *)
				materialCount    : SIGNED32;     (* Number of materials *)
				meshes           : PMesh;       (* Meshes array *)
				materials        : PMaterial;   (* Materials array *)
				meshMaterial     : PInteger;    (* Mesh material number *)
				(* Animation data *)
				boneCount        : SIGNED32;     (* Number of bones *)
				bones            : PBoneInfo;   (* Bones information (skeleton) *)
				bindPose         : PTransform;  (* Bones base transformation (pose) *)
			END;

		(* ModelAnimation *)
		PModelAnimation = POINTER TO TModelAnimation;
		TModelAnimation = RECORD
				boneCount : SIGNED32;      (* Number of bones *)
				frameCount : SIGNED32;     (* Number of animation frames *)
				bones : PBoneInfo;        (* Bones information (skeleton) *)
				framePoses : POINTER TO PTransform; (* Poses array by frame *)
			END;

			(* Ray, ray for raycasting *)
			PRay = POINTER TO TRay;
			TRay = RECORD
				position  : TVector3; (* Ray position (origin) *)
				direction : TVector3; (* Ray direction *)
			END;

			(* RayCollision, ray hit information *)
			PRayCollision = POINTER TO TRayCollision;
			TRayCollision = RECORD
					hit       : BOOLEAN;  (* Did the ray hit something? *)
					distance  : FLOAT32;   (* Distance to nearest hit *)
					point     : TVector3; (* Point of nearest hit *)
					normal    : TVector3; (* Surface normal of hit *)
				END;

		(* BoundingBox *)
		PBoundingBox = POINTER TO TBoundingBox;
		TBoundingBox = RECORD
				min : TVector3; (* Minimum vertex box-corner *)
				max : TVector3; (* Maximum vertex box-corner *)
			END;

		(* Wave, audio wave data *)
		PWave = POINTER TO TWave;
		TWave = RECORD
				frameCount : LongWord;   (* Total number of frames (considering channels) *)
				sampleRate : LongWord;   (* Frequency (samples per second) *)
				sampleSize : LongWord;   (* Bit depth (bits per sample): 8, 16, 32 (24 not supported) *)
				channels   : LongWord;   (* Number of channels (1-mono, 2-stereo, ...) *)
				data       : ANY; (* Buffer data pointer *)
			END;

		(* Opaque structs declaration *)
		(* NOTE: Actual structs are defined internally in raudio module *)
		PrAudioBuffer = POINTER TO TrAudioBuffer;
		TrAudioBuffer = RECORD END;

		PrAudioProcessor = POINTER TO TrAudioProcessor;
		TrAudioProcessor = RECORD END;

		(* AudioStream, custom audio stream *)
		PAudioStream = POINTER TO TAudioStream;
		TAudioStream = RECORD
				buffer     : PrAudioBuffer;    (* Pointer to internal data used by the audio system *)
				processor  : PrAudioProcessor; (* Pointer to internal data processor, useful for audio effects *)
				sampleRate : LongWord;         (* Frequency (samples per second) *)
				sampleSize : LongWord;         (* Bit depth (bits per sample): 8, 16, 32 (24 not supported) *)
				channels   : LongWord;         (* Number of channels (1-mono, 2-stereo, ...) *)
			END;

		(* Sound *)
		PSound = POINTER TO TSound;
		TSound = RECORD
				stream     : TAudioStream; (* Audio stream *)
				frameCount : LongWord;        (* Total number of frames (considering channels) *)
			END;

		(* Music, audio stream, anything longer than ~10 seconds should be streamed *)
		PMusic = POINTER TO TMusic;
		TMusic = RECORD
				stream     : TAudioStream; (* Audio stream *)
				frameCount : LongWord;     (* Total number of frames (considering channels) *)
				looping    : BOOLEAN;      (* Music looping enable *)
				ctxType    : SIGNED32;      (* Type of music context (audio filetype) *)
				ctxData    : ANY;      (* Audio context data, depends on type *)
			END;

			(* VrDeviceInfo, Head-Mounted-Display device parameters *)
			PVrDeviceInfo = POINTER TO TVrDeviceInfo;
			TVrDeviceInfo = RECORD
					hResolution            : SIGNED32;               (* Horizontal resolution in pixels *)
					vResolution            : SIGNED32;               (* Vertical resolution in pixels *)
					hScreenSize            : FLOAT32;                (* Horizontal size in meters *)
					vScreenSize            : FLOAT32;                (* Vertical size in meters *)
					vScreenCenter          : FLOAT32;                (* Screen center in meters *)
					eyeToScreenDistance    : FLOAT32;                (* Distance between eye and display in meters *)
					lensSeparationDistance : FLOAT32;                (* Lens separation distance in meters *)
					interpupillaryDistance : FLOAT32;                (* IPD (distance between pupils) in meters *)
					lensDistortionValues   : ARRAY[0..3] OF FLOAT32; (* Lens distortion constant parameters *)
					chromaAbCorrection     : ARRAY[0..3] OF FLOAT32; (* Chromatic aberration correction parameters *)
				END;

		(* VrStereoConfig, VR stereo rendering configuration for simulator *)
		PVrStereoConfig = POINTER TO TVrStereoConfig;
		TVrStereoConfig = RECORD
				projection          : ARRAY[0..1] OF TMatrix; (* VR projection matrices (per eye) *)
				viewOffset          : ARRAY[0..1] OF TMatrix; (* VR view offset matrices (per eye) *)
				leftLensCenter      : ARRAY[0..1] OF FLOAT32;  (* VR left lens center *)
				rightLensCenter     : ARRAY[0..1] OF FLOAT32;  (* VR right lens center *)
				leftScreenCenter    : ARRAY[0..1] OF FLOAT32;  (* VR left screen center *)
				rightScreenCenter   : ARRAY[0..1] OF FLOAT32;  (* VR right screen center *)
				scale               : ARRAY[0..1] OF FLOAT32;  (* VR distortion scale *)
				scaleIn             : ARRAY[0..1] OF FLOAT32;  (* VR distortion scale in *)
			END;

		(* File path list *)
		PFilePathList = POINTER TO TFilePathList;
		TFilePathList = RECORD
			capacity  : LongWord;  (* Filepaths max entries *)
			count     : LongWord;  (* Filepaths entries count *)
			paths     : PPChar; (* Filepaths entries *)
		END;

(* ---------------------------------------------------------------------------------- *)
(* Enumerators Definition *)
(* ---------------------------------------------------------------------------------- *)

		(* System/Window config flags *)
		(* NOTE: Every bit registers one state (use it with bit masks) *)
		(* By default all flags are set to 0 *)
		PConfigFlags = POINTER TO TConfigFlags;
		TConfigFlags =  SIGNED32;
			CONST
				FLAG_VSYNC_HINT                = 40H; (* Set to try enabling V-Sync on GPU *)
				FLAG_FULLSCREEN_MODE           = 2H; (* Set to run program in fullscreen *)
				FLAG_WINDOW_RESIZABLE          = 4H; (* Set to allow resizable window *)
				FLAG_WINDOW_UNDECORATED        = 8H; (* Set to disable window decoration (frame and buttons) *)
				FLAG_WINDOW_HIDDEN             = 80H; (* Set to hide window *)
				FLAG_WINDOW_MINIMIZED          = 200H; (* Set to minimize window (iconify) *)
				FLAG_WINDOW_MAXIMIZED          = 400H; (* Set to maximize window (expanded to monitor) *)
				FLAG_WINDOW_UNFOCUSED          = 800H; (* Set to window non focused *)
				FLAG_WINDOW_TOPMOST            = 1000H; (* Set to window always on top *)
				FLAG_WINDOW_ALWAYS_RUN         = 100H; (* Set to allow windows running while minimized *)
				FLAG_WINDOW_TRANSPARENT        = 10H; (* Set to allow transparent framebuffer *)
				FLAG_WINDOW_HIGHDPI            = 2000H; (* Set to support HighDPI *)
				FLAG_WINDOW_MOUSE_PASSTHROUGH  = 4000H; (* Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED *)
				FLAG_MSAA_4X_HINT              = 20H; (* Set to try enabling MSAA 4X *)
				FLAG_INTERLACED_HINT           = 10000H; (* Set to try enabling interlaced video format (for V3D) *)

		(* Trace log level *)
		(* NOTE: Organized by priority level *)
		TYPE
			PTraceLogLevel = POINTER TO TTraceLogLevel;
			TTraceLogLevel =  SIGNED32;
			CONST
				LOG_ALL      = 0; (* Display all logs *)
				LOG_TRACE    = 1; (* Trace logging, intended for internal use only *)
				LOG_DEBUG    = 2; (* Debug logging, used for internal debugging, it should be disabled on release builds *)
				LOG_INFO     = 3; (* Info logging, used for program execution info *)
				LOG_WARNING  = 4; (* Warning logging, used on recoverable failures *)
				LOG_ERROR    = 5; (* Error logging, used on unrecoverable failures *)
				LOG_FATAL    = 6; (* Fatal logging, used to abort program: exit(EXIT_FAILURE) *)
				LOG_NONE     = 7; (* Disable logging *)

		(* Keyboard keys (US keyboard layout) *)
		(* NOTE: Use GetKeyPressed() to allow redefining *)
		(* required keys for alternative layouts *)
		TYPE
			PKeyboardKey = POINTER TO TKeyboardKey;
			TKeyboardKey =  SIGNED32;
			CONST
				(* Alphanumeric keys *)
				KEY_NULL              = 0;    (* Key: NULL, used for no key pressed *)
				KEY_APOSTROPHE        = 39;   (* Key: ' *)
				KEY_COMMA             = 44;   (* Key: , *)
				KEY_MINUS             = 45;   (* Key: - *)
				KEY_PERIOD            = 46;   (* Key: . *)
				KEY_SLASH             = 47;   (* Key: / *)
				KEY_ZERO              = 48;   (* Key: 0 *)
				KEY_ONE               = 49;   (* Key: 1 *)
				KEY_TWO               = 50;   (* Key: 2 *)
				KEY_THREE             = 51;   (* Key: 3 *)
				KEY_FOUR              = 52;   (* Key: 4 *)
				KEY_FIVE              = 53;   (* Key: 5 *)
				KEY_SIX               = 54;   (* Key: 6 *)
				KEY_SEVEN             = 55;   (* Key: 7 *)
				KEY_EIGHT             = 56;   (* Key: 8 *)
				KEY_NINE              = 57;   (* Key: 9 *)
				KEY_SEMICOLON         = 59;   (* Key: ; *)
				KEY_EQUAL             = 61;   (* Key: = *)
				KEY_A                 = 65;   (* Key: A | a *)
				KEY_B                 = 66;   (* Key: B | b *)
				KEY_C                 = 67;   (* Key: C | c *)
				KEY_D                 = 68;   (* Key: D | d *)
				KEY_E                 = 69;   (* Key: E | e *)
				KEY_F                 = 70;   (* Key: F | f *)
				KEY_G                 = 71;   (* Key: G | g *)
				KEY_H                 = 72;   (* Key: H | h *)
				KEY_I                 = 73;   (* Key: I | i *)
				KEY_J                 = 74;   (* Key: J | j *)
				KEY_K                 = 75;   (* Key: K | k *)
				KEY_L                 = 76;   (* Key: L | l *)
				KEY_M                 = 77;   (* Key: M | m *)
				KEY_N                 = 78;   (* Key: N | n *)
				KEY_O                 = 79;   (* Key: O | o *)
				KEY_P                 = 80;   (* Key: P | p *)
				KEY_Q                 = 81;   (* Key: Q | q *)
				KEY_R                 = 82;   (* Key: R | r *)
				KEY_S                 = 83;   (* Key: S | s *)
				KEY_T                 = 84;   (* Key: T | t *)
				KEY_U                 = 85;   (* Key: U | u *)
				KEY_V                 = 86;   (* Key: V | v *)
				KEY_W                 = 87;   (* Key: W | w *)
				KEY_X                 = 88;   (* Key: X | x *)
				KEY_Y                 = 89;   (* Key: Y | y *)
				KEY_Z                 = 90;   (* Key: Z | z *)
				KEY_LEFT_BRACKET      = 91;   (* Key: [ *)
				KEY_BACKSLASH         = 92;   (* Key: '\' *)
				KEY_RIGHT_BRACKET     = 93;   (* Key: ] *)
				KEY_GRAVE             = 96;   (* Key: ` *)
				(* Function keys *)
				KEY_SPACE             = 32;   (* Key: Space *)
				KEY_ESCAPE            = 256;  (* Key: Esc *)
				KEY_ENTER             = 257;  (* Key: Enter *)
				KEY_TAB               = 258;  (* Key: Tab *)
				KEY_BACKSPACE         = 259;  (* Key: Backspace *)
				KEY_INSERT            = 260;  (* Key: Ins *)
				KEY_DELETE            = 261;  (* Key: Del *)
				KEY_RIGHT             = 262;  (* Key: Cursor right *)
				KEY_LEFT              = 263;  (* Key: Cursor left *)
				KEY_DOWN              = 264;  (* Key: Cursor down *)
				KEY_UP                = 265;  (* Key: Cursor up *)
				KEY_PAGE_UP           = 266;  (* Key: Page up *)
				KEY_PAGE_DOWN         = 267;  (* Key: Page down *)
				KEY_HOME              = 268;  (* Key: Home *)
				KEY_END               = 269;  (* Key: End *)
				KEY_CAPS_LOCK         = 280;  (* Key: Caps lock *)
				KEY_SCROLL_LOCK       = 281;  (* Key: Scroll down *)
				KEY_NUM_LOCK          = 282;  (* Key: Num lock *)
				KEY_PRINT_SCREEN      = 283;  (* Key: Print screen *)
				KEY_PAUSE             = 284;  (* Key: Pause *)
				KEY_F1                = 290;  (* Key: F1 *)
				KEY_F2                = 291;  (* Key: F2 *)
				KEY_F3                = 292;  (* Key: F3 *)
				KEY_F4                = 293;  (* Key: F4 *)
				KEY_F5                = 294;  (* Key: F5 *)
				KEY_F6                = 295;  (* Key: F6 *)
				KEY_F7                = 296;  (* Key: F7 *)
				KEY_F8                = 297;  (* Key: F8 *)
				KEY_F9                = 298;  (* Key: F9 *)
				KEY_F10               = 299;  (* Key: F10 *)
				KEY_F11               = 300;  (* Key: F11 *)
				KEY_F12               = 301;  (* Key: F12 *)
				KEY_LEFT_SHIFT        = 340;  (* Key: Shift left *)
				KEY_LEFT_CONTROL      = 341;  (* Key: Control left *)
				KEY_LEFT_ALT          = 342;  (* Key: Alt left *)
				KEY_LEFT_SUPER        = 343;  (* Key: Super left *)
				KEY_RIGHT_SHIFT       = 344;  (* Key: Shift right *)
				KEY_RIGHT_CONTROL     = 345;  (* Key: Control right *)
				KEY_RIGHT_ALT         = 346;  (* Key: Alt right *)
				KEY_RIGHT_SUPER       = 347;  (* Key: Super right *)
				KEY_KB_MENU           = 348;  (* Key: KB menu *)
				(* Keypad keys *)
				KEY_KP_0              = 320;  (* Key: Keypad 0 *)
				KEY_KP_1              = 321;  (* Key: Keypad 1 *)
				KEY_KP_2              = 322;  (* Key: Keypad 2 *)
				KEY_KP_3              = 323;  (* Key: Keypad 3 *)
				KEY_KP_4              = 324;  (* Key: Keypad 4 *)
				KEY_KP_5              = 325;  (* Key: Keypad 5 *)
				KEY_KP_6              = 326;  (* Key: Keypad 6 *)
				KEY_KP_7              = 327;  (* Key: Keypad 7 *)
				KEY_KP_8              = 328;  (* Key: Keypad 8 *)
				KEY_KP_9              = 329;  (* Key: Keypad 9 *)
				KEY_KP_DECIMAL        = 330;  (* Key: Keypad . *)
				KEY_KP_DIVIDE         = 331;  (* Key: Keypad / *)
				KEY_KP_MULTIPLY       = 332;  (* Key: Keypad * *)
				KEY_KP_SUBTRACT       = 333;  (* Key: Keypad - *)
				KEY_KP_ADD            = 334;  (* Key: Keypad + *)
				KEY_KP_ENTER          = 335;  (* Key: Keypad Enter *)
				KEY_KP_EQUAL          = 336;  (* Key: Keypad = *)
				(* Android key buttons *)
				KEY_BACK              = 4;    (* Key: Android back button *)
				KEY_MENU              = 82;   (* Key: Android menu button *)
				KEY_VOLUME_UP         = 24;   (* Key: Android volume up button *)
				KEY_VOLUME_DOWN       = 25;   (* Key: Android volume down button *)

		(* Mouse buttons *)
		TYPE
			PMouseButton = POINTER TO TMouseButton;
			TMouseButton =  SIGNED32;
			CONST
				MOUSE_BUTTON_LEFT     = 0; (* Mouse button left *)
				MOUSE_BUTTON_RIGHT    = 1; (* Mouse button right *)
				MOUSE_BUTTON_MIDDLE   = 2; (* Mouse button middle (pressed wheel) *)
				MOUSE_BUTTON_SIDE     = 3; (* Mouse button side (advanced mouse device) *)
				MOUSE_BUTTON_EXTRA    = 4; (* Mouse button extra (advanced mouse device) *)
				MOUSE_BUTTON_FORWARD  = 5; (* Mouse button forward (advanced mouse device) *)
				MOUSE_BUTTON_BACK     = 6; (* Mouse button back (advanced mouse device) *)

				(* Add backwards compatibility support for deprecated names *)
				MOUSE_LEFT_BUTTON = MOUSE_BUTTON_LEFT;
				MOUSE_RIGHT_BUTTON = MOUSE_BUTTON_RIGHT;
				MOUSE_MIDDLE_BUTTON = MOUSE_BUTTON_MIDDLE;

		(* Mouse cursor *)
		TYPE
			PMouseCursor = POINTER TO TMouseCursor;
			TMouseCursor =  SIGNED32;
			CONST
				MOUSE_CURSOR_DEFAULT         = 0;  (* Default pointer shape *)
				MOUSE_CURSOR_ARROW           = 1;  (* Arrow shape *)
				MOUSE_CURSOR_IBEAM           = 2;  (* Text writing cursor shape *)
				MOUSE_CURSOR_CROSSHAIR       = 3;  (* Cross shape *)
				MOUSE_CURSOR_POINTING_HAND   = 4;  (* Pointing hand cursor *)
				MOUSE_CURSOR_RESIZE_EW       = 5;  (* Horizontal resize/move arrow shape *)
				MOUSE_CURSOR_RESIZE_NS       = 6;  (* Vertical resize/move arrow shape *)
				MOUSE_CURSOR_RESIZE_NWSE     = 7;  (* Top-left to bottom-right diagonal resize/move arrow shape *)
				MOUSE_CURSOR_RESIZE_NESW     = 8;  (* The top-right to bottom-left diagonal resize/move arrow shape *)
				MOUSE_CURSOR_RESIZE_ALL      = 9;  (* The omni-directional resize/move cursor shape *)
				MOUSE_CURSOR_NOT_ALLOWED     = 10; (* The operation-not-allowed shape *)

	(* Gamepad buttons *)
	TYPE
			PGamepadButton = POINTER TO TGamepadButton;
			TGamepadButton =  SIGNED32;
			CONST
				GAMEPAD_BUTTON_UNKNOWN           = 0;  (* Unknown button, just for error checking *)
				GAMEPAD_BUTTON_LEFT_FACE_UP      = 1;  (* Gamepad left DPAD up button *)
				GAMEPAD_BUTTON_LEFT_FACE_RIGHT   = 2;  (* Gamepad left DPAD right button *)
				GAMEPAD_BUTTON_LEFT_FACE_DOWN    = 3;  (* Gamepad left DPAD down button *)
				GAMEPAD_BUTTON_LEFT_FACE_LEFT    = 4;  (* Gamepad left DPAD left button *)
				GAMEPAD_BUTTON_RIGHT_FACE_UP     = 5;  (* Gamepad right button up (i.e. PS3: Triangle, Xbox: Y) *)
				GAMEPAD_BUTTON_RIGHT_FACE_RIGHT  = 6;  (* Gamepad right button right (i.e. PS3: Square, Xbox: X) *)
				GAMEPAD_BUTTON_RIGHT_FACE_DOWN   = 7;  (* Gamepad right button down (i.e. PS3: Cross, Xbox: A) *)
				GAMEPAD_BUTTON_RIGHT_FACE_LEFT   = 8;  (* Gamepad right button left (i.e. PS3: Circle, Xbox: B) *)
				GAMEPAD_BUTTON_LEFT_TRIGGER_1    = 9;  (* Gamepad top/back trigger left (first), it could be a trailing button *)
				GAMEPAD_BUTTON_LEFT_TRIGGER_2    = 10; (* Gamepad top/back trigger left (second), it could be a trailing button *)
				GAMEPAD_BUTTON_RIGHT_TRIGGER_1   = 11; (* Gamepad top/back trigger right (one), it could be a trailing button *)
				GAMEPAD_BUTTON_RIGHT_TRIGGER_2   = 12; (* Gamepad top/back trigger right (second), it could be a trailing button *)
				GAMEPAD_BUTTON_MIDDLE_LEFT       = 13; (* Gamepad center buttons, left one (i.e. PS3: Select) *)
				GAMEPAD_BUTTON_MIDDLE            = 14; (* Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX) *)
				GAMEPAD_BUTTON_MIDDLE_RIGHT      = 15; (* Gamepad center buttons, right one (i.e. PS3: Start) *)
				GAMEPAD_BUTTON_LEFT_THUMB        = 16; (* Gamepad joystick pressed button left *)
				GAMEPAD_BUTTON_RIGHT_THUMB       = 17; (* Gamepad joystick pressed button right *)

	(* Gamepad axis *)
	TYPE
		PGamepadAxis = POINTER TO TGamepadAxis;
		TGamepadAxis =  SIGNED32;
		CONST
			GAMEPAD_AXIS_LEFT_X           = 0;  (* Gamepad left stick X axis *)
			GAMEPAD_AXIS_LEFT_Y           = 1;  (* Gamepad left stick Y axis *)
			GAMEPAD_AXIS_RIGHT_X          = 2;  (* Gamepad right stick X axis *)
			GAMEPAD_AXIS_RIGHT_Y          = 3;  (* Gamepad right stick Y axis *)
			GAMEPAD_AXIS_LEFT_TRIGGER     = 4;  (* Gamepad back trigger left, pressure level: [1..-1] *)
			GAMEPAD_AXIS_RIGHT_TRIGGER    = 5;  (* Gamepad back trigger right, pressure level: [1..-1] *)

		(* Material map index *)
		TYPE
			PMaterialMapIndex = POINTER TO TMaterialMapIndex;
			TMaterialMapIndex =  SIGNED32;
			CONST
				MATERIAL_MAP_ALBEDO        = 0;  (* Albedo material (same as: MATERIAL_MAP_DIFFUSE) *)
				MATERIAL_MAP_METALNESS     = 1;  (* Metalness material (same as: MATERIAL_MAP_SPECULAR) *)
				MATERIAL_MAP_NORMAL        = 2;  (* Normal material *)
				MATERIAL_MAP_ROUGHNESS     = 3;  (* Roughness material *)
				MATERIAL_MAP_OCCLUSION     = 4;  (* Ambient occlusion material *)
				MATERIAL_MAP_EMISSION      = 5;  (* Emission material *)
				MATERIAL_MAP_HEIGHT        = 6;  (* Heightmap material *)
				MATERIAL_MAP_CUBEMAP       = 7;  (* Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP) *)
				MATERIAL_MAP_IRRADIANCE    = 8;  (* Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP) *)
				MATERIAL_MAP_PREFILTER     = 9;  (* Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP) *)
				MATERIAL_MAP_BRDF          = 10; (* Brdf material *)

				MATERIAL_MAP_DIFFUSE = MATERIAL_MAP_ALBEDO;
				MATERIAL_MAP_SPECULAR = MATERIAL_MAP_METALNESS;

		(* Shader location index *)
		TYPE
			PShaderLocationIndex = POINTER TO TShaderLocationIndex;
			TShaderLocationIndex =  SIGNED32;
			CONST
				SHADER_LOC_VERTEX_POSITION     = 0;  (* Shader location: vertex attribute: position *)
				SHADER_LOC_VERTEX_TEXCOORD01   = 1;  (* Shader location: vertex attribute: texcoord01 *)
				SHADER_LOC_VERTEX_TEXCOORD02   = 2;  (* Shader location: vertex attribute: texcoord02 *)
				SHADER_LOC_VERTEX_NORMAL       = 3;  (* Shader location: vertex attribute: normal *)
				SHADER_LOC_VERTEX_TANGENT      = 4;  (* Shader location: vertex attribute: tangent *)
				SHADER_LOC_VERTEX_COLOR        = 5;  (* Shader location: vertex attribute: color *)
				SHADER_LOC_MATRIX_MVP          = 6;  (* Shader location: matrix uniform: model-view-projection *)
				SHADER_LOC_MATRIX_VIEW         = 7;  (* Shader location: matrix uniform: view (camera transform) *)
				SHADER_LOC_MATRIX_PROJECTION   = 8;  (* Shader location: matrix uniform: projection *)
				SHADER_LOC_MATRIX_MODEL        = 9;  (* Shader location: matrix uniform: model (transform) *)
				SHADER_LOC_MATRIX_NORMAL       = 10; (* Shader location: matrix uniform: normal *)
				SHADER_LOC_VECTOR_VIEW         = 11; (* Shader location: vector uniform: view *)
				SHADER_LOC_COLOR_DIFFUSE       = 12; (* Shader location: vector uniform: diffuse color *)
				SHADER_LOC_COLOR_SPECULAR      = 13; (* Shader location: vector uniform: specular color *)
				SHADER_LOC_COLOR_AMBIENT       = 14; (* Shader location: vector uniform: ambient color *)
				SHADER_LOC_MAP_ALBEDO          = 15; (* Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE) *)
				SHADER_LOC_MAP_METALNESS       = 16; (* Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR) *)
				SHADER_LOC_MAP_NORMAL          = 17; (* Shader location: sampler2d texture: normal *)
				SHADER_LOC_MAP_ROUGHNESS       = 18; (* Shader location: sampler2d texture: roughness *)
				SHADER_LOC_MAP_OCCLUSION       = 19; (* Shader location: sampler2d texture: occlusion *)
				SHADER_LOC_MAP_EMISSION        = 20; (* Shader location: sampler2d texture: emission *)
				SHADER_LOC_MAP_HEIGHT          = 21; (* Shader location: sampler2d texture: height *)
				SHADER_LOC_MAP_CUBEMAP         = 22; (* Shader location: samplerCube texture: cubemap *)
				SHADER_LOC_MAP_IRRADIANCE      = 23; (* Shader location: samplerCube texture: irradiance *)
				SHADER_LOC_MAP_PREFILTER       = 24; (* Shader location: samplerCube texture: prefilter *)
				SHADER_LOC_MAP_BRDF            = 25; (* Shader location: sampler2d texture: brdf *)

				SHADER_LOC_MAP_DIFFUSE = SHADER_LOC_MAP_ALBEDO;
				SHADER_LOC_MAP_SPECULAR = SHADER_LOC_MAP_METALNESS;

		(* Shader uniform data type *)
		TYPE
			PShaderUniformDataType = POINTER TO TShaderUniformDataType;
			TShaderUniformDataType =  SIGNED32;
			CONST
				SHADER_UNIFORM_FLOAT      = 0; (* Shader uniform type: float *)
				SHADER_UNIFORM_VEC2       = 1; (* Shader uniform type: vec2 (2 float) *)
				SHADER_UNIFORM_VEC3       = 2; (* Shader uniform type: vec3 (3 float) *)
				SHADER_UNIFORM_VEC4       = 3; (* Shader uniform type: vec4 (4 float) *)
				SHADER_UNIFORM_INT        = 4; (* Shader uniform type: int *)
				SHADER_UNIFORM_IVEC2      = 5; (* Shader uniform type: ivec2 (2 int) *)
				SHADER_UNIFORM_IVEC3      = 6; (* Shader uniform type: ivec3 (3 int) *)
				SHADER_UNIFORM_IVEC4      = 7; (* Shader uniform type: ivec4 (4 int) *)
				SHADER_UNIFORM_SAMPLER2D  = 8; (* Shader uniform type: sampler2d *)

		(* Shader attribute data types *)
		TYPE
			PShaderAttributeDataType = POINTER TO TShaderAttributeDataType;
			TShaderAttributeDataType =  SIGNED32;
			CONST
				SHADER_ATTRIB_FLOAT     = 0; (* Shader attribute type: float *)
				SHADER_ATTRIB_VEC2      = 1; (* Shader attribute type: vec2 (2 float) *)
				SHADER_ATTRIB_VEC3      = 2; (* Shader attribute type: vec3 (3 float) *)
				SHADER_ATTRIB_VEC4      = 3; (* Shader attribute type: vec4 (4 float) *)

		(* Pixel formats *)
		(* NOTE: Support depends on OpenGL version and platform *)
		TYPE
			PPixelFormat = POINTER TO TPixelFormat;
			TPixelFormat =  SIGNED32;
			CONST
				PIXELFORMAT_UNCOMPRESSED_GRAYSCALE     = 1;  (* 8 bit per pixel (no alpha) *)
				PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA    = 2;  (* 8*2 bpp (2 channels) *)
				PIXELFORMAT_UNCOMPRESSED_R5G6B5        = 3;  (* 16 bpp *)
				PIXELFORMAT_UNCOMPRESSED_R8G8B8        = 4;  (* 24 bpp *)
				PIXELFORMAT_UNCOMPRESSED_R5G5B5A1      = 5;  (* 16 bpp (1 bit alpha) *)
				PIXELFORMAT_UNCOMPRESSED_R4G4B4A4      = 6;  (* 16 bpp (4 bit alpha) *)
				PIXELFORMAT_UNCOMPRESSED_R8G8B8A8      = 7;  (* 32 bpp *)
				PIXELFORMAT_UNCOMPRESSED_R32           = 8;  (* 32 bpp (1 channel - float) *)
				PIXELFORMAT_UNCOMPRESSED_R32G32B32     = 9;  (* 32*3 bpp (3 channels - float) *)
				PIXELFORMAT_UNCOMPRESSED_R32G32B32A32  = 10; (* 32*4 bpp (4 channels - float) *)
				PIXELFORMAT_COMPRESSED_DXT1_RGB        = 11; (* 4 bpp (no alpha) *)
				PIXELFORMAT_COMPRESSED_DXT1_RGBA       = 12; (* 4 bpp (1 bit alpha) *)
				PIXELFORMAT_COMPRESSED_DXT3_RGBA       = 13; (* 8 bpp *)
				PIXELFORMAT_COMPRESSED_DXT5_RGBA       = 14; (* 8 bpp *)
				PIXELFORMAT_COMPRESSED_ETC1_RGB        = 15; (* 4 bpp *)
				PIXELFORMAT_COMPRESSED_ETC2_RGB        = 16; (* 4 bpp *)
				PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA   = 17; (* 8 bpp *)
				PIXELFORMAT_COMPRESSED_PVRT_RGB        = 18; (* 4 bpp *)
				PIXELFORMAT_COMPRESSED_PVRT_RGBA       = 19; (* 4 bpp *)
				PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA   = 20; (* 8 bpp *)
				PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA   = 21; (* 2 bpp *)

	(* Texture parameters: filter mode *)
	(* NOTE 1: Filtering considers mipmaps if available in the texture *)
	(* NOTE 2: Filter is accordingly set for minification and magnification *)
	TYPE
		PTextureFilter = POINTER TO TTextureFilter;
		TTextureFilter =  SIGNED32;
		CONST
			TEXTURE_FILTER_POINT            = 0; (* No filter, just pixel approximation *)
			TEXTURE_FILTER_BILINEAR         = 1; (* Linear filtering *)
			TEXTURE_FILTER_TRILINEAR        = 2; (* Trilinear filtering (linear with mipmaps) *)
			TEXTURE_FILTER_ANISOTROPIC_4X   = 3; (* Anisotropic filtering 4x *)
			TEXTURE_FILTER_ANISOTROPIC_8X   = 4; (* Anisotropic filtering 8x *)
			TEXTURE_FILTER_ANISOTROPIC_16X  = 5; (* Anisotropic filtering 16x *)

	(* Texture parameters: wrap mode *)
	TYPE
		PTextureWrap = POINTER TO TTextureWrap;
		TTextureWrap =  SIGNED32;
		CONST
			TEXTURE_WRAP_REPEAT        = 0; (* Repeats texture in tiled mode *)
			TEXTURE_WRAP_CLAMP         = 1; (* Clamps texture to edge pixel in tiled mode *)
			TEXTURE_WRAP_MIRROR_REPEAT = 2; (* Mirrors and repeats the texture in tiled mode *)
			TEXTURE_WRAP_MIRROR_CLAMP  = 3; (* Mirrors and clamps to border the texture in tiled mode *)

	(* Cubemap layouts *)
	TYPE
		PCubemapLayout = POINTER TO TCubemapLayout;
		TCubemapLayout =  SIGNED32;
		CONST
			CUBEMAP_LAYOUT_AUTO_DETECT         = 0; (* Automatically detect layout type *)
			CUBEMAP_LAYOUT_LINE_VERTICAL       = 1; (* Layout is defined by a vertical line with faces *)
			CUBEMAP_LAYOUT_LINE_HORIZONTAL     = 2; (* Layout is defined by an horizontal line with faces *)
			CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3; (* Layout is defined by a 3x4 cross with cubemap faces *)
			CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4; (* Layout is defined by a 4x3 cross with cubemap faces *)
			CUBEMAP_LAYOUT_PANORAMA            = 5; (* Layout is defined by a panorama image (equirectangular map) *)

	(* Font type, defines generation method *)
	TYPE
		PFontType = POINTER TO TFontType;
		TFontType =  SIGNED32;
		CONST
			FONT_DEFAULT          = 0;    (* Default font generation, anti-aliased *)
			FONT_BITMAP           = 1;    (* Bitmap font generation, no anti-aliasing *)
			FONT_SDF              = 2;    (* SDF font generation, requires external shader *)

	(* Color blending modes (pre-defined) *)
	TYPE
		PBlendMode = POINTER TO TBlendMode;
		TBlendMode =  SIGNED32;
		CONST
			BLEND_ALPHA             = 0;    (* Blend textures considering alpha (default) *)
			BLEND_ADDITIVE          = 1;    (* Blend textures adding colors *)
			BLEND_MULTIPLIED        = 2;    (* Blend textures multiplying colors *)
			BLEND_ADD_COLORS        = 3;    (* Blend textures adding colors (alternative) *)
			BLEND_SUBTRACT_COLORS   = 4;    (* Blend textures subtracting colors (alternative) *)
			BLEND_ALPHA_PREMULTIPLY = 5;    (* Blend premultiplied textures considering alpha *)
			BLEND_CUSTOM            = 6;    (* Blend textures using custom src/dst factors (use rlSetBlendMode()) *)
			BLEND_CUSTOM_SEPARATE   = 7;    (* Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendModeSeparate()) *)

	(* Gestures *)
	(* NOTE: It could be used as flags to enable only some gestures *)
	TYPE
		PGesture = POINTER TO TGesture;
		TGesture =  SIGNED32;
		CONST
			GESTURE_NONE          = 0;    (* No gesture *)
			GESTURE_TAP           = 1;    (* Tap gesture *)
			GESTURE_DOUBLETAP     = 2;    (* Double tap gesture *)
			GESTURE_HOLD          = 4;    (* Hold gesture *)
			GESTURE_DRAG          = 8;    (* Drag gesture *)
			GESTURE_SWIPE_RIGHT   = 16;   (* Swipe right gesture *)
			GESTURE_SWIPE_LEFT    = 32;   (* Swipe left gesture *)
			GESTURE_SWIPE_UP      = 64;   (* Swipe up gesture *)
			GESTURE_SWIPE_DOWN    = 128;  (* Swipe down gesture *)
			GESTURE_PINCH_IN      = 256;  (* Pinch in gesture *)
			GESTURE_PINCH_OUT     = 512;  (* Pinch out gesture *)

	(* Camera system modes *)
	TYPE
		PCameraMode = POINTER TO TCameraMode;
		TCameraMode =  SIGNED32;
		CONST
			CAMERA_CUSTOM = 0;      (* Custom camera *)
			CAMERA_FREE = 1;        (* Free camera *)
			CAMERA_ORBITAL = 2;     (* Orbital camera *)
			CAMERA_FIRST_PERSON = 3;(* First person camera *)
			CAMERA_THIRD_PERSON = 4;(* Third person camera *)

	(* Camera projection *)
	TYPE
		PCameraProjection = POINTER TO TCameraProjection;
		TCameraProjection =  SIGNED32;
		CONST
			CAMERA_PERSPECTIVE = 0; (* Perspective projection *)
			CAMERA_ORTHOGRAPHIC = 1;(* Orthographic projection *)

		(* N-patch layout *)
		TYPE
			PNPatchLayout = POINTER TO TNPatchLayout;
			TNPatchLayout =  SIGNED32;

			CONST
				NPATCH_NINE_PATCH = 0;             (* Npatch layout: 3x3 tiles *)
				NPATCH_THREE_PATCH_VERTICAL = 1;   (* Npatch layout: 1x3 tiles *)
				NPATCH_THREE_PATCH_HORIZONTAL = 2; (* Npatch layout: 3x1 tiles *)


(* ------------------------------------------------------------------------------------ *)
(* Global Variables Definition *)
(* ------------------------------------------------------------------------------------ *)
(* It's lonely here... *)
(* ------------------------------------------------------------------------------------ *)
(* Window and Graphics Device Functions (Module: core) *)
(* ------------------------------------------------------------------------------------ *)

(* Window-related function *)

(* Initialize window and OpenGL context *)
PROCEDURE InitWindow(width, height: SIGNED32; title: PChar); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if KEY_ESCAPE pressed or Close icon pressed *)
PROCEDURE WindowShouldClose: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Close window and unload OpenGL context *)
PROCEDURE CloseWindow; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if window has been initialized successfully *)
PROCEDURE IsWindowReady: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if window is currently fullscreen *)
PROCEDURE IsWindowFullscreen: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if window is currently hidden (only PLATFORM_DESKTOP) *)
PROCEDURE IsWindowHidden: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if window is currently minimized (only PLATFORM_DESKTOP) *)
PROCEDURE IsWindowMinimized: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if window is currently maximized (only PLATFORM_DESKTOP) *)
PROCEDURE IsWindowMaximized: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if window is currently focused (only PLATFORM_DESKTOP) *)
PROCEDURE IsWindowFocused: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if window has been resized last frame *)
PROCEDURE IsWindowResized: BOOLEAN;cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if one specific window flag is enabled *)
PROCEDURE IsWindowState(flag: LongWord): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set window configuration state using flags (only PLATFORM_DESKTOP) *)
PROCEDURE SetWindowState(flags: LongWord); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Clear window configuration state flags *)
PROCEDURE ClearWindowState(flags: LongWord); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP) *)
PROCEDURE ToggleFullscreen; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set window state: maximized, if resizable (only PLATFORM_DESKTOP) *)
PROCEDURE MaximizeWindow; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set window state: minimized, if resizable (only PLATFORM_DESKTOP) *)
PROCEDURE MinimizeWindow; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set window state: not minimized/maximized (only PLATFORM_DESKTOP) *)
PROCEDURE RestoreWindow; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set icon for window (only PLATFORM_DESKTOP) *)
PROCEDURE SetWindowIcon(image: TImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set title for window (only PLATFORM_DESKTOP) *)
PROCEDURE SetWindowTitle(title: PChar); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set window position on screen (only PLATFORM_DESKTOP) *)
PROCEDURE SetWindowPosition(x, y: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set monitor for the current window (fullscreen mode) *)
PROCEDURE SetWindowMonitor(monitor: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE) *)
PROCEDURE SetWindowMinSize(width, height: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set window dimensions *)
PROCEDURE SetWindowSize(width, height: SIGNED32);cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP) *)
PROCEDURE SetWindowOpacity(opacity: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get native window handle *)
PROCEDURE GetWindowHandle: ANY; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get current screen width *)
PROCEDURE GetScreenWidth: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get current screen height *)
PROCEDURE GetScreenHeight: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get current render width (it considers HiDPI) *)
PROCEDURE GetRenderWidth: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get current render height (it considers HiDPI) *)
PROCEDURE GetRenderHeight: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get number of connected monitors *)
PROCEDURE GetMonitorCount: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get current connected monitor *)
PROCEDURE GetCurrentMonitor: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get specified monitor position *)
PROCEDURE GetMonitorPosition(monitor: SIGNED32): TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get specified monitor width (current video mode used by monitor) *)
PROCEDURE GetMonitorWidth(monitor: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get specified monitor height (current video mode used by monitor) *)
PROCEDURE GetMonitorHeight(monitor: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get specified monitor physical width in millimetres *)
PROCEDURE GetMonitorPhysicalWidth(monitor: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get specified monitor physical height in millimetres *)
PROCEDURE GetMonitorPhysicalHeight(monitor: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get specified monitor refresh rate *)
PROCEDURE GetMonitorRefreshRate(monitor: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get window position XY on monitor *)
PROCEDURE GetWindowPosition: TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get window scale DPI factor *)
PROCEDURE GetWindowScaleDPI: TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get the human-readable, UTF-8 encoded name of the primary monitor *)
PROCEDURE GetMonitorName(monitor: SIGNED32): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set clipboard text content *)
PROCEDURE SetClipboardText(text: PChar); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get clipboard text content *)
PROCEDURE GetClipboardText: PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Enable waiting for events on EndDrawing(), no automatic event polling *)
PROCEDURE EnableEventWaiting; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Disable waiting for events on EndDrawing(), automatic events polling *)
PROCEDURE DisableEventWaiting; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Custom frame control functions *)
(* NOTE: Those functions are intended for advance users that want full control over the frame processing *)
(* By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timming + PollInputEvents() *)
(* To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL *)

(* Swap back buffer with front buffer (screen drawing) *)
PROCEDURE SwapScreenBuffer; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Register all input events *)
PROCEDURE PollInputEvents; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Wait for some time (halt program execution) *)
PROCEDURE WaitTime(ms: FLOAT64); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Cursor-related functions *)

(* Shows cursor *)
PROCEDURE ShowCursor; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Hides cursor *)
PROCEDURE HideCursor; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if cursor is not visible *)
PROCEDURE IsCursorHidden: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Enables cursor (unlock cursor) *)
PROCEDURE EnableCursor; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Disables cursor (lock cursor) *)
PROCEDURE DisableCursor; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if cursor is on the current screen. *)
PROCEDURE IsCursorOnScreen: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Drawing-related functions *)

(* Set background color (framebuffer clear color) *)
PROCEDURE ClearBackground(color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Setup canvas (framebuffer) to start drawing *)
PROCEDURE BeginDrawing; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* End canvas drawing and swap buffers (double buffering) *)
PROCEDURE EndDrawing; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Initialize 2D mode with custom camera (2D) *)
PROCEDURE BeginMode2D(camera: TCamera2D); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Ends 2D mode with custom camera *)
PROCEDURE EndMode2D; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Initializes 3D mode with custom camera (3D) *)
PROCEDURE BeginMode3D(camera: TCamera3D); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Ends 3D mode and returns to default 2D orthographic mode *)
PROCEDURE EndMode3D; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Initializes render texture for drawing *)
PROCEDURE BeginTextureMode(target: TRenderTexture2D); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Ends drawing to render texture *)
PROCEDURE EndTextureMode; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Begin custom shader drawing *)
PROCEDURE BeginShaderMode(shader: TShader); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* End custom shader drawing (use default shader) *)
PROCEDURE EndShaderMode;cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Begin blending mode (alpha, additive, multiplied) *)
PROCEDURE BeginBlendMode(mode: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* End blending mode (reset to default: alpha blending) *)
PROCEDURE EndBlendMode; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Begin scissor mode (define screen area for following drawing) *)
PROCEDURE BeginScissorMode(x, y, width, height: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* End scissor mode *)
PROCEDURE EndScissorMode; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Begin stereo rendering (requires VR simulator) *)
PROCEDURE BeginVrStereoMode(config: TVrStereoConfig); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* End stereo rendering (requires VR simulator) *)
PROCEDURE EndVrStereoMode; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* VR stereo config functions for VR simulator *)

(* Load VR stereo config for VR simulator device parameters *)
PROCEDURE LoadVrStereoConfig(device: TVrDeviceInfo): TVrStereoConfig; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload VR stereo config *)
PROCEDURE UnloadVrStereoConfig(config: TVrStereoConfig); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Shader management functions *)
(* NOTE: Shader functionality is not available on OpenGL 1.1 *)

(* Load shader from files and bind default locations *)
PROCEDURE LoadShader(vsFileName, fsFileName: PChar): TShader; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load shader from code strings and bind default locations *)
PROCEDURE LoadShaderFromMemory(vsCode, fsCode: PChar): TShader;cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get shader uniform location *)
PROCEDURE GetShaderLocation(shader: TShader; uniformName: PChar): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get shader attribute location *)
PROCEDURE GetShaderLocationAttrib(shader:TShader; attribName:PChar): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set shader uniform value *)
PROCEDURE SetShaderValue(shader: TShader; locIndex: SIGNED32; value: ANY; uniformType: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set shader uniform value vector *)
PROCEDURE SetShaderValueV(shader: TShader; locIndex: SIGNED32; value: ANY; uniformType, count: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set shader uniform value (matrix 4x4) *)
PROCEDURE SetShaderValueMatrix(shader: TShader; locIndex: SIGNED32; mat:TMatrix); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set shader uniform value for texture (sampler2d) *)
PROCEDURE SetShaderValueTexture(shader: TShader; locIndex: SIGNED32; texture: TTexture2D); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload shader from GPU memory (VRAM) *)
PROCEDURE UnloadShader(shader: TShader); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Screen-space-related functions *)

(* Get a ray trace from mouse position *)
PROCEDURE GetMouseRay(mousePosition: TVector2; camera: TCamera): TRay; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get camera transform matrix (view matrix) *)
PROCEDURE GetCameraMatrix(camera: TCamera): TMatrix; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get camera 2d transform matrix *)
PROCEDURE GetCameraMatrix2D(camera: TCamera2D): TMatrix; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get the screen space position for a 3d world space position *)
PROCEDURE GetWorldToScreen(position: TVector3; camera: TCamera): TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get size position for a 3d world space position *)
PROCEDURE GetWorldToScreenEx(position: TVector3; camera: TCamera; width, height: SIGNED32): TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get the screen space position for a 2d camera world space position *)
PROCEDURE GetWorldToScreen2D(position: TVector2; camera: TCamera2D): TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get the world space position for a 2d camera screen space position *)
PROCEDURE GetScreenToWorld2D(position: TVector2; camera: TCamera2D): TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Timing-related functions *)

(* Set target FPS (maximum) *)
PROCEDURE SetTargetFPS(fps: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Returns current FPS *)
PROCEDURE GetFPS: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Returns time in seconds for last frame drawn (delta time) *)
PROCEDURE GetFrameTime: FLOAT32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Returns elapsed time in seconds since InitWindow() *)
PROCEDURE GetTime: FLOAT64; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Misc. functions *)

(* Get a random value between min and max (both included) *)
PROCEDURE GetRandomValue(min, max: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set the seed for the random number generator *)
PROCEDURE SetRandomSeed(seed: LongWord); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Takes a screenshot of current screen (filename extension defines format) *)
PROCEDURE TakeScreenshot(fileName: PChar); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Setup init configuration flags (view FLAGS) *)
PROCEDURE SetConfigFlags(flags:LongWord); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...) *)
PROCEDURE TraceLog(logLevel: SIGNED32; text: PChar); cdecl; varargs; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set the current threshold (minimum) log level *)
PROCEDURE SetTraceLogLevel(logLevel: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Internal memory allocator *)
PROCEDURE MemAlloc(size: LongWord): ANY; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Internal memory reallocator *)
PROCEDURE MemRealloc(ptr: ANY; size: LongWord): ANY; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Internal memory free *)
PROCEDURE MemFree(ptr: ANY); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Open URL with default system browser (if available) *)
PROCEDURE OpenURL(CONST url: PChar); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Set custom callbacks *)
(* Callbacks to hook some internal functions *)
(* WARNING: This callbacks are intended for advance users *)
TYPE
	TTraceLogCallback = PROCEDURE(logLevel: SIGNED32; text: PChar); cdecl; varargs; (* , va_list args varargs ??? *)
	TLoadFileDataCallback = PROCEDURE(fileName: PChar; out bytesRead: LongWord): PChar; cdecl;
	TSaveFileDataCallback = PROCEDURE(fileName: PChar; data: ANY; bytesToWrite: LongWord): BOOLEAN; cdecl;
	TLoadFileTextCallback = PROCEDURE(fileName: PChar): PChar; cdecl;
	TSaveFileTextCallback = PROCEDURE(fileName, text: PChar): BOOLEAN; cdecl;

	(* Set custom trace log *)
	PROCEDURE SetTraceLogCallback(callback: TTraceLogCallback); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
	(* Set custom file binary data loader *)
	PROCEDURE SetLoadFileDataCallback(callback: TLoadFileDataCallback); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
	(* Set custom file binary data saver *)
	PROCEDURE SetSaveFileDataCallback(callback: TSaveFileDataCallback); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
	(* Set custom file text data loader *)
	PROCEDURE SetLoadFileTextCallback(callback: TLoadFileTextCallback); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
	(* Set custom file text data saver *)
	PROCEDURE SetSaveFileTextCallback(callback: TSaveFileTextCallback); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Files management functions *)

(* Load file data as byte array (read) *)
PROCEDURE LoadFileData(fileName: PChar; bytesRead: PLongWord): ANY; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload file data allocated by LoadFileData() *)
PROCEDURE UnloadFileData(data: ANY); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Save data to file from byte array (write), returns true on success *)
PROCEDURE SaveFileData(fileName: PChar; data: ANY; bytesToWrite: LongWord): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Export data to code (.h), returns true on success *)
PROCEDURE ExportDataAsCode(data: PChar; size: LongWord; fileName: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load text data from file (read), returns a '\0' terminated string *)
PROCEDURE LoadFileText(fileName: Pchar): Pchar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload file text data allocated by LoadFileText() *)
PROCEDURE UnloadFileText(text: PChar); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Save text data to file (write), string must be '\0' terminated, returns true on success *)
PROCEDURE SaveFileText(fileName, text: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if file exists *)
PROCEDURE FileExists(fileName: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a directory path exists *)
PROCEDURE DirectoryExists(dirPath: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check file extension (including point: .png, .wav) *)
PROCEDURE IsFileExtension(fileName, ext: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h) *)
PROCEDURE GetFileLength(fileName: PChar): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get pointer to extension for a filename string (includes dot: '.png') *)
PROCEDURE GetFileExtension(fileName: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get pointer to filename for a path string *)
PROCEDURE GetFileName(filePath: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get filename string without extension (uses static string) *)
PROCEDURE GetFileNameWithoutExt(filePath: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get full path for a given fileName with path (uses static string) *)
PROCEDURE GetDirectoryPath(filePath: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get previous directory path for a given path (uses static string) *)
PROCEDURE GetPrevDirectoryPath(dirPath: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get current working directory (uses static string) *)
PROCEDURE GetWorkingDirectory: PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get the directory if the running application (uses static string) *)
PROCEDURE GetApplicationDirectory: PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Change working directory, return true on success *)
PROCEDURE ChangeDirectory(dir: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a given path is a file or a directory *)
PROCEDURE IsPathFile(path: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load directory filepaths *)
PROCEDURE LoadDirectoryFiles(dirPath: PChar): TFilePathList; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load directory filepaths with extension filtering and recursive directory scan *)
PROCEDURE LoadDirectoryFilesEx(basePath, filter: PChar; scanSubdirs: BOOLEAN): TFilePathList; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload filepaths *)
PROCEDURE UnloadDirectoryFiles(files: TFilePathList); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a file has been dropped into window *)
PROCEDURE IsFileDropped: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load dropped filepaths *)
PROCEDURE LoadDroppedFiles: TFilePathList; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload dropped filepaths *)
PROCEDURE UnloadDroppedFiles(files: TFilePathList); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get file modification time (last write time) *)
PROCEDURE GetFileModTime(fileName: PChar): QWord; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Compression/Encoding functionality *)

(* Compress data (DEFLATE algorithm), memory must be MemFree() *)
PROCEDURE CompressData(CONST data: ANY; dataSize: SIGNED32; compDataSize: PInteger): ANY; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Decompress data (DEFLATE algorithm), memory must be MemFree() *)
PROCEDURE DecompressData(CONST compData: ANY; compDataSize: SIGNED32; dataSize: PInteger): ANY; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Encode data to Base64 string, memory must be MemFree() *)
PROCEDURE EncodeDataBase64(CONST data: PChar; dataSize: SIGNED32; outputSize: PInteger): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Decode Base64 string data, memory must be MemFree() *)
PROCEDURE DecodeDataBase64(CONST data: PChar; outputSize: PInteger): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* Input Handling Functions (Module: core) *)
(* ------------------------------------------------------------------------------------ *)

(* Input-related functions: keyboard *)

(* Check if a key has been pressed once *)
PROCEDURE IsKeyPressed(key: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a key is being pressed *)
PROCEDURE IsKeyDown(key: SIGNED32): BOOLEAN;cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a key has been released once *)
PROCEDURE IsKeyReleased(key: SIGNED32): BOOLEAN;cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a key is NOT being pressed *)
PROCEDURE IsKeyUp(key: SIGNED32): BOOLEAN;cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set a custom key to exit program (default is ESC) *)
PROCEDURE SetExitKey(key: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty *)
PROCEDURE GetKeyPressed: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty *)
PROCEDURE GetCharPressed: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Input-related functions: gamepads *)

(* Check if a gamepad is available *)
PROCEDURE IsGamepadAvailable(gamepad: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get gamepad internal name id *)
PROCEDURE GetGamepadName(gamepad: SIGNED32): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a gamepad button has been pressed once *)
PROCEDURE IsGamepadButtonPressed(gamepad, button: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a gamepad button is being pressed *)
PROCEDURE IsGamepadButtonDown(gamepad, button: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a gamepad button has been released once *)
PROCEDURE IsGamepadButtonReleased(gamepad, button: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a gamepad button is NOT being pressed *)
PROCEDURE IsGamepadButtonUp(gamepad, button: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get the last gamepad button pressed *)
PROCEDURE GetGamepadButtonPressed: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get gamepad axis count for a gamepad *)
PROCEDURE GetGamepadAxisCount(gamepad: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get axis movement value for a gamepad axis *)
PROCEDURE GetGamepadAxisMovement(gamepad, axis: SIGNED32): FLOAT32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set internal gamepad mappings (SDL_GameControllerDB) *)
PROCEDURE SetGamepadMappings(mappings: PChar): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Input-related functions: mouse *)

(* Check if a mouse button has been pressed once *)
PROCEDURE IsMouseButtonPressed(button: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a mouse button is being pressed *)
PROCEDURE IsMouseButtonDown(button: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a mouse button has been released once *)
PROCEDURE IsMouseButtonReleased(button: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a mouse button is NOT being pressed *)
PROCEDURE IsMouseButtonUp(button: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get mouse position X *)
PROCEDURE GetMouseX: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get mouse position Y *)
PROCEDURE GetMouseY: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get mouse position XY *)
PROCEDURE GetMousePosition: TVector2; cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get mouse delta between frames *)
PROCEDURE GetMouseDelta: TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set mouse position XY *)
PROCEDURE SetMousePosition(x,y: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set mouse offset *)
PROCEDURE SetMouseOffset(offsetX, offsetY: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set mouse scaling *)
PROCEDURE SetMouseScale(scaleX, scaleY: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get mouse wheel movement for X or Y, whichever is larger *)
PROCEDURE GetMouseWheelMove: FLOAT32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get mouse wheel movement for both X and Y *)
PROCEDURE GetMouseWheelMoveV: TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set mouse cursor *)
PROCEDURE SetMouseCursor(cursor: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Input-related functions: touch *)

(* Get touch position X for touch point 0 (relative to screen size) *)
PROCEDURE GetTouchX: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get touch position Y for touch point 0 (relative to screen size) *)
PROCEDURE GetTouchY: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get touch point identifier for given index *)
PROCEDURE GetTouchPointId(index: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get touch position XY for a touch point index (relative to screen size) *)
PROCEDURE GetTouchPosition(index: SIGNED32): TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get touch points count *)
PROCEDURE GetTouchPointCount: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get last touch event registered *)
PROCEDURE GetTouchEvent: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* Gestures and Touch Handling Functions (Module: rgestures) *)
(* ------------------------------------------------------------------------------------ *)

(* Enable a set of gestures using flags *)
PROCEDURE SetGesturesEnabled(flags: LongWord); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a gesture have been detected *)
PROCEDURE IsGestureDetected(gesture: SIGNED32): BOOLEAN;cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get latest detected gesture *)
PROCEDURE GetGestureDetected: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get gesture hold time in milliseconds *)
PROCEDURE GetGestureHoldDuration: FLOAT32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get gesture drag vector *)
PROCEDURE GetGestureDragVector: TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get gesture drag angle *)
PROCEDURE GetGestureDragAngle: FLOAT32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get gesture pinch delta *)
PROCEDURE GetGesturePinchVector: TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get gesture pinch angle *)
PROCEDURE GetGesturePinchAngle: FLOAT32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* Camera System Functions (Module: rcamera) *)
(* ------------------------------------------------------------------------------------ *)

(* Set camera mode (multiple camera modes available) *)
PROCEDURE SetCameraMode(camera: TCamera; mode: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Update camera position for selected mode *)
PROCEDURE UpdateCamera(camera: PCamera); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set camera pan key to combine with mouse movement (free camera) *)
PROCEDURE SetCameraPanControl(keyPan: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set camera alt key to combine with mouse movement (free camera) *)
PROCEDURE SetCameraAltControl(keyAlt: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set camera smooth zoom key to combine with mouse (free camera) *)
PROCEDURE SetCameraSmoothZoomControl(keySmoothZoom: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set camera move controls (1st person and 3rd person cameras) *)
PROCEDURE SetCameraMoveControls(keyFront, keyBack, keyRight, keyLeft, keyUp, keyDown: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* Basic Shapes Drawing Functions (Module: shapes) *)
(* ------------------------------------------------------------------------------------ *)
(* Set texture and rectangle to be used on shapes drawing *)
(* NOTE: It can be useful when using basic shapes and one single font, *)
(* defining a font char white rectangle would allow drawing everything in a single draw call *)

(* Set texture and rectangle to be used on shapes drawing *)
PROCEDURE SetShapesTexture(texture: TTexture2D; source: TRectangle); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Basic shapes drawing functions *)

(* Draw a pixel *)
PROCEDURE DrawPixel(posX, posY: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a pixel (Vector version) *)
PROCEDURE DrawPixelV(position: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a line *)
PROCEDURE DrawLine(startPosX, startPosY, endPosX, endPosY: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a line (Vector version) *)
PROCEDURE DrawLineV(startPos, endPos: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a line defining thickness *)
PROCEDURE DrawLineEx(startPos, endPos: TVector2; thick: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a line using cubic-bezier curves in-out *)
PROCEDURE DrawLineBezier(startPos, endPos: TVector2; thick: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw line using quadratic bezier curves with a control point *)
PROCEDURE DrawLineBezierQuad(startPos, endPos, controlPos: TVector2; thick: FLOAT32; color:TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw line using cubic bezier curves with 2 control points *)
PROCEDURE DrawLineBezierCubic(startPos, endPos, startControlPos, endControlPos: TVector2; thick: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw lines sequence *)
PROCEDURE DrawLineStrip(points: PVector2; pointCount: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a color-filled circle *)
PROCEDURE DrawCircle(centerX, centerY: SIGNED32; radius: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a piece of a circle *)
PROCEDURE DrawCircleSector(center: TVector2; radius, startAngle, endAngle: FLOAT32; segments: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw circle sector outline *)
PROCEDURE DrawCircleSectorLines(center: TVector2; radius, startAngle, endAngle: FLOAT32; segments: SIGNED32; color: TColorB);cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a gradient-filled circle *)
PROCEDURE DrawCircleGradient(centerX, centerY: SIGNED32; radius: FLOAT32; color1, color2: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a color-filled circle (Vector version) *)
PROCEDURE DrawCircleV(center: TVector2; radius: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw circle outline *)
PROCEDURE DrawCircleLines(centerX, centerY: SIGNED32; radius: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw ellipse *)
PROCEDURE DrawEllipse(centerX, centerY: SIGNED32; radiusH, radiusV: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw ellipse outline *)
PROCEDURE DrawEllipseLines(centerX, centerY: SIGNED32; radiusH, radiusV: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw ring *)
PROCEDURE DrawRing(center: TVector2; innerRadius, outerRadius, startAngle, endAngle: FLOAT32; segments: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw ring outline *)
PROCEDURE DrawRingLines(center: TVector2; innerRadius, outerRadius, startAngle, endAngle: FLOAT32; segments: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a color-filled rectangle *)
PROCEDURE DrawRectangle(posX, posY, width, height: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a color-filled rectangle (Vector version) *)
PROCEDURE DrawRectangleV(position, size: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a color-filled rectangle *)
PROCEDURE DrawRectangleRec(rec: TRectangle; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a color-filled rectangle with pro parameters *)
PROCEDURE DrawRectanglePro(rec: TRectangle; origin: TVector2; rotation: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a vertical-gradient-filled rectangle *)
PROCEDURE DrawRectangleGradientV(posX, posY, width, height: SIGNED32; color1, color2: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a horizontal-gradient-filled rectangle *)
PROCEDURE DrawRectangleGradientH(posX, posY, width, height: SIGNED32; color1, color2: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a gradient-filled rectangle with custom vertex colors *)
PROCEDURE DrawRectangleGradientEx(rec: TRectangle; col1, col2, col3, col4: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw rectangle outline *)
PROCEDURE DrawRectangleLines(posX, posY, width, height: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw rectangle outline with extended parameters *)
PROCEDURE DrawRectangleLinesEx(rec: TRectangle; lineThick: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw rectangle with rounded edges *)
PROCEDURE DrawRectangleRounded(rec: TRectangle; roundness: FLOAT32; segments: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw rectangle with rounded edges outline *)
PROCEDURE DrawRectangleRoundedLines(rec: TRectangle; roundness: FLOAT32; segments: SIGNED32; lineThick: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a color-filled triangle (vertex in counter-clockwise order!) *)
PROCEDURE DrawTriangle(v1, v2, v3: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw triangle outline (vertex in counter-clockwise order!) *)
PROCEDURE DrawTriangleLines(v1, v2, v3: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a triangle fan defined by points (first vertex is the center) *)
PROCEDURE DrawTriangleFan(points: PVector2; pointCount: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a triangle strip defined by points *)
PROCEDURE DrawTriangleStrip(points: PVector2; pointCount: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a regular polygon (Vector version) *)
PROCEDURE DrawPoly(center: TVector2; sides: SIGNED32; radius: FLOAT32; rotation: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a polygon outline of n sides *)
PROCEDURE DrawPolyLines(center: TVector2; sides: SIGNED32; radius, rotation: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a polygon outline of n sides with extended parameters *)
PROCEDURE DrawPolyLinesEx(center: TVector2; sides: SIGNED32; radius, rotation, lineThick: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Basic shapes collision detection functions *)

(* Check collision between two rectangles *)
PROCEDURE CheckCollisionRecs(rec1, rec2: TRectangle): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check collision between two circles *)
PROCEDURE CheckCollisionCircles(center1: TVector2; radius1: FLOAT32; center2: TVector2; radius2: FLOAT32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check collision between circle and rectangle *)
PROCEDURE CheckCollisionCircleRec(center: TVector2; radius: FLOAT32; rec: TRectangle): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if point is inside rectangle *)
PROCEDURE CheckCollisionPointRec(point: TVector2; rec: TRectangle): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if point is inside circle *)
PROCEDURE CheckCollisionPointCircle(point, center: TVector2; radius: FLOAT32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if point is inside a triangle *)
PROCEDURE CheckCollisionPointTriangle(point, p1, p2, p3: TVector2): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if point is within a polygon described by array of vertices *)
PROCEDURE CheckCollisionPointPoly(point: TVector2; points: PVector2; pointCount: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check the collision between two lines defined by two points each, returns collision point by reference *)
PROCEDURE CheckCollisionLines(startPos1, endPos1, startPos2, endPos2: TVector2; collisionPoint: PVector2): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold] *)
PROCEDURE CheckCollisionPointLine(point, p1, p2: TVector2; threshold: SIGNED32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get collision rectangle for two rectangles collision *)
PROCEDURE GetCollisionRec(rec1, rec2: TRectangle): TRectangle; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* Texture Loading and Drawing Functions (Module: textures) *)
(* ------------------------------------------------------------------------------------ *)

(* Image loading functions *)
(* NOTE: This functions do not require GPU access *)

(* Load image from file into CPU memory (RAM) *)
PROCEDURE LoadImage(fileName: PChar): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load image from RAW file data *)
PROCEDURE LoadImageRaw(fileName: PChar; width, height, format, headerSize: SIGNED32): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load image sequence from file (frames appended to image.data) *)
PROCEDURE LoadImageAnim(fileName: PChar; frames: PInteger):TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load image from memory buffer, fileType refers to extension: i.e. '.png' *)
PROCEDURE LoadImageFromMemory(fileType: PChar; fileData: ANY; dataSize: SIGNED32): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load image from GPU texture data *)
PROCEDURE LoadImageFromTexture(texture: TTexture2D): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load image from screen buffer and (screenshot) *)
PROCEDURE LoadImageFromScreen: TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload image from CPU memory (RAM) *)
PROCEDURE UnloadImage(image: TImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Export image data to file, returns true on success *)
PROCEDURE ExportImage(image: TImage; fileName: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Export image as code file defining an array of bytes, returns true on success *)
PROCEDURE ExportImageAsCode(image: TImage; fileName: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Image generation functions *)

(* Generate image: plain color *)
PROCEDURE GenImageColor(width, height: SIGNED32; color: TColorB): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image: vertical gradient *)
PROCEDURE GenImageGradientV(width, height: SIGNED32; top, bottom: TColorB): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image: horizontal gradient *)
PROCEDURE GenImageGradientH(width, height: SIGNED32; left, right: TColorB): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image: radial gradient *)
PROCEDURE GenImageGradientRadial(width, height: SIGNED32; density: FLOAT32; inner, outer: TColorB): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image: checked *)
PROCEDURE GenImageChecked(width, height, checksX, checksY: SIGNED32; col1, col2: TColorB): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image: white noise *)
PROCEDURE GenImageWhiteNoise(width, height: SIGNED32; factor: FLOAT32): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image: perlin noise *)
PROCEDURE GenImagePerlinNoise(width, height, offsetX, offsetY: SIGNED32; scale: SIGNED32): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image: cellular algorithm, bigger tileSize means bigger cells *)
PROCEDURE GenImageCellular(width, height, tileSize: SIGNED32): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image: grayscale image from text data *)
PROCEDURE GenImageText(width, height: SIGNED32; CONST text: PChar): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Image manipulation functions *)

(* Create an image duplicate (useful for transformations) *)
PROCEDURE ImageCopy(image: TImage): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Create an image from another image piece *)
PROCEDURE ImageFromImage(image: TImage; rec: TRectangle): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Create an image from text (default font) *)
PROCEDURE ImageText(text: PChar; fontSize: SIGNED32; color: TColorB): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Create an image from text (custom sprite font) *)
PROCEDURE ImageTextEx(font: TFont; text: PChar; fontSize, spacing: FLOAT32; tint: TColorB): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Convert image data to desired format *)
PROCEDURE ImageFormat(image: PImage; newFormat: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Convert image to POT (power-of-two) *)
PROCEDURE ImageToPOT(image: PImage; fill: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Crop an image to a defined rectangle *)
PROCEDURE ImageCrop(image: PImage; crop: TRectangle); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Crop image depending on alpha value *)
PROCEDURE ImageAlphaCrop(image: PImage; threshold: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Clear alpha channel to desired color *)
PROCEDURE ImageAlphaClear(image: PImage; color: TColorB; threshold: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Apply alpha mask to image *)
PROCEDURE ImageAlphaMask(image: PImage; alphaMask: TImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Premultiply alpha channel *)
PROCEDURE ImageAlphaPremultiply(image: PImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Resize image (Bicubic scaling algorithm) *)
PROCEDURE ImageResize(image: PImage; newWidth, newHeight: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Resize image (Nearest-Neighbor scaling algorithm) *)
PROCEDURE ImageResizeNN(image: PImage; newWidth, newHeight: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Resize canvas and fill with color *)
PROCEDURE ImageResizeCanvas(image: PImage; newWidth, newHeight, offsetX, offsetY: SIGNED32; fill: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Compute all mipmap levels for a provided image *)
PROCEDURE ImageMipmaps(image: PImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Dither image data to 16bpp or lower (Floyd-Steinberg dithering) *)
PROCEDURE ImageDither(image: PImage; rBpp, gBpp, bBpp, aBpp: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Flip image vertically *)
PROCEDURE ImageFlipVertical(image: PImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Flip image horizontally *)
PROCEDURE ImageFlipHorizontal(image: PImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Rotate image clockwise 90deg *)
PROCEDURE ImageRotateCW(image: PImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Rotate image counter-clockwise 90deg *)
PROCEDURE ImageRotateCCW(image: PImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Modify image color: tint *)
PROCEDURE ImageColorTint(image: PImage; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Modify image color: invert *)
PROCEDURE ImageColorInvert(image: PImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Modify image color: grayscale *)
PROCEDURE ImageColorGrayscale(image: PImage); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Modify image color: contrast (-100 to 100) *)
PROCEDURE ImageColorContrast(image: PImage; contrast: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Modify image color: brightness (-255 to 255) *)
PROCEDURE ImageColorBrightness(image: PImage; brightness: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Modify image color: replace color *)
PROCEDURE ImageColorReplace(image: PImage; color, replace: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load color data from image as a Color array (RGBA - 32bit) *)
PROCEDURE LoadImageColors(image: TImage): PColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load colors palette from image as a Color array (RGBA - 32bit) *)
PROCEDURE LoadImagePalette(image: TImage; maxPaletteSize: SIGNED32; colorCount: PInteger): PColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload color data loaded with LoadImageColors() *)
PROCEDURE UnloadImageColors(colors: PColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload colors palette loaded with LoadImagePalette() *)
PROCEDURE UnloadImagePalette(colors: PColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get image alpha border rectangle *)
PROCEDURE GetImageAlphaBorder(image: TImage; threshold: FLOAT32): TRectangle; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get image pixel color at (x, y) position *)
PROCEDURE GetImageColor(image: TImage; x, y: SIGNED32): TColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Image drawing functions *)
(* NOTE: Image software-rendering functions (CPU) *)

(* Clear image background with given color *)
PROCEDURE ImageClearBackground(dst: PImage; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw pixel within an image *)
PROCEDURE ImageDrawPixel(dst: PImage; posX, posY: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw pixel within an image (Vector version) *)
PROCEDURE ImageDrawPixelV(dst: PImage; position: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw line within an image *)
PROCEDURE ImageDrawLine(dst: PImage; startPosX, startPosY, endPosX, endPosY: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw line within an image (Vector version) *)
PROCEDURE ImageDrawLineV(dst: PImage; start, _end: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a filled circle within an image *)
PROCEDURE ImageDrawCircle(dst: PImage; centerX, centerY, radius: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a filled circle within an image (Vector version) *)
PROCEDURE ImageDrawCircleV(dst: PImage; center: TVector2; radius: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw circle outline within an image *)
PROCEDURE ImageDrawCircleLines(dst: PImage; centerX, centerY, radius: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw circle outline within an image (Vector version) *)
PROCEDURE ImageDrawCircleLinesV(dst: PImage; center: TVector2; radius: SIGNED32; color: TColor); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw rectangle within an image *)
PROCEDURE ImageDrawRectangle(dst: PImage; posX, posY, width, height: SIGNED32; color: TColorB);cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw rectangle within an image (Vector version) *)
PROCEDURE ImageDrawRectangleV(dst: PImage; position, size: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw rectangle within an image *)
PROCEDURE ImageDrawRectangleRec(dst: PImage; rec: TRectangle; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw rectangle lines within an image *)
PROCEDURE ImageDrawRectangleLines(dst: PImage; rec: TRectangle; thick: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a source image within a destination image (tint applied to source) *)
PROCEDURE ImageDraw(dst: PImage; src: TImage; srcRec, dstRec: TRectangle; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw text (using default font) within an image (destination) *)
PROCEDURE ImageDrawText(dst: PImage; text: PChar; posX, posY, fontSize: SIGNED32; color:TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw text (custom sprite font) within an image (destination) *)
PROCEDURE ImageDrawTextEx(dst: PImage; font: TFont; text: PChar; position: TVector2; fontSize, spacing: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Texture loading functions *)
(* NOTE: These functions require GPU access *)

(* Load texture from file into GPU memory (VRAM) *)
PROCEDURE LoadTexture(fileName: PChar): TTexture2D; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load texture from image data *)
PROCEDURE LoadTextureFromImage(image: TImage): TTexture2D; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load cubemap from image, multiple image cubemap layouts supported *)
PROCEDURE LoadTextureCubemap(image: TImage; layout: SIGNED32): TTextureCubemap; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load texture for rendering (framebuffer) *)
PROCEDURE LoadRenderTexture(width, height: SIGNED32): TRenderTexture2D; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload texture from GPU memory (VRAM) *)
PROCEDURE UnloadTexture(texture: TTexture2D); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload render texture from GPU memory (VRAM) *)
PROCEDURE UnloadRenderTexture(target: TRenderTexture2D); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Update GPU texture with new data *)
PROCEDURE UpdateTexture(texture: TTexture2D; pixels: ANY); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Update GPU texture rectangle with new data *)
PROCEDURE UpdateTextureRec(texture: TTexture2D; rec: TRectangle; pixels: ANY); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Texture configuration functions *)

(* Generate GPU mipmaps for a texture *)
PROCEDURE GenTextureMipmaps(texture: PTexture2D); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set texture scaling filter mode *)
PROCEDURE SetTextureFilter(texture: TTexture2D; filter: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set texture wrapping mode *)
PROCEDURE SetTextureWrap(texture: TTexture2D; wrap: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Texture drawing functions *)

(* Draw a Texture2D *)
PROCEDURE DrawTexture(texture: TTexture2D; posX, posY: SIGNED32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a Texture2D with position defined as Vector2 *)
PROCEDURE DrawTextureV(texture: TTexture2D; position: TVector2; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a Texture2D with extended parameters *)
PROCEDURE DrawTextureEx(texture: TTexture2D; position: TVector2; rotation, scale: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a part of a texture defined by a rectangle *)
PROCEDURE DrawTextureRec(texture: TTexture2D; source: TRectangle; position: TVector2; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw texture quad with tiling and offset parameters *)
PROCEDURE DrawTextureQuad(texture: TTexture2D; tiling, offset: TVector2; quad: TRectangle; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw part of a texture (defined by a rectangle) with rotation and scale tiled into dest. *)
PROCEDURE DrawTextureTiled(texture: TTexture2D; source, dest: TRectangle; origin: TVector2; rotation, scale: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a part of a texture defined by a rectangle with 'pro' parameters *)
PROCEDURE DrawTexturePro(texture: TTexture2D; source, dest: TRectangle; origin: TVector2; rotation: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draws a texture (or part of it) that stretches or shrinks nicely *)
PROCEDURE DrawTextureNPatch(texture: TTexture2D; nPatchInfo: TNPatchInfo; dest: TRectangle; origin: TVector2; rotation: FLOAT32; tint: TColorB);cdecl;external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a textured polygon *)
PROCEDURE DrawTexturePoly(texture: TTexture2D; center: TVector2; points: PVector2; texcoords: PVector2; pointCount: SIGNED32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Color/pixel related functions *)

(* Get color with alpha applied, alpha goes from 0.0f to 1.0f *)
PROCEDURE Fade(color: TColorB; alpha: FLOAT32): TColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get hexadecimal value for a Color *)
PROCEDURE ColorToInt(color: TColorB): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get Color normalized as float [0..1] *)
PROCEDURE ColorNormalize(color: TColorB): TVector4; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get Color from normalized values [0..1] *)
PROCEDURE ColorFromNormalized(normalized: TVector4): TColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get HSV values for a Color, hue [0..360], saturation/value [0..1] *)
PROCEDURE ColorToHSV(color: TColorB): TVector3; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get a Color from HSV values, hue [0..360], saturation/value [0..1] *)
PROCEDURE ColorFromHSV(hue, saturation, value: FLOAT32): TColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get color with alpha applied, alpha goes from 0.0f to 1.0f *)
PROCEDURE ColorAlpha(color: TColorB; alpha: FLOAT32): TColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get src alpha-blended into dst color with tint *)
PROCEDURE ColorAlphaBlend(dst, src, tint: TColorB): TColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get Color structure from hexadecimal value *)
PROCEDURE GetColor(hexValue: LongWord): TColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get Color from a source pixel pointer of certain format *)
PROCEDURE GetPixelColor(srcPtr: ANY; format: SIGNED32): TColorB; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set color formatted into destination pixel pointer *)
PROCEDURE SetPixelColor(dstPtr: ANY; color: TColorB; format: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get pixel data size in bytes for certain format *)
PROCEDURE GetPixelDataSize(width, height, format: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* TFont Loading and Text Drawing Functions (Module: text) *)
(* ------------------------------------------------------------------------------------ *)

(* Font loading/unloading functions *)

(* Get the default Font *)
PROCEDURE GetFontDefault: TFont; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load font from file into GPU memory (VRAM) *)
PROCEDURE LoadFont(fileName: PChar): TFont; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load font from file with extended parameters, use NULL for fontChars and 0 for glyphCount to load the default character set *)
PROCEDURE LoadFontEx(fileName: Pchar; fontSize: SIGNED32; fontChars: PInteger; glyphCount: SIGNED32): TFont; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load font from Image (XNA style) *)
PROCEDURE LoadFontFromImage(image: TImage; key: TColorB; firstChar: SIGNED32): TFont; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load font from memory buffer, fileType refers to extension: i.e. '.ttf' *)
PROCEDURE LoadFontFromMemory(fileType: PChar; fileData: ANY; dataSize, fontSize: SIGNED32; fontChars: PInteger; glyphCount: SIGNED32): TFont; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load font data for further uses *)
PROCEDURE LoadFontData(fileData: ANY; dataSize, fontSize: SIGNED32; fontChars: PInteger; glyphCount, _type: SIGNED32): PGlyphInfo; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate image font atlas using chars info *)
PROCEDURE GenImageFontAtlas(chars: PGlyphInfo; recs: PPRectangle; glyphCount, fontSize, padding, packMethod: SIGNED32): TImage; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload font chars info data (RAM) *)
PROCEDURE UnloadFontData(chars: PGlyphInfo; glyphCount: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload Font from GPU memory (VRAM) *)
PROCEDURE UnloadFont(font: TFont); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Export font as code file, returns true on success *)
PROCEDURE ExportFontAsCode(font: TFont; fileName: PChar); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Text drawing functions *)

(* Draw current FPS *)
PROCEDURE DrawFPS(posX, posY: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw text (using default font) *)
PROCEDURE DrawText(text: PChar; posX, posY, fontSize: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw text using font and additional parameters *)
PROCEDURE DrawTextEx(font: TFont; text: PChar; position: TVector2; fontSize, spacing: FLOAT32; tint:TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw text using Font and pro parameters (rotation) *)
PROCEDURE DrawTextPro(font: TFont; text: PChar; position, origin: TVector2; rotation, fontSize, spacing: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw one character (codepoint) *)
PROCEDURE DrawTextCodepoint(font: TFont; codepoint: SIGNED32; position: TVector2; fontSize: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw multiple character (codepoint) *)
PROCEDURE DrawTextCodepoints(font: TFont; CONST codepoints: PInteger; count: SIGNED32; position: TVector2; fontSize, spacing: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Text font info functions *)

(* Measure string width for default font *)
PROCEDURE MeasureText(text: PChar; fontSize: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Measure string size for Font *)
PROCEDURE MeasureTextEx(font: TFont; text: PChar; fontSize, spacing: FLOAT32): TVector2; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found *)
PROCEDURE GetGlyphIndex(font: TFont; codepoint: SIGNED32): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found *)
PROCEDURE GetGlyphInfo(font: TFont; codepoint: SIGNED32): TGlyphInfo; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found *)
PROCEDURE GetGlyphAtlasRec(font: TFont; codepoint: SIGNED32): TRectangle; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Text codepoints management functions (unicode characters) *)

(* Load UTF-8 text encoded from codepoints array *)
PROCEDURE LoadUTF8( codepoints: PInteger; length: SIGNED32): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload UTF-8 text encoded from codepoints array *)
PROCEDURE UnloadUTF8(text: PChar); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load all codepoints from a UTF-8 text string, codepoints count returned by parameter *)
PROCEDURE LoadCodepoints(text: PChar; count: PInteger): PInteger; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload codepoints data from memory *)
PROCEDURE UnloadCodepoints(codepoints: PInteger); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get total number of codepoints in a UTF-8 encoded string *)
PROCEDURE GetCodepointCount(text: PChar): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure *)
PROCEDURE GetCodepoint(text: PChar; codepointSize: PInteger): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure *)
PROCEDURE GetCodepointNext(text: PChar; codepointSize: PInteger): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure *)
PROCEDURE GetCodepointPrevious(text: PChar; codepointSize: PInteger): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Encode one codepoint into UTF-8 byte array (array length returned as parameter) *)
PROCEDURE CodepointToUTF8(codepoint: SIGNED32; utf8Size: PInteger): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Text strings management functions (no UTF-8 strings, only byte chars) *)
(* NOTE: Some strings allocate memory internally for returned strings, just be careful! *)

(* Copy one string to another, returns bytes copied *)
PROCEDURE TextCopy(dst, src: PChar): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if two text string are equal *)
PROCEDURE TextIsEqual(text1, text2: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get text length, checks for '\0' ending *)
PROCEDURE TextLength(text: PChar): LongWord; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Text formatting with variables (sprintf() style) *)
PROCEDURE TextFormat(text: PChar): PChar; cdecl; varargs; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get a piece of a text string *)
PROCEDURE TextSubtext(text: PChar; position, length: SIGNED32): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Replace text string (WARNING: memory must be freed!) *)
PROCEDURE TextReplace(text, replace, by: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Insert text in a position (WARNING: memory must be freed!) *)
PROCEDURE TextInsert(text, insert: PChar; position: SIGNED32): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Join text strings with delimiter *)
PROCEDURE TextJoin(textList: PPChar; count: SIGNED32; delimiter: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Split text into multiple strings *)
PROCEDURE TextSplit(text: PChar; delimiter: CHAR; count: PInteger): PPChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Append text at specific position and move cursor! *)
PROCEDURE TextAppend(text, append: PChar; position: PInteger); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Find first text occurrence within a string *)
PROCEDURE TextFindIndex(text, find: PChar): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get upper case version of provided string *)
PROCEDURE TextToUpper(text: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get lower case version of provided string *)
PROCEDURE TextToLower(text: PChar):PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get Pascal case notation version of provided string *)
PROCEDURE TextToPascal(text: PChar): PChar; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get integer value from text (negative values not supported) *)
PROCEDURE TextToInteger(text: PChar): SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* Basic 3d Shapes Drawing Functions (Module: models) *)
(* ------------------------------------------------------------------------------------ *)

(* Basic geometric 3D shapes drawing functions *)

(* Draw a line in 3D world space *)
PROCEDURE DrawLine3D(startPos, endPos: TVector3; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a point in 3D space, actually a small line *)
PROCEDURE DrawPoint3D(position: TVector3; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a circle in 3D world space *)
PROCEDURE DrawCircle3D(center: TVector3; radius: FLOAT32; rotationAxis: TVector3; rotationAngle: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a color-filled triangle (vertex in counter-clockwise order!) *)
PROCEDURE DrawTriangle3D(v1, v2, v3: TVector3; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a triangle strip defined by points *)
PROCEDURE DrawTriangleStrip3D(points: PVector3; pointCount: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw cube *)
PROCEDURE DrawCube(position: TVector3; width, height, length: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw cube (Vector version) *)
PROCEDURE DrawCubeV(position, size: TVector3; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw cube wires *)
PROCEDURE DrawCubeWires(position: TVector3; width, height, length: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw cube wires (Vector version) *)
PROCEDURE DrawCubeWiresV(position, size: TVector3; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw cube textured *)
PROCEDURE DrawCubeTexture(texture: TTexture2D; position: TVector3; width, height, length: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw cube with a region of a texture *)
PROCEDURE DrawCubeTextureRec(texture: TTexture2D; source: TRectangle; position: TVector3; width, height, length: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw sphere *)
PROCEDURE DrawSphere(centerPos: TVector3; radius: FLOAT32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw sphere with extended parameters *)
PROCEDURE DrawSphereEx(centerPos: TVector3; radius: FLOAT32; rings, slices: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw sphere wires *)
PROCEDURE DrawSphereWires(centerPos: TVector3; radius: FLOAT32; rings, slices: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a cylinder/cone *)
PROCEDURE DrawCylinder(position: TVector3; radiusTop, radiusBottom, height: FLOAT32; slices: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a cylinder with base at startPos and top at endPos *)
PROCEDURE DrawCylinderEx(startPos, endPos: TVector3; startRadius, endRadius: FLOAT32; sides: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a cylinder/cone wires *)
PROCEDURE DrawCylinderWires(position: TVector3; radiusTop, radiusBottom, height: FLOAT32; slices: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a cylinder wires with base at startPos and top at endPos *)
PROCEDURE DrawCylinderWiresEx(startPos, endPos: TVector3; startRadius, endRadius: FLOAT32; sides: SIGNED32; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a plane XZ *)
PROCEDURE DrawPlane(centerPos: TVector3; size: TVector2; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a ray line *)
PROCEDURE DrawRay(ray: TRay; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a grid (centered at (0, 0, 0)) *)
PROCEDURE DrawGrid(slices: SIGNED32; spacing: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* TModel 3d Loading and Drawing Functions (Module: models) *)
(* ------------------------------------------------------------------------------------ *)

(* Model management functions *)

(* Load model from files (meshes and materials) *)
PROCEDURE LoadModel(fileName: PChar): TModel; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load model from generated mesh (default material) *)
PROCEDURE LoadModelFromMesh(mesh: TMesh): TModel; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload model (including meshes) from memory (RAM and/or VRAM) *)
PROCEDURE UnloadModel(model: TModel); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload model (but not meshes) from memory (RAM and/or VRAM) *)
PROCEDURE UnloadModelKeepMeshes(model: TModel); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Compute model bounding box limits (considers all meshes) *)
PROCEDURE GetModelBoundingBox(model: TModel): TBoundingBox; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Model drawing functions *)

(* Draw a model (with texture if set) *)
PROCEDURE DrawModel(model: TModel; position: TVector3; scale: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a model with extended parameters *)
PROCEDURE DrawModelEx(model: TModel; position, rotationAxis: TVector3; rotationAngle: FLOAT32; scale: TVector3; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a model wires (with texture if set) *)
PROCEDURE DrawModelWires(model: TModel; position: TVector3; scale: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a model wires (with texture if set) with extended parameters *)
PROCEDURE DrawModelWiresEx(model: TModel; position, rotationAxis: TVector3; rotationAngle: FLOAT32; scale: TVector3; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw bounding box (wires) *)
PROCEDURE DrawBoundingBox(box: TBoundingBox; color: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a billboard texture *)
PROCEDURE DrawBillboard(camera: TCamera; texture: TTexture2D; position: TVector3; size: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a billboard texture defined by source *)
PROCEDURE DrawBillboardRec(camera: TCamera; texture: TTexture2D; source: TRectangle; position: TVector3; size: TVector2; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a billboard texture defined by source and rotation *)
PROCEDURE DrawBillboardPro(camera: TCamera; texture: TTexture2D; source: TRectangle; position, up: TVector3; size, origin: TVector2; rotation: FLOAT32; tint: TColorB); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Mesh management functions *)

(* Upload mesh vertex data in GPU and provide VAO/VBO ids *)
PROCEDURE UploadMesh(mesh: PMesh; _dynamic: BOOLEAN); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Update mesh vertex data in GPU for a specific buffer index *)
PROCEDURE UpdateMeshBuffer(mesh: TMesh; index: SIGNED32; CONST data: ANY; dataSize, offset: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload mesh data from CPU and GPU *)
PROCEDURE UnloadMesh(mesh: TMesh); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw a 3d mesh with material and transform *)
PROCEDURE DrawMesh(mesh: TMesh; material: TMaterial; transform: TMatrix); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Draw multiple mesh instances with material and different transforms *)
PROCEDURE DrawMeshInstanced(mesh: TMesh; material: TMaterial;CONST transforms: PMatrix; instances: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Export mesh data to file, returns true on success *)
PROCEDURE ExportMesh(mesh: TMesh; fileName: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Compute mesh bounding box limits *)
PROCEDURE GetMeshBoundingBox(mesh: TMesh): TBoundingBox; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Compute mesh tangents *)
PROCEDURE GenMeshTangents(mesh: PMesh); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Mesh generation functions *)

(* Generate polygonal mesh *)
PROCEDURE GenMeshPoly(sides: SIGNED32; radius: FLOAT32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate plane mesh (with subdivisions) *)
PROCEDURE GenMeshPlane(width, length: FLOAT32; resX, resZ: SIGNED32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate cuboid mesh *)
PROCEDURE GenMeshCube(width, height, length: FLOAT32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate sphere mesh (standard sphere) *)
PROCEDURE GenMeshSphere(radius: FLOAT32; rings, slices: SIGNED32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate half-sphere mesh (no bottom cap) *)
PROCEDURE GenMeshHemiSphere(radius: FLOAT32; rings, slices: SIGNED32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate cylinder mesh *)
PROCEDURE GenMeshCylinder(radius, height: FLOAT32; slices: SIGNED32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate cone/pyramid mesh *)
PROCEDURE GenMeshCone(radius, height: FLOAT32; slices: SIGNED32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate torus mesh *)
PROCEDURE GenMeshTorus(radius, size: FLOAT32; radSeg, sides: SIGNED32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate trefoil knot mesh *)
PROCEDURE GenMeshKnot(radius, size: FLOAT32; radSeg, sides: SIGNED32): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate heightmap mesh from image data *)
PROCEDURE GenMeshHeightmap(heightmap: TImage; size: TVector3): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Generate cubes-based map mesh from image data *)
PROCEDURE GenMeshCubicmap(cubicmap: TImage; cubeSize: TVector3): TMesh; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Material loading/unloading functions *)

(* Load materials from model file *)
PROCEDURE LoadMaterials(fileName: PChar; materialCount: PInteger): PMaterial; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps) *)
PROCEDURE LoadMaterialDefault: TMaterial; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload material from GPU memory (VRAM) *)
PROCEDURE UnloadMaterial(material: TMaterial); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...) *)
PROCEDURE SetMaterialTexture(material: PMaterial; mapType: SIGNED32; texture: TTexture2D); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set material for a mesh *)
PROCEDURE SetModelMeshMaterial(model: PModel; meshId, materialId: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Model animations loading/unloading functions *)

(* Load model animations from file *)
PROCEDURE LoadModelAnimations(fileName: PChar; animCount: PLongWord): PModelAnimation; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Update model animation pose *)
PROCEDURE UpdateModelAnimation(model: TModel; anim: TModelAnimation; frame: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload animation data *)
PROCEDURE UnloadModelAnimation(anim: TModelAnimation); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload animation array data *)
PROCEDURE UnloadModelAnimations(animations: PModelAnimation; count: LongWord); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check model animation skeleton match *)
PROCEDURE IsModelAnimationValid(model: TModel; anim: TModelAnimation): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Collision detection functions *)

(* Check collision between two spheres *)
PROCEDURE CheckCollisionSpheres(center1: TVector3; radius1: FLOAT32; center2: TVector3; radius2: FLOAT32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check collision between two bounding boxes *)
PROCEDURE CheckCollisionBoxes(box1, box2: TBoundingBox): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check collision between box and sphere *)
PROCEDURE CheckCollisionBoxSphere(box: TBoundingBox; center: TVector3; radius: FLOAT32): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get collision info between ray and sphere *)
PROCEDURE GetRayCollisionSphere(ray:TRay; center: TVector3; radius: FLOAT32): TRayCollision; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get collision info between ray and box *)
PROCEDURE GetRayCollisionBox(ray: TRay; box: TBoundingBox): TRayCollision; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get collision info between ray and mesh *)
PROCEDURE GetRayCollisionMesh(ray: TRay; mesh: TMesh; transform: TMatrix): TRayCollision; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get collision info between ray and triangle *)
PROCEDURE GetRayCollisionTriangle(ray: TRay; p1, p2, p3: TVector3): TRayCollision; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get collision info between ray and quad *)
PROCEDURE GetRayCollisionQuad(ray: TRay; p1, p2, p3, p4: TVector3): TRayCollision; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* ------------------------------------------------------------------------------------ *)
(* Audio Loading and Playing Functions (Module: audio) *)
(* ------------------------------------------------------------------------------------ *)
TYPE
PAudioCallback = POINTER TO TAudioCallback;
TAudioCallback = PROCEDURE (bufferData: ANY; frames: LongWord); cdecl;

(* Audio device management functions *)

(* Initialize audio device and context *)
PROCEDURE InitAudioDevice; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Close the audio device and context *)
PROCEDURE CloseAudioDevice; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if audio device has been initialized successfully *)
PROCEDURE IsAudioDeviceReady: BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set master volume (listener) *)
PROCEDURE SetMasterVolume(volume: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Wave/Sound loading/unloading functions *)

(* Load wave data from file *)
PROCEDURE LoadWave(fileName: PChar): TWave; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load wave from memory buffer, fileType refers to extension: i.e. '.wav' *)
PROCEDURE LoadWaveFromMemory(fileType: PChar; fileData: ANY; dataSize: SIGNED32): TWave; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load sound from file *)
PROCEDURE LoadSound(fileName: PChar): TSound; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load sound from wave data *)
PROCEDURE LoadSoundFromWave(wave: TWave): TSound; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Update sound buffer with new data *)
PROCEDURE UpdateSound(sound: TSound; data: ANY; sampleCount: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload wave data *)
PROCEDURE UnloadWave(wave: TWave); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload sound *)
PROCEDURE UnloadSound(sound: TSound); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Export wave data to file, returns true on success *)
PROCEDURE ExportWave(wave: TWave; fileName: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Export wave sample data to code (.h), returns true on success *)
PROCEDURE ExportWaveAsCode(wave: TWave; fileName: PChar): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Wave/Sound management functions *)

(* Play a sound *)
PROCEDURE PlaySound(sound: TSound); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Stop playing a sound *)
PROCEDURE StopSound(sound: TSound); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Pause a sound *)
PROCEDURE PauseSound(sound: TSound); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Resume a paused sound *)
PROCEDURE ResumeSound(sound: TSound); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Play a sound (using multichannel buffer pool) *)
PROCEDURE PlaySoundMulti(sound: TSound); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Stop any sound playing (using multichannel buffer pool) *)
PROCEDURE StopSoundMulti; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get number of sounds playing in the multichannel *)
PROCEDURE GetSoundsPlaying: SIGNED32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if a sound is currently playing *)
PROCEDURE IsSoundPlaying(sound: TSound): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set volume for a sound (1.0 is max level) *)
PROCEDURE SetSoundVolume(sound: TSound; volume: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set pitch for a sound (1.0 is base level) *)
PROCEDURE SetSoundPitch(sound: TSound; pitch: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set pan for a sound (0.5 is center) *)
PROCEDURE SetSoundPan(sound: TSound; pan: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Copy a wave to a new wave *)
PROCEDURE WaveCopy(wave: TWave): TWave; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Crop a wave to defined samples range *)
PROCEDURE WaveCrop(wave: PWave; initSample, finalSample: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Convert wave data to desired format *)
PROCEDURE WaveFormat(wave: PWave; sampleRate, sampleSize, channels: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load samples data from wave as a floats array *)
PROCEDURE LoadWaveSamples(wave: TWave): PSingle; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload samples data loaded with LoadWaveSamples() *)
PROCEDURE UnloadWaveSamples(samples: PSingle); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Music management functions *)

(* Load music stream from file *)
PROCEDURE LoadMusicStream(fileName: PChar): TMusic; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Load music stream from data *)
PROCEDURE LoadMusicStreamFromMemory(fileType: PChar; CONST data: ANY; dataSize: SIGNED32): TMusic; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload music stream *)
PROCEDURE UnloadMusicStream(music: TMusic); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Start music playing *)
PROCEDURE PlayMusicStream(music: TMusic); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if music is playing *)
PROCEDURE IsMusicStreamPlaying(music: TMusic): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Updates buffers for music streaming *)
PROCEDURE UpdateMusicStream(music: TMusic); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Stop music playing *)
PROCEDURE StopMusicStream(music: TMusic); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Pause music playing *)
PROCEDURE PauseMusicStream(music: TMusic); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Resume playing paused music *)
PROCEDURE ResumeMusicStream(music: TMusic); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Seek music to a position (in seconds) *)
PROCEDURE SeekMusicStream(music: TMusic; position: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set volume for music (1.0 is max level) *)
PROCEDURE SetMusicVolume(music: TMusic; volume: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set pitch for a music (1.0 is base level) *)
PROCEDURE SetMusicPitch(music: TMusic; pitch: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set pan for a music (0.5 = center) *)
PROCEDURE SetMusicPan(music: TMusic; pan: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get music time length (in seconds) *)
PROCEDURE GetMusicTimeLength(music: TMusic): FLOAT32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Get current music time played (in seconds) *)
PROCEDURE GetMusicTimePlayed(music: TMusic): FLOAT32; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* AudioStream management functions *)

(* Load audio stream (to stream raw audio pcm data) *)
PROCEDURE LoadAudioStream(sampleRate, sampleSize, channels: LongWord): TAudioStream; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Unload audio stream and free memory *)
PROCEDURE UnloadAudioStream(stream: TAudioStream); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Update audio stream buffers with data *)
PROCEDURE UpdateAudioStream(stream: TAudioStream; data: ANY; frameCount: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if any audio stream buffers requires refill *)
PROCEDURE IsAudioStreamProcessed(stream: TAudioStream): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Play audio stream *)
PROCEDURE PlayAudioStream(stream: TAudioStream); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Pause audio stream *)
PROCEDURE PauseAudioStream(stream: TAudioStream); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Resume audio stream *)
PROCEDURE ResumeAudioStream(stream: TAudioStream); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Check if audio stream is playing *)
PROCEDURE IsAudioStreamPlaying(stream: TAudioStream): BOOLEAN; cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Stop audio stream *)
PROCEDURE StopAudioStream(stream: TAudioStream); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set volume for audio stream (1.0 is max level) *)
PROCEDURE SetAudioStreamVolume(stream: TAudioStream; volume: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set pitch for audio stream (1.0 is base level) *)
PROCEDURE SetAudioStreamPitch(stream: TAudioStream; pitch: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Set pan for audio stream (0.5 is centered) *)
PROCEDURE SetAudioStreamPan(stream: TAudioStream; pan: FLOAT32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Default size for new audio streams *)
PROCEDURE SetAudioStreamBufferSizeDefault(size: SIGNED32); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Audio thread callback to request new data *)
PROCEDURE SetAudioStreamCallback(stream: TAudioStream; callback: TAudioCallback); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);

(* Attach audio stream processor to stream *)
PROCEDURE AttachAudioStreamProcessor(stream: TAudioStream; processor: TAudioCallback); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);
(* Detach audio stream processor from stream *)
PROCEDURE DetachAudioStreamProcessor(stream: TAudioStream; processor: TAudioCallback); cdecl; external (* $IFNDEF RAY_STATIC *)cDllName(* $ENDIF *);


(* Custom Misc Functions to help simplify a few things *)

PROCEDURE Vector2Create(aX: FLOAT32; aY: FLOAT32): TVector2;
PROCEDURE Vector2Set(aVec: PVector2; aX: FLOAT32; aY: FLOAT32);
PROCEDURE Vector3Create(aX: FLOAT32; aY: FLOAT32; aZ: FLOAT32): TVector3;
PROCEDURE Vector3Set(aVec: PVector3; aX: FLOAT32; aY: FLOAT32; aZ: FLOAT32);
PROCEDURE ColorCreate(aR: UNSIGNED8; aG: UNSIGNED8; aB: UNSIGNED8; aA: UNSIGNED8): TColorB;
PROCEDURE ColorSet(aColor: PColorB; aR: UNSIGNED8; aG: UNSIGNED8; aB: UNSIGNED8; aA: UNSIGNED8);

PROCEDURE RectangleCreate(aX: FLOAT32; aY: FLOAT32; aWidth: FLOAT32; aHeight: FLOAT32): TRectangle;
PROCEDURE RectangleSet(aRect: PRectangle; aX: FLOAT32; aY: FLOAT32; aWidth: FLOAT32; aHeight: FLOAT32);
PROCEDURE Camera3DCreate(aPosition, aTarget, aUp: TVector3; aFOVY: FLOAT32; aType: SIGNED32): TCamera3D;
PROCEDURE Camera3DSet(aCam: PCamera3D; aPosition, aTarget, aUp: TVector3; aFOVY: FLOAT32; aType: SIGNED32);

(* IMPLEMENTATION *)

(* $IFDEF linux *)
	(* $IFDEF RAY_STATIC *)
	(* $linklib c *)
	(* $linklib m *)
	(* $linklib dl *)
	(* $linklib pthread *)
	(* $linklib libraylib.a *)
	(* $endif *)
(* $endif *)



PROCEDURE Vector2Create(aX: FLOAT32; aY: FLOAT32): TVector2;
BEGIN
	Result.x := aX;
	Result.y := aY;
END;

PROCEDURE Vector2Set(aVec: PVector2; aX: FLOAT32; aY: FLOAT32);
BEGIN
	aVec^.x := aX;
	aVec^.y := aY;
END;

PROCEDURE Vector3Create(aX: FLOAT32; aY: FLOAT32; aZ: FLOAT32): TVector3;
BEGIN
	Result.x := aX;
	Result.y := aY;
	Result.z := aZ;
END;

PROCEDURE Vector3Set(aVec: PVector3; aX: FLOAT32; aY: FLOAT32; aZ: FLOAT32);
BEGIN
	aVec^.x := aX;
	aVec^.y := aY;
	aVec^.z := aZ;
END;

PROCEDURE ColorCreate(aR: UNSIGNED8; aG: UNSIGNED8; aB: UNSIGNED8; aA: UNSIGNED8): TColorB;
BEGIN
	Result.r := aR;
	Result.g := aG;
	Result.b := aB;
	Result.a := aA;
END;

PROCEDURE ColorSet(aColor: PColorB; aR: UNSIGNED8; aG: UNSIGNED8; aB: UNSIGNED8; aA: UNSIGNED8);
BEGIN
	aColor^.r := aR;
	aColor^.g := aG;
	aColor^.b := aB;
	aColor^.a := aA;
END;

PROCEDURE RectangleCreate(aX: FLOAT32; aY: FLOAT32; aWidth: FLOAT32; aHeight: FLOAT32): TRectangle;
BEGIN
	Result.x := aX;
	Result.y := aY;
	Result.Width := aWidth;
	Result.Height := aHeight;
END;

PROCEDURE RectangleSet(aRect: PRectangle; aX: FLOAT32; aY: FLOAT32; aWidth: FLOAT32; aHeight: FLOAT32);
BEGIN
	aRect^.x := aX;
	aRect^.y := aY;
	aRect^.Width := aWidth;
	aRect^.Height := aHeight;
END;

PROCEDURE Camera3DCreate(aPosition, aTarget, aUp: TVector3; aFOVY: FLOAT32; aType: SIGNED32): TCamera3D;
BEGIN
	Result.position := aPosition;
	Result.target := aTarget;
	Result.up := aUp;
	Result.fovy := aFOVY;
	Result.projection := aType;
END;

PROCEDURE Camera3DSet(aCam: PCamera3D; aPosition, aTarget, aUp: TVector3; aFOVY: FLOAT32; aType: SIGNED32);
BEGIN
	aCam^.position := aPosition;
	aCam^.target := aTarget;
	aCam^.up := aUp;
	aCam^.fovy := aFOVY;
	aCam^.projection := aType;
END;


BEGIN

END.
