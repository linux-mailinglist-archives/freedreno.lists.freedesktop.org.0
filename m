Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962DA569137
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 19:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA7C113A49;
	Wed,  6 Jul 2022 17:57:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF611134BD
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 17:57:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id z25so9624216lfr.2
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KyeJu7Pv1QH2NAw8ZXO0O0Q3YavVpXrf7zh8GRdLwvk=;
 b=kXMlyHPleiim0LxLGGugSxP4isDfWv/bnhuzecQaIHiPxuztzyxy/S2K3FmB64xlhR
 owXS413HeCskcDKsN4XuwJUjtSG2g5kYyT3UyC2va68oonPJFTAF55058q3HxKwRyEKI
 OlloJpAFrZ24gdufjItc1pBh2vOjokbhLd4xK2wtDUUPfFWTJOjDq/cLRgF1doksrrM/
 /wMWbF1RrzMiq+1qEq8yiESVH5MFYMLpgVjvRqBuszC/TuqlGeoOzZoCTpSE4lE+yX2v
 cSwXP+UyBG58pGVIkloVV8B9WOvLkOYIOdU4kC7AGSWvnZOOxpgrav2WNVy59DAbwhlZ
 3Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KyeJu7Pv1QH2NAw8ZXO0O0Q3YavVpXrf7zh8GRdLwvk=;
 b=LwPEKM7Lf/e2q3JIvQ24xc01KlD0fDM5ngrTvF/JF2w8lty6orp0DW+NphWSYYOBGw
 95n+o0QEXbo5ptpM/PGLKyveZs4fYOeTkVj4t2DBJj5aZqrK14IGrc/YX1PN/HBtYoZV
 fVBCM02sQXHeQxkHy8nVdaoUIx9TaVokGvqIAincPF2EfvBZoEJmLtjpBKzuZgjNeTrw
 DpOjkEt4tV6//qtz9XqjEDVfpVr47FPvWt4N5jv1L0ZcYrylgmL19g6z/Ke97AxbVoDR
 zJD1lbTzZQTpfX7xjsn+uE6B3QKw1d1jrYaqpdgxlcjosb2qw71VLwGuFm/g3zty99Jb
 wBdA==
X-Gm-Message-State: AJIora9jd78s47EK3kYus80YgbQjQ9FqnGk5IJCSZJp/Qsp4r6ueDcHZ
 aDuLQ5tOgAvsxAP3nNw3kLutZg==
X-Google-Smtp-Source: AGRyM1vmzrDA/Ula763E/UE8BewNmnYF1s0LMrcmAblE2Z+RDqVJTDgMgsBwplsf/zTfww3H3eqciA==
X-Received: by 2002:ac2:53a8:0:b0:486:777f:a1b6 with SMTP id
 j8-20020ac253a8000000b00486777fa1b6mr2653233lfh.298.1657130227110; 
 Wed, 06 Jul 2022 10:57:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05651238c700b0047f66294ff4sm6355064lft.151.2022.07.06.10.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 10:57:06 -0700 (PDT)
Message-ID: <c6b64751-fd37-09d4-9b31-a4aa112c51ef@linaro.org>
Date: Wed, 6 Jul 2022 20:57:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1657128246-15929-1-git-send-email-quic_khsieh@quicinc.com>
 <86ee9636-8827-7bad-6bd9-22191b2d293c@linaro.org>
 <949ae061-8191-2497-af56-1df74432272d@quicinc.com>
 <b85a7423-44ec-1f58-7465-e5322bc32cd3@linaro.org>
 <cdbfbad1-83a3-b15d-3000-eec425ae140c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cdbfbad1-83a3-b15d-3000-eec425ae140c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: make eDP panel as the first
 connected connector
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/07/2022 20:54, Kuogee Hsieh wrote:
> 
> On 7/6/2022 10:41 AM, Dmitry Baryshkov wrote:
>> On 06/07/2022 20:38, Kuogee Hsieh wrote:
>>>
>>> On 7/6/2022 10:25 AM, Dmitry Baryshkov wrote:
>>>> On 06/07/2022 20:24, Kuogee Hsieh wrote:
>>>>> Some userspace presumes that the first connected connector is the main
>>>>> display, where it's supposed to display e.g. the login screen. For
>>>>> laptops, this should be the main panel.
>>>>>
>>>>> This patch call drm_helper_move_panel_connectors_to_head() after
>>>>> drm_bridge_connector_init() to make sure eDP stay at head of
>>>>> connected connector list. This fixes unexpected corruption happen
>>>>> at eDP panel if eDP is not placed at head of connected connector
>>>>> list.
>>>>>
>>>>> Changes in v2:
>>>>> -- move drm_helper_move_panel_connectors_to_head() to
>>>>>         dpu_kms_drm_obj_init()
>>>>>
>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> index 2b9d931..50ff666 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> @@ -763,6 +763,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms 
>>>>> *dpu_kms)
>>>>>       if (ret)
>>>>>           return ret;
>>>>>   +    drm_helper_move_panel_connectors_to_head(dev);
>>>>
>>>> This should be in msm_drv.c unless you have a strong reason to have 
>>>> it here.
>>> Can you please  provide more info why should be in msm_drv.c?
>>
>> Let me quote my message from v1 review:
>>
>> Please move this call to the msm_drm_init(). Calling this function 
>> somewhere after the ->kms_init() would make sure that all panel 
>> connectors are close to the top of the list, whichever MDP/DPU driver 
>> is used and whichever actual interface is bound to this panel.
>>
> Below are the call flow in timing order, ->kms_init does not create 
> connectors/interfaces, hw_init does that.
> 
> 1) ->kms_init
> 
> 2) ->hw_init -> dpu_kms_hw_init --> _dpu_kms_drm_obj_init()  --> 
> _dpu_kms_setup_displays()--> msm_dp_modeset_init() --> creator 
> connectors/interfaces
> 
> 3) drm_helper_move_panel_connectors_to_head() <== add here??

Yes.

> 
>>>> _dpu_kms_drm_obj_init() create and initialize drm obj one by one and 
>>>> _dpu_kms_setup_displays() had created system wide 
>>>> connectors/interfaces .
>>>
>>> After that should be fine to move edp to head of connector list.
>>>
>>>>> +
>>>>>       num_encoders = 0;
>>>>>       drm_for_each_encoder(encoder, dev)
>>>>>           num_encoders++;
>>>>
>>>>
>>
>>


-- 
With best wishes
Dmitry
