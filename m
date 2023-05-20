Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2C170AB00
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 22:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED0910E1A5;
	Sat, 20 May 2023 20:49:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEF010E1A5
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 20:49:50 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso5074935e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 13:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684615788; x=1687207788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fqYU5pBw/fosyLtbu99SoFfcl2t7V6t1nbS3X58IuPE=;
 b=k6zamuW9UmqDDFJzkuGLETMehT8oWegHya8cjibkMxfjNCbEpA4P9yHYLXe80vR7I2
 FnY9AXD9QjWw9woVs+dfTaU9NvTz/EhBCr6+lmuSGX+tfUllo+Aw+Gj0Ac/4LNhjFbe0
 QyaiiB+rjF5bh0PnM2F/dXXZ2st8I0aGRywO0yGnsvOmqTLHEO2l4zvwPn949gGQjW5K
 TQyzvEsfkAnEil9Ek6U4hcWPaJ3xwUZyDEdWL3xoTf+B/eZg/3sgKhNa7Yfok6Ffp7I5
 IRIZ2SNtdyss6APpC/amQzi6BMHm4+POnuZpI5k8dWxvoJ1T6edCU+Guw5/QUJdMvPUX
 M1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684615788; x=1687207788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fqYU5pBw/fosyLtbu99SoFfcl2t7V6t1nbS3X58IuPE=;
 b=c9TQvkI+ppcf4Y1xtntdDcoPJCs+MDxX4I7vv5LYU4K/hznntv4fEeO1dio6w8dgRL
 fc7h84OeoR8dzwOsM16FBB6W0YZ68f8wIACCY5DHXcUAi2KZcKmMuWD4GQTndX/7zgrI
 CO6n4IpkWklb6GzDeL95rNULFt8fXoY0vy3pvppBVQi460QnH78NTbMbgDiJ3jKJwHcQ
 cKuRpqKzRerzG0M1eRfayaoFGiV54v9Zl7PVdpjxK9Zp4or2NABIkQ4ri7ig07eFvWO0
 xFkmWkstyWDytb6Ytnos7oZB5LsQXIyk4K1fZJmP/BMTOgxiStRyFseobriYzrYEDhHP
 MNsg==
X-Gm-Message-State: AC+VfDydUwEkcpLNHePxrhO2wOSpDm9pw9wrNShRwXlJ04lMay8hF9sF
 SN5D/t9ulKn3yVjzrvQ4mmjksA==
X-Google-Smtp-Source: ACHHUZ7l5Y3JhzRvQohtL0YM5pZWEzOewup9on2iBfVDx+SL10dj1xELlEy5Tsbk98QUjnSPNxse4A==
X-Received: by 2002:ac2:4d10:0:b0:4f3:b6e9:3e47 with SMTP id
 r16-20020ac24d10000000b004f3b6e93e47mr787738lfi.53.1684615788014; 
 Sat, 20 May 2023 13:49:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a19520e000000b004f3acfa92c9sm370115lfb.277.2023.05.20.13.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 May 2023 13:49:47 -0700 (PDT)
Message-ID: <50fc88f9-4304-110c-84e8-15dfdeee062f@linaro.org>
Date: Sat, 20 May 2023 23:49:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
 Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-2-d1bac46db075@freebox.fr>
 <6e807c05-a990-5692-3f84-2e4153c8c278@linaro.org>
 <905b4150-6e15-4172-10cf-19aa0ebf817c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <905b4150-6e15-4172-10cf-19aa0ebf817c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 02/11] drm/msm/dpu: use the actual lm
 maximum width instead of a hardcoded value
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/04/2023 20:47, Jeykumar Sankaran wrote:
> 
> 
> On 4/19/2023 3:23 PM, Dmitry Baryshkov wrote:
>> On 19/04/2023 17:41, Arnaud Vrac wrote:
>>> This avoids using two LMs instead of one when the display width is lower
>>> than the maximum supported value. For example on MSM8996/MSM8998, the
>>> actual maxwidth is 2560, so we would use two LMs for 1280x720 or
>>> 1920x1080 resolutions, while one is enough.
>>>
>>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>>
>> While this looks correct (and following what we have in 4.4), later 
>> vendor kernels specify the topology explicitly. Probably we should 
>> check this with the hw guys, because it might be the following case: 
>> even though a single LM can supply the mode, it will spend more power 
>> compared to two LMs.
>>
>>
> Yes. 2 LM split will allow the HW to run in lower mdp core clock. Can 
> you maintain the split_threshold in the hw catalog until per mode 
> topology is available?

I don't think it warrants the trouble, unless we have a real usecase 
when the device is short of LMs.

Arnaud, I'll mark this patch as Rejected for now, unless it fixes an LM 
shortage for your platform.

> 
> Jeykumar S
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 1dc5dbe585723..dd2914726c4f6 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -53,8 +53,6 @@
>>>   #define IDLE_SHORT_TIMEOUT    1
>>> -#define MAX_HDISPLAY_SPLIT 1080
>>> -
>>>   /* timeout in frames waiting for frame done */
>>>   #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
>>> @@ -568,10 +566,12 @@ static struct msm_display_topology 
>>> dpu_encoder_get_topology(
>>>        */
>>>       if (intf_count == 2)
>>>           topology.num_lm = 2;
>>> -    else if (!dpu_kms->catalog->caps->has_3d_merge)
>>> -        topology.num_lm = 1;
>>> +    else if (dpu_kms->catalog->caps->has_3d_merge &&
>>> +         dpu_kms->catalog->mixer_count > 0 &&
>>> +         mode->hdisplay > dpu_kms->catalog->mixer[0].sblk->maxwidth)
>>> +        topology.num_lm = 2;
>>>       else
>>> -        topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 
>>> : 1;
>>> +        topology.num_lm = 1;
>>>       if (crtc_state->ctm)
>>>           topology.num_dspp = topology.num_lm;
>>>
>>

-- 
With best wishes
Dmitry

