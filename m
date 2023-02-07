Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8E68DCF3
	for <lists+freedreno@lfdr.de>; Tue,  7 Feb 2023 16:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E292510E540;
	Tue,  7 Feb 2023 15:25:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB0E10E540
 for <freedreno@lists.freedesktop.org>; Tue,  7 Feb 2023 15:25:40 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ee13so9403254edb.5
 for <freedreno@lists.freedesktop.org>; Tue, 07 Feb 2023 07:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gqw3ItXDERibs9MvTHHWDYA1HOORZY/w75C9QLmT6ho=;
 b=nmkA1XnnSYzH2iL2NtINcfjG9uYS/90ddDU3nZp+OOzlLwxUUKgCpt4HVExKpONE+z
 IzRBEtZPlADKLZqDYKdp1rA7ngjTycwWCvVQawOwm0S81uROQoh3sQ2qOQYURdb1j2Uw
 u2JeXauY+CNvCBNAgDVSMHz3A2Cu5GQGlx7hdGfUBtT/H7nMrjSaKiA8H21Kbrus3jgF
 1p1PmRJdCivEwh6UhbSlf4HYfQD+bAEhOCP5N61s699BwiHOGY6yjmZDOG/yia3nunY1
 k0tykVf453fG31CGHVsg68SyAiGlYpliYueSAOxkUN2muHiRugG4WxHTseTZHwbSge0o
 r6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gqw3ItXDERibs9MvTHHWDYA1HOORZY/w75C9QLmT6ho=;
 b=Il+e0yw2YjpV15Aa62Y/CyMfk9La5G6317x5xObSoumWh70H1AXob6HAG/SKXZk00G
 dDyd0VzzTduEf0IR/UETb47JO6KaVoX3NRfd3IexW48//wMFVxIdBJh3SbeGN9VDY5Ft
 DgFyHAiu1wt3Cn15XfktAyMSPaUg2qpstGT6EHgdTKGJUuIA81fm1CVkZ0UB4IGM1dyT
 XB794mohX2kko1UlWqBEgQ6uVtl7Dadrwdgb9IYlFBY9t0WcfxnSiUByq/9/1HgPBhrg
 wjxc6S2Q8u7e4E4vehNwIQ+HjgphWNEWVdccPo+aUnsHPks/3pnsmeLsh4GzZPA5NwM3
 DrWA==
X-Gm-Message-State: AO0yUKXy0Whr4MjCOFRPIa5rO/TCqTLNX7r9r+HT6cBYjSlDqJwEEPxo
 d7zGd6w44yoZIMhmgq6KDJ7Jtg==
X-Google-Smtp-Source: AK7set8aYFgt1cFBsTjhAE8HdnIZqNPwT9nh3o3GniglJAEld5iW2IFX/nTREqLgSJLIj7W6sTjEXw==
X-Received: by 2002:a50:f697:0:b0:4a2:7579:1d9c with SMTP id
 d23-20020a50f697000000b004a275791d9cmr4090563edn.1.1675783539413; 
 Tue, 07 Feb 2023 07:25:39 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a50934a000000b004aacee2728dsm849480eda.19.2023.02.07.07.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:25:39 -0800 (PST)
Message-ID: <3c3d8533-d0b6-2c7c-32a4-8c7fc1ae4af8@linaro.org>
Date: Tue, 7 Feb 2023 17:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Vinod Polimera <vpolimer@qti.qualcomm.com>,
 "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
 <1675091494-13988-14-git-send-email-quic_vpolimer@quicinc.com>
 <60af517c-e22d-780c-221c-4df41f1e7c5c@linaro.org>
 <BN0PR02MB81732F599DBA2D68A4B542DAE4DB9@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB81732F599DBA2D68A4B542DAE4DB9@BN0PR02MB8173.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v12 13/14] drm/msm/disp/dpu: add PSR support
 for eDP interface in dpu driver
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/02/2023 16:26, Vinod Polimera wrote:
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Tuesday, January 31, 2023 6:29 PM
>> To: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
>> dianders@chromium.org; swboyd@chromium.org; Kalyan Thota (QUIC)
>> <quic_kalyant@quicinc.com>; Kuogee Hsieh (QUIC)
>> <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
>> <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
>> <quic_bjorande@quicinc.com>; Abhinav Kumar (QUIC)
>> <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
>> <quic_sbillaka@quicinc.com>
>> Subject: Re: [PATCH v12 13/14] drm/msm/disp/dpu: add PSR support for eDP
>> interface in dpu driver
>>
>>
>> On 30/01/2023 17:11, Vinod Polimera wrote:
>>> Enable PSR on eDP interface using drm self-refresh librabry.
>>> This patch uses a trigger from self-refresh library to enter/exit
>>> into PSR, when there are no updates from framework.
>>>
>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 ++++++++++++-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>>>    3 files changed, 27 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index f29a339..60e5984 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -21,6 +21,7 @@
>>>    #include <drm/drm_probe_helper.h>
>>>    #include <drm/drm_rect.h>
>>>    #include <drm/drm_vblank.h>
>>> +#include <drm/drm_self_refresh_helper.h>
>>>
>>>    #include "dpu_kms.h"
>>>    #include "dpu_hw_lm.h"
>>> @@ -1021,6 +1022,9 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>>>
>>>        DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>>>
>>> +     if (old_crtc_state->self_refresh_active)
>>> +             return;
>>> +
>>
>> I have been looking at the crtc_needs_disable(). It explicitly mentions
>> that 'We also need to run through the crtc_funcs->disable() function
>> [..] if it's transitioning to self refresh mode...'. Don't we need to
>> perform some cleanup here (like disabling the vblank irq handling,
>> freeing the bandwidth, etc)?
> 
> When self refresh active is enabled, then we will clean up irq handling and bandwidth etc.
> The above case is to handle display off commit triggered when we are in psr as all
>   the resources are already cleaned up . we just need to do an early return.
>>
>>>        /* Disable/save vblank irq handling */
>>>        drm_crtc_vblank_off(crtc);
>>>
>>> @@ -1577,7 +1581,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device
>> *dev, struct drm_plane *plane,
>>>    {
>>>        struct drm_crtc *crtc = NULL;
>>>        struct dpu_crtc *dpu_crtc = NULL;
>>> -     int i;
>>> +     int i, ret;
>>>
>>>        dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
>>>        if (!dpu_crtc)
>>> @@ -1614,6 +1618,13 @@ struct drm_crtc *dpu_crtc_init(struct
>> drm_device *dev, struct drm_plane *plane,
>>>        /* initialize event handling */
>>>        spin_lock_init(&dpu_crtc->event_lock);
>>>
>>> +     ret = drm_self_refresh_helper_init(crtc);
>>> +     if (ret) {
>>> +             DPU_ERROR("Failed to initialize %s with self-refresh helpers %d\n",
>>> +                     crtc->name, ret);
>>> +             return ERR_PTR(ret);
>>> +     }
>>> +
>>>        DRM_DEBUG_KMS("%s: successfully initialized crtc\n", dpu_crtc-
>>> name);
>>>        return crtc;
>>>    }
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 01b7509..450abb1 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -12,6 +12,7 @@
>>>    #include <linux/kthread.h>
>>>    #include <linux/seq_file.h>
>>>
>>> +#include <drm/drm_atomic.h>
>>>    #include <drm/drm_crtc.h>
>>>    #include <drm/drm_file.h>
>>>    #include <drm/drm_probe_helper.h>
>>> @@ -1212,11 +1213,24 @@ static void
>> dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>>>                                        struct drm_atomic_state *state)
>>>    {
>>>        struct dpu_encoder_virt *dpu_enc = NULL;
>>> +     struct drm_crtc *crtc;
>>> +     struct drm_crtc_state *old_state = NULL;
>>>        int i = 0;
>>>
>>>        dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>        DPU_DEBUG_ENC(dpu_enc, "\n");
>>>
>>> +     crtc = drm_atomic_get_old_crtc_for_encoder(state, drm_enc);
>>> +     if (crtc)
>>> +             old_state = drm_atomic_get_old_crtc_state(state, crtc);
>>> +
>>> +     /*
>>> +      * The encoder is already disabled if self refresh mode was set earlier,
>>> +      * in the old_state for the corresponding crtc.
>>> +      */
>>> +     if (old_state && old_state->self_refresh_active)
>>> +             return;
>>> +
>>
>> Again the same question here, doesn't crtc_needs_disable() take care of
>> this clause? I might be missing something in the PSR state transitions.
>> Could you please add some explanation here?
> Same usecase as above, applies to encoder disable also when triggered via disable commit
> When driver is in psr state.

Ack, thank you for the explanations. I'd like to take another glance 
later today, but generally it look good to me.

-- 
With best wishes
Dmitry

