Shader "Custom/Anaglyph" {
    Properties {
        _MainTex("MainTex", 2D) = ""{}
		_SubTex("SubTex", 2D) = ""{}
    }

    SubShader {
        Pass {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert_img
            #pragma fragment frag

            sampler2D _MainTex;
			sampler2D _SubTex;
			
            fixed4 frag(v2f_img i) : COLOR {
                fixed4 left = tex2D(_MainTex, i.uv);
				fixed4 right = tex2D(_SubTex, i.uv);
                float gray_left = left.r * 0.3 + left.g * 0.6 + left.b * 0.1;
				float gray_right = right.r * 0.3 + right.g * 0.6 + right.b * 0.1;
				left.rgb = fixed3(gray_left, gray_right, gray_right);
				return left;
            }

            ENDCG
        }
    }
}