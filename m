Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCAB718F73
	for <lists+freedreno@lfdr.de>; Thu,  1 Jun 2023 02:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFD510E1EF;
	Thu,  1 Jun 2023 00:16:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8946F10E0F9
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jun 2023 00:16:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f4b80bf93aso149769e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 17:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685578613; x=1688170613;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sxTX4X4YKUtqwPm+hbV1ZZouN5cpgVgg+LAtjb8cK/I=;
 b=i9rKVnU4m6dI91mhR4zJ7ZW0TQwWjSH3HQMaugd8Y1bpUQYDRiw8b1AKA1sRS0A2FR
 6ZlvU5hW6bsSlbITaHTAI4Ekc9LVT3bVmo6OG4/+itIrrEmHfi9hDdtcfJ6z5aza7qqo
 y42Dn/E/BTVRqI35zv1N2oRcF/9JKrRh+TzhMp79w/spWSvGmmGQw8QuqikBPv8ZWAa+
 iaByBCuzR95pTcAmIWvopqsuDc9/GyQg82VQQeOlm1ciEFrimZht9pExjh9PccrerdFr
 VkpsNgXLe8doQ1rNuozfbkhclKq/tTkgrJA+mq5pjmMGQ/hA2cz/b1dEBGMcqRt4htI6
 eFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685578613; x=1688170613;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sxTX4X4YKUtqwPm+hbV1ZZouN5cpgVgg+LAtjb8cK/I=;
 b=XprQbu/u3b7IsURdu64jhiD0uWcqMEPofxpGi4SwvS2+r/8nyRGW3IAJOVPt8x8Ktw
 RiTPraKdFG4xTnhmyYCWs8JJ7z3+9uRaXISQlr4/bFo8TYToFjseZ5QBqghQlIYqZ2jJ
 zO72RGpSTuXzC7gQBB7YevCEyZzmQiFmsbf+gz768xyWfIIg9zQ//7YE9mGREjtMJfN7
 mfUMZYVNiQrytHQ3p8p61J5cF4g6Hz0jyHNzaL9g4RgGlhkbOB1fXtMB1+D26J5ZfPFl
 cSYKrD4XpotSFPdsRcFg7gfVbZOQ2ET2ZjKGQde7+GDB+jzVCufJaCqqRcwxvxAXyKi7
 wToQ==
X-Gm-Message-State: AC+VfDw9a3FYYfGBpHwCQV7/vhKlEHGSUQzz5uL5hQr04IBlRU2WMA7x
 cUgg8URP+2N/60vqBJ+183l+BQ==
X-Google-Smtp-Source: ACHHUZ5Q3u+SzRMFGtrtDBvEpZJ6S83Uw7/xbtquC1ZjKTF0POh8B99t3GmLNjPbhZJsD3vRnrpdEw==
X-Received: by 2002:ac2:4466:0:b0:4f1:43de:7c3 with SMTP id
 y6-20020ac24466000000b004f143de07c3mr267149lfl.51.1685578613308; 
 Wed, 31 May 2023 17:16:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f139712835sm889366lfh.293.2023.05.31.17.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 17:16:52 -0700 (PDT)
Message-ID: <0fbe5ddb-c3de-0724-fb69-a99e4980b26c@linaro.org>
Date: Thu, 1 Jun 2023 03:16:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 00/12] SM63(50|75) DPU support
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/05/2023 10:46, Konrad Dybcio wrote:

[skipped the changelog]

> ---
> Konrad Dybcio (12):
>        dt-bindings: display/msm: dsi-controller-main: Add SM6350
>        dt-bindings: display/msm: dsi-controller-main: Add SM6375
>        dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
>        dt-bindings: display/msm: Add SM6350 MDSS
>        dt-bindings: display/msm: Add SM6375 MDSS
>        drm/msm/dpu: Add SM6350 support
>        drm/msm: mdss: Add SM6350 support
>        drm/msm/dpu: Add SM6375 support
>        drm/msm: mdss: Add SM6375 support
>        iommu/arm-smmu-qcom: Sort the compatible list alphabetically
>        iommu/arm-smmu-qcom: Add SM6375 DPU compatible
>        iommu/arm-smmu-qcom: Add SM6350 DPU compatible

As we are now nearly ready to merge this series, Will, Robin, what 
should be the merge strategy for these three patches? Would you take 
them through the arm-smmu/iommu tree?

> 
>   .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
>   .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  23 ++-
>   .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 ++++++++++++++++++++
>   .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 173 +++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 139 +++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>   drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   6 +-
>   11 files changed, 792 insertions(+), 3 deletions(-)
> ---
> base-commit: 9f925874281f7e8855855d6210d6e29d844e4307
> change-id: 20230411-topic-straitlagoon_mdss-8f34cacd5e26
> 
> Best regards,

-- 
With best wishes
Dmitry

