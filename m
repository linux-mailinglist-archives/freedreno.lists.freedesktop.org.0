Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CAC66380C
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 05:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D30010E526;
	Tue, 10 Jan 2023 04:18:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941D810E0DE
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jan 2023 04:18:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f34so16352436lfv.10
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 20:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BAbrvIDX21sORhEpMRKBFBGE1ijyHzGfQa4j/vy210g=;
 b=wVcLbz6qKAkEDzLBDbrj0XoNmBd3D66kdBI5sin4HTu/Q65cWDdf5OCsrbv/Li4IOa
 QObJZ6e4KFlS1s1X9cUiYRj9xcSWnXCOqbXzoV8bllvVNnB837Gqs2zgyFd6MnyEaaQ1
 ovKJW8NUZZ2r/23tlF1yuvUBJpMoetpJzHrdsoKtvoEl7lw9k0fkJmq/plYMp5TjZ6Jt
 15NHN6kLVgt1aHPiosoYWouMabAQw5dcmLFgCKOqVfYI/JRu8Ch2m++wjbIb9rkaBZHF
 rL+g1xgixhUZ+AHUpQfxu7K3iu7kQGeyqqsQnOkQX+0tptqoNocsm6pLS6PpUybla9Sx
 VYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAbrvIDX21sORhEpMRKBFBGE1ijyHzGfQa4j/vy210g=;
 b=26YKiNFr/PNSrYw2BfsUUHsP8DUe26qdwNO+uqpsCbTmUzo/gDPJieiOgYVYGoP0xI
 x+OpHkq8ozamMqwUF4ObVHVLDA3gkCW7wVNtHgXWc7ByNkN5xuEtp/USURXO+0rhUvC0
 Jjenj5sIGKj0xMt1Cvk8uKldIxtebRAV3ENIhNQ1qK1mderZCmJIgt4kXo59j/sMWTFF
 qiGBS5AhnfjASFgyHH7T4YP7qUgC4+ZXr3dvrH7nlkfRAdIa0XAM3kRK3f1hkg/q+4sT
 x+ziqjlHYFnTS7BTuSfktD0ClZTIbpt/wUPcUeqN0Ki4QyD3SV2OfF79rnjjHqMsAzVt
 kR+g==
X-Gm-Message-State: AFqh2kpqYFqkg2bpVc2YDTEAq26BVJpQPd1gP3pZL2JqR5A2SOlGFGsi
 D1FdM0lznlVLfS1XelTlX27kvQ==
X-Google-Smtp-Source: AMrXdXtGqxB5FWKeH4Hz54MIYp9cdc9vjkF+6IIeAl9xo/p4w1nnxoIC8iPDN9GOhuEaFdyvoT1vjw==
X-Received: by 2002:a05:6512:65:b0:4cb:4438:30a3 with SMTP id
 i5-20020a056512006500b004cb443830a3mr674653lfo.53.1673324288764; 
 Mon, 09 Jan 2023 20:18:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a056512200d00b004c57abccb8bsm1956949lfb.102.2023.01.09.20.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 20:18:08 -0800 (PST)
Message-ID: <e8f80539-f253-a6f7-3c5e-e6c94dac31c2@linaro.org>
Date: Tue, 10 Jan 2023 06:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <167330408777.609993.13359003796525315964.b4-ty@linaro.org>
In-Reply-To: <167330408777.609993.13359003796525315964.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 0/7] drm/msm: add support for SM8550
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/01/2023 01:43, Dmitry Baryshkov wrote:
> 
> On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
>> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
>>
>> This patchset is based on the SM8450 display support serie at [1].
>>
>> In order to work, the following patchsets are required:
>> - PM8550 LDO fix at [2]
>> - DISPCC driver at [3]
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/7] dt-bindings: display/msm: document the SM8550 DSI PHY
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/71917f654bae
> [2/7] dt-bindings: display/msm: document DPU on SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/602082368233

These two patches were removed for now, until we have dispcc and 
interconnect bindings in place.

> [3/7] dt-bindings: display/msm: document MDSS on SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/9cb8eacfb528
> [4/7] drm/msm/dpu: add support for SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/c3cc4e88efb0
> [5/7] drm/msm: mdss: add support for SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/f96cca5ed719
> [6/7] drm/msm/dsi: add support for DSI-PHY on SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/0fd17f93661d
> [7/7] drm/msm/dsi: add support for DSI 2.7.0
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/d797ca161b87
> 
> Best regards,

-- 
With best wishes
Dmitry

