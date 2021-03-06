//Made by 90Hz with the Amplify Shader Editor in Unity 2018 at the 2022.06.02
Shader "90Hz/Aptical v1.5"
{
	Properties
	{
		[HideInInspector] shader_is_using_thry_editor("", Float) = 0
		[HideInInspector] shader_master_label("<color=#8100FF><b>90Hz Aptical Shader v1.5</b></color>", Float) = 0
		[Helpbox]_WarnBox("Public Shader | Based on the old Equation Shader", Float) = 0
		[HideInInspector] m_start_shader("Shader Settings --{is_hideable:true}", Float) = 0
			[HideInInspector] m_start_main("Main Options --{is_hideable:true}", Float) = 0
				[HDR]_MainColor("Main Color", Color) = (1,1,1,0)
				_LerpMainTexHue("Lerp MainTex Hue", Range(0 , 1)) = 0
				_MainTexHueSaturation("MainTex Hue Saturation", Float) = 1
				_MainTexHueValue("MainTex Hue Value", Float) = 1
				_MainTexHueSpeed("MainTex Hue Speed", Float) = 0
				[NoScaleOffset][SingleLineTexture]_MainTex("MainTex", 2D) = "white" {}
				_LerpMainGrayscale("Lerp Main Grayscale", Range(0 , 1)) = 0
				_LerpMainTexAlpha("Lerp MainTex Alpha", Range(0 , 1)) = 0
				_MainTilingandOffset("Main Tiling and Offset", Vector) = (1,1,0,0)
				_CutoutStrength("Cutout Strength", Float) = 0
				[KeywordEnum(Vertex,Clip,Tangent)] _MainRendering("Main Rendering", Float) = 0
			[HideInInspector] m_end_main("Main Options", Float) = 0
			[HideInInspector] m_start_light("Light Options --{is_hideable:true}", Float) = 0
				[KeywordEnum(On,Off)] _ToggleCustomLighting("Toggle CustomLighting", Float) = 0
				_CustomLightingStrength("CustomLighting Strength", Range(0 , 1)) = 0.35
			[HideInInspector] m_end_light("Light Options", Float) = 0
			[HideInInspector] m_start_rimlight("RimLight Options --{is_hideable:true}", Float) = 0
				[KeywordEnum(On,Off)] _ToggleRimLight("Toggle RimLight", Float) = 1
				[HDR]_RimLightColor("RimLight Color", Color) = (0,1,0.8758622,0)
				_LerpRimLightHue("Lerp RimLight Hue", Range(0 , 1)) = 0
				_RimLightHueSaturation("RimLight Hue Saturation", Float) = 1
				_RimLightHueValue("RimLight Hue Value", Float) = 1
				_RimLightHueSpeed("RimLight Hue Speed", Float) = 0
				_RimLightPower("RimLight Power", Range(0 , 10)) = 0.5
				_RimLightOffset("RimLight Offset", Float) = 0.24
			[HideInInspector] m_end_rimlight("RimLight Options", Float) = 0
			[HideInInspector] m_start_overlay("Overlay Options --{is_hideable:true}", Float) = 0
				_LerpOverlay("Lerp Overlay", Range(0 , 1)) = 0
				[HDR]_OverlayColor("Overlay Color", Color) = (1,1,1,0)
				_LerpOverlayHue("Lerp Overlay Hue", Range(0 , 1)) = 0
				_OverlayHueSaturation("Overlay Hue Saturation", Float) = 1
				_OverlayHueValue("Overlay Hue Value", Float) = 1
				_OverlayHueSpeed("Overlay Hue Speed", Float) = 0
				[NoScaleOffset][SingleLineTexture]_OverlayTex("OverlayTex", 2D) = "white" {}
				_LerpOverlayGrayscale("Lerp Overlay Grayscale", Range(0 , 1)) = 0
				_LerpOverlayTexAlpha("Lerp OverlayTex Alpha", Range(0 , 1)) = 0
				_OverlayTilingandOffset("Overlay Tiling and Offset", Vector) = (1,1,0,0)
				[KeywordEnum(On,Off)] _ToggleOverlaySpeed("Toggle Overlay Speed", Float) = 1
				_OverlaySpeed("Overlay Speed", Vector) = (0,0,0,0)
				[KeywordEnum(Vertex,Clip,Tangent)] _OverlayRendering("Overlay Rendering", Float) = 0
				_LerpOverlayFlicker("Lerp Overlay Flicker", Range(0 , 1)) = 0
				_OverlayFlickerAmplitude("Overlay Flicker Amplitude", Float) = 1
				_OverlayFlickerOffset("Overlay Flicker Offset", Float) = 0
				_OverlayFlickerSpeed("Overlay Flicker Speed", Float) = 1
			[HideInInspector] m_end_overlay("Overlay Options", Float) = 0
			[HideInInspector] m_start_outline("Outline Options --{is_hideable:true}", Float) = 0
				_OutlineAlpha("Outline Alpha", Range(0 , 1)) = 0
				_OutliceScale("Outlice Scale", Float) = 0
				[HDR]_OutlineColor("Outline Color", Color) = (0,0,0,0)
				_LerpOutlineHue("Lerp Outline Hue", Range(0 , 1)) = 0
				_OutlineHueSaturation("Outline Hue Saturation", Float) = 1
				_OutlineHueValue("Outline Hue Value", Float) = 1
				_OutlineHueSpeed("Outline Hue Speed", Float) = 0
			[HideInInspector] m_end_outline("Outline Options", Float) = 0
			[HideInInspector] m_start_rendering("Rendering Options --{is_hideable:true}", Float) = 0
				[Enum(Off,0,Front,1,Back,2)]_CullMode("Cull Mode", Float) = 2
				[Enum(On,0,Off,1)]_ZWriteMode("ZWrite Mode", Float) = 1
				[Enum(Less,0,Greater,1,Less or Equal,2,Greater or Equal,3,Equal,4,Not Equal,5,Always,6)]_ZTestMode("ZTest Mode", Float) = 2
				[IntRange]_StencilReference("Stencil Reference", Range(0 , 255)) = 0
				[IntRange]_StencilReadMask("Stencil Read Mask", Range(0 , 255)) = 255
				[IntRange]_StencilWriteMask("Stencil Write Mask", Range(0 , 255)) = 255
				[Enum(CompareFunction)]_StencilComparison("Stencil Comparison", Float) = 0
				[Enum(StencilOp)]_StencilPassFront("Stencil Pass Front", Float) = 0
				[Enum(StencilOp)]_StencilFailFront("Stencil Fail Front", Float) = 0
				[Enum(StencilOp)]_StencilZFailFront("Stencil ZFail Front", Float) = 0
			[HideInInspector] m_end_rendering("Rendering Options", Float) = 0
		[HideInInspector] m_end_shader("Shader Settings", Float) = 0

		[HideInInspector] footer_discord("{texture:{name:DiscordIcon,height:32},action:{type:URL,data:https://discord.gg/8TtTX8kWwe},hover:My Discord Server}", Float) = 0
		
		[HideInInspector] _texcoord("", 2D) = "white" {}
		[HideInInspector] __dirty("", Int) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent" }
		Cull Front
		CGPROGRAM
		#pragma target 3.0
		#pragma surface outlineSurf Outline nofog alpha:fade  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 
		
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float outlineVar = ( _OutliceScale * 0.0001 );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float mulTime217 = _Time.y * _OutlineHueSpeed;
			float3 hsvTorgb226 = HSVToRGB( float3(mulTime217,_OutlineHueSaturation,_OutlineHueValue) );
			float4 lerpResult205 = lerp( _OutlineColor , float4( hsvTorgb226 , 0.0 ) , _LerpOutlineHue);
			o.Emission = lerpResult205.rgb;
			o.Alpha = _OutlineAlpha;
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		LOD 200
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest [_ZTestMode]
		Stencil
		{
			Ref [_StencilReference]
			ReadMask [_StencilReadMask]
			WriteMask [_StencilWriteMask]
			Comp [_StencilComparison]
			Pass [_StencilPassFront]
			Fail [_StencilFailFront]
			ZFail [_StencilZFailFront]
		}
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma shader_feature _TOGGLEOVERLAYSPEED_ON _TOGGLEOVERLAYSPEED_OFF
		#pragma shader_feature _OVERLAYRENDERING_VERTEX _OVERLAYRENDERING_CLIP _OVERLAYRENDERING_TANGENT
		#pragma shader_feature _TOGGLERIMLIGHT_ON _TOGGLERIMLIGHT_OFF
		#pragma shader_feature _MAINRENDERING_VERTEX _MAINRENDERING_CLIP _MAINRENDERING_TANGENT
		#pragma shader_feature _TOGGLECUSTOMLIGHTING_ON _TOGGLECUSTOMLIGHTING_OFF
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

		uniform float _CullMode;
		uniform float _ZWriteMode;
		uniform float _ZTestMode;
		uniform float _StencilReference;
		uniform float _StencilReadMask;
		uniform float _StencilWriteMask;
		uniform float _StencilComparison;
		uniform float _StencilPassFront;
		uniform float _StencilFailFront;
		uniform float _StencilZFailFront;
		uniform sampler2D _OverlayTex;
		uniform float4 _OverlayTilingandOffset;
		uniform float2 _OverlaySpeed;
		uniform float _LerpOverlayTexAlpha;
		uniform float _OverlayFlickerSpeed;
		uniform float _OverlayFlickerAmplitude;
		uniform float _OverlayFlickerOffset;
		uniform float _LerpOverlayFlicker;
		uniform float4 _OverlayColor;
		uniform float _OverlayHueSpeed;
		uniform float _OverlayHueSaturation;
		uniform float _OverlayHueValue;
		uniform float _LerpOverlayHue;
		uniform float _LerpOverlay;
		uniform float _LerpOverlayGrayscale;
		uniform float _RimLightOffset;
		uniform float _RimLightPower;
		uniform float4 _RimLightColor;
		uniform float _RimLightHueSpeed;
		uniform float _RimLightHueSaturation;
		uniform float _RimLightHueValue;
		uniform float _LerpRimLightHue;
		uniform sampler2D _MainTex;
		uniform float _CutoutStrength;
		uniform float4 _MainTilingandOffset;
		uniform float _LerpMainTexAlpha;
		uniform float4 _MainColor;
		uniform float _MainTexHueSpeed;
		uniform float _MainTexHueSaturation;
		uniform float _MainTexHueValue;
		uniform float _LerpMainTexHue;
		uniform float _LerpMainGrayscale;
		uniform float _CustomLightingStrength;
		uniform float4 _OutlineColor;
		uniform float _OutlineHueSpeed;
		uniform float _OutlineHueSaturation;
		uniform float _OutlineHueValue;
		uniform float _LerpOutlineHue;
		uniform float _OutlineAlpha;
		uniform float _OutliceScale;


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		struct Gradient
		{
			int type;
			int colorsLength;
			int alphasLength;
			float4 colors[8];
			float2 alphas[8];
		};


		Gradient NewGradient(int type, int colorsLength, int alphasLength, 
		float4 colors0, float4 colors1, float4 colors2, float4 colors3, float4 colors4, float4 colors5, float4 colors6, float4 colors7,
		float2 alphas0, float2 alphas1, float2 alphas2, float2 alphas3, float2 alphas4, float2 alphas5, float2 alphas6, float2 alphas7)
		{
			Gradient g;
			g.type = type;
			g.colorsLength = colorsLength;
			g.alphasLength = alphasLength;
			g.colors[ 0 ] = colors0;
			g.colors[ 1 ] = colors1;
			g.colors[ 2 ] = colors2;
			g.colors[ 3 ] = colors3;
			g.colors[ 4 ] = colors4;
			g.colors[ 5 ] = colors5;
			g.colors[ 6 ] = colors6;
			g.colors[ 7 ] = colors7;
			g.alphas[ 0 ] = alphas0;
			g.alphas[ 1 ] = alphas1;
			g.alphas[ 2 ] = alphas2;
			g.alphas[ 3 ] = alphas3;
			g.alphas[ 4 ] = alphas4;
			g.alphas[ 5 ] = alphas5;
			g.alphas[ 6 ] = alphas6;
			g.alphas[ 7 ] = alphas7;
			return g;
		}


		float4 SampleGradient( Gradient gradient, float time )
		{
			float3 color = gradient.colors[0].rgb;
			UNITY_UNROLL
			for (int c = 1; c < 8; c++)
			{
			float colorPos = saturate((time - gradient.colors[c-1].w) / ( 0.00001 + (gradient.colors[c].w - gradient.colors[c-1].w)) * step(c, (float)gradient.colorsLength-1));
			color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
			}
			#ifndef UNITY_COLORSPACE_GAMMA
			color = half3(GammaToLinearSpaceExact(color.r), GammaToLinearSpaceExact(color.g), GammaToLinearSpaceExact(color.b));
			#endif
			float alpha = gradient.alphas[0].x;
			UNITY_UNROLL
			for (int a = 1; a < 8; a++)
			{
			float alphaPos = saturate((time - gradient.alphas[a-1].y) / ( 0.00001 + (gradient.alphas[a].y - gradient.alphas[a-1].y)) * step(a, (float)gradient.alphasLength-1));
			alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
			}
			return float4(color, alpha);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			v.vertex.xyz += 0;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			#ifdef UNITY_PASS_FORWARDBASE
			float ase_lightAtten = data.atten;
			if( _LightColor0.a == 0)
			ase_lightAtten = 0;
			#else
			float3 ase_lightAttenRGB = gi.light.color / ( ( _LightColor0.rgb ) + 0.000001 );
			float ase_lightAtten = max( max( ase_lightAttenRGB.r, ase_lightAttenRGB.g ), ase_lightAttenRGB.b );
			#endif
			#if defined(HANDLE_SHADOWS_BLENDING_IN_GI)
			half bakedAtten = UnitySampleBakedOcclusion(data.lightmapUV.xy, data.worldPos);
			float zDist = dot(_WorldSpaceCameraPos - data.worldPos, UNITY_MATRIX_V[2].xyz);
			float fadeDist = UnityComputeShadowFadeDistance(data.worldPos, zDist);
			ase_lightAtten = UnityMixRealtimeAndBakedShadows(data.atten, bakedAtten, UnityComputeShadowFade(fadeDist));
			#endif
			float2 uv_MainTex166 = i.uv_texcoord;
			float lerpResult170 = lerp( tex2D( _MainTex, uv_MainTex166 ).a , _CutoutStrength , 0.0);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 objectToClipDir44 = mul(UNITY_MATRIX_VP, mul(unity_ObjectToWorld, float4(ase_worldViewDir, 0.0)));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_worldToTangent = float3x3( ase_worldTangent, ase_worldBitangent, ase_worldNormal );
			float3 objectToTangentDir57 = mul( ase_worldToTangent, mul( unity_ObjectToWorld, float4( ase_worldViewDir, 0 ) ).xyz);
			#if defined(_MAINRENDERING_VERTEX)
				float3 staticSwitch40 = float3( i.uv_texcoord ,  0.0 );
			#elif defined(_MAINRENDERING_CLIP)
				float3 staticSwitch40 = objectToClipDir44;
			#elif defined(_MAINRENDERING_TANGENT)
				float3 staticSwitch40 = objectToTangentDir57;
			#else
				float3 staticSwitch40 = float3( i.uv_texcoord ,  0.0 );
			#endif
			float2 appendResult69 = (float2(_MainTilingandOffset.x , _MainTilingandOffset.y));
			float2 appendResult70 = (float2(_MainTilingandOffset.z , _MainTilingandOffset.w));
			float4 tex2DNode27 = tex2D( _MainTex, (staticSwitch40*float3( appendResult69 ,  0.0 ) + float3( appendResult70 ,  0.0 )).xy );
			float4 temp_cast_17 = (tex2DNode27.a).xxxx;
			float4 lerpResult256 = lerp( tex2DNode27 , temp_cast_17 , _LerpMainTexAlpha);
			float mulTime240 = _Time.y * _MainTexHueSpeed;
			float3 hsvTorgb239 = HSVToRGB( float3(mulTime240,_MainTexHueSaturation,_MainTexHueValue) );
			float4 lerpResult244 = lerp( _MainColor , float4( hsvTorgb239 , 0.0 ) , _LerpMainTexHue);
			float4 temp_output_38_0 = ( lerpResult256 * lerpResult244 );
			float grayscale275 = (temp_output_38_0.rgb.r + temp_output_38_0.rgb.g + temp_output_38_0.rgb.b) / 3;
			float4 temp_cast_20 = (grayscale275).xxxx;
			float4 lerpResult274 = lerp( temp_output_38_0 , temp_cast_20 , _LerpMainGrayscale);
			Gradient gradient117 = NewGradient( 0, 3, 2, float4( 0, 0, 0, 0 ), float4( 0, 0, 0, 0.1294118 ), float4( 1, 1, 1, 1 ), 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float dotResult11 = dot( ase_worldNormal , ase_worldlightDir );
			float4 temp_cast_21 = (( 1.0 - _CustomLightingStrength )).xxxx;
			float4 temp_cast_22 = (( 1.0 - _CustomLightingStrength )).xxxx;
			float4 temp_cast_23 = (1.0).xxxx;
			#if defined(_TOGGLECUSTOMLIGHTING_ON)
				float4 staticSwitch81 = max( SampleGradient( gradient117, saturate( (dotResult11*0.5 + 0.5) ) ) , temp_cast_21 );
			#elif defined(_TOGGLECUSTOMLIGHTING_OFF)
				float4 staticSwitch81 = temp_cast_23;
			#else
				float4 staticSwitch81 = max( SampleGradient( gradient117, saturate( (dotResult11*0.5 + 0.5) ) ) , temp_cast_21 );
			#endif
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			UnityGI gi18 = gi;
			float3 diffNorm18 = ase_worldNormal;
			gi18 = UnityGI_Base( data, 1, diffNorm18 );
			float3 indirectDiffuse18 = gi18.indirect.diffuse + diffNorm18 * 0.0001;
			float3 temp_cast_24 = (( 1.0 - _CustomLightingStrength )).xxx;
			float3 temp_cast_25 = (( 1.0 - _CustomLightingStrength )).xxx;
			float3 temp_cast_26 = (1.0).xxx;
			#if defined(_TOGGLECUSTOMLIGHTING_ON)
				float3 staticSwitch172 = max( ( ase_lightColor.rgb * ( indirectDiffuse18 + ase_lightAtten ) ) , temp_cast_24 );
			#elif defined(_TOGGLECUSTOMLIGHTING_OFF)
				float3 staticSwitch172 = temp_cast_26;
			#else
				float3 staticSwitch172 = max( ( ase_lightColor.rgb * ( indirectDiffuse18 + ase_lightAtten ) ) , temp_cast_24 );
			#endif
			float4 temp_output_32_0 = ( ( lerpResult274 * staticSwitch81 ) * float4( staticSwitch172 , 0.0 ) );
			c.rgb = temp_output_32_0.rgb;
			c.a = 1;
			clip( lerpResult170 - _CutoutStrength );
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
			float lerpResult174 = lerp( 0.0 , ( _CullMode + _ZWriteMode + _ZTestMode + ( _StencilReference + _StencilReadMask + _StencilWriteMask + ( _StencilComparison + _StencilPassFront + _StencilFailFront + _StencilZFailFront ) ) ) , 0.0);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 objectToClipDir87 = mul(UNITY_MATRIX_VP, mul(unity_ObjectToWorld, float4(ase_worldViewDir, 0.0)));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_worldToTangent = float3x3( ase_worldTangent, ase_worldBitangent, ase_worldNormal );
			float3 objectToTangentDir88 = mul( ase_worldToTangent, mul( unity_ObjectToWorld, float4( ase_worldViewDir, 0 ) ).xyz);
			#if defined(_OVERLAYRENDERING_VERTEX)
				float3 staticSwitch92 = float3( i.uv_texcoord ,  0.0 );
			#elif defined(_OVERLAYRENDERING_CLIP)
				float3 staticSwitch92 = objectToClipDir87;
			#elif defined(_OVERLAYRENDERING_TANGENT)
				float3 staticSwitch92 = objectToTangentDir88;
			#else
				float3 staticSwitch92 = float3( i.uv_texcoord ,  0.0 );
			#endif
			float2 appendResult91 = (float2(_OverlayTilingandOffset.x , _OverlayTilingandOffset.y));
			float2 appendResult90 = (float2(_OverlayTilingandOffset.z , _OverlayTilingandOffset.w));
			float3 temp_output_93_0 = (staticSwitch92*float3( appendResult91 ,  0.0 ) + float3( appendResult90 ,  0.0 ));
			float mulTime114 = _Time.y * _OverlaySpeed.x;
			float mulTime112 = _Time.y * _OverlaySpeed.y;
			float2 appendResult113 = (float2(mulTime114 , mulTime112));
			#if defined(_TOGGLEOVERLAYSPEED_ON)
				float3 staticSwitch116 = ( float3( ( appendResult113 * -0.1 ) ,  0.0 ) + temp_output_93_0 );
			#elif defined(_TOGGLEOVERLAYSPEED_OFF)
				float3 staticSwitch116 = temp_output_93_0;
			#else
				float3 staticSwitch116 = temp_output_93_0;
			#endif
			float4 tex2DNode73 = tex2D( _OverlayTex, staticSwitch116.xy );
			float4 temp_cast_6 = (tex2DNode73.a).xxxx;
			float4 lerpResult254 = lerp( tex2DNode73 , temp_cast_6 , _LerpOverlayTexAlpha);
			float mulTime97 = _Time.y * _OverlayFlickerSpeed;
			float temp_output_284_0 = ( _OverlayFlickerAmplitude * 0.5 );
			float4 lerpResult202 = lerp( lerpResult254 , ( lerpResult254 * ( ( sin( mulTime97 ) * temp_output_284_0 ) + ( temp_output_284_0 + _OverlayFlickerOffset ) ) ) , _LerpOverlayFlicker);
			float mulTime234 = _Time.y * _OverlayHueSpeed;
			float3 hsvTorgb237 = HSVToRGB( float3(mulTime234,_OverlayHueSaturation,_OverlayHueValue) );
			float4 lerpResult231 = lerp( _OverlayColor , float4( hsvTorgb237 , 0.0 ) , _LerpOverlayHue);
			float4 lerpResult203 = lerp( float4( 0,0,0,0 ) , ( lerpResult202 * lerpResult231 ) , _LerpOverlay);
			float grayscale277 = (lerpResult203.rgb.r + lerpResult203.rgb.g + lerpResult203.rgb.b) / 3;
			float4 temp_cast_9 = (grayscale277).xxxx;
			float4 lerpResult278 = lerp( lerpResult203 , temp_cast_9 , _LerpOverlayGrayscale);
			float dotResult5 = dot( ase_worldNormal , ase_worldViewDir );
			float mulTime249 = _Time.y * _RimLightHueSpeed;
			float3 hsvTorgb251 = HSVToRGB( float3(mulTime249,_RimLightHueSaturation,_RimLightHueValue) );
			float4 lerpResult245 = lerp( _RimLightColor , float4( hsvTorgb251 , 0.0 ) , _LerpRimLightHue);
			#if defined(_TOGGLERIMLIGHT_ON)
				float4 staticSwitch61 = ( saturate( ( 1.0 * pow( ( 1.0 - saturate( ( dotResult5 + _RimLightOffset ) ) ) , _RimLightPower ) ) ) * lerpResult245 );
			#elif defined(_TOGGLERIMLIGHT_OFF)
				float4 staticSwitch61 = float4( 0,0,0,0 );
			#else
				float4 staticSwitch61 = float4( 0,0,0,0 );
			#endif
			o.Emission = ( lerpResult174 + lerpResult278 + staticSwitch61 ).rgb;
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
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT( UnityGI, gi );
				o.Alpha = LightingStandardCustomLighting( o, worldViewDir, gi ).a;
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
    CustomEditor "ThryEditor"
}