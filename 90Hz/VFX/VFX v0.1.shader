Shader "90Hz/VFX v0.1"
{
	Properties 
	{ 
		[HideInInspector] shader_is_using_thry_editor("", Float)=0
		[HideInInspector] shader_master_label("<color=#8100FF><b>90Hz VFX Shader v0.1</b></color>", Float) = 0
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
				[KeywordEnum(Horizontal,Radial)] _Blur("Blur", Float) = 0
				_BlurDistance("BlurDistance", Float) = 0
				_BlurDistanceSpeed("BlurDistance Speed", Float) = 0
			[HideInInspector] m_end_blur("Blur Settings", Float) = 0
			[HideInInspector] m_start_bars("Bars Settings --{is_hideable:true}", Float) = 0
				[KeywordEnum(Off,On)] _BarsOriginalScreenPosition("Bars Original Screen Position", Float) = 0
				[KeywordEnum(Triangle,Box)] _BarTypes("Bar Types", Float) = 0
				_BarsStrength("Bars Strength", Range( 0 , 1)) = 0
				_BarsWidth("Bars Width", Range( -41 , 100)) = 100
				_BarsHeight("Bars Height", Range( -41 , 100)) = 100
				_BarsOffset("Bars Offset", Vector) = (0,0,0,0)
			[HideInInspector] m_end_screenshake("Bars Settings", Float) = 0
			[HideInInspector] m_start_color("Color Settings --{is_hideable:true}", Float) = 0
				_LerpGrayscale("Lerp Grayscale", Range( 0 , 1)) = 0
				_LerpHue("Lerp Hue", Range( 0 , 1)) = 0
				[KeywordEnum(Simple,Lines)] _HueTypes("Hue Types", Float) = 0
				_HueSaturation("Hue Saturation", Float) = 0
				_HueValue("Hue Value", Float) = 0
				_HueSpeed("Hue Speed", Float) = 0
			[HideInInspector] m_end_color("Color Settings", Float) = 0
			[HideInInspector] m_start_overlaytex("Overlay Texture Settings --{is_hideable:true}", Float) = 0
				_LerpOverlayTex("Lerp OverlayTex", Range( 0 , 1)) = 0
				_OverlayTexColor("OverlayTex Color", Color) = (1,1,1,0)
				[NoScaleOffset][SingleLineTexture]_OverlayTex("OverlayTex", 2D) = "white" {}
				_OverlayTexStrength("OverlayTex Strength", Range( -1 , 1)) = 1
				[KeywordEnum(On,Off)] _OverlayTexOriginalScreenPosition("OverlayTex Original Screen Position", Float) = 0
				_OverlayTexTilingX("OverlayTex Tiling X", Float) = 0
				_OverlayTexTilingY("OverlayTex Tiling Y", Float) = 0
				_OverlayTexOffsetX("OverlayTex Offset X", Float) = 0
				_OverlayTexOffsetY("OverlayTex Offset Y", Float) = 0
			[HideInInspector] m_end_overlaytex("Overlay Texture Settings", Float) = 0
		[HideInInspector] m_end_shader("Shader Settings", Float) = 0

		[HideInInspector] footer_discord("{texture:{name:DiscordIcon,height:32},action:{type:URL,data:https://discord.gg/w2jwhn5hj4},hover:My Discord Server}", Float) = 0

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
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows 
		struct Input
		{
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

		ASE_DECLARE_SCREENSPACE_TEXTURE( _Screen )
		uniform float _RotationStrength;
		uniform float _RotationSpeed;
		uniform float _Zoom;
		uniform float _AmplitudeX;
		uniform float _SpeedX;
		uniform float _AmplitudeY;
		uniform float _SpeedY;
		uniform float2 _BarsOffset;
		uniform float _BarsStrength;
		uniform float _BarsWidth;
		uniform float _BarsHeight;
		uniform float _BlurDistanceSpeed;
		uniform float _BlurDistance;
		uniform float _HueSpeed;
		uniform float _HueSaturation;
		uniform float _HueValue;
		uniform float _LerpHue;
		uniform float _LerpGrayscale;
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


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 screenColor155 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,ase_grabScreenPos.xy/ase_grabScreenPos.w);
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float2 temp_cast_1 = (0.5).xx;
			float mulTime179 = _Time.y * _RotationSpeed;
			float cos177 = cos( ( ( _RotationStrength * 0.01 ) * ( _RotationSpeed == 0.0 ? 1.0 : sin( mulTime179 ) ) ) );
			float sin177 = sin( ( ( _RotationStrength * 0.01 ) * ( _RotationSpeed == 0.0 ? 1.0 : sin( mulTime179 ) ) ) );
			float2 rotator177 = mul( ase_grabScreenPosNorm.xy - temp_cast_1 , float2x2( cos177 , -sin177 , sin177 , cos177 )) + temp_cast_1;
			float temp_output_112_0 = ( ( _Zoom + 10.0 ) * 0.1 );
			float mulTime96 = _Time.y * _SpeedX;
			float mulTime102 = _Time.y * _SpeedY;
			float2 appendResult88 = (float2(( ( _AmplitudeX * 0.01 ) * sin( mulTime96 ) ) , ( ( _AmplitudeY * 0.01 ) * sin( mulTime102 ) )));
			float2 ScreenPos26 = (rotator177*temp_output_112_0 + ( ( ( 1.0 - temp_output_112_0 ) * 0.5 ) + appendResult88 ));
			#if defined(_BARSORIGINALSCREENPOSITION_OFF)
				float4 staticSwitch342 = float4( ScreenPos26, 0.0 , 0.0 );
			#elif defined(_BARSORIGINALSCREENPOSITION_ON)
				float4 staticSwitch342 = ase_grabScreenPosNorm;
			#else
				float4 staticSwitch342 = float4( ScreenPos26, 0.0 , 0.0 );
			#endif
			float2 temp_cast_4 = (0.0).xx;
			#if defined(_BARTYPES_TRIANGLE)
				float staticSwitch345 = ( _BarsOffset.y + -1.0 );
			#elif defined(_BARTYPES_BOX)
				float staticSwitch345 = _BarsOffset.y;
			#else
				float staticSwitch345 = ( _BarsOffset.y + -1.0 );
			#endif
			float2 appendResult328 = (float2(( ( _BarsOffset.x * -1.0 ) * 0.1 ) , ( ( staticSwitch345 * -1.0 ) * 0.1 )));
			float2 lerpResult353 = lerp( temp_cast_4 , appendResult328 , _BarsStrength);
			float4 temp_output_326_0 = ( staticSwitch342 + float4( lerpResult353, 0.0 , 0.0 ) );
			float lerpResult84 = lerp( 1.41 , ( ( _BarsWidth + 41.0 ) * 0.01 ) , _BarsStrength);
			float lerpResult361 = lerp( 4.0 , 3.0 , _BarsStrength);
			float temp_output_2_0_g223 = lerpResult361;
			float cosSides12_g223 = cos( ( UNITY_PI / temp_output_2_0_g223 ) );
			float lerpResult86 = lerp( 1.41 , ( ( 41.0 + _BarsHeight ) * 0.01 ) , _BarsStrength);
			float2 appendResult18_g223 = (float2(( lerpResult84 * cosSides12_g223 ) , ( lerpResult86 * cosSides12_g223 )));
			float2 break23_g223 = ( (temp_output_326_0.xy*2.0 + -1.0) / appendResult18_g223 );
			float polarCoords30_g223 = atan2( break23_g223.x , -break23_g223.y );
			float temp_output_52_0_g223 = ( 6.28318548202515 / temp_output_2_0_g223 );
			float2 appendResult25_g223 = (float2(break23_g223.x , -break23_g223.y));
			float2 finalUVs29_g223 = appendResult25_g223;
			float temp_output_44_0_g223 = ( cos( ( ( floor( ( 0.5 + ( polarCoords30_g223 / temp_output_52_0_g223 ) ) ) * temp_output_52_0_g223 ) - polarCoords30_g223 ) ) * length( finalUVs29_g223 ) );
			float temp_output_2_0_g224 = 4.0;
			float cosSides12_g224 = cos( ( UNITY_PI / temp_output_2_0_g224 ) );
			float2 appendResult18_g224 = (float2(( lerpResult84 * cosSides12_g224 ) , ( lerpResult86 * cosSides12_g224 )));
			float2 break23_g224 = ( (temp_output_326_0.xy*2.0 + -1.0) / appendResult18_g224 );
			float polarCoords30_g224 = atan2( break23_g224.x , -break23_g224.y );
			float temp_output_52_0_g224 = ( 6.28318548202515 / temp_output_2_0_g224 );
			float2 appendResult25_g224 = (float2(break23_g224.x , -break23_g224.y));
			float2 finalUVs29_g224 = appendResult25_g224;
			float temp_output_44_0_g224 = ( cos( ( ( floor( ( 0.5 + ( polarCoords30_g224 / temp_output_52_0_g224 ) ) ) * temp_output_52_0_g224 ) - polarCoords30_g224 ) ) * length( finalUVs29_g224 ) );
			#if defined(_BARTYPES_TRIANGLE)
				float staticSwitch121 = saturate( ( ( 1.0 - temp_output_44_0_g223 ) / fwidth( temp_output_44_0_g223 ) ) );
			#elif defined(_BARTYPES_BOX)
				float staticSwitch121 = saturate( ( ( 1.0 - temp_output_44_0_g224 ) / fwidth( temp_output_44_0_g224 ) ) );
			#else
				float staticSwitch121 = saturate( ( ( 1.0 - temp_output_44_0_g223 ) / fwidth( temp_output_44_0_g223 ) ) );
			#endif
			float Box231 = staticSwitch121;
			float mulTime59 = _Time.y * _BlurDistanceSpeed;
			float BlurDistance239 = _BlurDistance;
			float temp_output_68_0 = ( BlurDistance239 * 0.1 );
			float temp_output_369_0 = ( ( sin( mulTime59 ) * temp_output_68_0 ) + temp_output_68_0 );
			float2 appendResult4 = (float2(temp_output_369_0 , 0.0));
			float2 temp_output_22_0 = ( appendResult4 * 0.01 );
			float4 screenColor31 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(ScreenPos26*1.0 + ( temp_output_22_0 * 2.0 )));
			float4 screenColor3 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(ScreenPos26*1.0 + temp_output_22_0));
			float4 screenColor32 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(ScreenPos26*1.0 + ( temp_output_22_0 * 3.0 )));
			float4 screenColor1 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,ScreenPos26);
			float2 appendResult5 = (float2(( temp_output_369_0 * -1.0 ) , 0.0));
			float2 temp_output_24_0 = ( appendResult5 * 0.01 );
			float4 screenColor2 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(ScreenPos26*1.0 + temp_output_24_0));
			float4 screenColor29 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(ScreenPos26*1.0 + ( temp_output_24_0 * 3.0 )));
			float4 screenColor30 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(ScreenPos26*1.0 + ( temp_output_24_0 * 2.0 )));
			float4 Blur227 = ( ( ( screenColor31 + screenColor3 + screenColor32 ) + screenColor1 + ( screenColor2 + screenColor29 + screenColor30 ) ) * 0.14 );
			float Radial252 = ( BlurDistance239 * 0.1 );
			float temp_output_7_0_g209 = ( ( ( 1.0 - ( 1.0 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor316 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g209 + ( ( 1.0 - temp_output_7_0_g209 ) * 0.5 )).xy);
			float temp_output_7_0_g221 = ( ( ( 1.0 - ( 1.5 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor293 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g221 + ( ( 1.0 - temp_output_7_0_g221 ) * 0.5 )).xy);
			float temp_output_7_0_g217 = ( ( ( 1.0 - ( 2.0 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor266 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g217 + ( ( 1.0 - temp_output_7_0_g217 ) * 0.5 )).xy);
			float temp_output_7_0_g211 = ( ( ( 1.0 - ( 2.5 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor263 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g211 + ( ( 1.0 - temp_output_7_0_g211 ) * 0.5 )).xy);
			float temp_output_7_0_g214 = ( ( ( 1.0 - ( 3.0 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor289 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g214 + ( ( 1.0 - temp_output_7_0_g214 ) * 0.5 )).xy);
			float temp_output_7_0_g212 = ( ( ( 1.0 - ( 3.5 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor308 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g212 + ( ( 1.0 - temp_output_7_0_g212 ) * 0.5 )).xy);
			float temp_output_7_0_g222 = ( ( ( 1.0 - ( 4.0 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor294 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g222 + ( ( 1.0 - temp_output_7_0_g222 ) * 0.5 )).xy);
			float temp_output_7_0_g216 = ( ( ( 1.0 - ( 4.5 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor319 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g216 + ( ( 1.0 - temp_output_7_0_g216 ) * 0.5 )).xy);
			float temp_output_7_0_g220 = ( ( ( 1.0 - ( 5.0 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor295 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g220 + ( ( 1.0 - temp_output_7_0_g220 ) * 0.5 )).xy);
			float temp_output_7_0_g218 = ( ( ( 1.0 - ( 5.5 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor307 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g218 + ( ( 1.0 - temp_output_7_0_g218 ) * 0.5 )).xy);
			float temp_output_7_0_g213 = ( ( ( 1.0 - ( 6.0 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor258 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g213 + ( ( 1.0 - temp_output_7_0_g213 ) * 0.5 )).xy);
			float temp_output_7_0_g219 = ( ( ( 1.0 - ( 6.5 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor300 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g219 + ( ( 1.0 - temp_output_7_0_g219 ) * 0.5 )).xy);
			float temp_output_7_0_g215 = ( ( ( 1.0 - ( 7.0 * Radial252 ) ) + 9.0 ) * 0.1 );
			float4 screenColor305 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_Screen,(float4( ScreenPos26, 0.0 , 0.0 )*temp_output_7_0_g215 + ( ( 1.0 - temp_output_7_0_g215 ) * 0.5 )).xy);
			float4 RadialBlur236 = ( ( ( screenColor316 + screenColor293 + screenColor266 + screenColor263 + screenColor289 ) + ( screenColor308 + screenColor294 + screenColor319 + screenColor295 ) + ( screenColor307 + screenColor258 + screenColor300 + screenColor305 ) ) * 0.076 );
			#if defined(_BLUR_HORIZONTAL)
				float4 staticSwitch235 = Blur227;
			#elif defined(_BLUR_RADIAL)
				float4 staticSwitch235 = RadialBlur236;
			#else
				float4 staticSwitch235 = Blur227;
			#endif
			float mulTime142 = _Time.y * _HueSpeed;
			float4 temp_cast_35 = (mulTime142).xxxx;
			float4 temp_cast_36 = (mulTime142).xxxx;
			#if defined(_HUETYPES_SIMPLE)
				float4 staticSwitch355 = temp_cast_35;
			#elif defined(_HUETYPES_LINES)
				float4 staticSwitch355 = ( ase_grabScreenPosNorm + mulTime142 );
			#else
				float4 staticSwitch355 = temp_cast_35;
			#endif
			float3 hsvTorgb134 = HSVToRGB( float3(staticSwitch355.x,( _HueSaturation * -1.0 ),_HueValue) );
			float3 Hue229 = hsvTorgb134;
			float4 lerpResult131 = lerp( staticSwitch235 , ( staticSwitch235 * float4( Hue229 , 0.0 ) ) , _LerpHue);
			float grayscale129 = Luminance(lerpResult131.rgb);
			float4 temp_cast_40 = (grayscale129).xxxx;
			float4 lerpResult128 = lerp( lerpResult131 , temp_cast_40 , _LerpGrayscale);
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
			float4 lerpResult213 = lerp( ( Box231 * lerpResult128 ) , ( Box231 * OverlayTex226 ) , _LerpOverlayTex);
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