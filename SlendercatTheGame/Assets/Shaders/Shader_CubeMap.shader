Shader "Custom/Shader_CubeMap"
{
    Properties
    {
        _MyTex("Albedo", 2D) = "white"{}
        _MyNormal("Normal", Range(0,10)) = 1
        _MyCube("Cube Map", CUBE) = "white"{}
    }

        SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        sampler2D _MyTex;
        samplerCUBE _MyCube;
        half _MyNormal;

        struct Input
        {
            float2 uv_MyTex;
            float3 worldRefl; INTERNAL_DATA
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MyTex, IN.uv_MyTex).rgb;
            o.Normal.xy += _MyNormal;
            o.Emission = texCUBE(_MyCube, WorldReflectionVector(IN,o.Normal)).rgb;
        }
        ENDCG
    }
        FallBack "Diffuse"
}
