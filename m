Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791D34B9515
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 01:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F7110E6CB;
	Thu, 17 Feb 2022 00:40:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C208210E6C4
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 00:40:06 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id r20so5915324ljj.1
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=irfOfdSIE9rR3XmORLk7Bf5d4a0WcfMYhHYf+s3tbSs=;
 b=AILDcMvPG9itOtC+CSIt/42wtECc07XURtltr7tN1l6iwwVFUcer9QlOidGe1bE6Oo
 lJ3mxg5ho54gQsy4Y/h37a+rnbQJbxMwwHw4jUe4/O069PV3zrcMlH0VyS+hnJCf0p/V
 URQ3OT2qwI+4bahYujfrfw5Vrmj2Zs8/ybeC+XbUjCDSXju+aZRbUbxsyKVEaPewEZnz
 3fJwD7K39V77Cc5eE+fYj1bxFEellkt8bIitHmWKG0BYzfcebAK5JXISaKBQhEC5kyl4
 LUQ47gj+LjKBylW4dOtUv3SufxPxUbos5KcWkY4qz17jlaQivgaVkUA8SAleUnizDbjX
 XZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=irfOfdSIE9rR3XmORLk7Bf5d4a0WcfMYhHYf+s3tbSs=;
 b=iXStbTlHpU7FeVet3w63Kn0q/c3AjR0/5ncfyAMKJL9JOxfaTtK1iOpwiwvI/D1bFt
 ZVxOwhmjKyoiqP22glXOFL2PXRINg5HHu14lNgF4IKSqNBuRy013nXKa81SRBTSp9Ouf
 2JVUVAtu9CRF6PzKEw5Lwl4cXdv9ibYT8goeYkeWm5xTELQoGw9+fBD86o7jk3/8XkMN
 2wFhyl6/378hZzMTq5HIhgFn5kN1iGruxa1gISGoh1gdZ80d6Z6jcMTCFGQBheSzp4dL
 AasSpHbwymEsgk3H5JjVpdRK2hWx6W+yAh0TIBpnnoXSlI9LLaPCC2EtWdGYuKwyXhQ/
 Cq+g==
X-Gm-Message-State: AOAM531deeUdUGa1QqzxCSvXs+aOeqPiYok7eC7ffspdCVNexekmcS84
 LMRb1/WfRM2mozXipcC/L1ID4Q==
X-Google-Smtp-Source: ABdhPJzv0HhA2eC9Ca8TvfoEl3imb6op8FIsLTF5dy8X5bvs6IGsJDWqpBElKJJ5mKwrc8q714fGLg==
X-Received: by 2002:a2e:9c15:0:b0:23f:96fa:4b96 with SMTP id
 s21-20020a2e9c15000000b0023f96fa4b96mr426058lji.293.1645058404997; 
 Wed, 16 Feb 2022 16:40:04 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l18sm4966807ljc.11.2022.02.16.16.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 16:40:04 -0800 (PST)
Message-ID: <8aeec164-836b-d964-3b40-fb0874612250@linaro.org>
Date: Thu, 17 Feb 2022 03:40:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd
 <swboyd@chromium.org>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 vkoul@kernel.org
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
 <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n534MH7ih4nKbjY5EewcZ0J73Zp_A=Q-CJ0M_z3nWoVaVQ@mail.gmail.com>
 <f480811d-3e82-a6c7-1e57-fabe51604f9b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f480811d-3e82-a6c7-1e57-fabe51604f9b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 3/3] drm/msm/dp: replace DRM_DEBUG_DP
 marco with drm_dbg_dp
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/02/2022 03:22, Kuogee Hsieh wrote:
> 
> On 2/16/2022 3:46 PM, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2022-02-02 10:56:39)
>>
>> Please add some commit text
>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++++------
>>>   drivers/gpu/drm/msm/dp/dp_catalog.c |  34 +++++++-----
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 106 
>>> +++++++++++++++++++-----------------
>>>   drivers/gpu/drm/msm/dp/dp_display.c |  68 +++++++++++++----------
>>>   drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>>>   drivers/gpu/drm/msm/dp/dp_link.c    |  99 
>>> +++++++++++++++++++--------------
>>>   drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++++------
>>>   drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>>>   drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>>>   9 files changed, 246 insertions(+), 179 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c 
>>> b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> index d7e4a39..4fbbe0a 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> @@ -136,7 +136,8 @@ static void dp_audio_stream_sdp(struct 
>>> dp_audio_private *audio)
>>>          parity_byte = dp_audio_calculate_parity(new_value);
>>>          value |= ((new_value << HEADER_BYTE_1_BIT)
>>>                          | (parity_byte << PARITY_BYTE_1_BIT));
>>> -       DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 
>>> 0x%x\n",
>>> +       drm_dbg_dp((struct drm_device *)NULL,
>> Why can't we pass the platform device pointer? Surely the cast is not
>> necessary and in fact harmful.
> 
> Platform device only available at top level (dp_display.c), other level 
> has no access to platform device or drm_device.

You can pass the platform device (or even better, drm device) to other 
driver blocks too. It's not something to be kept in secret in 
dp_display.c only.

> 
> I will just apss NULL, such as  drm_dbg_dp(NULL, ...), if not device 
> available.



-- 
With best wishes
Dmitry
