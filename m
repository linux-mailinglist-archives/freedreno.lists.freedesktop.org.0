Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC331616683
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 16:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B1610E4CF;
	Wed,  2 Nov 2022 15:51:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCBE10E4D3
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 15:51:44 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g7so28939172lfv.5
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XkrttrP/8k6Uhj+JHOcFHyc8juhef2eGyny7iXFjWgw=;
 b=Z0VLSJzNCtq9E/ToW9yfbkWyLnA4YxfCOgY356IXchLTKymFr/drPoV6ftSoyyK1kx
 7HNvXAtou0FZKenXDL6dfoFqMh7JInssILzSMMfBYEFJrWIEKLuCn+TApj49wJfEdvwl
 p2n3sIFPzHPnzLFUYRjh/oMxWAuMI3n7mTPhkKTJA4c5OIIKISCY5y550/FKvsJjLw9+
 14vw+0YMXt+QXJJfB035YvPXV1Qxt2CBojYgM2PUJQ+Q/jfD7nlbjPZ8iYBn2xjOjtUK
 /gOyDngmmxbfzeWYJhhScq7bUEJu/MshMGh1kiS6U8iDcea209WtB1opX5Ut2oAR1N39
 PV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XkrttrP/8k6Uhj+JHOcFHyc8juhef2eGyny7iXFjWgw=;
 b=i79/dHECqMFxiN3NDmVv8ErPXyhiNTMN2JiZzeppkoEH3vrCkPPPF+syflnD//sQtD
 EPd5xdRwz4fy/Cl58xDFL/afRsbnFfl5PNUfgRrhXvYCubCZCO+ubIvb7T9VNetryWJD
 zvXcAQfS9BP4Upyp2sRJtGj3vChWs/LZ4XmMGpPC9TuVyeiNtd8OOdE9uRyxOmY1dOEN
 ohaBYVL8My7yiYKjSmBQzdl1IM3MyKT8/UvrVq1z+pdUWxwHWr6+4iF4Dtf3nc0bz8+f
 2iehX7HWcRv9a4QLB4Uo2vboky98BPu8Rlvmk4NNaDEZOegniuLlSNdjBY5nTr9tLfMR
 M9Sw==
X-Gm-Message-State: ACrzQf2MSWUBPcqqSNHrCuSNUUOwJDDaWjfVzh22epp9C7jo7d2vP3oo
 0eY/zMai0/35HqfmN5a7txXgLQ==
X-Google-Smtp-Source: AMsMyM5obyOxH5ml1zFCem7IPj8YH+crCGInHzB5mEhtge5d5tFEMYzt7zsPGDsbakKat45LEQ00pQ==
X-Received: by 2002:ac2:51b4:0:b0:4b1:785c:7a5d with SMTP id
 f20-20020ac251b4000000b004b1785c7a5dmr349522lfk.261.1667404302716; 
 Wed, 02 Nov 2022 08:51:42 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a2ea170000000b0026c3ecf9a39sm2192247ljl.38.2022.11.02.08.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 08:51:42 -0700 (PDT)
Message-ID: <b0663134-f1fe-9d14-44fb-145b95e5228c@linaro.org>
Date: Wed, 2 Nov 2022 18:51:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1662999830-13916-1-git-send-email-quic_khsieh@quicinc.com>
 <1662999830-13916-4-git-send-email-quic_khsieh@quicinc.com>
 <067c7bc0-4746-f714-db56-a3c9e4f25588@linaro.org>
 <61d591ff-c5d8-a032-9eaa-6ab4c535a679@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <61d591ff-c5d8-a032-9eaa-6ab4c535a679@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v5 3/3] drm/msm/dp: retry 3 times if set
 sink to D0 poweer state failed
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/09/2022 22:26, Kuogee Hsieh wrote:
> 
> On 9/12/2022 11:37 AM, Dmitry Baryshkov wrote:
>> On 12/09/2022 19:23, Kuogee Hsieh wrote:
>>> Bring sink out of D3 (power down) mode into D0 (normal operation) mode
>>> by setting DP_SET_POWER_D0 bit to DP_SET_POWER dpcd register. This
>>> patch will retry 3 times if written to DP_SET_POWER register failed.
>>
>> Could you please elaborate this change? Can the sink succeed in 
>> reading the DP_SET_POWER, but fail writing DP_SET_POWER?
> 
> yes, there is possible since it is not only set local sink device but 
> also all downstream sink devices to D0 state.

Ack. Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>>
>>>
>>> Changes in v5:
>>> -- split into two patches
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_link.c | 13 ++++++++-----
>>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
>>> b/drivers/gpu/drm/msm/dp/dp_link.c
>>> index 9d5381d..4360728 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>> @@ -50,6 +50,7 @@ static int dp_aux_link_power_up(struct drm_dp_aux 
>>> *aux,
>>>   {
>>>       u8 value;
>>>       ssize_t len;
>>> +    int i;
>>>         if (link->revision < 0x11)
>>>           return 0;
>>> @@ -61,11 +62,13 @@ static int dp_aux_link_power_up(struct drm_dp_aux 
>>> *aux,
>>>       value &= ~DP_SET_POWER_MASK;
>>>       value |= DP_SET_POWER_D0;
>>>   -    len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>>> -    if (len < 0)
>>> -        return len;
>>> -
>>> -    usleep_range(1000, 2000);
>>> +    /* retry for 1ms to give the sink time to wake up */
>>> +    for (i = 0; i < 3; i++) {
>>> +        len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>>> +        usleep_range(1000, 2000);
>>> +        if (len == 1)
>>> +            break;
>>> +    }
>>>         return 0;
>>>   }
>>

-- 
With best wishes
Dmitry

