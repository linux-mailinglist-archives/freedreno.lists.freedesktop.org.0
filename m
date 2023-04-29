Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA6F6F21CD
	for <lists+freedreno@lfdr.de>; Sat, 29 Apr 2023 03:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBE310EE31;
	Sat, 29 Apr 2023 01:04:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330B110EE2D
 for <freedreno@lists.freedesktop.org>; Sat, 29 Apr 2023 01:04:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso212830f8f.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 18:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682730282; x=1685322282;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hjf7cYIchQZ3mSIrHD7BYWO+Nbd2z209mj286WzO3DI=;
 b=EoDUs8g8T6+yyM27k6+JwT935WG6mEMrSIHN0Dt5NrgeNQZvODs1Grig+KvEXfeyoz
 kfKfTWy4l4DEATkQAr1hwMi0H/pr4TmQKvAMqOx42g8Og5SAok6kolLj82dOf9SATkAO
 qSdUk9tUzNj2ReFoXmUOstRzuZEZUmu6imwT4jcfrFoi4v3fMOC+YIhx4s7f//rKhkG4
 WWg7Jjq7I7o+zYtzNIJBThwIXFI/q0PF3VgOg1rpUaQZdUrUrAUS3ngzOvblvGfgmCBR
 v8iCEX9sMn7MdGZidgPG1s3q5xN1N2ELawCD9d3EpdEHDr+23+bkFbJAOpCnVJIqqfG8
 FcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682730282; x=1685322282;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hjf7cYIchQZ3mSIrHD7BYWO+Nbd2z209mj286WzO3DI=;
 b=fhRmqgjDH/PFaKsI6bqDAVve96tGP1sIBCKzbzMQcraIOBJHynA4lu3/cSwdYhNT4c
 v4wlHodTSi/uj7FfMm+jgc84pXmZvoauQ5YWDbU4jFSFRVMQovBS0A+rppRdvSJFZB7L
 QIquC231k69TLlvEDYAN5B8PJ7hgFEgVXWhq9rAj9qGWBplFz12ayXgAJJiD9VBzm/he
 w3Lt9p8UD4dfTVhNyaxO7p/5hIDwK98BHHQdsXX7w301pd/O039ltYZ9K5d3Ryl7AOA/
 fSXrq4DdbQj9AyeNSEZc66DO0bVFYxr9NfscdXEfMcZjuUiAwMV2PF372Dat5oRsWbZv
 mmRw==
X-Gm-Message-State: AC+VfDy/FiBm4l0nTT0A8qeK94uZFXo3zAIToPgvHyborY8hZqc/xLo2
 odU6BT48p6vZEFKZvFqRleT6eQ==
X-Google-Smtp-Source: ACHHUZ4iNmmbOeqLwjxTObqip8317uX3EUbieuKcQ2uqMWW87xKOdNIZpwKy9JyUpWaCsjxEaC9nQQ==
X-Received: by 2002:adf:ef8f:0:b0:2f8:e190:e719 with SMTP id
 d15-20020adfef8f000000b002f8e190e719mr5178289wro.65.1682730282039; 
 Fri, 28 Apr 2023 18:04:42 -0700 (PDT)
Received: from [10.5.40.109] ([212.140.138.206])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d6dc9000000b00304adbeeabbsm5603442wrz.99.2023.04.28.18.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 18:04:41 -0700 (PDT)
Message-ID: <9da0d71c-209e-f1fd-97c8-ef7b36c7e12b@linaro.org>
Date: Sat, 29 Apr 2023 04:04:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-5-git-send-email-quic_khsieh@quicinc.com>
 <1ef1388d-4dc3-273d-3ba6-10614ce6426c@linaro.org>
 <d25d506a-4d56-e16e-ca58-7bc96f2941a5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d25d506a-4d56-e16e-ca58-7bc96f2941a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 4/7] drm/msm/dpu: add dsc blocks for
 remaining chipsets in catalog
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/04/2023 04:03, Abhinav Kumar wrote:
> 
> 
> On 4/28/2023 5:35 PM, Dmitry Baryshkov wrote:
>> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> In preparation of calling ping-pong DSC related functions only
>>> for chipsets which have such a design add the dsc blocks for the
>>> chipsets for which DSC is present but was not added in the catalog.
>>
>> Why/how is it prearing us for such calling?
>>
>> The change itself LGTM.
> 
> The next change adds DPU_PINGPONG_DSC feature flag to chipsets where it 
> is supported. But when I checked there were many chipsets where DSC is 
> present but were not added in catalog.
> 
> Without doing that, the next change was originally adding 0 to the 
> feature flags of those chipsets which didnt seem right to me.
> 
> This seemed like the right way to do it to first add the DSC blocks for 
> those chipsets and add the feature flag to them in the next change.

I'd write something like 'for completeness, add DSC blocks for platforms 
which missed them'.

> 
>>
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 
>>> +++++++++++
>>>   2 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> index 2b3ae84..17f821c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg 
>>> msm8998_pp[] = {
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>   };
>>> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
>>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>>> +};
>>> +
>>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>>>       DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
>>>            &msm8998_dspp_sblk),
>>> @@ -191,6 +196,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>>       .dspp = msm8998_dspp,
>>>       .pingpong_count = ARRAY_SIZE(msm8998_pp),
>>>       .pingpong = msm8998_pp,
>>> +    .dsc_count = ARRAY_SIZE(msm8998_dsc),
>>> +    .dsc = msm8998_dsc,
>>>       .intf_count = ARRAY_SIZE(msm8998_intf),
>>>       .intf = msm8998_intf,
>>>       .vbif_count = ARRAY_SIZE(msm8998_vbif),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> index e3bdfe7..5bb9882 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> @@ -142,6 +142,15 @@ static const struct dpu_merge_3d_cfg 
>>> sc8180x_merge_3d[] = {
>>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>>>   };
>>> +static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +};
>>> +
>>>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 
>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>>       INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, 
>>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>> @@ -192,6 +201,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>>>       .mixer = sc8180x_lm,
>>>       .pingpong_count = ARRAY_SIZE(sc8180x_pp),
>>>       .pingpong = sc8180x_pp,
>>> +    .dsc_count = ARRAY_SIZE(sc8180x_dsc),
>>> +    .dsc = sc8180x_dsc,
>>>       .merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
>>>       .merge_3d = sc8180x_merge_3d,
>>>       .intf_count = ARRAY_SIZE(sc8180x_intf),
>>

-- 
With best wishes
Dmitry

