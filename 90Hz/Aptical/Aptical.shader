//Made by 90Hz with the Amplify Shader Editor in Unity 2018 at the 2022.06.02
Shader "90Hz/Aptical v1.3"
{
	Properties
	{
		[HideInInspector] shader_is_using_thry_editor("", Float) = 0
		[HideInInspector] shader_master_label("<color=#8100FF><b>90Hz Aptical Shader v1.3</b></color>", Float) = 0
		[Helpbox]_WarnBox("Public Shader | Based on the old Equation Shader", Float) = 0
		[HideInInspector] m_start_shader("Shader Settings --{is_hideable:true}", Float) = 0
			[HideInInspector] m_start_main("Main Options --{is_hideable:true}", Float) = 0
				[HDR]_MainColor("Main Color", Color) = (1,1,1,0)
				[NoScaleOffset][SingleLineTexture]_MainTex("MainTex", 2D) = "white" {}
				_MainTilingandOffset("Main Tiling and Offset", Vector) = (1,1,0,0)
				_CutoutStrength("Cutout Strength", Float) = 0
				[KeywordEnum(Vertex,Clip,Tangent)] _MainRendering("Main Rendering", Float) = 0
			[HideInInspector] m_end_main("Main Options", Float) = 0
			[HideInInspector] m_start_light("Light Options --{is_hideable:true}", Float) = 0
				[KeywordEnum(On,Off)] _ToggleCustomLighting("Toggle CustomLighting", Float) = 0
				_CustomLightingStrength("CustomLighting Strength", Range(0 , 1)) = 0.5
			[HideInInspector] m_end_light("Light Options", Float) = 0
			[HideInInspector] m_start_rimlight("RimLight Options --{is_hideable:true}", Float) = 0
				[KeywordEnum(On,Off)] _ToggleRimLight("Toggle RimLight", Float) = 1
				[HDR]_RimColor("Rim Color", Color) = (0,1,0,0)
				_RimPower("Rim Power", Range(0 , 10)) = 0
				_RimOffset("Rim Offset", Float) = 0
			[HideInInspector] m_end_rimlight("RimLight Options", Float) = 0
			[HideInInspector] m_start_overlay("Overlay Options --{is_hideable:true}", Float) = 0
				[KeywordEnum(On,Off)] _ToggleOverlayDiffuse("Toggle Overlay Diffuse", Float) = 1
				[KeywordEnum(Diffuse,Emission)] _OverlayLayerRendering("Overlay Layer Rendering", Float) = 0
				[HDR]_OverlayColor("Overlay Color", Color) = (1,1,1,0)
				[NoScaleOffset][SingleLineTexture]_OverlayTex("OverlayTex", 2D) = "white" {}
				_OverlayTilingandOffset("Overlay Tiling and Offset", Vector) = (1,1,0,0)
				[KeywordEnum(On,Off)] _ToggleOverlaySpeed("Toggle Overlay Speed", Float) = 1
				_OverlaySpeed("Overlay Speed", Vector) = (0,0,0,0)
				[KeywordEnum(Vertex,Clip,Tangent)] _OverlayRendering("Overlay Rendering", Float) = 0
				[KeywordEnum(On,Off)] _ToggleOverlayFlicker("Toggle Overlay Flicker", Float) = 1
				_OverlayFlickerAmplitude("Overlay Flicker Amplitude", Float) = 1
				_OverlayFlickerOffset("Overlay Flicker Offset", Float) = 0.5
				_OverlayFlickerSpeed("Overlay Flicker Speed", Float) = 1
			[HideInInspector] m_end_overlay("Overlay Options", Float) = 0
			[HideInInspector] m_start_outline("Outline Options --{is_hideable:true}", Float) = 0
				[HDR]_OutlineColor("Outline Color", Color) = (0,0,0,0)
				_OutliceScale("Outlice Scale", Float) = 0
				_OutlineAlpha("Outline Alpha", Range( 0 , 1)) = 0
			[HideInInspector] m_end_outline("Outline Options", Float) = 0
			[HideInInspector] m_start_rendering("Rendering Options --{is_hideable:true}", Float) = 0
				[Enum(Back,0,Front,1,Off,2)]_CullMode("Cull Mode", Float) = 2
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

		[HideInInspector] footer_discord("{texture:{name:DiscordIcon,height:32},action:{type:URL,data:https://discord.gg/w2jwhn5hj4},hover:My Discord Server}", Float) = 0
		
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
			o.Emission = _OutlineColor.rgb;
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
		#pragma shader_feature _OVERLAYLAYERRENDERING_DIFFUSE _OVERLAYLAYERRENDERING_EMISSION
		#pragma shader_feature _TOGGLEOVERLAYFLICKER_ON _TOGGLEOVERLAYFLICKER_OFF
		#pragma shader_feature _TOGGLEOVERLAYSPEED_ON _TOGGLEOVERLAYSPEED_OFF
		#pragma shader_feature _OVERLAYRENDERING_VERTEX _OVERLAYRENDERING_CLIP _OVERLAYRENDERING_TANGENT
		#pragma shader_feature _TOGGLEOVERLAYDIFFUSE_ON _TOGGLEOVERLAYDIFFUSE_OFF
		#pragma shader_feature _MAINRENDERING_VERTEX _MAINRENDERING_CLIP _MAINRENDERING_TANGENT
		#pragma shader_feature _TOGGLECUSTOMLIGHTING_ON _TOGGLECUSTOMLIGHTING_OFF
		#pragma shader_feature _TOGGLERIMLIGHT_ON _TOGGLERIMLIGHT_OFF
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

		uniform sampler2D _OverlayTex;
		uniform float4 _OverlayTilingandOffset;
		uniform float2 _OverlaySpeed;
		uniform float _OverlayFlickerSpeed;
		uniform float _OverlayFlickerAmplitude;
		uniform float _OverlayFlickerOffset;
		uniform float4 _OverlayColor;
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
		uniform sampler2D _MainTex;
		uniform float _CutoutStrength;
		uniform float4 _MainTilingandOffset;
		uniform float4 _MainColor;
		uniform float _CustomLightingStrength;
		uniform float _RimOffset;
		uniform float _RimPower;
		uniform float4 _RimColor;
		uniform float4 _OutlineColor;
		uniform float _OutlineAlpha;
		uniform float _OutliceScale;


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
			float4 temp_output_38_0 = ( tex2D( _MainTex, (staticSwitch40*float3( appendResult69 ,  0.0 ) + float3( appendResult70 ,  0.0 )).xy ) * _MainColor );
			float3 objectToClipDir87 = mul(UNITY_MATRIX_VP, mul(unity_ObjectToWorld, float4(ase_worldViewDir, 0.0)));
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
				float3 staticSwitch116 = ( float3( appendResult113 ,  0.0 ) + temp_output_93_0 );
			#elif defined(_TOGGLEOVERLAYSPEED_OFF)
				float3 staticSwitch116 = temp_output_93_0;
			#else
				float3 staticSwitch116 = temp_output_93_0;
			#endif
			float4 tex2DNode73 = tex2D( _OverlayTex, staticSwitch116.xy );
			float mulTime97 = _Time.y * _OverlayFlickerSpeed;
			#if defined(_TOGGLEOVERLAYFLICKER_ON)
				float4 staticSwitch108 = ( tex2DNode73 * (( sin( mulTime97 ) / 2.0 )*_OverlayFlickerAmplitude + _OverlayFlickerOffset) );
			#elif defined(_TOGGLEOVERLAYFLICKER_OFF)
				float4 staticSwitch108 = tex2DNode73;
			#else
				float4 staticSwitch108 = tex2DNode73;
			#endif
			float4 temp_output_74_0 = ( staticSwitch108 * _OverlayColor );
			#if defined(_TOGGLEOVERLAYDIFFUSE_ON)
				float4 staticSwitch80 = ( temp_output_38_0 + temp_output_74_0 );
			#elif defined(_TOGGLEOVERLAYDIFFUSE_OFF)
				float4 staticSwitch80 = temp_output_38_0;
			#else
				float4 staticSwitch80 = temp_output_38_0;
			#endif
			#if defined(_OVERLAYLAYERRENDERING_DIFFUSE)
				float4 staticSwitch71 = staticSwitch80;
			#elif defined(_OVERLAYLAYERRENDERING_EMISSION)
				float4 staticSwitch71 = temp_output_38_0;
			#else
				float4 staticSwitch71 = staticSwitch80;
			#endif
			Gradient gradient117 = NewGradient( 0, 3, 2, float4( 0, 0, 0, 0 ), float4( 0, 0, 0, 0.1294118 ), float4( 1, 1, 1, 1 ), 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float dotResult11 = dot( ase_worldNormal , ase_worldlightDir );
			float4 temp_cast_24 = (( 1.0 - _CustomLightingStrength )).xxxx;
			float4 temp_cast_25 = (( 1.0 - _CustomLightingStrength )).xxxx;
			float4 temp_cast_26 = (1.0).xxxx;
			#if defined(_TOGGLECUSTOMLIGHTING_ON)
				float4 staticSwitch81 = max( SampleGradient( gradient117, saturate( (dotResult11*0.5 + 0.5) ) ) , temp_cast_24 );
			#elif defined(_TOGGLECUSTOMLIGHTING_OFF)
				float4 staticSwitch81 = temp_cast_26;
			#else
				float4 staticSwitch81 = max( SampleGradient( gradient117, saturate( (dotResult11*0.5 + 0.5) ) ) , temp_cast_24 );
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
			float4 temp_cast_28 = (( 1.0 - _CustomLightingStrength )).xxxx;
			float4 temp_cast_30 = (( 1.0 - _CustomLightingStrength )).xxxx;
			float4 temp_cast_31 = (1.0).xxxx;
			#if defined(_TOGGLECUSTOMLIGHTING_ON)
				float4 staticSwitch172 = max( ( ase_lightColor * float4( ( indirectDiffuse18 + ase_lightAtten ) , 0.0 ) ) , temp_cast_28 );
			#elif defined(_TOGGLECUSTOMLIGHTING_OFF)
				float4 staticSwitch172 = temp_cast_31;
			#else
				float4 staticSwitch172 = max( ( ase_lightColor * float4( ( indirectDiffuse18 + ase_lightAtten ) , 0.0 ) ) , temp_cast_28 );
			#endif
			#if defined(_TOGGLECUSTOMLIGHTING_ON)
				float staticSwitch83 = ( ase_lightAtten * dotResult11 );
			#elif defined(_TOGGLECUSTOMLIGHTING_OFF)
				float staticSwitch83 = 1.0;
			#else
				float staticSwitch83 = ( ase_lightAtten * dotResult11 );
			#endif
			float dotResult5 = dot( ase_worldNormal , ase_worldViewDir );
			float4 temp_cast_32 = (( 1.0 - _CustomLightingStrength )).xxxx;
			float4 temp_cast_33 = (( 1.0 - _CustomLightingStrength )).xxxx;
			#if defined(_TOGGLECUSTOMLIGHTING_ON)
				float4 staticSwitch195 = ( _RimColor * max( ase_lightColor , temp_cast_32 ) );
			#elif defined(_TOGGLECUSTOMLIGHTING_OFF)
				float4 staticSwitch195 = _RimColor;
			#else
				float4 staticSwitch195 = ( _RimColor * max( ase_lightColor , temp_cast_32 ) );
			#endif
			#if defined(_TOGGLERIMLIGHT_ON)
				float4 staticSwitch61 = ( saturate( ( staticSwitch83 * pow( ( 1.0 - saturate( ( dotResult5 + _RimOffset ) ) ) , _RimPower ) ) ) * staticSwitch195 );
			#elif defined(_TOGGLERIMLIGHT_OFF)
				float4 staticSwitch61 = float4( 0,0,0,0 );
			#else
				float4 staticSwitch61 = float4( 0,0,0,0 );
			#endif
			c.rgb = ( ( ( staticSwitch71 * staticSwitch81 ) * staticSwitch172 ) + staticSwitch61 ).rgb;
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
			float4 temp_cast_0 = (0.0).xxxx;
			float4 temp_cast_1 = (0.0).xxxx;
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
				float3 staticSwitch116 = ( float3( appendResult113 ,  0.0 ) + temp_output_93_0 );
			#elif defined(_TOGGLEOVERLAYSPEED_OFF)
				float3 staticSwitch116 = temp_output_93_0;
			#else
				float3 staticSwitch116 = temp_output_93_0;
			#endif
			float4 tex2DNode73 = tex2D( _OverlayTex, staticSwitch116.xy );
			float mulTime97 = _Time.y * _OverlayFlickerSpeed;
			#if defined(_TOGGLEOVERLAYFLICKER_ON)
				float4 staticSwitch108 = ( tex2DNode73 * (( sin( mulTime97 ) / 2.0 )*_OverlayFlickerAmplitude + _OverlayFlickerOffset) );
			#elif defined(_TOGGLEOVERLAYFLICKER_OFF)
				float4 staticSwitch108 = tex2DNode73;
			#else
				float4 staticSwitch108 = tex2DNode73;
			#endif
			float4 temp_output_74_0 = ( staticSwitch108 * _OverlayColor );
			#if defined(_OVERLAYLAYERRENDERING_DIFFUSE)
				float4 staticSwitch72 = temp_cast_0;
			#elif defined(_OVERLAYLAYERRENDERING_EMISSION)
				float4 staticSwitch72 = temp_output_74_0;
			#else
				float4 staticSwitch72 = temp_cast_0;
			#endif
			float4 temp_cast_8 = (( _CullMode + _ZWriteMode + _ZTestMode + ( _StencilReference + _StencilReadMask + _StencilWriteMask + ( _StencilComparison + _StencilPassFront + _StencilFailFront + _StencilZFailFront ) ) )).xxxx;
			float4 lerpResult174 = lerp( staticSwitch72 , temp_cast_8 , float4( 0,0,0,0 ));
			o.Emission = lerpResult174.rgb;
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