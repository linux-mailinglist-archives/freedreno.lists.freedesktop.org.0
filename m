Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AA4B5B82
	for <lists+freedreno@lfdr.de>; Mon, 14 Feb 2022 22:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4AC10E227;
	Mon, 14 Feb 2022 21:00:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFD410E2E2
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 21:00:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e5so3262731lfr.9
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 13:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2nOxSfxC5d0K6IVKp4zE1wrpFnLKPO0Xaise/eOirLY=;
 b=kPiZqYEwBCdmA51juRTF8Ufmi6EoniKHwK2suVXkdNN1vWkg+ku8KWKhE8o64PF3sl
 CO0DRcTllgOtv/LZZ1k2xKtQo+XC8Q2e0NxviDRjFnCUa6vNq9yMS5HzdX+EsvBhjfvC
 El7a24acxMwtpJJAHWH2sNdfLogGwHYxBlYbTumL6n9RuXjyy/iAc8Hfpp9yytBIAEta
 vsZ9ZSMmDcodI4Nh846ij8xXAYyD4VE0s/uU9bl4MRDmuAlqtBYWzc/peiPcEg3Wx0Pc
 vW3Vqk2OgDLbB362vue2kqlxjIS00yH4s90+1Bl+D/UqQyGF/rkOVNb59QNIkap2lSea
 n7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2nOxSfxC5d0K6IVKp4zE1wrpFnLKPO0Xaise/eOirLY=;
 b=67waHbBf5Q6CTBezVn+JvDeUcOxKl6ZeyfHvaVMCu9X3xWCmMtaDW9TtmEUPNT6iGK
 3qZuTyekzxbIHf9PUsrP+wG6Lw258GmCr9Q7y57UaGiOBeGXeOYEMha7yueipftHeu1y
 4P+8BuxmVuQANlJIuTS7z4lWP8c118tBYM/8Sv0IZyTECIb3uV6sewMYKY1vFF+RERZo
 Qg7hmM2oBOFXeFX2DAh0P+zAY7lkkI0LXQXJMP9yLsmjBYofVKtxnhCL1ACRNhpEgOY9
 jzihs0gcp/dfkM/yCgl10TCbgYEsQsUQQqwqfb5t/GQ7zWG0cVxFNBxpdxi9Bv4Qmo20
 fw2A==
X-Gm-Message-State: AOAM530Dx9cZUqsN8R+4Oph3eianbEF7et9baFIyiQpydvUZ4hormahJ
 2UYt7phlFj6CUT6H9iTkWWmZFg==
X-Google-Smtp-Source: ABdhPJzHSeOU0mjnUhdjqpKrFNyLy4bR7RR6F1D6uxTDz8QYlVVkR7sSpfcIQWDRm5o/aHx5D1Yl0g==
X-Received: by 2002:a05:6512:22d4:: with SMTP id
 g20mr694127lfu.116.1644872427785; 
 Mon, 14 Feb 2022 13:00:27 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m9sm3450661lfp.134.2022.02.14.13.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:00:27 -0800 (PST)
Message-ID: <369073e5-4311-a752-786e-e5132b202796@linaro.org>
Date: Tue, 15 Feb 2022 00:00:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqwAxDa142B_N6NA7KkQ6WuuG_Ma7No5SXEpJdBmgKvXQ@mail.gmail.com>
 <3b6cd2c2-5ebb-97a2-f9af-3c32d0899cd8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3b6cd2c2-5ebb-97a2-f9af-3c32d0899cd8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm: populate intf_audio_select() base
 on hardware capability
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2022 20:55, Kuogee Hsieh wrote:
> 
> On 2/11/2022 3:36 PM, Dmitry Baryshkov wrote:
>> On Sat, 12 Feb 2022 at 02:23, Kuogee Hsieh<quic_khsieh@quicinc.com>  wrote:
>>> intf_audio_select() callback function use to configure
>>> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
>>> interface. HDMI is obsoleted at newer chipset. To keep supporting
>>> legacy hdmi application, intf_audio_select call back function have
>>> to be populated base on hardware chip capability where legacy
>>> chipsets have has_audio_select flag set to true.
>>>
>>> Signed-off-by: Kuogee Hsieh<quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 9 ++++++---
>>>   3 files changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 272b14b..23680e7 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -201,6 +201,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
>>>          .has_dim_layer = true,
>>>          .has_idle_pc = true,
>>>          .has_3d_merge = true,
>>> +       .has_audio_select = true,
>>>          .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>          .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>          .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>> @@ -229,6 +230,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
>>>          .has_dim_layer = true,
>>>          .has_idle_pc = true,
>>>          .has_3d_merge = true,
>>> +       .has_audio_select = true,
>>>          .max_linewidth = 4096,
>>>          .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>          .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index e5a96d6..b33f91b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -357,6 +357,7 @@ struct dpu_caps {
>>>          bool has_dim_layer;
>>>          bool has_idle_pc;
>>>          bool has_3d_merge;
>>> +       bool has_audio_select;
>> I'd suggest adding a bit to dpu_mdp_cfg's features instead, following
>> the example of other hardware blocks.
> 
> it may cause mis leading if we put this in hardware level since 
> MDP_HDMI_DP_SELECT  bit has not be connected
> 
> to logic for a while even it still present at ipcat. Also this bit but 
> will be  removed at next release.

I'm sorry, I can't quite catch you. Why would you like to remove this 
bit at the next release?

> 
> Is dpu_caps level more proper than in hardware feature level?

A priciple of the least surprise. In other hardware-dependent virtual 
functions selection we use block's caps->features rather than boolean flags.

> 
> 
>>>          /* SSPP limits */
>>>          u32 max_linewidth;
>>>          u32 pixel_ram_size;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> index 282e3c6..e608f4d 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> @@ -261,14 +261,17 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
>>>   }
>>>
>>>   static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>>> -               unsigned long cap)
>>> +               unsigned long cap,
>>> +               const struct dpu_mdss_cfg *m)
>>>   {
>>>          ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>>>          ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>>>          ops->get_danger_status = dpu_hw_get_danger_status;
>>>          ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>>>          ops->get_safe_status = dpu_hw_get_safe_status;
>>> -       ops->intf_audio_select = dpu_hw_intf_audio_select;
>>> +
>>> +       if (m->caps->has_audio_select)
>>> +               ops->intf_audio_select = dpu_hw_intf_audio_select;
>>>   }
>>>
>>>   static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
>>> @@ -320,7 +323,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
>>>           */
>>>          mdp->idx = idx;
>>>          mdp->caps = cfg;
>>> -       _setup_mdp_ops(&mdp->ops, mdp->caps->features);
>>> +       _setup_mdp_ops(&mdp->ops, mdp->caps->features, m);
>>>
>>>          return mdp;
>>>   }


-- 
With best wishes
Dmitry
