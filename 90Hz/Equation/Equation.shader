Shader "90Hz/Equation v2.5"
{
	Properties
	{
		[HideInInspector] shader_is_using_thry_editor("", Float)=0
		[HideInInspector] shader_master_label("<color=#ff000d><b>90Hz Equation Shader v2.5</b></color>", Float) = 0
		[Helpbox]_WarnBox("This Shader is made by 90Hz | 2021.03.27", Float) = 0
		[HideInInspector] m_shader("Shader Settings", Float) = 0
		[HideInInspector] m_start_main("Main Options --{is_hideable:true}", Float) = 0
				_MainStrength("Main Strength", Range( -2 , 2)) = 1
				_MainColor("Main Color", Color) = (1,1,1,0)
				_MainTex("Main Texture", 2D) = "white" {}
				_LerpMainGrayscale("Lerp Main Grayscale", Range(0 , 1)) = 0
				_LerpMainTextureAlpha("Lerp Main Texture Alpha", Range( 0 , 1)) = 0
			[HideInInspector] m_start_maines("Main Extra Options --{is_hideable:true}", Float) = 0
					[HideInInspector] m_start_maineshue("Hue Settings --{is_hideable:true}", Float) = 0
						_LerpMainColorHue("Lerp Main Color Hue", Range( 0 , 1)) = 0
						_MainColorHueSaturation("Main Color Hue Saturation", Float) = 1
						_MainColorHueValue("Main Color Hue Value", Float) = 1
						_MainColorHueSpeed("Main Color Hue Speed", Vector) = (0,0,0,0)
						_LerpMainColorHueScreen("Lerp Main Color Hue Screen", Range( 0 , 1)) = 0
						[HideInInspector] m_start_maineshu("Hue Extra Settings --{is_hideable:true}", Float) = 0
							_LerpMainColorHueNoise("Lerp Main Color Hue Noise", Range( 0 , 1)) = 0
							_MainColorHueNoiseScale("Main Color Hue Noise Scale", Float) = 1
						[HideInInspector] m_end_maineshu("Hue Extra Settings", Float) = 0
					[HideInInspector] m_end_maineshue("Hue Settings", Float) = 0
					[HideInInspector] m_start_mainesdist("Distortion Settings --{is_hideable:true}", Float) = 0
						_LerpMainDistortion("Lerp Main Distortion", Range(0 , 1)) = 0
						_MainDistortionStrength("Main Distortion Strength", Float) = 0
						_MainDistortionX("Main Distortion X", Float) = 0
						_MainDistortionY("Main Distortion Y", Float) = 0
						_LerpMainDistortionSin("Lerp Main Distortion Sin", Range(0 , 1)) = 0
						_MainDistortionSinSpeed("Main Distortion Sin Speed", Float) = 0
					[HideInInspector] m_end_mainesdist("Distortion Settings", Float) = 0
					[HideInInspector] m_start_mainespix("Pixeleration Settings --{is_hideable:true}", Float) = 0
						_LerpMainPixeleration("Lerp Main Pixeleration", Range(0 , 1)) = 0
						_MainPixelSize("Main Pixel Size", Range(0,1)) = 1
					[HideInInspector] m_end_mainespix("Pixeleration Settings", Float) = 0
					[HideInInspector] m_start_mainesgl("Glitch Settings --{is_hideable:true}", Float) = 0
						_LerpMainGlitch("Lerp Main Glitch", Range(0 , 1)) = 0
						_MainGlitchStrength("Main Glitch Strength", Float) = 0
						_MainGlitchSpeed("Main Glitch Speed", Float) = 0
					[HideInInspector] m_end_mainesgl("Glitch Settings ", Float) = 0
			[HideInInspector] m_end_maines("Main Extra Options", Float) = 0
		[HideInInspector] m_end_main("Main Options", Float) = 0
		[HideInInspector] m_start_glitt("Glitter Settings --{is_hideable:true}", Float) = 0
			_LerpGlitter("Lerp Glitter", Range(0 , 1)) = 0
			_SparkleColor1("Glitter Color", Color) = (1,1,1,0)
		    _GlitterTexture("Glitter Texture", 2D) = "white" {}
			[NoScaleOffset]_GlitterNoise("Glitter Noise", 2D) = "white" {}
			_SparklesBrightness1("Glitter Brightness", Float) = 2
			_SparkleFresnel1("Glitter Fresnel Bias, Scale, Power", Vector) = (0,0,0,0)
			_GlitterScreenContribution("Glitter Screen Contribution", Range(0 , 1)) = 0.2
			_GlitterFrequency("Glitter Frequency", Range(0 , 100)) = 20
			_GlitterThreshold("Glitter Threshold", Range(0 , 1)) = 0.5
			_GlitterRange("Glitter Range", Range(0 , 1)) = 0
			_GlitterSpeed("Glitter Speed", Range(0 , 0.1)) = 0
		[HideInInspector] m_end_glitt("Glitter Settings", Float) = 0
		[HideInInspector] m_start_scline("Scanline Settings --{is_hideable:true}", Float) = 0
			_LerpScanline("Lerp Scanline", Range(0 , 1)) = 0
			_GlintColor1("Scanline Color", Color) = (0,0,0,0)
			_ScanlineTexture("Scanline Texture", 2D) = "white" {}
			_ScanlineBrightness("Scanline Brightness", Float) = 1
			_ScanlineSizeSpeedInterval("Scanline Size Speed Interval", Vector) = (1,1,1,0)
			[KeywordEnum(X,Y,Z)] _ScanlineDirection("Scanline Direction", Float) = 1
			[Toggle(_SCANLINEINVERTDIRECTION_ON)] _ScanlineInvertDirection("Scanline Invert Direction", Float) = 1
			_GlintFresnel1("Scanline Fresnel Bias, Scale, Power", Vector) = (0,0,0,0)
			_ScanlineTailHeadFalloff("Scanline Tail Head Falloff", Range(0 , 1)) = 0.5
		[HideInInspector] m_end_scline("Scanline Settings", Float) = 0
		[HideInInspector] m_start_matcap("MatCap Settings --{is_hideable:true}", Float) = 0
			_LerpMatCap("Lerp MatCap", Range(0 , 1)) = 0
			_MatCapColor("MatCap Color", Color) = (1,1,1,0)
			_MatCapTexture("MatCap Texture", 2D) = "white" {}
			_MatCapRotation("MatCap Rotation", Range(-100 , 100)) = 0
		[HideInInspector] m_end_matcap("MatCap Settings", Float) = 0	
		[HideInInspector] m_start_paral("Parallax Settings --{is_hideable:true}", Float) = 0
			_LerpParallax("Lerp Parallax", Range(0 , 1)) = 0
			_ParallaxColor1("Parallax Color 1", Color) = (1,1,1,0)
			[NoScaleOffset]_ParallaxTexture1("Parallax Texture 1", 2D) = "white" {}
			_LerpParallaxTextureAlpha1("Lerp Parallax Texture Alpha 1", Range(0 , 1)) = 0
			_ParallaxScale1("Parallax Scale 1", Float) = 0
			_ParallaxOffset1("Parallax Offset 1", Float) = 0
			_LerpParallax2("Lerp Parallax 2", Range(0 , 1)) = 0
			[NoScaleOffset]_ParallaxTexture2("Parallax Texture 2", 2D) = "white" {}
			_ParallaxColor2("Parallax Color 2", Color) = (1,1,1,0)
			_LerpParallaxTextureAlpha2("Lerp Parallax Texture Alpha 2", Range(0 , 1)) = 0
			_ParallaxScale2("Parallax Scale 2", Float) = 0
			_ParallaxOffset2("Parallax Offset 2", Float) = 0
		[HideInInspector] m_end_paral("Parallax Settings", Float) = 0
		[HideInInspector] m_start_rim("RimLight Settings --{is_hideable:true}", Float) = 0
			_LerpRimlight("Lerp Rimlight", Range(-1 , 1)) = 0
			_RimlightPower("Rimlight Power", Range(0 , 15)) = 3.83
			_RimlightColor("Rimlight Color", Color) = (1,1,1,0)
			_RimlightTexture("Rimlight Texture", 2D) = "white" {}
			_RimlightTilingX("Rimlight Tiling X", Float) = 1
			_RimlightTilingY("Rimlight Tiling Y", Float) = 1
			_RimlightSpeedX("Rimlight Speed X", Float) = 0
			_RimlightSpeedY("Rimlight Speed Y", Float) = 0
			_LerpRimlightUVScreenPos("Lerp Rimlight UV ScreenPos", Range(0 , 1)) = 0
			_LerpRimlightScreenPosToObject("Lerp Rimlight ScreenPos To Object", Range(0 , 1)) = 0
		[HideInInspector] m_end_rim("RimLight Settings", Float) = 0
		[HideInInspector] m_start_meta("Metallic Options --{is_hideable:true}", Float) = 0
			_LerpMetallicSettings("Lerp Metallic Settings", Range(0 , 1)) = 0
			[HideInInspector] m_start_metal("Metallic Settings --{is_hideable:true}", Float) = 0
				_MetallicTexture("Metallic Texture", 2D) = "white" {}
				_LerpMetallicTexAlpha("Lerp Metallic Tex Alpha", Range(0 , 1)) = 0
				_MetallicStrength("Metallic Strength", Range(-2 , 2)) = 0
			[HideInInspector] m_end_metal("Metallic Settings", Float) = 0
			[HideInInspector] m_start_smoth("Smoothness Settings --{is_hideable:true}", Float) = 0
				_SmoothnessTexture("Smoothness Texture", 2D) = "white" {}
				_LerpSmoothnessTexAlpha("Lerp Smoothness Tex Alpha", Range(0 , 1)) = 0
				_SmoothnessStrength("Smoothness Strength", Range(-2 , 2)) = 0
			[HideInInspector] m_end_smoth("Smoothness Settings", Float) = 0
			[HideInInspector] m_start_occ("Occlusion Settings --{is_hideable:true}", Float) = 0
				_OcclusionTexture("Occlusion Texture", 2D) = "white" {}
				_LerpOcclussionTexAlpha("Lerp Occlussion Tex Alpha", Range(0 , 1)) = 0
				_OcclusionStrength("Occlusion Strength", Range(-2 , 2)) = 0
			[HideInInspector] m_end_occ("Occlusion Settings", Float) = 0
		[HideInInspector] m_end_meta("Metallic Settings", Float) = 0
		[HideInInspector] m_start_emiss("Emission Settings --{is_hideable:true}", Float) = 0
				_EmissionStrength("Emission Strength", Range( -2 , 2)) = 0
				_EmissionColor("Emission Color", Color) = (1,1,1,0)
				[NoScaleOffset]_EmissionTex("Emission Texture", 2D) = "white" {}
				_LerpEmissionGrayscale("Lerp Emission Grayscale", Range(0 , 1)) = 0
				_LerpEmissionTextureAlpha("Lerp Emission Texture Alpha", Range( 0 , 1)) = 0
				_LerpEmissionOverlay("Lerp Emission Overlay", Range(0, 1)) = 0
				[KeywordEnum(Overlay, OverlayToObject)] _EmissionOverlayRendering("Emission Overlay Rendering", Float) = 0
				_EmissionTiling("Emission Tiling", Vector) = (1,1,0,0)
				_EmissionOffset("Emission Offset", Vector) = (0,0,0,0)
				_LerpEmissionSin("Lerp Emission Sin ", Range(0, 1)) = 0
				_EmissionSpeed("Emission Speed", Vector) = (0,0,0,0)
				_EmissionRotator("Emission Rotator", Range( -100 , 100)) = 0
				_LerpEmissionAutoRotate("Lerp Emission Auto Rotate", Range( 0 , 1)) = 0
				_EmissionRotatorAmplitude("Emission Rotator Amplitude", Float) = 0
				_EmissionRotatorAutoSpeed("Emission Rotator Auto Speed", Float) = 1
			[HideInInspector] m_start_emisseo("Emission Extra Options --{is_hideable:true}", Float) = 0
					[HideInInspector] m_start_emisseou("Hue Settings --{is_hideable:true}", Float) = 0
						_LerpEmissionColorHue("Lerp Emission Color Hue", Range( 0 , 1)) = 0
						_EmissionColorHueSaturation("Emission Color Hue Saturation", Float) = 1
						_EmissionColorHueValue("Emission Color Hue Value", Float) = 1
						_EmissionColorHueSpeed("Emission Color Hue Speed", Vector) = (0,0,0,0)
						_LerpEmissionColorHueScreen("Lerp Emission Color Hue Screen", Range( 0 , 1)) = 0
						[HideInInspector] m_start_emisseoe("Hue Extra Settings --{is_hideable:true}", Float) = 0
							_LerpEmissionColorHueNoise("Lerp Emission Color Hue Noise", Range( 0 , 1)) = 0
							_EmissionColorHueNoiseScale("Emission Color Hue Noise Scale", Float) = 1
						[HideInInspector] m_end_emisseoe("Hue Extra Settings", Float) = 0
					[HideInInspector] m_end_emisseou("Hue Settings", Float) = 0
					[HideInInspector] m_start_emisseodist("Distortion Settings --{is_hideable:true}", Float) = 0
						_LerpEmissionDistortion("Lerp Emission Distortion", Range(0 , 1)) = 0
						_EmissionDistortionStrength("Emission Distortion Strength", Float) = 0
						_EmissionDistortionTilingX("Emission Distortion Tiling X", Float) = 0
						_EmissionDistortionTilingY("Emission Distortion Tiling Y", Float) = 0
						_LerpEmissionDistortionSin("Lerp Emission Distortion Sin", Range(0 , 1)) = 0
						_EmissionDistortionSinSpeed("Emission Distortion Sin Speed", Float) = 0
					[HideInInspector] m_end_emisseodist("Distortion Settings", Float) = 0
					[HideInInspector] m_start_emisseopix("Pixeleration Settings --{is_hideable:true}", Float) = 0
						_LerpEmissionPixeleration("Lerp Emission Pixeleration", Range(0, 1)) = 0
						_EmissionPixelSize("Emission Pixel Size", Float) = 1
					[HideInInspector] m_end_emisseopix("Pixeleration Settings", Float) = 0
					[HideInInspector] m_start_emisseogl("Glitch Settings --{is_hideable:true}", Float) = 0
						_LerpEmissionGlitch("Lerp Emission Glitch", Range(0, 1)) = 0
						_EmissionGlitchStrength("Emission Glitch Strength", Float) = 0
						_EmissionGlitchSpeed("Emission Glitch Speed", Float) = 0
					[HideInInspector] m_end_emisseogl("Glitch Settings", Float) = 0
			[HideInInspector] m_end_emisseo("Emission Extra Options", Float) = 0
			[HideInInspector] m_start_emisswa("Emission Wave Options --{is_hideable:true}", Float) = 0
				_LerpEmissionWave("Lerp Emission Wave", Range( 0 , 1)) = 0
				_EmissionWaveMax("Emission Wave Max", Float) = 0
				_EmissionWaveMin("Emission Wave Min", Float) = 0
				_EmissionChangeSpeed("Emission Change Speed", Float) = 0
			[HideInInspector] m_end_emisswa("Emission Wave Options", Float) = 0
			[HideInInspector] m_start_emissts("Emission Texture Sheet Options --{is_hideable:true}", Float) = 0
				_LerpEmissionTexturesheet("Lerp Emission Texturesheet", Range( 0 , 1)) = 0
				_Columns("Columns", Float) = 1
				_Rows("Rows", Float) = 1
				_TexsheetSpeed("Texsheet Speed", Float) = 1
				_StartFrame("Start Frame", Float) = 1
				_TexsheetTime("Texsheet Time", Float) = 1
			[HideInInspector] m_end_emissts("Emission Wave Options", Float) = 0
		[HideInInspector] m_end_emiss("Emission Settings", Float) = 0
		[HideInInspector] m_start_CL("CustomLight Settings --{is_hideable:true}", Float) = 0
			_LerpCustomLightning("Lerp CustomLightning", Range(-1 , 1)) = 0
			_CustomLightRamp("CustomLight Ramp", 2D) = "white" {}
		[HideInInspector] m_end_CL("CustomLight Settings", Float) = 0
		[HideInInspector] m_start_outline("Outline Settings --{is_hideable:true}", Float) = 0
			_OutlineScale("Outline Scale", Float) = 0
			[HDR]_OutlineColor("Outline Color", Color) = (0,0,0,0)
			_LerpOutlineHue("Lerp Outline Hue", Range(0 , 1)) = 0
			_OutlineHueTilingX("Outline Hue Tiling X", Float) = 1
			_OutlineHueTilingY("Outline Hue Tiling Y", Float) = 1
			_OutlineHueSpeedX("Outline Hue Speed X", Float) = 0
			_OutlineHueSpeedY("Outline Hue Speed Y", Float) = 0
		[HideInInspector] m_end_outline("Outline Settings", Float) = 0
		[HideInInspector] m_start_render("Rendering Settings --{is_hideable:true}", Float) = 0
			_LerpScreenTexture("Lerp Screen Texture", Range(0 , 1)) = 0
			[IntRange]_Cull0Back1Front2Off("Cull 0 Back 1 Front 2 Off", Range(0 , 2)) = 0
			[Toggle]_ZWriteSettings("ZWrite Settings", Range(0 , 1)) = 1
			[IntRange]_ZTestSettings("ZTest Settings", Range(0 , 5)) = 4
		[HideInInspector] m_end_render("Rendering Settings", Float) = 0

		[HideInInspector] footer_discord("{texture:{name:DiscordIcon,height:32},action:{type:URL,data:https://discord.com/invite/ZvhnZ9F4Bs},hover:My Discord Server}", Float) = 0

		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0"}
		Cull Front
		CGPROGRAM
		#pragma target 3.0
		#pragma surface outlineSurf Outline nofog alpha:fade  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 

		void outlineVertexDataFunc(inout appdata_full v, out Input o)
		{
			UNITY_INITIALIZE_OUTPUT(Input, o);
			float outlineVar = (_OutlineScale * 0.001);
			v.vertex.xyz += (v.normal * outlineVar);
		}
		inline half4 LightingOutline(SurfaceOutput s, half3 lightDir, half atten) { return half4 (0,0,0, s.Alpha); }
		void outlineSurf(Input i, inout SurfaceOutput o)
		{
			float mulTime214 = _Time.y * _OutlineHueSpeedX;
			float mulTime215 = _Time.y * _OutlineHueSpeedY;
			float2 appendResult210 = (float2(mulTime214 , mulTime215));
			float2 appendResult217 = (float2(_OutlineHueTilingX , _OutlineHueTilingY));
			float3 hsvTorgb3_g8 = HSVToRGB(float3((((float2(0,0) + (i.uv_texcoord - float2(0,0)) * (float2(1,0) - float2(0,0)) / (float2(1,0) - float2(0,0))) + appendResult210) * appendResult217).x,1.0,1.0));
			float4 lerpResult204 = lerp(_OutlineColor , float4(hsvTorgb3_g8 , 0.0) , _LerpOutlineHue);
			o.Emission = lerpResult204.rgb;
			o.Alpha = (1.0 - _LerpScreenTexture);
		}
		ENDCG


		Tags{ "RenderType" = "Overlay"  "Queue" = "Overlay+28767" "IsEmissive" = "true"  }
		LOD 32767
		Cull[_Cull0Back1Front2Off]
		ZWrite[_ZWriteSettings]
		ZTest[_ZTestSettings]
		GrabPass{ "_Equation" }
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma shader_feature _EMISSIONOVERLAYRENDERING_OVERLAY _EMISSIONOVERLAYRENDERING_OVERLAYTOOBJECT
		#pragma shader_feature _SCANLINEINVERTDIRECTION_ON
		#pragma shader_feature _SCANLINEDIRECTION_X _SCANLINEDIRECTION_Y _SCANLINEDIRECTION_Z
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
			float4 screenPos;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float _MainDistortionX;
		uniform float _MainDistortionY;
		uniform float _MainDistortionStrength;
		uniform float _MainDistortionSinSpeed;
		uniform float _LerpMainDistortionSin;
		uniform float _LerpMainDistortion;
		uniform float _MainPixelSize;
		uniform float _LerpMainPixeleration;
		uniform float _LerpMainTextureAlpha;
		uniform float4 _MainColor;
		uniform float2 _MainColorHueSpeed;
		uniform float _LerpMainColorHueScreen;
		uniform float _MainColorHueNoiseScale;
		uniform float _LerpMainColorHueNoise;
		uniform float _MainColorHueSaturation;
		uniform float _MainColorHueValue;
		uniform float _LerpMainColorHue;
		uniform float _MainGlitchStrength;
		uniform float _MainGlitchSpeed;
		uniform float _LerpMainGlitch;
		uniform float _LerpMainGrayscale;
		uniform float _MainStrength;
		uniform float _Cull0Back1Front2Off;
		uniform sampler2D _EmissionTex;
		uniform float2 _EmissionTiling;
		uniform float _LerpEmissionOverlay;
		uniform float _LerpEmissionSin;
		uniform float2 _EmissionSpeed;
		uniform float2 _EmissionOffset;
		uniform float _Columns;
		uniform float _Rows;
		uniform float _TexsheetSpeed;
		uniform float _StartFrame;
		uniform float _TexsheetTime;
		uniform float _LerpEmissionTexturesheet;
		uniform float _EmissionRotator;
		uniform float _EmissionRotatorAutoSpeed;
		uniform float _EmissionRotatorAmplitude;
		uniform float _LerpEmissionAutoRotate;
		uniform float _EmissionDistortionTilingX;
		uniform float _EmissionDistortionTilingY;
		uniform float _EmissionDistortionStrength;
		uniform float _EmissionDistortionSinSpeed;
		uniform float _LerpEmissionDistortionSin;
		uniform float _LerpEmissionDistortion;
		uniform float _EmissionPixelSize;
		uniform float _LerpEmissionPixeleration;
		uniform float _EmissionGlitchStrength;
		uniform float _EmissionGlitchSpeed;
		uniform float _LerpEmissionGlitch;
		uniform float _LerpEmissionTextureAlpha;
		uniform float4 _EmissionColor;
		uniform float2 _EmissionColorHueSpeed;
		uniform float _LerpEmissionColorHueScreen;
		uniform float _EmissionColorHueNoiseScale;
		uniform float _LerpEmissionColorHueNoise;
		uniform float _EmissionColorHueSaturation;
		uniform float _EmissionColorHueValue;
		uniform float _LerpEmissionColorHue;
		uniform float _LerpEmissionGrayscale;
		uniform float _EmissionChangeSpeed;
		uniform float _EmissionWaveMax;
		uniform float _EmissionWaveMin;
		uniform float _LerpEmissionWave;
		uniform float _EmissionStrength;
		uniform sampler2D _CustomLightRamp;
		uniform float _LerpCustomLightning;
		uniform float4 _MatCapColor;
		uniform sampler2D _MatCapTexture;
		uniform float _MatCapRotation;
		uniform float _LerpMatCap;
		uniform float4 _GlintColor1;
		uniform sampler2D _ScanlineTexture;
		uniform float4 _ScanlineTexture_ST;
		uniform float3 _ScanlineSizeSpeedInterval;
		uniform float _ScanlineTailHeadFalloff;
		uniform float3 _GlintFresnel1;
		uniform float _ScanlineBrightness;
		uniform float _LerpScanline;
		uniform float4 _SparkleColor1;
		uniform sampler2D _GlitterTexture;
		uniform float4 _GlitterTexture_ST;
		uniform float _GlitterThreshold;
		uniform float _GlitterRange;
		uniform sampler2D _GlitterNoise;
		uniform float _GlitterScreenContribution;
		uniform float4 _GlitterNoise_ST;
		uniform float _GlitterFrequency;
		uniform float _GlitterSpeed;
		uniform float _SparklesBrightness1;
		uniform float3 _SparkleFresnel1;
		uniform float _LerpGlitter;
		uniform float4 _ParallaxColor1;
		uniform sampler2D _ParallaxTexture1;
		uniform float _ParallaxScale1;
		uniform float _ParallaxOffset1;
		uniform float _LerpParallaxTextureAlpha1;
		uniform float4 _ParallaxColor2;
		uniform sampler2D _ParallaxTexture2;
		uniform float _ParallaxScale2;
		uniform float _ParallaxOffset2;
		uniform float _LerpParallaxTextureAlpha2;
		uniform float _LerpParallax2;
		uniform float _LerpParallax;
		uniform float _ZTestSettings;
		uniform float _ZWriteSettings;
		uniform float _RimlightPower;
		uniform float4 _RimlightColor;
		uniform sampler2D _RimlightTexture;
		uniform float _RimlightTilingX;
		uniform float _RimlightTilingY;
		uniform float _LerpRimlightScreenPosToObject;
		uniform float _LerpRimlightUVScreenPos;
		uniform float _RimlightSpeedX;
		uniform float _RimlightSpeedY;
		uniform float _LerpRimlight;
		ASE_DECLARE_SCREENSPACE_TEXTURE(_Equation)
		uniform float _LerpScreenTexture;
		uniform float _MetallicStrength;
		uniform sampler2D _MetallicTexture;
		uniform float4 _MetallicTexture_ST;
		uniform float _LerpMetallicTexAlpha;
		uniform float _SmoothnessStrength;
		uniform sampler2D _SmoothnessTexture;
		uniform float4 _SmoothnessTexture_ST;
		uniform float _LerpSmoothnessTexAlpha;
		uniform float _OcclusionStrength;
		uniform sampler2D _OcclusionTexture;
		uniform float4 _OcclusionTexture_ST;
		uniform float _LerpOcclussionTexAlpha;
		uniform float _LerpMetallicSettings;
		uniform float4 _OutlineColor;
		uniform float _OutlineHueSpeedX;
		uniform float _OutlineHueSpeedY;
		uniform float _OutlineHueTilingX;
		uniform float _OutlineHueTilingY;
		uniform float _LerpOutlineHue;
		uniform float _OutlineScale;


		float3 mod2D289(float3 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }

		float2 mod2D289(float2 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }

		float3 permute(float3 x) { return mod2D289(((x * 34.0) + 1.0) * x); }

		float snoise(float2 v)
		{
			const float4 C = float4(0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439);
			float2 i = floor(v + dot(v, C.yy));
			float2 x0 = v - i + dot(i, C.xx);
			float2 i1;
			i1 = (x0.x > x0.y) ? float2(1.0, 0.0) : float2(0.0, 1.0);
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289(i);
			float3 p = permute(permute(i.y + float3(0.0, i1.y, 1.0)) + i.x + float3(0.0, i1.x, 1.0));
			float3 m = max(0.5 - float3(dot(x0, x0), dot(x12.xy, x12.xy), dot(x12.zw, x12.zw)), 0.0);
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac(p * C.www) - 1.0;
			float3 h = abs(x) - 0.5;
			float3 ox = floor(x + 0.5);
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * (a0 * a0 + h * h);
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot(m, g);
		}


		float3 HSVToRGB(float3 c)
		{
			float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
			float3 p = abs(frac(c.xxx + K.xyz) * 6.0 - K.www);
			return c.z * lerp(K.xxx, saturate(p - K.xxx), c.y);
		}


		inline float noise_randomValue(float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }

		inline float noise_interpolate(float a, float b, float t) { return (1.0 - t)*a + (t*b); }

		inline float valueNoise(float2 uv)
		{
			float2 i = floor(uv);
			float2 f = frac(uv);
			f = f * f * (3.0 - 2.0 * f);
			uv = abs(frac(uv) - 0.5);
			float2 c0 = i + float2(0.0, 0.0);
			float2 c1 = i + float2(1.0, 0.0);
			float2 c2 = i + float2(0.0, 1.0);
			float2 c3 = i + float2(1.0, 1.0);
			float r0 = noise_randomValue(c0);
			float r1 = noise_randomValue(c1);
			float r2 = noise_randomValue(c2);
			float r3 = noise_randomValue(c3);
			float bottomOfGrid = noise_interpolate(r0, r1, f.x);
			float topOfGrid = noise_interpolate(r2, r3, f.x);
			float t = noise_interpolate(bottomOfGrid, topOfGrid, f.y);
			return t;
		}


		float SimpleNoise(float2 UV)
		{
			float t = 0.0;
			float freq = pow(2.0, float(0));
			float amp = pow(0.5, float(3 - 0));
			t += valueNoise(UV / freq)*amp;
			freq = pow(2.0, float(1));
			amp = pow(0.5, float(3 - 1));
			t += valueNoise(UV / freq)*amp;
			freq = pow(2.0, float(2));
			amp = pow(0.5, float(3 - 2));
			t += valueNoise(UV / freq)*amp;
			return t;
		}


		inline float4 ASE_ComputeGrabScreenPos(float4 pos)
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = (pos.y - o.y) * _ProjectionParams.x * scale + o.y;
			return o;
		}


		void vertexDataFunc(inout appdata_full v, out Input o)
		{
			UNITY_INITIALIZE_OUTPUT(Input, o);
			v.vertex.xyz += 0;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustomLighting(inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi)
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float4 temp_cast_57 = (0.0).xxxx;
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float2 appendResult454 = (float2(_MainDistortionX , _MainDistortionY));
			float simplePerlin2D452 = snoise((appendResult454 * uv_MainTex));
			float mulTime458 = _Time.y * _MainDistortionSinSpeed;
			float lerpResult463 = lerp(_MainDistortionStrength , (_MainDistortionStrength * sin(mulTime458)) , _LerpMainDistortionSin);
			float2 lerpResult465 = lerp(uv_MainTex , (uv_MainTex + (simplePerlin2D452 * (lerpResult463 * 0.01))) , _LerpMainDistortion);
			float2 lerpResult696 = lerp((uv_MainTex * float2(0,0)) , (round((uv_MainTex / _MainPixelSize)) * _MainPixelSize) , _LerpMainPixeleration);
			float2 Mainuv527 = (lerpResult465 + lerpResult696);
			float4 tex2DNode131 = tex2D(_MainTex, Mainuv527);
			float4 temp_cast_58 = (tex2DNode131.a).xxxx;
			float4 lerpResult161 = lerp(tex2DNode131 , temp_cast_58 , _LerpMainTextureAlpha);
			float2 temp_output_154_0 = (_MainColorHueSpeed * _Time.y);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize(UnityWorldSpaceViewDir(ase_worldPos));
			float3 objToViewDir678 = mul(UNITY_MATRIX_IT_MV, float4(ase_worldViewDir, 0)).xyz;
			float3 Screenpos680 = (objToViewDir678 * -1.0);
			float3 lerpResult147 = lerp(float3(i.uv_texcoord ,  0.0) , Screenpos680 , _LerpMainColorHueScreen);
			float simplePerlin2D146 = snoise((float3(temp_output_154_0 ,  0.0) + lerpResult147).xy*_MainColorHueNoiseScale);
			simplePerlin2D146 = simplePerlin2D146 * 0.5 + 0.5;
			float2 temp_cast_62 = (simplePerlin2D146).xx;
			float2 lerpResult145 = lerp(temp_output_154_0 , temp_cast_62 , _LerpMainColorHueNoise);
			float3 hsvTorgb143 = HSVToRGB(float3(lerpResult145.x,_MainColorHueSaturation,_MainColorHueValue));
			float4 lerpResult141 = lerp(_MainColor , float4(hsvTorgb143 , 0.0) , _LerpMainColorHue);
			float mulTime521 = _Time.y * _MainGlitchSpeed;
			float temp_output_518_0 = ((_MainGlitchStrength * 0.01) * sin(mulTime521));
			float2 appendResult515 = (float2(temp_output_518_0 , 0.0));
			float2 appendResult516 = (float2((temp_output_518_0 * -1.0) , 0.0));
			float4 appendResult525 = (float4(tex2D(_MainTex, (Mainuv527 + appendResult515)).r , tex2D(_MainTex, (Mainuv527 + appendResult516)).g , tex2DNode131.b , tex2DNode131.a));
			float4 lerpResult523 = lerp(float4(0,0,0,0) , appendResult525 , _LerpMainGlitch);
			float4 MainGl504 = lerpResult523;
			float4 temp_output_502_0 = ((lerpResult161 * lerpResult141) + MainGl504);
			float grayscale201 = (temp_output_502_0.rgb.r + temp_output_502_0.rgb.g + temp_output_502_0.rgb.b) / 3;
			float4 temp_cast_66 = (grayscale201).xxxx;
			float4 lerpResult202 = lerp(temp_output_502_0 , temp_cast_66 , _LerpMainGrayscale);
			float4 temp_output_139_0 = (lerpResult202 * _MainStrength);
			float4 MainTex330 = temp_output_139_0;
			float3 ase_worldNormal = WorldNormalVector(i, float3(0, 0, 1));
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize(UnityWorldSpaceLightDir(ase_worldPos));
			#endif //aseld
			float dotResult484 = dot(ase_worldNormal , ase_worldlightDir);
			float2 temp_cast_67 = (saturate((dotResult484*0.5 + 0.5))).xx;
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			UnityGI gi487 = gi;
			float3 diffNorm487 = ase_worldNormal;
			gi487 = UnityGI_Base(data, 1, diffNorm487);
			float3 indirectDiffuse487 = gi487.indirect.diffuse + diffNorm487 * 0.0001;
			float4 CustLight494 = ((MainTex330 * tex2D(_CustomLightRamp, temp_cast_67)) * (ase_lightColor * float4((indirectDiffuse487 + float3(0,0,0)) , 0.0)));
			float4 lerpResult338 = lerp(temp_cast_57 , CustLight494 , _LerpCustomLightning);
			float4 CClight496 = lerpResult338;
			float3 temp_cast_69 = (0.0).xxx;
			SurfaceOutputStandard s354 = (SurfaceOutputStandard)0;
			s354.Albedo = float3(0,0,0);
			s354.Normal = ase_worldNormal;
			s354.Emission = float3(0,0,0);
			float2 uv_MetallicTexture = i.uv_texcoord * _MetallicTexture_ST.xy + _MetallicTexture_ST.zw;
			float4 tex2DNode356 = tex2D(_MetallicTexture, uv_MetallicTexture);
			float4 temp_cast_70 = (tex2DNode356.a).xxxx;
			float4 lerpResult357 = lerp(tex2DNode356 , temp_cast_70 , _LerpMetallicTexAlpha);
			s354.Metallic = ((_MetallicStrength * -1.0) * lerpResult357).r;
			float2 uv_SmoothnessTexture = i.uv_texcoord * _SmoothnessTexture_ST.xy + _SmoothnessTexture_ST.zw;
			float4 tex2DNode360 = tex2D(_SmoothnessTexture, uv_SmoothnessTexture);
			float4 temp_cast_72 = (tex2DNode360.a).xxxx;
			float4 lerpResult362 = lerp(tex2DNode360 , temp_cast_72 , _LerpSmoothnessTexAlpha);
			s354.Smoothness = (_SmoothnessStrength * lerpResult362).r;
			float2 uv_OcclusionTexture = i.uv_texcoord * _OcclusionTexture_ST.xy + _OcclusionTexture_ST.zw;
			float4 tex2DNode365 = tex2D(_OcclusionTexture, uv_OcclusionTexture);
			float4 temp_cast_74 = (tex2DNode365.a).xxxx;
			float4 lerpResult367 = lerp(tex2DNode365 , temp_cast_74 , _LerpOcclussionTexAlpha);
			s354.Occlusion = (_OcclusionStrength * lerpResult367).r;

			data.light = gi.light;

			UnityGI gi354 = gi;
			#ifdef UNITY_PASS_FORWARDBASE
			Unity_GlossyEnvironmentData g354 = UnityGlossyEnvironmentSetup(s354.Smoothness, data.worldViewDir, s354.Normal, float3(0,0,0));
			gi354 = UnityGlobalIllumination(data, s354.Occlusion, s354.Normal, g354);
			#endif

			float3 surfResult354 = LightingStandard(s354, viewDir, gi354).rgb;
			surfResult354 += s354.Emission;

			#ifdef UNITY_PASS_FORWARDADD//354
			surfResult354 -= s354.Emission;
			#endif//354
			float3 Metallicetc353 = surfResult354;
			float3 lerpResult350 = lerp(temp_cast_69 , Metallicetc353 , _LerpMetallicSettings);
			float4 ase_screenPos = float4(i.screenPos.xyz , i.screenPos.w + 0.00000000001);
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos(ase_screenPos);
			float4 screenColor413 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Equation,ase_grabScreenPos.xy / ase_grabScreenPos.w);
			float4 lerpResult415 = lerp((CClight496 + float4(lerpResult350 , 0.0)) , (0.0 * screenColor413) , _LerpScreenTexture);
			c.rgb = lerpResult415.rgb;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI(inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi)
		{
			s.GIData = data;
		}

		void surf(Input i , inout SurfaceOutputCustomLightingCustom o)
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float2 appendResult454 = (float2(_MainDistortionX , _MainDistortionY));
			float simplePerlin2D452 = snoise((appendResult454 * uv_MainTex));
			float mulTime458 = _Time.y * _MainDistortionSinSpeed;
			float lerpResult463 = lerp(_MainDistortionStrength , (_MainDistortionStrength * sin(mulTime458)) , _LerpMainDistortionSin);
			float2 lerpResult465 = lerp(uv_MainTex , (uv_MainTex + (simplePerlin2D452 * (lerpResult463 * 0.01))) , _LerpMainDistortion);
			float2 lerpResult696 = lerp((uv_MainTex * float2(0,0)) , (round((uv_MainTex / _MainPixelSize)) * _MainPixelSize) , _LerpMainPixeleration);
			float2 Mainuv527 = (lerpResult465 + lerpResult696);
			float4 tex2DNode131 = tex2D(_MainTex, Mainuv527);
			float4 temp_cast_0 = (tex2DNode131.a).xxxx;
			float4 lerpResult161 = lerp(tex2DNode131 , temp_cast_0 , _LerpMainTextureAlpha);
			float2 temp_output_154_0 = (_MainColorHueSpeed * _Time.y);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize(UnityWorldSpaceViewDir(ase_worldPos));
			float3 objToViewDir678 = mul(UNITY_MATRIX_IT_MV, float4(ase_worldViewDir, 0)).xyz;
			float3 Screenpos680 = (objToViewDir678 * -1.0);
			float3 lerpResult147 = lerp(float3(i.uv_texcoord ,  0.0) , Screenpos680 , _LerpMainColorHueScreen);
			float simplePerlin2D146 = snoise((float3(temp_output_154_0 ,  0.0) + lerpResult147).xy*_MainColorHueNoiseScale);
			simplePerlin2D146 = simplePerlin2D146 * 0.5 + 0.5;
			float2 temp_cast_4 = (simplePerlin2D146).xx;
			float2 lerpResult145 = lerp(temp_output_154_0 , temp_cast_4 , _LerpMainColorHueNoise);
			float3 hsvTorgb143 = HSVToRGB(float3(lerpResult145.x,_MainColorHueSaturation,_MainColorHueValue));
			float4 lerpResult141 = lerp(_MainColor , float4(hsvTorgb143 , 0.0) , _LerpMainColorHue);
			float mulTime521 = _Time.y * _MainGlitchSpeed;
			float temp_output_518_0 = ((_MainGlitchStrength * 0.01) * sin(mulTime521));
			float2 appendResult515 = (float2(temp_output_518_0 , 0.0));
			float2 appendResult516 = (float2((temp_output_518_0 * -1.0) , 0.0));
			float4 appendResult525 = (float4(tex2D(_MainTex, (Mainuv527 + appendResult515)).r , tex2D(_MainTex, (Mainuv527 + appendResult516)).g , tex2DNode131.b , tex2DNode131.a));
			float4 lerpResult523 = lerp(float4(0,0,0,0) , appendResult525 , _LerpMainGlitch);
			float4 MainGl504 = lerpResult523;
			float4 temp_output_502_0 = ((lerpResult161 * lerpResult141) + MainGl504);
			float grayscale201 = (temp_output_502_0.rgb.r + temp_output_502_0.rgb.g + temp_output_502_0.rgb.b) / 3;
			float4 temp_cast_8 = (grayscale201).xxxx;
			float4 lerpResult202 = lerp(temp_output_502_0 , temp_cast_8 , _LerpMainGrayscale);
			float4 temp_output_139_0 = (lerpResult202 * _MainStrength);
			float4 MainTex330 = temp_output_139_0;
			o.Albedo = MainTex330.rgb;
			float lerpResult1 = lerp(0.0 , _Cull0Back1Front2Off , 0.0);
			float2 temp_cast_10 = (0.0).xx;
			float3 ase_vertex3Pos = mul(unity_WorldToObject, float4(i.worldPos , 1));
			float4 unityObjectToClipPos3_g7 = UnityObjectToClipPos(ase_vertex3Pos);
			float4 computeScreenPos5_g7 = ComputeScreenPos(unityObjectToClipPos3_g7);
			float temp_output_20_0_g7 = 1.0;
			float4 unityObjectToClipPos4_g7 = UnityObjectToClipPos(float3(0,0,0));
			float4 computeScreenPos6_g7 = ComputeScreenPos(unityObjectToClipPos4_g7);
			float4 transform10_g7 = mul(unity_ObjectToWorld,float4(0,0,0,1));
			#if defined(_EMISSIONOVERLAYRENDERING_OVERLAY)
				float3 staticSwitch737 = Screenpos680;
			#elif defined(_EMISSIONOVERLAYRENDERING_OVERLAYTOOBJECT)
				float3 staticSwitch737 = float3((((((computeScreenPos5_g7 / (computeScreenPos5_g7).w) * temp_output_20_0_g7) - (temp_output_20_0_g7 * (computeScreenPos6_g7 / (computeScreenPos6_g7).w))) * length((float4(_WorldSpaceCameraPos , 0.0) - transform10_g7)))).xy ,  0.0);
			#else
				float3 staticSwitch737 = Screenpos680;
			#endif
			float3 lerpResult19 = lerp(float3(i.uv_texcoord ,  0.0) , staticSwitch737 , _LerpEmissionOverlay);
			float4 lerpResult26 = lerp(_Time , sin(_Time) , _LerpEmissionSin);
			float4 temp_output_16_0 = (float4(_EmissionTiling, 0.0 , 0.0) * (float4(lerpResult19 , 0.0) + ((lerpResult26 * float4(_EmissionSpeed, 0.0 , 0.0)) + float4(_EmissionOffset, 0.0 , 0.0))));
			float mulTime74 = _Time.y * _TexsheetTime;
			// *** BEGIN Flipbook UV Animation vars ***
			// Total tiles of Flipbook Texture
			float fbtotaltiles67 = _Columns * _Rows;
			// Offsets for cols and rows of Flipbook Texture
			float fbcolsoffset67 = 1.0f / _Columns;
			float fbrowsoffset67 = 1.0f / _Rows;
			// Speed of animation
			float fbspeed67 = mulTime74 * _TexsheetSpeed;
			// UV Tiling (col and row offset)
			float2 fbtiling67 = float2(fbcolsoffset67, fbrowsoffset67);
			// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
			// Calculate current tile linear index
			float fbcurrenttileindex67 = round(fmod(fbspeed67 + _StartFrame, fbtotaltiles67));
			fbcurrenttileindex67 += (fbcurrenttileindex67 < 0) ? fbtotaltiles67 : 0;
			// Obtain Offset X coordinate from current tile linear index
			float fblinearindextox67 = round(fmod(fbcurrenttileindex67, _Columns));
			// Multiply Offset X by coloffset
			float fboffsetx67 = fblinearindextox67 * fbcolsoffset67;
			// Obtain Offset Y coordinate from current tile linear index
			float fblinearindextoy67 = round(fmod((fbcurrenttileindex67 - fblinearindextox67) / _Columns, _Rows));
			// Reverse Y to get tiles from Top to Bottom
			fblinearindextoy67 = (int)(_Rows - 1) - fblinearindextoy67;
			// Multiply Offset Y by rowoffset
			float fboffsety67 = fblinearindextoy67 * fbrowsoffset67;
			// UV Offset
			float2 fboffset67 = float2(fboffsetx67, fboffsety67);
			// Flipbook UV
			half2 fbuv67 = temp_output_16_0.xy * fbtiling67 + fboffset67;
			// *** END Flipbook UV Animation vars ***
			float4 lerpResult70 = lerp(temp_output_16_0 , float4(fbuv67, 0.0 , 0.0) , _LerpEmissionTexturesheet);
			float2 temp_cast_25 = (0.5).xx;
			float temp_output_137_0 = (_EmissionRotator * 0.0628);
			float mulTime187 = _Time.y * _EmissionRotatorAutoSpeed;
			float lerpResult184 = lerp(temp_output_137_0 , (temp_output_137_0 * (sin(mulTime187) * _EmissionRotatorAmplitude)) , _LerpEmissionAutoRotate);
			float cos134 = cos(lerpResult184);
			float sin134 = sin(lerpResult184);
			float2 rotator134 = mul(lerpResult70.xy - temp_cast_25 , float2x2(cos134 , -sin134 , sin134 , cos134)) + temp_cast_25;
			float2 appendResult434 = (float2(_EmissionDistortionTilingX , _EmissionDistortionTilingY));
			float simplePerlin2D430 = snoise((appendResult434 * rotator134));
			float mulTime440 = _Time.y * _EmissionDistortionSinSpeed;
			float lerpResult439 = lerp(_EmissionDistortionStrength , (_EmissionDistortionStrength * sin(mulTime440)) , _LerpEmissionDistortionSin);
			float2 lerpResult432 = lerp(temp_cast_10 , (rotator134 + (simplePerlin2D430 * (lerpResult439 * 0.01))) , _LerpEmissionDistortion);
			float2 lerpResult708 = lerp((rotator134 * float2(0,0)) , (round((rotator134 / _EmissionPixelSize)) * _EmissionPixelSize) , _LerpEmissionPixeleration);
			float2 Emissionuv532 = (lerpResult432 + rotator134 + lerpResult708);
			float mulTime535 = _Time.y * _EmissionGlitchSpeed;
			float temp_output_538_0 = ((_EmissionGlitchStrength * 0.01) * sin(mulTime535));
			float2 appendResult542 = (float2(temp_output_538_0 , 0.0));
			float2 appendResult541 = (float2((temp_output_538_0 * -1.0) , 0.0));
			float4 tex2DNode5 = tex2D(_EmissionTex, Emissionuv532);
			float4 appendResult549 = (float4(tex2D(_EmissionTex, (Emissionuv532 + appendResult542)).r , tex2D(_EmissionTex, (Emissionuv532 + appendResult541)).g , tex2DNode5.b , tex2DNode5.a));
			float4 lerpResult550 = lerp(float4(0,0,0,0) , appendResult549 , _LerpEmissionGlitch);
			float4 EmGlitch552 = lerpResult550;
			float4 temp_cast_26 = (tex2DNode5.a).xxxx;
			float4 lerpResult56 = lerp(tex2DNode5 , temp_cast_26 , _LerpEmissionTextureAlpha);
			float2 temp_output_180_0 = (_EmissionColorHueSpeed * _Time.y);
			float3 lerpResult167 = lerp(float3(i.uv_texcoord ,  0.0) , Screenpos680 , _LerpEmissionColorHueScreen);
			float simpleNoise171 = SimpleNoise((lerpResult167 + float3(temp_output_180_0 ,  0.0)).xy*_EmissionColorHueNoiseScale);
			simpleNoise171 = simpleNoise171 * 2 - 1;
			float2 temp_cast_30 = (simpleNoise171).xx;
			float2 lerpResult172 = lerp(temp_output_180_0 , temp_cast_30 , _LerpEmissionColorHueNoise);
			float3 hsvTorgb175 = HSVToRGB(float3(lerpResult172.x,_EmissionColorHueSaturation,_EmissionColorHueValue));
			float4 lerpResult176 = lerp(_EmissionColor , float4(hsvTorgb175 , 0.0) , _LerpEmissionColorHue);
			float4 temp_output_531_0 = (EmGlitch552 + (lerpResult56 * lerpResult176));
			float grayscale199 = (temp_output_531_0.rgb.r + temp_output_531_0.rgb.g + temp_output_531_0.rgb.b) / 3;
			float4 temp_cast_34 = (grayscale199).xxxx;
			float4 lerpResult198 = lerp(temp_output_531_0 , temp_cast_34 , _LerpEmissionGrayscale);
			float mulTime53 = _Time.y * _EmissionChangeSpeed;
			float lerpResult58 = lerp(1.0 , (sin(mulTime53)*_EmissionWaveMax + (_EmissionWaveMax + _EmissionWaveMin)) , _LerpEmissionWave);
			float4 temp_cast_35 = (1.0).xxxx;
			float4 temp_cast_36 = (0.0).xxxx;
			float3 ase_worldNormal = WorldNormalVector(i, float3(0, 0, 1));
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize(UnityWorldSpaceLightDir(ase_worldPos));
			#endif //aseld
			float dotResult484 = dot(ase_worldNormal , ase_worldlightDir);
			float2 temp_cast_37 = (saturate((dotResult484*0.5 + 0.5))).xx;
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 CustLight494 = ((MainTex330 * tex2D(_CustomLightRamp, temp_cast_37)) * (ase_lightColor * float4((float3(0,0,0) + float3(0,0,0)) , 0.0)));
			float4 lerpResult338 = lerp(temp_cast_36 , CustLight494 , _LerpCustomLightning);
			float4 CClight496 = lerpResult338;
			float4 lerpResult500 = lerp(temp_cast_35 , CClight496 , _LerpCustomLightning);
			float4 temp_cast_39 = (0.0).xxxx;
			float cos419 = cos((_MatCapRotation * 0.06248));
			float sin419 = sin((_MatCapRotation * 0.06248));
			float2 rotator419 = mul(((mul(UNITY_MATRIX_V, float4(ase_worldNormal , 0.0)).xyz * 0.5) + 0.5).xy - float2(0.5,0.5) , float2x2(cos419 , -sin419 , sin419 , cos419)) + float2(0.5,0.5);
			float4 lerpResult337 = lerp(temp_cast_39 , (_MatCapColor * tex2D(_MatCapTexture, rotator419)) , _LerpMatCap);
			float2 uv_ScanlineTexture = i.uv_texcoord * _ScanlineTexture_ST.xy + _ScanlineTexture_ST.zw;
			#if defined(_SCANLINEDIRECTION_X)
				float staticSwitch583 = ase_vertex3Pos.x;
			#elif defined(_SCANLINEDIRECTION_Y)
				float staticSwitch583 = ase_vertex3Pos.y;
			#elif defined(_SCANLINEDIRECTION_Z)
				float staticSwitch583 = ase_vertex3Pos.z;
			#else
				float staticSwitch583 = ase_vertex3Pos.y;
			#endif
			#ifdef _SCANLINEINVERTDIRECTION_ON
				float staticSwitch558 = -staticSwitch583;
			#else
				float staticSwitch558 = staticSwitch583;
			#endif
			float temp_output_559_0 = (_ScanlineSizeSpeedInterval.x * _ScanlineSizeSpeedInterval.y);
			float mulTime554 = _Time.y * temp_output_559_0;
			float temp_output_569_0 = (fmod(((staticSwitch558 * _ScanlineSizeSpeedInterval.x) + mulTime554) , ((temp_output_559_0 + 1.0) * _ScanlineSizeSpeedInterval.z)) + (_ScanlineTailHeadFalloff - 1.0));
			float saferPower579 = max((1.0 - (saturate((temp_output_569_0 * (-1.0 / (1.0 - _ScanlineTailHeadFalloff)))) + saturate((temp_output_569_0 * (1.0 / _ScanlineTailHeadFalloff))))) , 0.0001);
			float fresnelNdotV567 = dot(half3(0,0,0), ase_worldViewDir);
			float fresnelNode567 = (_GlintFresnel1.x + _GlintFresnel1.y * pow(max(1.0 - fresnelNdotV567 , 0.0001), _GlintFresnel1.z));
			float4 lerpResult586 = lerp(float4(0,0,0,0) , ((_GlintColor1 * tex2D(_ScanlineTexture, uv_ScanlineTexture)) * pow(saferPower579 , 5.0) * fresnelNode567 * _ScanlineBrightness) , _LerpScanline);
			float4 Scanline584 = lerpResult586;
			float2 uv_GlitterTexture = i.uv_texcoord * _GlitterTexture_ST.xy + _GlitterTexture_ST.zw;
			float2 uv_GlitterNoise = i.uv_texcoord * _GlitterNoise_ST.xy + _GlitterNoise_ST.zw;
			float2 temp_output_603_0 = (uv_GlitterNoise * _GlitterFrequency);
			float mulTime589 = _Time.y * _GlitterSpeed;
			float smoothstepResult598 = smoothstep(_GlitterThreshold , (_GlitterThreshold + _GlitterRange) , (tex2D(_GlitterNoise, ((Screenpos680 * _GlitterScreenContribution) + float3(temp_output_603_0 ,  0.0) + mulTime589).xy).g * tex2D(_GlitterNoise, ((temp_output_603_0 * 1.1) + -mulTime589)).g));
			float fresnelNdotV596 = dot(half3(0,0,0), ase_worldViewDir);
			float fresnelNode596 = (_SparkleFresnel1.x + _SparkleFresnel1.y * pow(max(1.0 - fresnelNdotV596 , 0.0001), _SparkleFresnel1.z));
			float4 lerpResult616 = lerp(float4(0,0,0,0) , ((_SparkleColor1 * tex2D(_GlitterTexture, uv_GlitterTexture)) * smoothstepResult598 * _SparklesBrightness1 * fresnelNode596) , _LerpGlitter);
			float4 Glitter618 = lerpResult616;
			float4 temp_cast_45 = (0.0).xxxx;
			float3 ase_worldTangent = WorldNormalVector(i, float3(1, 0, 0));
			float3 ase_worldBitangent = WorldNormalVector(i, float3(0, 1, 0));
			float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
			float3 tangentTobjectDir686 = normalize(mul(unity_WorldToObject, float4(mul(ase_tangentToWorldFast, ase_worldViewDir), 0)).xyz);
			float2 Offset688 = ((0.0 - 1) * float3(0,0,0).xy * 0.0) + tangentTobjectDir686.xy;
			float4 tex2DNode385 = tex2D(_ParallaxTexture1, (Offset688*(_ParallaxScale1 * -1.0) + (_ParallaxOffset1 + 0.5)));
			float4 temp_cast_47 = (tex2DNode385.a).xxxx;
			float4 lerpResult387 = lerp(tex2DNode385 , temp_cast_47 , _LerpParallaxTextureAlpha1);
			float4 tex2DNode402 = tex2D(_ParallaxTexture2, (Offset688*(_ParallaxScale2 * -1.0) + (_ParallaxOffset2 + 0.5)));
			float4 temp_cast_49 = (tex2DNode402.a).xxxx;
			float4 lerpResult403 = lerp(tex2DNode402 , temp_cast_49 , _LerpParallaxTextureAlpha2);
			float4 lerpResult409 = lerp(float4(0,0,0,0) , (_ParallaxColor2 * lerpResult403) , _LerpParallax2);
			float4 lerpResult390 = lerp(temp_cast_45 , ((_ParallaxColor1 * lerpResult387) + lerpResult409) , _LerpParallax);
			float4 Parallax371 = lerpResult390;
			float lerpResult345 = lerp(0.0 , _ZTestSettings , 0.0);
			float lerpResult347 = lerp(0.0 , _ZWriteSettings , 0.0);
			float sett343 = (lerpResult345 + lerpResult347);
			float fresnelNdotV728 = dot(ase_worldNormal, ase_worldViewDir);
			float fresnelNode728 = (0.0 + 1.0 * pow(1.0 - fresnelNdotV728, (15.0 + (-1.0 * _RimlightPower))));
			float2 appendResult748 = (float2(_RimlightTilingX , _RimlightTilingY));
			float4 unityObjectToClipPos3_g9 = UnityObjectToClipPos(ase_vertex3Pos);
			float4 computeScreenPos5_g9 = ComputeScreenPos(unityObjectToClipPos3_g9);
			float temp_output_20_0_g9 = 1.0;
			float4 unityObjectToClipPos4_g9 = UnityObjectToClipPos(float3(0,0,0));
			float4 computeScreenPos6_g9 = ComputeScreenPos(unityObjectToClipPos4_g9);
			float4 transform10_g9 = mul(unity_ObjectToWorld,float4(0,0,0,1));
			float3 lerpResult741 = lerp(Screenpos680 , float3((((((computeScreenPos5_g9 / (computeScreenPos5_g9).w) * temp_output_20_0_g9) - (temp_output_20_0_g9 * (computeScreenPos6_g9 / (computeScreenPos6_g9).w))) * length((float4(_WorldSpaceCameraPos , 0.0) - transform10_g9)))).xy ,  0.0) , _LerpRimlightScreenPosToObject);
			float3 lerpResult744 = lerp(float3(i.uv_texcoord ,  0.0) , lerpResult741 , _LerpRimlightUVScreenPos);
			float mulTime753 = _Time.y * _RimlightSpeedX;
			float mulTime751 = _Time.y * _RimlightSpeedY;
			float2 appendResult752 = (float2(mulTime753 , mulTime751));
			float4 lerpResult334 = lerp(float4(0,0,0,0) , (fresnelNode728 * (_RimlightColor * tex2D(_RimlightTexture, (float3(appendResult748 ,  0.0) * (lerpResult744 + float3(appendResult752 ,  0.0))).xy))) , _LerpRimlight);
			float4 temp_output_341_0 = ((((lerpResult1 + (lerpResult198 * lerpResult58)) * _EmissionStrength) + (temp_output_139_0 * lerpResult500) + lerpResult337 + Scanline584 + Glitter618 + Parallax371) + sett343 + lerpResult334);
			float4 ase_screenPos = float4(i.screenPos.xyz , i.screenPos.w + 0.00000000001);
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos(ase_screenPos);
			float4 screenColor413 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Equation,ase_grabScreenPos.xy / ase_grabScreenPos.w);
			float4 lerpResult412 = lerp(temp_output_341_0 , (temp_output_341_0 * screenColor413) , _LerpScreenTexture);
			o.Emission = lerpResult412.rgb;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 screenPos : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert(appdata_full v)
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_OUTPUT(v2f, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				Input customInputData;
				vertexDataFunc(v, customInputData);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				half3 worldNormal = UnityObjectToWorldNormal(v.normal);
				half3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				o.screenPos = ComputeScreenPos(o.pos);
				return o;
			}
			half4 frag(v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT(Input, surfIN);
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
				half3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3(IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z);
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				surfIN.screenPos = IN.screenPos;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT(SurfaceOutputCustomLightingCustom, o)
				surf(surfIN, o);
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT(IN)
			}
			ENDCG
		}
	}
		Fallback "Diffuse"
		CustomEditor "ThryEditor"
}