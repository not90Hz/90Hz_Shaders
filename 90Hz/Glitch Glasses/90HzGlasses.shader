Shader "90Hz/Glitch Glasses"
{
	Properties
	{
		[HideInInspector] shader_is_using_thry_editor("", Float)=0
		[HideInInspector] shader_master_label("<color=#ff000d><b>90Hz Glitch Glasses v1.4</b></color>", Float) = 0
		[Helpbox]_WarnBox("This version is a small mash up", Float) = 0

		[HideInInspector] m_start_shader("Shader Settings --{is_hideable:true}", Float) = 0

			[HideInInspector] m_start_dissolve("Dissolve Settings --{is_hideable:true}", Float) = 0
				_OnDissolveTexColor("On Dissolve Tex Color", Color) = (1,1,1,0)
				_OnDissolveTexture("On Dissolve Texture", 2D) = "white" {}
				_LerpOnDissolveTexAlpha("Lerp On Dissolve Tex Alpha", Range(0 , 1)) = 0
				_LerpOnDissolveTexGrayscale("Lerp On Dissolve Tex Grayscale", Range(0 , 1)) = 0
				_DissolveTexture1("Dissolve Texture 1", 2D) = "white" {}
				_LerpDissolveTextures("Lerp Dissolve Textures", Range(0 , 1)) = 0
				_DissolveTexture2("Dissolve Texture 2", 2D) = "white" {}
				_DissolveStrength("Dissolve Strength", Float) = 1.64
				_DissolveOffset("Dissolve Offset", Vector) = (0,0,0,0)
				_DissolveTexturesSpeed("Dissolve Textures Speed", Vector) = (0,0,0,0)
				_DissolveTexXSpeedStrength("Dissolve Tex X Speed Strength", Float) = 0
				_LerpDissolveTexXSpeed("Lerp Dissolve Tex X Speed Sin", Range(0 , 1)) = 0
				_DissolveTexYSpeedStrength("Dissolve Tex Y Speed Strength", Float) = 0
				_LerpDissolveTexYSpeed("Lerp Dissolve Tex Y Speed Sin", Range(0 , 1)) = 0
			[HideInInspector] m_end_dissolve("Dissolve Settings", Float) = 0

			[HideInInspector] m_start_glitch("Glitch Settings --{is_hideable:true}", Float) = 0
				_XBlue("X Blue", Float) = 0
				_YBlue("Y Blue", Float) = 0
				_BlueSpeed("Blue Speed", Float) = 0
				_XGreen("X Green", Float) = 0
				_YGreen("Y Green", Float) = 0
				_GreenSpeed("Green Speed", Float) = 0
				[HideInInspector] m_start_glitche("Glitch Texture Settings --{is_hideable:true}", Float) = 0
					_GlitchAlpha("Glitch Alpha", Range(-1 , 1)) = 0.06679124
					_LerpGlitchColor("Lerp Glitch Color", Range(0 , 1)) = 0
					_GlitchColor("Glitch Color", Color) = (1,1,1,0)
					_GlitchColorStrength("Glitch Color Strength", Range(1 , 3)) = 1
					_LerpGlitchTexture("Lerp Glitch Texture", Range(0 , 1)) = 0
					_GlitchTexColor("Glitch Tex Color", Color) = (1,1,1,0)
					[NoScaleOffset][SingleLineTexture]_GlitchTexture("Glitch Texture", 2D) = "white" {}
					[Toggle]_ToggleGlitchTexAlpha("Toggle Glitch Tex Alpha", Range(0 , 1)) = 0
					[Toggle]_ToggleGlitchTexGrayscale("Toggle Glitch Tex Grayscale", Range(0 , 1)) = 0
					_GlitchTexTiling("Glitch Tex Tiling", Vector) = (1,1,0,0)
					_GlitchTexOffset("Glitch Tex Offset", Vector) = (0,0,0,0)
					_GlitchTexSpeedStrength("Glitch Tex Speed Strength", Vector) = (0,0,0,0)
					_GlitchTexSpeed("Glitch Tex Speed", Vector) = (0,0,0,0)
					_LerpGlitchTexSpeedSin("Lerp Glitch Tex Speed Sin", Range(0 , 1)) = 1
					_GlitchTexRotationStrength("Glitch Tex Rotation Strength", Float) = 0
					_GlitchTexRotationSpeed("Glitch Tex Rotation Speed", Float) = 0
					_LerpGlitchTexRotationSin("Lerp Glitch Tex Rotation Sin", Range(0 , 1)) = 0
					_GlitchColorDisplaceAlpha("Glitch Color Displace Alpha", Range(-1 , 1)) = 0
					_ColorDisplace1("Color Displace 1", Color) = (1,0,0,0)
					_ColorDisplace2("Color Displace 2", Color) = (0,1,0.006896496,0)
					_ColorDisplaceandHueonZ("Color Displace and Hue on Z", Vector) = (0.06,0,0.5,0)
					_LerpGlitchColorDisplaceHue("Lerp Glitch Color Displace Hue", Range(-1 , 1)) = 0
				[HideInInspector] m_end_glitche("Glitch Texture Settings", Float) = 0
			[HideInInspector] m_end_glitch("Glitch Settings", Float) = 0

		[HideInInspector] m_end_shader("Shader Settings", Float) = 0

		[HideInInspector] footer_discord("{texture:{name:DiscordIcon,height:32},action:{type:URL,data:https://discord.com/invite/ZvhnZ9F4Bs},hover:My Discord Server}", Float) = 0

		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Overlay"  "Queue" = "Overlay+28767" "IsEmissive" = "true"  }
		Cull Back
		GrabPass{ }
		GrabPass{ "_ScreenGlitch" }
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
			float2 uv3_texcoord3;
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

		uniform sampler2D _OnDissolveTexture;
		uniform float4 _OnDissolveTexture_ST;
		uniform float _LerpOnDissolveTexAlpha;
		uniform float _LerpOnDissolveTexGrayscale;
		uniform float4 _OnDissolveTexColor;
		ASE_DECLARE_SCREENSPACE_TEXTURE(_GrabTexture)
		ASE_DECLARE_SCREENSPACE_TEXTURE(_ScreenGlitch)
		uniform float _XGreen;
		uniform float _GreenSpeed;
		uniform float _YGreen;
		uniform float _XBlue;
		uniform float _BlueSpeed;
		uniform float _YBlue;
		uniform float4 _GlitchColor;
		uniform float _GlitchColorStrength;
		uniform float _LerpGlitchColor;
		uniform float _GlitchAlpha;
		uniform sampler2D _GlitchTexture;
		uniform float2 _GlitchTexTiling;
		uniform float4 _GlitchTexture_ST;
		uniform float2 _GlitchTexSpeedStrength;
		uniform float2 _GlitchTexSpeed;
		uniform float _LerpGlitchTexSpeedSin;
		uniform float2 _GlitchTexOffset;
		uniform float _GlitchTexRotationSpeed;
		uniform float _GlitchTexRotationStrength;
		uniform float _LerpGlitchTexRotationSin;
		uniform float _ToggleGlitchTexAlpha;
		uniform float4 _GlitchTexColor;
		uniform float _ToggleGlitchTexGrayscale;
		uniform float3 _ColorDisplaceandHueonZ;
		uniform float4 _ColorDisplace1;
		uniform float _LerpGlitchColorDisplaceHue;
		uniform float4 _ColorDisplace2;
		uniform float _GlitchColorDisplaceAlpha;
		uniform float _LerpGlitchTexture;
		uniform float2 _DissolveOffset;
		uniform float _DissolveStrength;
		uniform sampler2D _DissolveTexture1;
		uniform float2 _DissolveTexturesSpeed;
		uniform float _DissolveTexXSpeedStrength;
		uniform float _LerpDissolveTexXSpeed;
		uniform float _DissolveTexYSpeedStrength;
		uniform float _LerpDissolveTexYSpeed;
		uniform sampler2D _DissolveTexture2;
		uniform float _LerpDissolveTextures;


		float2 NonStereo(float2 UV)
		{
			#if UNITY_SINGLE_PASS_STEREO
			float3 nonStereoCameraPosition = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
			#else
			float3 nonStereoCameraPosition = _WorldSpaceCameraPos;
			#endif
			return UV;
		}


		float3 HSVToRGB(float3 c)
		{
			float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
			float3 p = abs(frac(c.xxx + K.xyz) * 6.0 - K.www);
			return c.z * lerp(K.xxx, saturate(p - K.xxx), c.y);
		}


		inline half4 LightingStandardCustomLighting(inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi)
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			c.rgb = 0;
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
			float2 uv_OnDissolveTexture = i.uv_texcoord * _OnDissolveTexture_ST.xy + _OnDissolveTexture_ST.zw;
			float4 tex2DNode1 = tex2D(_OnDissolveTexture, uv_OnDissolveTexture);
			float4 temp_cast_0 = (tex2DNode1.a).xxxx;
			float4 lerpResult237 = lerp(tex2DNode1 , temp_cast_0 , _LerpOnDissolveTexAlpha);
			float grayscale239 = (lerpResult237.rgb.r + lerpResult237.rgb.g + lerpResult237.rgb.b) / 3;
			float4 temp_cast_2 = (grayscale239).xxxx;
			float4 lerpResult238 = lerp(lerpResult237 , temp_cast_2 , _LerpOnDissolveTexGrayscale);
			float4 ase_screenPos = float4(i.screenPos.xyz , i.screenPos.w + 0.00000000001);
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = (UNITY_NEAR_CLIP_VALUE >= 0) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 UV144 = ase_screenPosNorm.xy;
			float2 localNonStereo144 = NonStereo(UV144);
			float4 screenColor149 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,localNonStereo144);
			float mulTime128 = _Time.y * _GreenSpeed;
			float temp_output_135_0 = sin(mulTime128);
			float2 appendResult142 = (float2((((_XGreen * -1.0) * 0.1) * temp_output_135_0) , (temp_output_135_0 * ((_YGreen * -1.0) * 0.1))));
			float4 screenColor147 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_ScreenGlitch,(localNonStereo144 + appendResult142));
			float mulTime129 = _Time.y * _BlueSpeed;
			float temp_output_131_0 = sin(mulTime129);
			float2 appendResult143 = (float2(((_XBlue * 0.1) * temp_output_131_0) , (temp_output_131_0 * (_YBlue * 0.1))));
			float4 screenColor148 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,(localNonStereo144 + appendResult143));
			float4 appendResult150 = (float4(screenColor149.r , screenColor147.g , screenColor148.b , screenColor147.a));
			float4 lerpResult226 = lerp(appendResult150 , (appendResult150 * (_GlitchColor * _GlitchColorStrength)) , _LerpGlitchColor);
			float2 uv_GlitchTexture = i.uv_texcoord * _GlitchTexture_ST.xy + _GlitchTexture_ST.zw;
			float mulTime265 = _Time.y * (_GlitchTexSpeed.x * 0.01);
			float mulTime267 = _Time.y * (_GlitchTexSpeed.y * 0.01);
			float2 appendResult264 = (float2((_GlitchTexSpeedStrength.x * mulTime265) , (_GlitchTexSpeedStrength.y * mulTime267)));
			float2 lerpResult248 = lerp(appendResult264 , sin(appendResult264) , _LerpGlitchTexSpeedSin);
			float mulTime243 = _Time.y * _GlitchTexRotationSpeed;
			float lerpResult251 = lerp(mulTime243 , (sin(mulTime243) * _GlitchTexRotationStrength) , _LerpGlitchTexRotationSin);
			float cos242 = cos(lerpResult251);
			float sin242 = sin(lerpResult251);
			float2 rotator242 = mul((_GlitchTexTiling * (uv_GlitchTexture + lerpResult248 + _GlitchTexOffset)) - float2(0.5,0.5) , float2x2(cos242 , -sin242 , sin242 , cos242)) + float2(0.5,0.5);
			float4 tex2DNode195 = tex2D(_GlitchTexture, rotator242);
			float4 temp_cast_4 = (tex2DNode195.a).xxxx;
			float4 lerpResult198 = lerp(tex2DNode195 , temp_cast_4 , _ToggleGlitchTexAlpha);
			float4 temp_output_207_0 = (lerpResult198 * _GlitchTexColor);
			float grayscale217 = (temp_output_207_0.rgb.r + temp_output_207_0.rgb.g + temp_output_207_0.rgb.b) / 3;
			float4 temp_cast_6 = (grayscale217).xxxx;
			float4 lerpResult228 = lerp(temp_output_207_0 , temp_cast_6 , _ToggleGlitchTexGrayscale);
			float4 temp_cast_7 = (grayscale217).xxxx;
			float4 lerpResult221 = lerp(temp_output_207_0 , temp_cast_7 , _ToggleGlitchTexGrayscale);
			float4 tex2DNode203 = tex2D(_GlitchTexture, (float3(rotator242 ,  0.0) + ((sin(_SinTime.w) * cos(_CosTime.w)) * _ColorDisplaceandHueonZ)).xy);
			float lerpResult210 = lerp(tex2DNode203.r , tex2DNode203.a , _ToggleGlitchTexAlpha);
			float mulTime193 = _Time.y * _ColorDisplaceandHueonZ.z;
			float3 hsvTorgb3_g4 = HSVToRGB(float3(mulTime193,1.0,1.0));
			float4 lerpResult209 = lerp(_ColorDisplace1 , float4(hsvTorgb3_g4 , 0.0) , _LerpGlitchColorDisplaceHue);
			float4 tex2DNode201 = tex2D(_GlitchTexture, (float3(rotator242 ,  0.0) + (_ColorDisplaceandHueonZ * (-1.0 * (sin(_SinTime.w) * cos(_CosTime.w))))).xy);
			float4 temp_cast_13 = (tex2DNode201.a).xxxx;
			float4 lerpResult212 = lerp(tex2DNode201 , temp_cast_13 , _ToggleGlitchTexAlpha);
			float mulTime192 = _Time.y * (_ColorDisplaceandHueonZ.z * -1.0);
			float3 hsvTorgb3_g5 = HSVToRGB(float3(mulTime192,1.0,1.0));
			float4 lerpResult211 = lerp(_ColorDisplace2 , float4(hsvTorgb3_g5 , 0.0) , _LerpGlitchColorDisplaceHue);
			float4 lerpResult232 = lerp(lerpResult228 , (lerpResult221 + ((lerpResult210 * lerpResult209) + (lerpResult212 * lerpResult211))) , _GlitchColorDisplaceAlpha);
			float4 lerpResult234 = lerp((lerpResult226 * (_GlitchAlpha + 1.0)) , lerpResult232 , _GlitchAlpha);
			float4 lerpResult151 = lerp(appendResult150 , lerpResult234 , _LerpGlitchTexture);
			float2 appendResult50 = (float2(0.0 , _DissolveStrength));
			float lerpResult255 = lerp(_Time.y , (sin(_Time.y) * _DissolveTexXSpeedStrength) , _LerpDissolveTexXSpeed);
			float lerpResult254 = lerp(_Time.y , (sin(_Time.y) * _DissolveTexYSpeedStrength) , _LerpDissolveTexYSpeed);
			float2 appendResult26 = (float2((_DissolveTexturesSpeed.x * lerpResult255) , ((_DissolveTexturesSpeed.y * lerpResult254) * -1.0)));
			float2 uv_TexCoord98 = i.uv_texcoord + appendResult26;
			float2 uv_TexCoord110 = i.uv_texcoord * float2(1.1,1.1) + appendResult26;
			float4 lerpResult111 = lerp(tex2D(_DissolveTexture1, uv_TexCoord98) , tex2D(_DissolveTexture2, uv_TexCoord110) , _LerpDissolveTextures);
			float grayscale100 = (lerpResult111.rgb.r + lerpResult111.rgb.g + lerpResult111.rgb.b) / 3;
			float4 lerpResult4 = lerp((lerpResult238 * _OnDissolveTexColor) , lerpResult151 , min(1.0 , abs(floor((length(((i.uv3_texcoord3.y + _DissolveOffset) * appendResult50)) * grayscale100)))));
			o.Emission = lerpResult4.rgb;
		}
		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ThryEditor"
}