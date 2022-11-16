Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABA62C23F
	for <lists+freedreno@lfdr.de>; Wed, 16 Nov 2022 16:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4010E4C2;
	Wed, 16 Nov 2022 15:18:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AE610E4C2
 for <freedreno@lists.freedesktop.org>; Wed, 16 Nov 2022 15:18:40 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a15so22199284ljb.7
 for <freedreno@lists.freedesktop.org>; Wed, 16 Nov 2022 07:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=he8mFZOBs1BvDVjn5opl2MtZ0ur6XPJl6SpGq2658M8=;
 b=vwMTJ5pIkGEoaz0oXODpU2Ez3BIxpc2QEfeB7VT+/2pa2GZsfVgBeg4hm0F5E8wjqR
 PFCsrOrIlX/Ni6yTgehE031bVkTkdQdJ8vdHZpLDaOFxxvOUtT/qOWMsvDe3MhEnqq9F
 HmehlVfaKvICqRnu0pe2ftMIdJ6bXdmkTQy4BGMhhHZS50rRbid8B+kvpSAGoDAFt4ad
 OjaktdrUe6SP1lYfz/siC2YQAqabqgOyt+OxrdsucT4/IG/JEBZsOvMVwVW+6xjgQR+e
 iTBeu//obUbrkYyxRFxrvNNAsK9y24c7cD2wyXrUAOQvejlemS1JUmoOjPIeF5nimHnO
 b8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=he8mFZOBs1BvDVjn5opl2MtZ0ur6XPJl6SpGq2658M8=;
 b=47aarNEsMJ0EJTQPu7KsCsYX2FWFkT24l/HYFktOdxO2EPu85YERnHsj8xuuk4Q4Tw
 cDpMg182AqoR6X4upJ7yfFDstl4dKGDJPEiJ0FsmnTXgtLnwNAK0n43hOupNwAtMslIr
 0ncHsSc85OGyurxO4ZdP12xcpLpVGgh8MaVugneGWdOC2QURcohSHVTdxdUc6Gzdr4p9
 fxEz2uBwRsJ0wqhnnoGbuo0aubFdWztKnACemxIoJ6pw5H5oQ/Ro6l9e6oQLRppkB7no
 EEJyhlazIGioUIls2B6hSmIJ6RxjZpWsaIX5O7uMXpp8prHKLeWfYYI+GEcfYMgT9QvB
 zqAg==
X-Gm-Message-State: ANoB5pnlm8WDR0vOvbP3bl3JbZ8tYeEjQi8BLKmnzeytAtOEuykDt8+j
 acoIp3yjSsTfd705IVwC0OQ7Tw==
X-Google-Smtp-Source: AA0mqf5AEp0f4Lf+TWHAP2v3bsxDMFqXBah6Ayj6Jb6UF8vkvfk6rYmAvCDMdHmyExU4UWZbiwhFNw==
X-Received: by 2002:a05:651c:2314:b0:26e:2772:ffab with SMTP id
 bi20-20020a05651c231400b0026e2772ffabmr7494107ljb.97.1668611918933; 
 Wed, 16 Nov 2022 07:18:38 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a2eb5ac000000b0026e15713edesm3038815ljn.9.2022.11.16.07.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 07:18:38 -0800 (PST)
Message-ID: <bf14540a-745c-c378-520a-f8edfd3e3adf@linaro.org>
Date: Wed, 16 Nov 2022 18:18:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
 <1668609040-2549-3-git-send-email-quic_kalyant@quicinc.com>
 <e049f5b1-da41-6854-4731-b6697770ffde@linaro.org>
 <6b1907db-3fdb-8fe0-e5e3-21ea17021925@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6b1907db-3fdb-8fe0-e5e3-21ea17021925@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 2/3] drm/msm/disp/dpu1: add helper to
 know if display is pluggable
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
Cc: robdclark@chromium.org, quic_vpolimer@quicinc.com, swboyd@chromium.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/11/2022 18:11, Abhinav Kumar wrote:
> 
> 
> On 11/16/2022 7:08 AM, Dmitry Baryshkov wrote:
>> On 16/11/2022 17:30, Kalyan Thota wrote:
>>> Since DRM encoder type for few encoders can be similar
>>> (like eDP and DP) find out if the interface supports HPD
>>> from encoder bridge to differentiate between builtin
>>> and pluggable displays.
>>>
>>> Changes in v1:
>>> - add connector type in the disp_info (Dmitry)
>>> - add helper functions to know encoder type
>>> - update commit text reflecting the change
>>>
>>> Changes in v2:
>>> - avoid hardcode of connector type for DSI as it may not be true 
>>> (Dmitry)
>>> - get the HPD information from encoder bridge
>>>
>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>>>   2 files changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 9c6817b..be93269 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -15,6 +15,7 @@
>>>   #include <drm/drm_crtc.h>
>>>   #include <drm/drm_file.h>
>>>   #include <drm/drm_probe_helper.h>
>>> +#include <drm/drm_bridge.h>
>>>   #include "msm_drv.h"
>>>   #include "dpu_kms.h"
>>> @@ -217,6 +218,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>>       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>>   };
>>> +bool dpu_encoder_is_pluggable(struct drm_encoder *encoder)
>>> +{
>>> +    struct drm_bridge *bridge;
>>> +    int ops = 0;
>>> +
>>> +    if (!encoder)
>>> +        return false;
>>> +
>>> +    /* Get last bridge in the chain to determine pluggable state */
>>> +    drm_for_each_bridge_in_chain(encoder, bridge)
>>> +        if (!drm_bridge_get_next_bridge(bridge))
>>> +            ops = bridge->ops;
>>> +
>>> +    return ops & DRM_BRIDGE_OP_HPD;
>>
>> No. This is not what you should be checking (hint: polled connectors 
>> also can be pluggable).
>>
>> Please check the type of the actual connector connected to this encoder.
>>
> 
> Even if we check the connector type as DSI or eDP that does not 
> necessarily mean its built-in.
> 
> We can even use DSI or eDP as a pluggable display.

Well, I don't think so. eDP and DSI connectors are not pluggable per 
design. One can use them so, but they are not thought to be used this 
way. Unlike e.g. HDMI, DP, VGA, etc.

I would say LVDS, eDP, DSI, DPI and SPI can be assumed to be constantly 
plugged.

Compare this with Composite, SVIDEO, 9PinDIN, TV. They can be assumed to 
be external even if they do not have the HPD (or even polling). And 
these connectors usually don't have it.

> 
> Thats why we thought of this check.
> 
-- 
With best wishes
Dmitry

