Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2763968C
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 15:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E37810E146;
	Sat, 26 Nov 2022 14:39:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8978B10E143
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 14:39:14 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so10852058lfb.13
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 06:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2npeoW1fUYvgot8LGOdczcXpNyjWUXUEKt73WEmiAM=;
 b=y9PdNFgEdpOcvo1nWI9PTjNGq/DgMEyJBwKggVmJQMslyUvgKfY8DQt+eDaaD5NLxc
 pidH3J66+48Y7Ft0/cGJ02GDdOeC9hQLjmmxlUaE7LI6ZUJg9VzKYgSOmH3MLDc5EzeH
 FsbXECnOFOfxImvJW5q6jXS54VX0C3Uxak3HvGzeWx2tJ+vT/8SeQLVmZKc9Apnkm0r/
 eq+EgouUmvYTCRqut/TvGxJOjdLbRBY9CpjBDiOGfFB56AtkiNfa1VGvgybhEFi7U/6t
 qJrfbqU791YEtkaYp9nACehigIFzxEg/fPLQsm9+Xsn0QKtsGzQ0jMU1Uedv8KyVxsim
 vIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2npeoW1fUYvgot8LGOdczcXpNyjWUXUEKt73WEmiAM=;
 b=0GxcmMlpc4K3bijPHSFW/VCK+egvUpE9NU3oll4iMlearXmA8DG5NfBS78am80Hp6E
 J26/dn+VHX5NBMmBQhHw3Xnv8hb20hsWxsA4p2vdXKCfmKYmlYpgByDpuKUyLHNkxa1w
 AcfrnWPO6+fbWvf5ffJ2mFlBi7+U2nBvUzgBrYbaVpTWx2vPSBZY7JH5+0qVz0tyRDPi
 ZKEjbtZoKv92LwD8ptH12jn/ZVAMUAsm1Zt/BWPzUM9nSGyr+BO7N9DYFQF2wpxhORWY
 YtmDa0NyGiBALInV0rf0JzrOg/n6FEbCJFJg1/Ox3/MIZm1D+N+ZUi35ssLOml2PmNDv
 DdTQ==
X-Gm-Message-State: ANoB5pmIbYzSrS0sW8IK2luCJbSf2DJDzJiwAfzd7iJXVKejUSu7xTgw
 CqqklUj0/P2FYRmVUFQHeR/Mbg==
X-Google-Smtp-Source: AA0mqf6pIhEjjCxmaDZ1mnUD6cLA91tLZOX0a2JYnwJ60QhlMlhj5MG22U1/Fp5c+BCi+krhFIN10Q==
X-Received: by 2002:a05:6512:a88:b0:4a0:2b7b:3f27 with SMTP id
 m8-20020a0565120a8800b004a02b7b3f27mr14167476lfu.443.1669473552868; 
 Sat, 26 Nov 2022 06:39:12 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u4-20020ac248a4000000b0049944ab6895sm934026lfg.260.2022.11.26.06.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 06:39:12 -0800 (PST)
Message-ID: <130b23da-1cf5-126d-11b4-bffb766bd2eb@linaro.org>
Date: Sat, 26 Nov 2022 15:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-5-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 04/18] dt-bindings: msm:
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
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
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

You need to test the bindings before sending them. Such change needs
updates in examples.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml        | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 67d08dc338925..c4da7179999d2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -14,9 +14,20 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,qcm2290-dsi-ctrl

You need to mention changes to existing compatibles in the commit msg.

> +    items:
> +      - enum:
> +          - qcom,apq8064-dsi-ctrl
> +          - qcom,msm8916-dsi-ctrl
> +          - qcom,msm8974-dsi-ctrl
> +          - qcom,msm8996-dsi-ctrl
> +          - qcom,qcm2290-dsi-ctrl


Best regards,
Krzysztof

