Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F67F9305
	for <lists+freedreno@lfdr.de>; Sun, 26 Nov 2023 15:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0330910E0B0;
	Sun, 26 Nov 2023 14:17:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE1410E0B0
 for <freedreno@lists.freedesktop.org>; Sun, 26 Nov 2023 14:17:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b2ddab817so23609885e9.3
 for <freedreno@lists.freedesktop.org>; Sun, 26 Nov 2023 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701008255; x=1701613055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QcndzPm7z338RHK94VwEZXvnKMZos/UvhLkmjn4xC/Q=;
 b=kL7nrL+emRswmKsNq9ITp4O/Eb3/Ay6oYEs4Zfhh6GgOenzbGTBbxz3Zt8LbLeQwya
 f8tQJDH7xx3L0ap4yFj0665no0p3L9xGzLueBX1/P3PwevvvhwAu9mB7kuaSnQvR0Utt
 Blu/OhrJKEWdrOkm9nM4suo7JSPUyOvn7xlRPBeS/qF0c6NjurEoiV5noeW16k1INW1c
 ihSNrLi5uvG0MbhSSoSONHhFmkjWDe2Kutupcg19Zs8L18XqBcb+Bugyk6ef2KJHxVYG
 OCfcVmYaR6Tu5sXxbBPJCvc79faB3HSuE5kCw/xQWGe3YlOdzPrJKqbOaJSpuOiqtbjG
 qFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701008255; x=1701613055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QcndzPm7z338RHK94VwEZXvnKMZos/UvhLkmjn4xC/Q=;
 b=L9DGvfKq4Ou7WfLUGA+55iZ2Yir4zDzlZXIEpSnhI3irTrL8jKGFgL2VgoNnncq+3W
 jOYOpXSdAS+X+a4GFX/crj3NvE448pVQxyyTOJbZ1ALyBmb2p8n8ASFm/ERGqh53AQWx
 Y+SfKhrwvjumTNGvK0FAoWfXcxgkDBifoCW6CacVJ6by0WYm/BbFiwtETWnpXZzOiJYK
 50hTHhttyaT7tIJpHCtRdmF4VVVlleB7e9iZLlCwkOP2ah9vMEMjs2PmsRNaCnXJQ289
 WKMQLb92bwRQKmcXNznXoJLKHfEvN/sGyz4wSRpzxWHJ4tYFfrCrBHtPGCOm0qUROlRV
 uXRA==
X-Gm-Message-State: AOJu0Yyc/Wfa6kivO6InT8WLM7L9qoFTCuGOPo/WNCtIkuZfbZaiqV4E
 g+T+RLeKX2w+mY0TH3J9bao8Uw==
X-Google-Smtp-Source: AGHT+IGkk9pdn9r7g1J1o/fcsxC78jPge+mZy3lXPIb8wrgrQCxYQ08bQdBSvKnCzAF2mipxLo0QBg==
X-Received: by 2002:a05:600c:154f:b0:40b:3dbf:f39 with SMTP id
 f15-20020a05600c154f00b0040b3dbf0f39mr2924922wmg.37.1701008254426; 
 Sun, 26 Nov 2023 06:17:34 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b004064cd71aa8sm10565101wmq.34.2023.11.26.06.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 06:17:33 -0800 (PST)
Message-ID: <1dce7a79-be67-4d44-b03f-63ef5cbb78e3@linaro.org>
Date: Sun, 26 Nov 2023 14:17:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
 <20231125-topic-rb1_feat-v1-1-11d71b12b058@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-1-11d71b12b058@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 01/12] dt-bindings: display: msm:
 qcm2290-mdss: Use the non-deprecated DSI compat
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/11/2023 14:17, Konrad Dybcio wrote:
> The "qcom,dsi-ctrl-6g-qcm2290" has been deprecated in commit 0c0f65c6dd44
> ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every
> current SoC"), but the example hasn't been updated to reflect that.
> 
> Fix that.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> index 5ad155612b6c..3d82c00a9f85 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -56,7 +56,9 @@ patternProperties:
>   
>       properties:
>         compatible:
> -        const: qcom,dsi-ctrl-6g-qcm2290
> +        items:
> +          - const: qcom,qcm2290-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl
>   
>     "^phy@[0-9a-f]+$":
>       type: object
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
