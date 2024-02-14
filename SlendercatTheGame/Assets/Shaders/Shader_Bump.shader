Shader "Custom/Shader_Bump"
{
    Properties
    {
        _MyTex("Albedo", 2D) = "white"{}
        _MyBump("Bump Texture", 2D) = "bump"{}
        _MyNormal("Normal", Range(0,10)) = 1
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MyBump;
        sampler2D _MyTex;
        half _MyNormal;

        struct Input
        {
            float2 uv_MyTex;
            float2 uv_MyBump;
            float3 worldRefl; INTERNAL_DATA
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = tex2D(_MyTex, IN.uv_MyTex).rgb;
            o.Normal = UnpackNormal(tex2D(_MyBump, IN.uv_MyBump));
        }
        ENDCG
    }
    FallBack "Diffuse"
}
