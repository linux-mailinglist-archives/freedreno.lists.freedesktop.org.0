Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B538D6397B7
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 19:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6500E10E153;
	Sat, 26 Nov 2022 18:55:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D38010E153
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 18:55:36 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id bn5so8693117ljb.2
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 10:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VbCBADLIPXF7TNfiwageJ9mTDj5FI0xwrrvz+HsWwAg=;
 b=w09ks6qaH8b9qQcgi8GXTnBK8RyoaE6DXPbG5xAVAvux8WkSz/kSGitbaXvJPyZ+uG
 MYfsD3AI/uz4atcTYv+RmnTHGQhMYEoueEBUX30LJHj6gKSZo6Rj9iu4+GHy8SHVrrWr
 /aLZtM7uuZFPRdQmo8I4RJAtwEQp8hjAB1nCzQrJEnY7y82gWPH7xiThs6e3Ndf55aoW
 sMvlZxCjzrvHsYl4MnVC8jQLVbxv1S2QZuT0f40w6pw6M1Baht7/nr5wx3QdjbaoLiH1
 UkjKkR/wQWIBIkcId8h/hpNjkiLA+4qxpaLJQXaVRih+k1lJilukEbVYQPvPtBilQu4r
 Z7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VbCBADLIPXF7TNfiwageJ9mTDj5FI0xwrrvz+HsWwAg=;
 b=SM29EqPS/XlGyJO3uhjsrfDJZcrNaT71mN/BpGT3sq6SP+QOKsTTntOEKREz1C49eY
 t7AIfXdee+uQkUbCy6balqds3/Ov9srNXzFxO7SxcMIVgurABaEPdrWqne2iwJElN9JY
 /RAvk35WPQ6Ue/fVxREo74pnidJTW3pre/lhZdPGI2BIc5iltbUsJwN/caSoqnkj69au
 vQQXuSO8Tnp6OCFiY2Mag+Maa0C3B1U0JtFj62YDWwuj8WiRYJoHS8c5d8Lr0ucHY8Kq
 6yv4UhA1vUGQ2v/CEVaW9EvthDsEUZWUqKQ8HYUlsxIW9HWMtgC/EL9CU9Z53nrkq9ic
 +SgQ==
X-Gm-Message-State: ANoB5pnfC5HwChWn6zTGOK/g425v2X17KtjVVofVF39a+jsyzNaE99gS
 9SB5fAeOO6lOj2Xfx+hVvKrSOQ==
X-Google-Smtp-Source: AA0mqf5Kernurc3hkhUufFar+cj2qeo7AMUGpIxEazneIz/6FDqGsiX+Gx/zU89mp4LCOsCl1Pr3uA==
X-Received: by 2002:a2e:a263:0:b0:276:be89:5616 with SMTP id
 k3-20020a2ea263000000b00276be895616mr7615840ljm.347.1669488934794; 
 Sat, 26 Nov 2022 10:55:34 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05651c125300b00267232d0652sm748076ljh.46.2022.11.26.10.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:55:34 -0800 (PST)
Message-ID: <1bb5309f-8e77-16bd-630a-707228e5dacc@linaro.org>
Date: Sat, 26 Nov 2022 20:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-5-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 04/18] dt-bindings: msm:
 dsi-controller-main: Add compatible strings for every current SoC
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 swboyd@chromium.org, airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm630-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> 
> Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../display/msm/dsi-controller-main.yaml      | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 67d08dc338925..0cd2079137b02 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -14,9 +14,20 @@ allOf:
>   
>   properties:
>     compatible:
> -    enum:
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,qcm2290-dsi-ctrl
> +    items:
> +      - enum:
> +          - qcom,apq8064-dsi-ctrl
> +          - qcom,msm8916-dsi-ctrl
> +          - qcom,msm8974-dsi-ctrl
> +          - qcom,msm8996-dsi-ctrl
> +          - qcom,qcm2290-dsi-ctrl
> +          - qcom,sc7180-dsi-ctrl
> +          - qcom,sc7280-dsi-ctrl
> +          - qcom,sdm630-dsi-ctrl
> +          - qcom,sdm660-dsi-ctrl
> +          - qcom,sdm845-dsi-ctrl
> +          - qcom,sm8250-dsi-ctrl
> +      - const: qcom,mdss-dsi-ctrl
>   
>     reg:
>       maxItems: 1
> @@ -146,7 +157,7 @@ examples:
>        #include <dt-bindings/power/qcom-rpmpd.h>
>   
>        dsi@ae94000 {
> -           compatible = "qcom,mdss-dsi-ctrl";
> +           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";

Other examples (from qcom,SOC-mdss.yaml) also must be updated.

>              reg = <0x0ae94000 0x400>;
>              reg-names = "dsi_ctrl";
>   

-- 
With best wishes
Dmitry

