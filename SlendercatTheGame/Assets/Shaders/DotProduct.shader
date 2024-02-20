Shader "Custom/DotProduct"
{
    Properties
    {
        //_Color("Color", Color) = (1,1,1,1)
        //_Emission("Emission", Color) = (1,1,1,1)
        _RimColor("RimColor", Color) = (1,1,1,1)
        _RimSlider("RimSlider", Range(0,1)) = 1
        _MainTex("Textura", 2D) = "white"{}
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
            float3 viewDir; //Dirección de la cámara, hacia dónde está apuntando la cámara
        };
        /*fixed4 _Color;
        fixed4 _Emission;*/
        float4 _RimColor;
        half _RimSlider;

        void surf (Input IN, inout SurfaceOutput o)
        {
            /*half dotp = 1 - dot(IN.viewDir, o.Normal); 
            o.Albedo = float3(1, dotp, 1);*/
            half rim = 1 - (dot(normalize(IN.viewDir), o.Normal));  
            o.Emission = _RimColor.rgb * pow(rim,3);
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            //o.Emission = _Emission.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
