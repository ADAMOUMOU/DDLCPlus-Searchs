Shader "Hidden/Blur" {
	Properties {
	}
	SubShader {
		Pass {
			ZWrite Off
			Cull Off
			GpuProgramID 31634
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
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[26];
						float _RenderViewportScaleFactor;
						vec4 unused_0_2[3];
					};
					in  vec3 in_POSITION0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec2 u_xlat0;
					void main()
					{
					    gl_Position.xy = in_POSITION0.xy;
					    gl_Position.zw = vec2(0.0, 1.0);
					    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, -0.5) + vec2(0.0, 1.0);
					    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
					    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, -0.5) + vec2(0.5, 0.5);
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
						vec4 unused_0_0[26];
						float _RenderViewportScaleFactor;
						vec4 unused_0_2;
						vec4 _MainTex_TexelSize;
						vec4 unused_0_4;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = u_xlat0 * vec4(_RenderViewportScaleFactor);
					    u_xlat1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0 = u_xlat0 + u_xlat1;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0 = u_xlat0 + u_xlat2;
					    u_xlat0 = u_xlat1 + u_xlat0;
					    u_xlat0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
					    SV_Target0 = min(u_xlat0, vec4(65504.0, 65504.0, 65504.0, 65504.0));
					    return;
					}"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 65765
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
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[28];
						vec4 _MainTex_TexelSize;
						float _Parameter;
					};
					in  vec3 in_POSITION0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec2 u_xlat0;
					vec2 u_xlat2;
					void main()
					{
					    gl_Position.xy = in_POSITION0.xy;
					    gl_Position.zw = vec2(0.0, 1.0);
					    u_xlat2.x = _Parameter;
					    u_xlat2.y = 1.0;
					    u_xlat0.xy = u_xlat2.xy * _MainTex_TexelSize.xy;
					    u_xlat2.x = 0.0;
					    u_xlat2.y = _Parameter;
					    vs_TEXCOORD1.xy = u_xlat2.xy * u_xlat0.xy;
					    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, -0.5) + vec2(0.0, 1.0);
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					vec4 ImmCB_0_0_0[7];
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					int u_xlati2;
					vec4 u_xlat3;
					bool u_xlatb6;
					vec2 u_xlat8;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(0.0205000006, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0855000019, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.231999993, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.324000001, 0.0, 0.0, 1.0);
						ImmCB_0_0_0[4] = vec4(0.231999993, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[5] = vec4(0.0855000019, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[6] = vec4(0.0205000006, 0.0, 0.0, 0.0);
					    u_xlat0.xy = (-vs_TEXCOORD1.xy) * vec2(3.0, 3.0) + vs_TEXCOORD0.xy;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlat8.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<7 ; u_xlati_loop_1++)
					    {
					        u_xlat3 = texture(_MainTex, u_xlat8.xy);
					        u_xlat1 = u_xlat3 * ImmCB_0_0_0[u_xlati_loop_1].xxxw + u_xlat1;
					        u_xlat8.xy = u_xlat8.xy + vs_TEXCOORD1.xy;
					    }
					    SV_Target0 = u_xlat1;
					    return;
					}"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 176706
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
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[28];
						vec4 _MainTex_TexelSize;
						float _Parameter;
					};
					in  vec3 in_POSITION0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec2 u_xlat0;
					vec2 u_xlat2;
					void main()
					{
					    gl_Position.xy = in_POSITION0.xy;
					    gl_Position.zw = vec2(0.0, 1.0);
					    u_xlat2.x = 1.0;
					    u_xlat2.y = _Parameter;
					    u_xlat0.xy = u_xlat2.xy * _MainTex_TexelSize.xy;
					    u_xlat2.x = _Parameter;
					    u_xlat2.y = 0.0;
					    vs_TEXCOORD1.xy = u_xlat2.xy * u_xlat0.xy;
					    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, -0.5) + vec2(0.0, 1.0);
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					vec4 ImmCB_0_0_0[7];
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					int u_xlati2;
					vec4 u_xlat3;
					bool u_xlatb6;
					vec2 u_xlat8;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(0.0205000006, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0855000019, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.231999993, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.324000001, 0.0, 0.0, 1.0);
						ImmCB_0_0_0[4] = vec4(0.231999993, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[5] = vec4(0.0855000019, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[6] = vec4(0.0205000006, 0.0, 0.0, 0.0);
					    u_xlat0.xy = (-vs_TEXCOORD1.xy) * vec2(3.0, 3.0) + vs_TEXCOORD0.xy;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlat8.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<7 ; u_xlati_loop_1++)
					    {
					        u_xlat3 = texture(_MainTex, u_xlat8.xy);
					        u_xlat1 = u_xlat3 * ImmCB_0_0_0[u_xlati_loop_1].xxxw + u_xlat1;
					        u_xlat8.xy = u_xlat8.xy + vs_TEXCOORD1.xy;
					    }
					    SV_Target0 = u_xlat1;
					    return;
					}"
				}
			}
		}
	}
}