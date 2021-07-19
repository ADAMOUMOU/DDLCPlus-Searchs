Shader "DDLC/ImageDissolve" {
	Properties {
		_FromTex ("From", 2D) = "white" {}
		_ToTex ("To", 2D) = "white" {}
		_AlphaTex ("AlphaMask", 2D) = "white" {}
		_T ("Time", Float) = 0
		_Ramplen ("Ramplen", Float) = 8
	}
	SubShader {
		LOD 100
		Tags { "RenderType" = "Opaque" }
		Pass {
			LOD 100
			Tags { "RenderType" = "Opaque" }
			GpuProgramID 32308
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    phase0_Output0_0 = in_TEXCOORD0.xyxy;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD1 = phase0_Output0_0.zw;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _T;
						int _Ramplen;
					};
					uniform  sampler2D _FromTex;
					uniform  sampler2D _ToTex;
					uniform  sampler2D _AlphaTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlati0 = max(_Ramplen, 1);
					    u_xlati0 = min(u_xlati0, 256);
					    u_xlat0 = float(u_xlati0);
					    u_xlat3 = u_xlat0 * 0.00390625 + 1.0;
					    u_xlat0 = u_xlat0 * 0.00390625;
					    u_xlat3 = (-_T) * u_xlat3 + 1.0;
					    u_xlat1 = texture(_AlphaTex, vs_TEXCOORD1.xy);
					    u_xlat3 = (-u_xlat3) + u_xlat1.x;
					    u_xlat0 = u_xlat3 / u_xlat0;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat1 = texture(_ToTex, vs_TEXCOORD0.xy);
					    u_xlat2 = texture(_FromTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 + (-u_xlat2);
					    SV_Target0 = vec4(u_xlat0) * u_xlat1 + u_xlat2;
					    return;
					}"
				}
			}
		}
	}
}