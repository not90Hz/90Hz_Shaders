Shader "90Hz/VFX v0.3"
{
	Properties 
	{ 
		[HideInInspector] shader_is_using_thry_editor("", Float)=0
		[HideInInspector] shader_master_label("<color=#8100FF><b>90Hz VFX Shader v0.3</b></color>", Float) = 0
		[Helpbox]_WarnBox("This Shader is not Optimized for VR!", Float) = 0
		[HideInInspector] m_start_shader("Shader Settings --{is_hideable:true}", Float) = 0
			[HideInInspector] m_start_distance("Distance Settings --{is_hideable:true}", Float) = 0
				[KeywordEnum(On,Off)] _UseDistanceFade("Use Distance Fade", Float) = 0
				_Distance("Distance", Float) = 0
				_Falloff("Falloff", Float) = 0
			[HideInInspector] m_end_distance("Distance Settings", Float) = 0
			[HideInInspector] m_start_zoom("Zoom Settings --{is_hideable:true}", Float) = 0
				_Zoom("Zoom", Float) = 0
			[HideInInspector] m_end_zoom("Zoom Settings", Float) = 0
			[HideInInspector] m_start_screenshake("Screenshake Settings --{is_hideable:true}", Float) = 0
				_ScreenshakeStrength("Screenshake Strength", Range(0 , 1)) = 0
				_AmplitudeX("AmplitudeX", Float) = 0
				_SpeedX("SpeedX", Float) = 0
				_AmplitudeY("AmplitudeY", Float) = 0
				_SpeedY("SpeedY", Float) = 0
			[HideInInspector] m_end_screenshake("Screenshake Settings", Float) = 0
			[HideInInspector] m_start_rotation("Rotation Settings --{is_hideable:true}", Float) = 0
				_RotationStrength("Rotation Strength", Float) = 0
				_RotationSpeed("Rotation Speed", Float) = 0
			[HideInInspector] m_end_rotation("Rotation Settings", Float) = 0
			[HideInInspector] m_start_blur("Blur Settings --{is_hideable:true}", Float) = 0
				_LerpBlur("Lerp Blur", Range(0 , 1)) = 0
				[KeywordEnum(Horizontal,Radial)] _Blur("Blur", Float) = 0
				_BlurDistance("Blur Distance", Float) = 0
			[HideInInspector] m_end_blur("Blur Settings", Float) = 0
			[HideInInspector] m_start_bars("Bars Settings --{is_hideable:true}", Float) = 0
				[KeywordEnum(Off,On)] _BarsOriginalScreenPosition("Bars Original Screen Position", Float) = 0
				[KeywordEnum(Triangle,Box)] _BarTypes("Bar Types", Float) = 0
				_BarsStrength("Bars Strength", Range(0 , 1)) = 0
				_BarsSmoothness("Bars Smoothness", Range(0.5 , 1)) = 0.5
				_BarsWidth("Bars Width", Range(-41.1 , 100)) = 100
				_BarsHeight("Bars Height", Range(-41.1 , 100)) = 100
				_BarsOffset("Bars Offset", Vector) = (0,0,0,0)
			[HideInInspector] m_end_screenshake("Bars Settings", Float) = 0
			[HideInInspector] m_start_distortion("Distortion Settings --{is_hideable:true}", Float) = 0
				_DistortionStrength("Distortion Strength", Range(0 , 1)) = 0
				_DistortionScale("Distortion Scale", Float) = 0
				_DistortionSpeedXY("Distortion Speed XY", Vector) = (0,0,0,0)
			[HideInInspector] m_end_distortion("Distortion Settings", Float) = 0
			[HideInInspector] m_start_wave("Wave Settings --{is_hideable:true}", Float) = 0
				_LerpWave("Lerp Wave", Range(0 , 1)) = 0
				_WaveXAmplitude("Wave X Amplitude", Float) = 0
				_WaveXFrequency("Wave X Frequency", Float) = 0
				_WaveXSpeed("Wave X Speed", Float) = 0
				_WaveYAmplitude("Wave Y Amplitude", Float) = 0
				_WaveYFrequency("Wave Y Frequency", Float) = 0
				_WaveYSpeed("Wave Y Speed", Float) = 0
			[HideInInspector] m_end_wave("Wave Settings", Float) = 0
			[HideInInspector] m_start_color("Color Settings --{is_hideable:true}", Float) = 0
				_LerpGrayscale("Lerp Grayscale", Range(0 , 1)) = 0
				_LerpHue("Lerp Hue", Range(0 , 1)) = 0
				[KeywordEnum(Simple,Lines)] _HueTypes("Hue Types", Float) = 0
				_HueSaturation("Hue Saturation", Float) = 0
				_HueValue("Hue Value", Float) = 0
				_HueSpeed("Hue Speed", Float) = 0
			[HideInInspector] m_end_color("Color Settings", Float) = 0
			[HideInInspector] m_start_overlaytex("Overlay Texture Settings --{is_hideable:true}", Float) = 0
				_LerpOverlayTex("Lerp OverlayTex", Range(0 , 1)) = 0
				_OverlayTexColor("OverlayTex Color", Color) = (1,1,1,0)
				[NoScaleOffset][SingleLineTexture]_OverlayTex("OverlayTex", 2D) = "white" {}
				_OverlayTexStrength("OverlayTex Strength", Range(-1 , 1)) = 1
				[KeywordEnum(On,Off)] _OverlayTexOriginalScreenPosition("OverlayTex Original Screen Position", Float) = 0
				_OverlayTexTilingX("OverlayTex Tiling X", Float) = 0
				_OverlayTexTilingY("OverlayTex Tiling Y", Float) = 0
				_OverlayTexOffsetX("OverlayTex Offset X", Float) = 0
				_OverlayTexOffsetY("OverlayTex Offset Y", Float) = 0
			[HideInInspector] m_end_overlaytex("Overlay Texture Settings", Float) = 0
			[HideInInspector] m_start_dither("Dither Settings --{is_hideable:true}", Float) = 0
				_LerpDither("Lerp Dither", Range(0 , 1)) = 0
			[HideInInspector] m_end_dither("Dither Settings", Float) = 0
		[HideInInspector] m_end_shader("Shader Settings", Float) = 0

		[HideInInspector] footer_discord("{texture:{name:DiscordIcon,height:32},action:{type:URL,data:https://discord.gg/8TtTX8kWwe},hover:My Discord Server}", Float) = 0

		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Overlay"  "Queue" = "Overlay+28767" "ForceNoShadowCasting" = "True" }
		Cull Off
		ZTest Always
		GrabPass{ }
		GrabPass{ "_Screen" }
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma shader_feature _BARTYPES_TRIANGLE _BARTYPES_BOX
		#pragma shader_feature _BARSORIGINALSCREENPOSITION_OFF _BARSORIGINALSCREENPOSITION_ON
		#pragma shader_feature _BLUR_HORIZONTAL _BLUR_RADIAL
		#pragma shader_feature _HUETYPES_SIMPLE _HUETYPES_LINES
		#pragma shader_feature _OVERLAYTEXORIGINALSCREENPOSITION_ON _OVERLAYTEXORIGINALSCREENPOSITION_OFF
		#pragma shader_feature _USEDISTANCEFADE_ON _USEDISTANCEFADE_OFF
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float4 screenPosition;
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

		ASE_DECLARE_SCREENSPACE_TEXTURE( _Screen )
		uniform float _WaveXFrequency;
		uniform float _WaveXSpeed;
		uniform float _WaveXAmplitude;
		uniform float _WaveYFrequency;
		uniform float _WaveYSpeed;
		uniform float _WaveYAmplitude;
		uniform float _LerpWave;
		uniform float2 _DistortionSpeedXY;
		uniform float _DistortionScale;
		uniform float _DistortionStrength;
		uniform float _RotationStrength;
		uniform float _RotationSpeed;
		uniform float _Zoom;
		uniform float _AmplitudeX;
		uniform float _SpeedX;
		uniform float _AmplitudeY;
		uniform float _SpeedY;
		uniform float _ScreenshakeStrength;
		uniform float2 _BarsOffset;
		uniform float _BarsStrength;
		uniform float _BarsWidth;
		uniform float _BarsHeight;
		uniform float _BarsSmoothness;
		uniform float _BlurDistance;
		uniform float _LerpBlur;
		uniform float _HueSpeed;
		uniform float _HueSaturation;
		uniform float _HueValue;
		uniform float _LerpHue;
		uniform float _LerpGrayscale;
		uniform float _LerpDither;
		uniform sampler2D _OverlayTex;
		uniform float _OverlayTexTilingX;
		uniform float _OverlayTexTilingY;
		uniform float _OverlayTexOffsetX;
		uniform float _OverlayTexOffsetY;
		uniform float4 _OverlayTexColor;
		uniform float _OverlayTexStrength;
		uniform float _LerpOverlayTex;
		uniform float _Distance;
		uniform float _Falloff;


		inline float4 ASE_ComputeGrabScreenPos( float4 pos )
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
			return o;
		}


		float2 UnityGradientNoiseDir( float2 p )
		{
			p = fmod(p , 289);
			float x = fmod((34 * p.x + 1) * p.x , 289) + p.y;
			x = fmod( (34 * x + 1) * x , 289);
			x = frac( x / 41 ) * 2 - 1;
			return normalize( float2(x - floor(x + 0.5 ), abs( x ) - 0.5 ) );
		}
		
		float UnityGradientNoise( float2 UV, float Scale )
		{
			float2 p = UV * Scale;
			float2 ip = floor( p );
			float2 fp = frac( p );
			float d00 = dot( UnityGradientNoiseDir( ip ), fp );
			float d01 = dot( UnityGradientNoiseDir( ip + float2( 0, 1 ) ), fp - float2( 0, 1 ) );
			float d10 = dot( UnityGradientNoiseDir( ip + float2( 1, 0 ) ), fp - float2( 1, 0 ) );
			float d11 = dot( UnityGradientNoiseDir( ip + float2( 1, 1 ) ), fp - float2( 1, 1 ) );
			fp = fp * fp * fp * ( fp * ( fp * 6 - 15 ) + 10 );
			return lerp( lerp( d00, d01, fp.y ), lerp( d10, d11, fp.y ), fp.x ) + 0.5;
		}


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		inline float Dither8x8Bayer( int x, int y )
		{
			const float dither[ 64 ] = {
				 1, 49, 13, 61,  4, 52, 16, 64,
				33, 17, 45, 29, 36, 20, 48, 32,
				 9, 57,  5, 53, 12, 60,  8, 56,
				41, 25, 37, 21, 44, 28, 40, 24,
				 3, 51, 15, 63,  2, 50, 14, 62,
				35, 19, 47, 31, 34, 18, 46, 30,
				11, 59,  7, 55, 10, 58,  6, 54,
				43, 27, 39, 23, 42, 26, 38, 22};
			int r = y * 8 + x;
			return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 ase_screenPos = ComputeScreenPos( UnityObjectToClipPos( v.vertex ) );
			o.screenPosition = ase_screenPos;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float4 ase_screenPos = i.screenPosition;
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 screenColor155 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,ase_grabScreenPos.xy/ase_grabScreenPos.w);
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float3 break3_g263 = ase_grabScreenPosNorm.xyz;
			float mulTime4_g263 = _Time.y * _WaveXSpeed;
			float3 appendResult11_g263 = (float3(break3_g263.x , ( break3_g263.y + ( sin( ( ( break3_g263.x * _WaveXFrequency ) + mulTime4_g263 ) ) * ( _WaveXAmplitude * 0.01 ) ) ) , break3_g263.z));
			float3 break5_g262 = ase_grabScreenPosNorm.xyz;
			float mulTime6_g262 = _Time.y * _WaveYSpeed;
			float3 appendResult1_g262 = (float3(( break5_g262.x + ( sin( ( ( break5_g262.y * _WaveYFrequency ) + mulTime6_g262 ) ) * ( 0.01 * _WaveYAmplitude ) ) ) , break5_g262.y , break5_g262.z));
			float3 lerpResult412 = lerp( appendResult11_g263 , appendResult1_g262 , 0.5);
			float4 lerpResult421 = lerp( ase_grabScreenPosNorm , float4( lerpResult412 , 0.0 ) , _LerpWave);
			float mulTime395 = _Time.y * ( _DistortionSpeedXY.x * 0.1 );
			float mulTime396 = _Time.y * ( _DistortionSpeedXY.y * 0.1 );
			float2 appendResult393 = (float2(mulTime395 , mulTime396));
			float gradientNoise388 = UnityGradientNoise((lerpResult421*1.0 + float4( appendResult393, 0.0 , 0.0 )).xy,( _DistortionScale * 0.1 ));
			float4 temp_cast_5 = (gradientNoise388).xxxx;
			float4 lerpResult390 = lerp( lerpResult421 , temp_cast_5 , _DistortionStrength);
			float2 temp_cast_7 = (0.5).xx;
			float mulTime179 = _Time.y * _RotationSpeed;
			float cos177 = cos( ( ( _RotationStrength * 0.01 ) * ( _RotationSpeed == 0.0 ? 1.0 : sin( mulTime179 ) ) ) );
			float sin177 = sin( ( ( _RotationStrength * 0.01 ) * ( _RotationSpeed == 0.0 ? 1.0 : sin( mulTime179 ) ) ) );
			float2 rotator177 = mul( lerpResult390.xy - temp_cast_7 , float2x2( cos177 , -sin177 , sin177 , cos177 )) + temp_cast_7;
			float temp_output_112_0 = ( ( _Zoom + 10.0 ) * 0.1 );
			float mulTime96 = _Time.y * _SpeedX;
			float mulTime102 = _Time.y * _SpeedY;
			float2 appendResult88 = (float2(( ( _AmplitudeX * 0.01 ) * sin( mulTime96 ) ) , ( ( _AmplitudeY * 0.01 ) * sin( mulTime102 ) )));
			float2 ScreenPos26 = (rotator177*temp_output_112_0 + ( ( ( 1.0 - temp_output_112_0 ) * 0.5 ) + ( appendResult88 * _ScreenshakeStrength ) ));
			#if defined(_BARSORIGINALSCREENPOSITION_OFF)
				float4 staticSwitch342 = float4( ScreenPos26, 0.0 , 0.0 );
			#elif defined(_BARSORIGINALSCREENPOSITION_ON)
				float4 staticSwitch342 = ase_grabScreenPosNorm;
			#else
				float4 staticSwitch342 = float4( ScreenPos26, 0.0 , 0.0 );
			#endif
			float2 temp_cast_10 = (0.0).xx;
			#if defined(_BARTYPES_TRIANGLE)
				float staticSwitch345 = ( _BarsOffset.y + -1.0 );
			#elif defined(_BARTYPES_BOX)
				float staticSwitch345 = _BarsOffset.y;
			#else
				float staticSwitch345 = ( _BarsOffset.y + -1.0 );
			#endif
			float2 appendResult328 = (float2(( ( _BarsOffset.x * -1.0 ) * 0.1 ) , ( ( staticSwitch345 * -1.0 ) * 0.1 )));
			float2 lerpResult353 = lerp( temp_cast_10 , appendResult328 , _BarsStrength);
			float4 temp_output_326_0 = ( staticSwitch342 + float4( lerpResult353, 0.0 , 0.0 ) );
			float lerpResult84 = lerp( 1.41 , ( ( _BarsWidth + 41.1 ) * 0.01 ) , _BarsStrength);
			float lerpResult361 = lerp( 4.0 , 3.0 , _BarsStrength);
			float temp_output_2_0_g277 = lerpResult361;
			float cosSides1_g277 = cos( ( UNITY_PI / temp_output_2_0_g277 ) );
			float lerpResult86 = lerp( 1.41 , ( ( 41.1 + _BarsHeight ) * 0.01 ) , _BarsStrength);
			float2 appendResult28_g277 = (float2(( lerpResult84 * cosSides1_g277 ) , ( lerpResult86 * cosSides1_g277 )));
			float2 break47_g277 = ( (temp_output_326_0.xy*2.0 + -1.0) / appendResult28_g277 );
			float polarCoords11_g277 = atan2( break47_g277.x , -break47_g277.y );
			float temp_output_24_0_g277 = ( 6.28318548202515 / temp_output_2_0_g277 );
			float2 appendResult3_g277 = (float2(break47_g277.x , -break47_g277.y));
			float2 finalUVs7_g277 = appendResult3_g277;
			float temp_output_37_0_g277 = ( cos( ( ( floor( ( 0.5 + ( polarCoords11_g277 / temp_output_24_0_g277 ) ) ) * temp_output_24_0_g277 ) - polarCoords11_g277 ) ) * length( finalUVs7_g277 ) );
			float temp_output_48_0_g277 = ( 1.0 - temp_output_37_0_g277 );
			float lerpResult51_g277 = lerp( ( temp_output_48_0_g277 / fwidth( temp_output_37_0_g277 ) ) , temp_output_48_0_g277 , _BarsSmoothness);
			float temp_output_2_0_g278 = 4.0;
			float cosSides1_g278 = cos( ( UNITY_PI / temp_output_2_0_g278 ) );
			float2 appendResult28_g278 = (float2(( lerpResult84 * cosSides1_g278 ) , ( lerpResult86 * cosSides1_g278 )));
			float2 break47_g278 = ( (temp_output_326_0.xy*2.0 + -1.0) / appendResult28_g278 );
			float polarCoords11_g278 = atan2( break47_g278.x , -break47_g278.y );
			float temp_output_24_0_g278 = ( 6.28318548202515 / temp_output_2_0_g278 );
			float2 appendResult3_g278 = (float2(break47_g278.x , -break47_g278.y));
			float2 finalUVs7_g278 = appendResult3_g278;
			float temp_output_37_0_g278 = ( cos( ( ( floor( ( 0.5 + ( polarCoords11_g278 / temp_output_24_0_g278 ) ) ) * temp_output_24_0_g278 ) - polarCoords11_g278 ) ) * length( finalUVs7_g278 ) );
			float temp_output_48_0_g278 = ( 1.0 - temp_output_37_0_g278 );
			float lerpResult51_g278 = lerp( ( temp_output_48_0_g278 / fwidth( temp_output_37_0_g278 ) ) , temp_output_48_0_g278 , _BarsSmoothness);
			#if defined(_BARTYPES_TRIANGLE)
				float staticSwitch121 = saturate( lerpResult51_g277 );
			#elif defined(_BARTYPES_BOX)
				float staticSwitch121 = saturate( lerpResult51_g278 );
			#else
				float staticSwitch121 = saturate( lerpResult51_g277 );
			#endif
			float Box231 = staticSwitch121;
			float2 temp_cast_16 = (12.0).xx;
			float BDistance252 = ( ( _BlurDistance * _LerpBlur ) * 0.1 );
			float temp_output_596_0 = ( BDistance252 * 0.005 );
			float2 appendResult4 = (float2(temp_output_596_0 , 0.0));
			float2 BlurX1428 = appendResult4;
			float temp_output_7_0_g372 = ( ( ( 1.0 - ( 1.0 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch453 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_16 * BlurX1428 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch453 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g372 + ( ( 1.0 - temp_output_7_0_g372 ) * 0.5 ));
			#else
				float4 staticSwitch453 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_16 * BlurX1428 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor316 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch453.xy);
			float2 temp_cast_21 = (10.0).xx;
			float temp_output_7_0_g373 = ( ( ( 1.0 - ( 1.5 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch450 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_21 * BlurX1428 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch450 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g373 + ( ( 1.0 - temp_output_7_0_g373 ) * 0.5 ));
			#else
				float4 staticSwitch450 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_21 * BlurX1428 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor293 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch450.xy);
			float2 temp_cast_26 = (8.0).xx;
			float temp_output_7_0_g371 = ( ( ( 1.0 - ( 2.0 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch447 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_26 * BlurX1428 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch447 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g371 + ( ( 1.0 - temp_output_7_0_g371 ) * 0.5 ));
			#else
				float4 staticSwitch447 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_26 * BlurX1428 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor266 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch447.xy);
			float2 temp_cast_31 = (6.0).xx;
			float temp_output_7_0_g365 = ( ( ( 1.0 - ( 2.5 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch444 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_31 * BlurX1428 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch444 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g365 + ( ( 1.0 - temp_output_7_0_g365 ) * 0.5 ));
			#else
				float4 staticSwitch444 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_31 * BlurX1428 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor263 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch444.xy);
			float2 temp_cast_36 = (4.0).xx;
			float temp_output_7_0_g364 = ( ( ( 1.0 - ( 3.0 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch441 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_36 * BlurX1428 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch441 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g364 + ( ( 1.0 - temp_output_7_0_g364 ) * 0.5 ));
			#else
				float4 staticSwitch441 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_36 * BlurX1428 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor289 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch441.xy);
			float2 temp_cast_41 = (2.0).xx;
			float temp_output_7_0_g376 = ( ( ( 1.0 - ( 3.5 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch433 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_41 * BlurX1428 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch433 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g376 + ( ( 1.0 - temp_output_7_0_g376 ) * 0.5 ));
			#else
				float4 staticSwitch433 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_41 * BlurX1428 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor308 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch433.xy);
			float temp_output_7_0_g387 = ( ( ( 1.0 - ( 4.0 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch235 = float4( ScreenPos26, 0.0 , 0.0 );
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch235 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g387 + ( ( 1.0 - temp_output_7_0_g387 ) * 0.5 ));
			#else
				float4 staticSwitch235 = float4( ScreenPos26, 0.0 , 0.0 );
			#endif
			float4 screenColor1 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch235.xy);
			float2 temp_cast_50 = (2.0).xx;
			float2 appendResult5 = (float2(( temp_output_596_0 * -1.0 ) , 0.0));
			float2 BlurX2429 = appendResult5;
			float temp_output_7_0_g367 = ( ( ( 1.0 - ( 4.5 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch456 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_50 * BlurX2429 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch456 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g367 + ( ( 1.0 - temp_output_7_0_g367 ) * 0.5 ));
			#else
				float4 staticSwitch456 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_50 * BlurX2429 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor319 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch456.xy);
			float2 temp_cast_55 = (4.0).xx;
			float temp_output_7_0_g363 = ( ( ( 1.0 - ( 5.0 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch459 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_55 * BlurX2429 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch459 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g363 + ( ( 1.0 - temp_output_7_0_g363 ) * 0.5 ));
			#else
				float4 staticSwitch459 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_55 * BlurX2429 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor295 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch459.xy);
			float2 temp_cast_60 = (6.0).xx;
			float temp_output_7_0_g368 = ( ( ( 1.0 - ( 5.5 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch462 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_60 * BlurX2429 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch462 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g368 + ( ( 1.0 - temp_output_7_0_g368 ) * 0.5 ));
			#else
				float4 staticSwitch462 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_60 * BlurX2429 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor307 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch462.xy);
			float2 temp_cast_65 = (8.0).xx;
			float temp_output_7_0_g382 = ( ( ( 1.0 - ( 6.0 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch465 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_65 * BlurX2429 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch465 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g382 + ( ( 1.0 - temp_output_7_0_g382 ) * 0.5 ));
			#else
				float4 staticSwitch465 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_65 * BlurX2429 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor258 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch465.xy);
			float2 temp_cast_70 = (10.0).xx;
			float temp_output_7_0_g375 = ( ( ( 1.0 - ( 6.5 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch468 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_70 * BlurX2429 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch468 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g375 + ( ( 1.0 - temp_output_7_0_g375 ) * 0.5 ));
			#else
				float4 staticSwitch468 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_70 * BlurX2429 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor300 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch468.xy);
			float2 temp_cast_75 = (12.0).xx;
			float temp_output_7_0_g378 = ( ( ( 1.0 - ( 7.0 * BDistance252 ) ) + 9.0 ) * 0.1 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch471 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_75 * BlurX2429 ), 0.0 , 0.0 ));
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch471 = (float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g378 + ( ( 1.0 - temp_output_7_0_g378 ) * 0.5 ));
			#else
				float4 staticSwitch471 = (float4( ScreenPos26, 0.0 , 0.0 )*1.0 + float4( ( temp_cast_75 * BlurX2429 ), 0.0 , 0.0 ));
			#endif
			float4 screenColor305 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,staticSwitch471.xy);
			float4 Blurs236 = ( ( ( screenColor316 + screenColor293 + screenColor266 + screenColor263 + screenColor289 + screenColor308 ) + screenColor1 + ( screenColor319 + screenColor295 + screenColor307 + screenColor258 + screenColor300 + screenColor305 ) ) * 0.076 );
			float mulTime142 = _Time.y * _HueSpeed;
			float4 temp_cast_79 = (mulTime142).xxxx;
			float4 temp_cast_80 = (mulTime142).xxxx;
			#if defined(_HUETYPES_SIMPLE)
				float4 staticSwitch355 = temp_cast_79;
			#elif defined(_HUETYPES_LINES)
				float4 staticSwitch355 = ( ase_grabScreenPosNorm + mulTime142 );
			#else
				float4 staticSwitch355 = temp_cast_79;
			#endif
			float3 hsvTorgb134 = HSVToRGB( float3(staticSwitch355.x,( _HueSaturation * -1.0 ),_HueValue) );
			float3 Hue229 = hsvTorgb134;
			float4 lerpResult131 = lerp( Blurs236 , ( Blurs236 * float4( Hue229 , 0.0 ) ) , _LerpHue);
			float grayscale129 = Luminance(lerpResult131.rgb);
			float4 temp_cast_84 = (grayscale129).xxxx;
			float4 lerpResult128 = lerp( lerpResult131 , temp_cast_84 , _LerpGrayscale);
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 clipScreen374 = ase_screenPosNorm.xy * _ScreenParams.xy;
			float dither374 = Dither8x8Bayer( fmod(clipScreen374.x, 8), fmod(clipScreen374.y, 8) );
			dither374 = step( dither374, lerpResult128.r );
			float4 temp_cast_86 = (dither374).xxxx;
			float4 lerpResult378 = lerp( lerpResult128 , temp_cast_86 , _LerpDither);
			#if defined(_OVERLAYTEXORIGINALSCREENPOSITION_ON)
				float4 staticSwitch193 = ase_grabScreenPosNorm;
			#elif defined(_OVERLAYTEXORIGINALSCREENPOSITION_OFF)
				float4 staticSwitch193 = float4( ScreenPos26, 0.0 , 0.0 );
			#else
				float4 staticSwitch193 = ase_grabScreenPosNorm;
			#endif
			float2 appendResult195 = (float2(_OverlayTexTilingX , _OverlayTexTilingY));
			float2 appendResult196 = (float2(_OverlayTexOffsetX , _OverlayTexOffsetY));
			float4 OverlayTex226 = ( ( tex2D( _OverlayTex, (staticSwitch193*float4( appendResult195, 0.0 , 0.0 ) + float4( appendResult196, 0.0 , 0.0 )).xy ) * _OverlayTexColor ) * _OverlayTexStrength );
			float4 lerpResult213 = lerp( ( Box231 * lerpResult378 ) , ( Box231 * OverlayTex226 ) , _LerpOverlayTex);
			float3 objToWorld175 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
			float clampResult173 = clamp( pow( ( distance( objToWorld175 , _WorldSpaceCameraPos ) / _Distance ) , _Falloff ) , 0.0 , 1.0 );
			float DistanceFade224 = ( 1.0 - clampResult173 );
			#if defined(_USEDISTANCEFADE_ON)
				float staticSwitch362 = DistanceFade224;
			#elif defined(_USEDISTANCEFADE_OFF)
				float staticSwitch362 = 1.0;
			#else
				float staticSwitch362 = DistanceFade224;
			#endif
			float4 lerpResult156 = lerp( screenColor155 , lerpResult213 , staticSwitch362);
			c.rgb = lerpResult156.rgb;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ThryEditor"
}