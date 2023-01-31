Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4675F682C5E
	for <lists+freedreno@lfdr.de>; Tue, 31 Jan 2023 13:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF4910E32D;
	Tue, 31 Jan 2023 12:15:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1721E10E335
 for <freedreno@lists.freedesktop.org>; Tue, 31 Jan 2023 12:15:40 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gr7so16400375ejb.5
 for <freedreno@lists.freedesktop.org>; Tue, 31 Jan 2023 04:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mhtv0ODRBlTpxDV/APPa73s4nDJP3dDm4ZD4J8aRvNY=;
 b=UsaHUY8te724GyFULneEvRi7onjFVb0YO1+XQODuiMN+7yLJjq+v7uO6f8+3axOx+I
 ojoQdZovek893Ai1j3jmS0kIGohjbMfCWlaJCbcXNqUYRDc1zJZlQAEntfQ8vEmWUD6L
 IrE/zHap3TVVA/sbXvF1FDjq0BHB+6epO4tp2byRxdq+D04XtVjwdhlWUio7BwPMOJ0a
 EW7dSlgtofoSOHIB8HQea+5g36F4KK/92BKgIAh6m5ijvY4hc//gNh8d6dces4t3DGy5
 W5icbL+CaIdX0OPAh7ULkR+NG131IoVzBngo3bme/Y0zu0q7nMtLgy5NxViKgqRYZKVT
 pPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mhtv0ODRBlTpxDV/APPa73s4nDJP3dDm4ZD4J8aRvNY=;
 b=RSeaqS9KV92MWUxgk5FycCef+8EAnEHFqAEDtKYuVzeK2p7W+9hn8MC8pe98PKbgvl
 5WMfugT4l+NJzsQAruShUsTuwLuVE5bVBCE2e+2qSNkLriHx1CW4jDvquoEaYNik1Qz6
 Xmqg7iKdlIb06kUVRVeEd4prwDmW4sw9odiZVKC9nsHGrsSlOACMQtAzdTHIO1/YU5Mr
 a0CUCF2LexpOGDWmsGUmYEjDzm43K1e7rEYPXrhBLOCb8o6Sn+IMOgIcYZfBpLs/JVWd
 fmuQn2/cNP+75/Dvw3cVnZiJWzmbClSEPRgYnN5xMFajLdpXf1YU5caFUu4OFtyIVyes
 dUuw==
X-Gm-Message-State: AO0yUKV4d6q8PIO6NmusPbmoqbt9Sxa4lyGB4NWlGlaCRqCqwqscOYX5
 f3ixM8n+B0Q/lNTR4Yi/TZV5MQ==
X-Google-Smtp-Source: AK7set/x66Cy6xuPwKUNLizlKs3jJEot0LID2oRqSrotXAnzbVteEE5qYnHHzlVkqsc/hlokOmVIfQ==
X-Received: by 2002:a17:906:9487:b0:878:8087:3b71 with SMTP id
 t7-20020a170906948700b0087880873b71mr20179854ejx.17.1675167338531; 
 Tue, 31 Jan 2023 04:15:38 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fy15-20020a1709069f0f00b0084c62b7b7d8sm8265192ejc.187.2023.01.31.04.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 04:15:38 -0800 (PST)
Message-ID: <01a23b0b-ee27-af2e-dbf2-79de76235d48@linaro.org>
Date: Tue, 31 Jan 2023 14:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-11-dmitry.baryshkov@linaro.org>
 <bbb6ff43-a432-c0a6-e108-7bf8bc170f52@quicinc.com>
 <9542e211-0cab-07b4-2d58-7fa16839a187@linaro.org>
In-Reply-To: <9542e211-0cab-07b4-2d58-7fa16839a187@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 10/27] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/01/2023 14:10, Dmitry Baryshkov wrote:
> On 31/01/2023 07:13, Abhinav Kumar wrote:
>>
>>
>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>> There is no need to pass full dpu_hw_pipe_cfg instance to
>>> _dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
>>>   3 files changed, 9 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> index f7f81ab08fa2..176cd6dc9a69 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> @@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct 
>>> dpu_hw_sspp *ctx,
>>>   }
>>>   static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
>>> -        struct dpu_hw_pipe_cfg *sspp,
>>> -        void *scaler_cfg)
>>> +        struct dpu_hw_scaler3_cfg *scaler3_cfg,
>>> +        const struct dpu_format *format)
>>>   {
>>>       u32 idx;
>>> -    struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
>>> -    if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
>>> +    if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
>>>           || !scaler3_cfg)
>>
>> Do we need to check for !format ?
> 
> We don't have since the calling sequence ensures that it is not NULL, 
> but let's check for it since it's a different module.

On the other hand, dpu_hw_setup_scaler3() properly handles the !format 
case and programs the rest of the scaler setup. So in the end I'll skip 
this check.

> 
>>
>>>           return;
>>>       dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
>>>               ctx->cap->sblk->scaler_blk.version,
>>> -            sspp->layout.format);
>>> +            format);
>>>   }
>>>   static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> index f5aae563741a..c713343378aa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> @@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
>>>       /**
>>>        * setup_scaler - setup scaler
>>> -     * @ctx: Pointer to pipe context
>>> -     * @pipe_cfg: Pointer to pipe configuration
>>>        * @scaler_cfg: Pointer to scaler configuration
>>
>> This doc needs to be fixed from scaler_cfg to scaler3_cfg
>>
>>> +     * @format: pixel format parameters
>>>        */
>>>       void (*setup_scaler)(struct dpu_hw_sspp *ctx,
>>> -        struct dpu_hw_pipe_cfg *pipe_cfg,
>>> -        void *scaler_cfg);
>>> +        struct dpu_hw_scaler3_cfg *scaler3_cfg,
>>> +        const struct dpu_format *format);
>>>       /**
>>>        * get_scaler_ver - get scaler h/w version
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 172a2c012917..cbff4dea8662 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -677,8 +677,8 @@ static void _dpu_plane_setup_scaler(struct 
>>> dpu_sw_pipe *pipe,
>>>       if (pipe_hw->ops.setup_scaler &&
>>>               pipe->multirect_index != DPU_SSPP_RECT_1)
>>>           pipe_hw->ops.setup_scaler(pipe_hw,
>>> -                pipe_cfg,
>>> -                &scaler3_cfg);
>>> +                &scaler3_cfg,
>>> +                fmt);
>>>   }
>>>   /**
> 

-- 
With best wishes
Dmitry

