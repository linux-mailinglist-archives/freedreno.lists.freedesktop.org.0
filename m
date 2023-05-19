Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B9709C69
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 18:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D646210E45E;
	Fri, 19 May 2023 16:26:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3079B10E45E
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:26:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4efd6e26585so3890360e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684513563; x=1687105563;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pzkV3eFT+UyGsSgy/B4/2r7DXWLfX9IJI6rAEngNyY4=;
 b=K0ZkrVXIBIlgJI6GxX9U1BVFOG9ni4zAFTvHmAW4p0eeDDXc1Tbb0fO/VaJp/Hc+0C
 yHmewdR6WXjfiEz+nBtXlMhoJDU/1srp1K5TxhljOukyl0sKcZyKG6kFBirFTG+egHU2
 M9P4Lc7HrP9lpdklzYz6bfU/cSgQgYxb5PFY52Px1gFV7IXKAa4Ra0EToNB5JHmBTm4C
 /SdSzmfLWaOYPSSdUt8H4E/QMJY2b+iY78AxB+OXcy/23jaHdqb70/BWpwA12BB69f+e
 kLGGEavODU1l7/+vcyhC7Ly24egtgQTYaPaBaQXH4mwvxnzYw7BWFMebiSRK3Sza/WGl
 eMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684513563; x=1687105563;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pzkV3eFT+UyGsSgy/B4/2r7DXWLfX9IJI6rAEngNyY4=;
 b=Fp58TduuLhmxLMspdxPYUOe9IGLNmr697h0HDbSeMKVK9nV+QIOHhv/leXfFAGMhzH
 zl9foBhdqEp9jKw/K+32OnVlj/WOrMiTTqKlXtjl2BShdTkCX0ERV3u0N//hOD/Y9Rk6
 NDBOFbfeDddcNXAUH5GPAEt5wbwjgCYvBiC+JDZBjw2gS1Bk4qSH8WTOLcfZ78gzzwty
 5Tt5oMH477iEbm35MVAM20+UZFkBN/K/ivmYGIsdVSyhs0Nv9tG6ontMhyU4HoygOXN6
 uwMnlVSmhjjHbeXDObI5EP7qX3gBMws0UsEsL5RWYqMtacxjZH8o+/D1+uVu7WixiPtJ
 ys7w==
X-Gm-Message-State: AC+VfDy1xrob7XSN/jUvkaV7a8u+x5wjte3JFPaiGUYS/6VqQKYew63b
 idqGj4Y7jIlHahymT4bV/S8gmtj6KEdQl9mee0k=
X-Google-Smtp-Source: ACHHUZ53FGQVKSy+8m5wHWJubiKSrd+KAgJAlXNP65x++jlyZJlF2vKxGa4xup0bi3pbF+08vFdwpg==
X-Received: by 2002:a05:6512:3c9:b0:4ee:dafa:cb00 with SMTP id
 w9-20020a05651203c900b004eedafacb00mr1028417lfp.60.1684513562641; 
 Fri, 19 May 2023 09:26:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a195505000000b004f3b2d3fc25sm102647lfe.10.2023.05.19.09.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 09:26:02 -0700 (PDT)
Message-ID: <ee0fc9e0-fa49-093b-87ee-463e1f728a0b@linaro.org>
Date: Fri, 19 May 2023 19:26:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
 <evkla3rkf4tge6gln4lgtulj7q5gt6vef3i2yqupc5lj2oszfx@7ttyxzlmvet5>
 <8e9feb23-a5f0-7cd8-ebff-8e9097ff0ca1@quicinc.com>
 <b2fcc9f5-ca11-ab87-e40b-9c6d2662325b@linaro.org>
 <ku27atp4yqkpmz7g4ttylvzd43jmu4cwcs76nqgzramgxetjna@bu76f4c73724>
 <62f0cdb9-af80-4ff4-0621-21a041ee2f16@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <62f0cdb9-af80-4ff4-0621-21a041ee2f16@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v10 6/8] drm/msm/dpu: separate DSC flush
 update out of interface
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/05/2023 19:21, Kuogee Hsieh wrote:
> 
> On 5/19/2023 5:04 AM, Marijn Suijten wrote:
>> On 2023-05-19 01:40:19, Dmitry Baryshkov wrote:
>>> On 19/05/2023 01:09, Kuogee Hsieh wrote:
>>>> On 5/17/2023 3:31 PM, Marijn Suijten wrote:
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>>>> @@ -139,6 +139,11 @@ static inline void
>>>>>> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>>>>>                    CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>>>>>>                    ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>>>>>>            }
>>>>>> +
>>>>>> +    if (ctx->pending_flush_mask & BIT(DSC_IDX))
>>>>>> +        DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>>>>>> +                  ctx->pending_dsc_flush_mask);
>>>>> Again, when do we reset this mask to 0?  (v8 review)
>>>> can not find it.
>>>>
>>>> let me add a separate  patch to fix this.
>>> The pending_dsc_flush_mask was added in this patch, so the reset should
>>> be a part of this patch too.
>> Yes, same patch.
> yes, i keep pending_dsc_flush_mask = 0; at this patch at V11
>>
>> Related question I asked in v8: only the global pending_flush_mask and
>> pending_dspp_flush_mask are reset in dpu_hw_ctl_clear_pending_flush().
>> Shall I send a patch to clear the other missing ones (e.g. merge_3d etc)
>> as well?
> at v11, I had add separate  patch to clear missing ones.
>>>>>> +
>>>>>>        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>>>>>    }
>>>>>> @@ -285,6 +290,13 @@ static void
>>>>>> dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>>>>>>        ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>>>>>>    }
>>>>>> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl
>>>>>> *ctx,
>>>>>> +                           enum dpu_dsc dsc_num)
>>>>>> +{
>>>>>> +    ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
>>>>>> +    ctx->pending_flush_mask |= BIT(DSC_IDX);
>>>>>> +}
>>>>>> +
>>>>>>    static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl
>>>>>> *ctx,
>>>>>>        enum dpu_dspp dspp, u32 dspp_sub_blk)
>>>>>>    {
>>>>>> @@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct
>>>>>> dpu_hw_ctl *ctx,
>>>>>>        if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>>>>>>            mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>>>>>> -    if (cfg->dsc)
>>>>>> -        DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
>>>>>> -
>>>>>>        if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>>>>>>            mode_sel |= BIT(17);
>>>>>> @@ -524,10 +533,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct
>>>>>> dpu_hw_ctl *ctx,
>>>>>>        if (cfg->merge_3d)
>>>>>>            DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>>>>>                      BIT(cfg->merge_3d - MERGE_3D_0));
>>>>>> -    if (cfg->dsc) {
>>>>>> -        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>>>> Again, this bugfix of now wrapping DSC_IDX in BIT() should go in a
>>>>> separate Fixes: patch to have this semantic change documented.  (v8
>>>>> review)
>>>> That will be this patch. let me add Fixes at this patch
>>> _separate_ patch.
>> Separate patch, and documenting clearly what happens and why.  Kuogee, I
>> can send this as well if it makes things more clear, since it doesn't
>> seem (from the patch description) that anyone noticed the
>> implication/bugfix in this change as a drive-by effect of porting
>> sde_hw_ctl_update_bitmask_dsc_v1() from downstream.
>>
>> - Marijn
> 
> The problem is a create a separate patch to delete 
> DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX), then this patch will break 
> dsc function.
> 
> So that I keep this within same patch.
> 
> please confirm you still want a separate patch to delete 
> DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX).

I'd prefer to see:

- DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
+ DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, BIT(DSC_IDX));

This a Fixes patch and in theory it can be backported to stable kernel.

Then the rest can go into this patch, including the movement of 
BIT(DSC_IDX) to proper function, etc.

> 
>>
>> <snip>

-- 
With best wishes
Dmitry

