Shader "Custom/Shader_Emission"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _Emission("Emission", Color) = (1,1,1,1)
    }
        SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert
        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;
        fixed4 _Emission;

        void surf(Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;

            o.Emission = _Emission.rgb;
        }
        ENDCG
    }
        FallBack "Diffuse"
}