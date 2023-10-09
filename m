Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A097BEC4B
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 23:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31E010E2E6;
	Mon,  9 Oct 2023 21:05:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1B810E2E6
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 21:05:57 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50585357903so6568410e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885555; x=1697490355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GXrOQXhi7nu5nW0Bm3Asi2YiiWFCB9aNui0KX6wRppQ=;
 b=RBIYm1v4cZ1va/lwc0zae7ccF57sstD6J+/C1ev7BKS/qA/pnxVufgqcdvhmOUQOPy
 ySxHXXiGj8dLZx1uGbC6NjfMBkhQ+LQ/+5plV21qSRaNMnVfnROfWsClIMW7z4G4yojt
 xBc5+81hLUGk0DehU2oajtr4M4IX2z6TV2zRIc6JpeiiplylEZYADKdAC2TQNdxWLYfJ
 1PpiqHe+yboKq1L458ZvJI+iZhFKk8hP2jDc5Ak9qH0ek1rxPwMfDaN6IeFrFiqdNjTY
 gj71s6L+9lb0KS8IpYi+U1XKHZSUw4RD9gdVuqNXoiH28TRnXP/nO1si1rxFpPHgYopy
 GI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885555; x=1697490355;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXrOQXhi7nu5nW0Bm3Asi2YiiWFCB9aNui0KX6wRppQ=;
 b=t9drWacNBjADrrRtOuMWMekUbBXU3cU6uXSMJPwa5CzYUyK3Uy3ENnXRRo1CsU4gdD
 rJhTRBaCgwRWhXspA1hT2Cln54wS4vQyHuydoqIx2O4wh7eBSHLTbcb1mKObLER5B7fW
 oqlrgC+iqu+d4jp0BvIqv22peP+1P+6ANXX/UuXaWCsk2JHX3dNo5Q8/TQN6yzjpWawS
 aMK0WF/lv9QwllvXgc7s4rjpP0/QVw9Dh4HwUlaqOj8TsX2g7dLg/O48vh8jOGAFdRHF
 dmKpCqV8nUDDtPyR5ootMzc9ywTp2oweYXtAD+mOs1LdWnsZRdXU8xKfAR/Apac7TUjw
 DGRw==
X-Gm-Message-State: AOJu0Yz/j8K/N8wWedbzxo6t9DJkJyijzsTHhw64m3CKsaiWEeTfP3T3
 5bv1u+Tqx0Wd+T/sKzGGzAR/TQ==
X-Google-Smtp-Source: AGHT+IHRQzjfZA3qbEFz0v3hw5zQjkZWnVU1DMVOIPl5A81sLfNXyOFrRmWkYQWeOBuytORrD0CRWQ==
X-Received: by 2002:ac2:5b9e:0:b0:500:c765:bbe with SMTP id
 o30-20020ac25b9e000000b00500c7650bbemr11903587lfn.0.1696885555647; 
 Mon, 09 Oct 2023 14:05:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a2e9b0f000000b002b9f1214394sm2195696lji.13.2023.10.09.14.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 14:05:55 -0700 (PDT)
Message-ID: <a549364b-d122-464e-b1bd-817c1ac6fb24@linaro.org>
Date: Tue, 10 Oct 2023 00:05:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-3-dmitry.baryshkov@linaro.org>
 <d56daed9-35ac-0ee3-a0b4-f8596b0490fc@quicinc.com>
 <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
 <8ef34ba0-f30a-45b0-991e-0a7eb573956d@linaro.org>
 <836a86ea-4a91-c649-fd3d-a9848eb8ecae@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <836a86ea-4a91-c649-fd3d-a9848eb8ecae@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 02/13] drm/msm/hdmi: switch to
 devm_drm_bridge_add()
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/10/2023 00:04, Abhinav Kumar wrote:
> 
> 
> On 10/9/2023 1:53 PM, Dmitry Baryshkov wrote:
>> On 09/10/2023 22:21, Dmitry Baryshkov wrote:
>>> On 09/10/2023 22:19, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>>>> Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
>>>>> drm_bridge_add(). As the driver doesn't require any additional 
>>>>> cleanup,
>>>>> stop adding created bridge to the priv->bridges array.
>>>>>
>>>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
>>>>>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
>>>>>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 
>>>>> ++++++++------------------
>>>>>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
>>>>>   4 files changed, 17 insertions(+), 43 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>>>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>>> index b6bcb9f675fe..c8ebd75176bb 100644
>>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>>> @@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>>>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>>>           struct drm_device *dev, struct drm_encoder *encoder)
>>>>>   {
>>>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>>>       int ret;
>>>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>>>> -        return -ENOSPC;
>>>>> -    }
>>>>> -
>>>>>       hdmi->dev = dev;
>>>>>       hdmi->encoder = encoder;
>>>>>       hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
>>>>> -    hdmi->bridge = msm_hdmi_bridge_init(hdmi);
>>>>> -    if (IS_ERR(hdmi->bridge)) {
>>>>> -        ret = PTR_ERR(hdmi->bridge);
>>>>> +    ret = msm_hdmi_bridge_init(hdmi);
>>>>> +    if (ret) {
>>>>>           DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: 
>>>>> %d\n", ret);
>>>>> -        hdmi->bridge = NULL;
>>>>>           goto fail;
>>>>>       }
>>>>> @@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>>>           goto fail;
>>>>>       }
>>>>> -    priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>>>>> -
>>>>>       return 0;
>>>>>   fail:
>>>>> -    /* bridge is normally destroyed by drm: */
>>>>> -    if (hdmi->bridge) {
>>>>> -        msm_hdmi_bridge_destroy(hdmi->bridge);
>>>>> -        hdmi->bridge = NULL;
>>>>> -    }
>>>>>       if (hdmi->connector) {
>>>>>           hdmi->connector->funcs->destroy(hdmi->connector);
>>>>>           hdmi->connector = NULL;
>>>>> @@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, 
>>>>> struct device *master,
>>>>>           if (priv->hdmi->audio_pdev)
>>>>>               platform_device_unregister(priv->hdmi->audio_pdev);
>>>>> +        if (priv->hdmi->bridge)
>>>>> +            msm_hdmi_hpd_disable(priv->hdmi);
>>>>> +
>>>>
>>>> Now is this the only place where hdmi->bridge is used?
>>>>
>>>> Why cant we just keep msm_hdmi_hpd_disable(priv->hdmi) here since 
>>>> its anyway protected by if (priv->hdmi) and drop hdmi->bridge 
>>>> completely?
>>>
>>> Sure, sounds like a good idea, same followup as for the DSI.
>>
>> I was wrong here. hdmi::bridge is used by the driver (e.g. for HPD 
>> reporting).
>>
> 
> hmmm, I thought HPD module uses hdmi_bridge->hdmi. here we are talking 
> about hdmi->bridge?

See msm_hdmi_irq().

-- 
With best wishes
Dmitry

