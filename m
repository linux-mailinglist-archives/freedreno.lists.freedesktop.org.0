Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB454C8AA
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 14:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4F10E52B;
	Wed, 15 Jun 2022 12:36:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260BC10E52B
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 12:36:54 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id v8so2055932ljj.8
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wVJwhnAqXNlzz2ki9lvX5+eqiHTxgWuKOy9DNV5jL/4=;
 b=GGjb8taXbbbbqbCt5AkVsNvtUwPhWNoe4YMbuFxLkeRmgw9rRxlbQSbP5KDl0ELo45
 iHlAGiRifBs0h696kiwGoikxweNmEP/IeWPb035WeZ16Qemzh9doYlCYk7qjUZqS7cKT
 Vqn0nXtygXU5ZVd9vQdYfUz5ngI0HOHB1f2yG+0bmJrMiaGNeIGeK+/m9YgAWgayKCiK
 Rl2EsfNEcwpLBLdayLsOK+kT3GfavryTZwZ0+tfH18fUwV5gbEFEbiVnWXJBliQ8MZeW
 M+GF7cfIii0ABmIs+tA3ZYkWfVfreputf1MOfhH+OGrv8NSwN6VxmvNxsf2bRYI+Pm7p
 JW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wVJwhnAqXNlzz2ki9lvX5+eqiHTxgWuKOy9DNV5jL/4=;
 b=d5eL3aQ4jV44kgmLiwf49bTBcdgxXPRQR1Fl6Hd0j+4pKVHhAQBU5SoDDii91ar23s
 wYNbG4KdJ6QkgxhfAnqoW7AMPCmA9mokdWLl/3LbnYu7aqfhmVszWY46ARo5KQuwRFbp
 6yM1ikjdXNHVqdXmZUWXGrGA+fuAavYXlq0slXwAZLMk9atf2CUJ9uQqlMErGbW8WZV0
 Futu+kiIF7LCunAQZuVqzihg7ZQWp9UuvaHfoQkiTxXGUjyOuOyIkymLzH9Ff87P9e6E
 UKPO/G1T5EsFcKV/rYO4EHBKsqcrh1pM6EzKKBSRx0v40gnEB8zT1OEs6+8wlq6iso3h
 Gmkg==
X-Gm-Message-State: AJIora/JrBiTkP03l7ZwGscJkXUG6CllDul0R0TcTKwVyVO3tIn/HaAr
 mQURKRI02Hc2q02WjuXg9E4g0w==
X-Google-Smtp-Source: AGRyM1uXnWEKf8vuND04px8rwzbAV7oZKZOsxAypq66WxVE2bc4v4XUjybbs7nKGV6qHGBqlYJySmQ==
X-Received: by 2002:a2e:b601:0:b0:255:6fc9:e7ff with SMTP id
 r1-20020a2eb601000000b002556fc9e7ffmr4998997ljn.518.1655296612507; 
 Wed, 15 Jun 2022 05:36:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a056512074600b0047255d210e2sm1791470lfs.17.2022.06.15.05.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:36:51 -0700 (PDT)
Message-ID: <6ce50e83-3fbf-d97f-a4f2-0f5db389349c@linaro.org>
Date: Wed, 15 Jun 2022 15:36:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: move intf and wb
 assignment to dpu_encoder_setup_display()
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/06/2022 22:32, Abhinav Kumar wrote:
> intf and wb resources are not dependent on the rm global
> state so need not be allocated during dpu_encoder_virt_atomic_mode_set().
> 
> Move the allocation of intf and wb resources to dpu_encoder_setup_display()
> so that we can utilize the hw caps even during atomic_check() phase.
> 
> Since dpu_encoder_setup_display() already has protection against
> setting invalid intf_idx and wb_idx, these checks can now
> be dropped as well.
> 
> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual encoder")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 +++++++------------------
>   1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3a462e327e0e..e991d4ba8a40 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1048,24 +1048,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_pp = dpu_enc->hw_pp[i];
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
> -		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> -			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> -
> -		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> -			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> -
> -		if (!phys->hw_intf && !phys->hw_wb) {
> -			DPU_ERROR_ENC(dpu_enc,
> -				      "no intf or wb block assigned at idx: %d\n", i);
> -			return;
> -		}
> -
> -		if (phys->hw_intf && phys->hw_wb) {
> -			DPU_ERROR_ENC(dpu_enc,
> -					"invalid phys both intf and wb block at idx: %d\n", i);
> -			return;
> -		}

Please retain these checks in dpu_encoder_setup_display().
It checks that we really have got the intf or wb. For example one might 
have specified the INTF that leads to INTF_NONE interface. Or 
non-existing/not supported WB.

> -
>   		phys->cached_mode = crtc_state->adjusted_mode;
>   		if (phys->ops.atomic_mode_set)
>   			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
> @@ -2293,7 +2275,14 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   		atomic_set(&phys->vsync_cnt, 0);
>   		atomic_set(&phys->underrun_cnt, 0);
> +
> +		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> +			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> +
> +		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> +			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>   	}
> +
>   	mutex_unlock(&dpu_enc->enc_lock);
>   
>   	return ret;


-- 
With best wishes
Dmitry
