Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CA41F76B
	for <lists+freedreno@lfdr.de>; Sat,  2 Oct 2021 00:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914AB6E59D;
	Fri,  1 Oct 2021 22:33:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD8A6E59D
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 22:33:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b20so44411095lfv.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 15:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+GGpQB1eoOvtXRgcP9cErq9HPOsKMWs+3BfVhk5Dh2w=;
 b=Qs5fOVMz612VsObKjPOggkEfD+Uia9/Hn4FLDX3M9oodQJMMfNivODTI9mTwo9fZ1h
 IVWJ8D7ew8UWXbTrcuZwHyrufGjm8nT7/Q0lcn0RarqDIi7l8yCWBB34FyTrXMkoSwVe
 wToMte27WQTnllnISTCD1WMowTtJS33E+Kk93rTRx/wsXMMax6YHNcsZrvX7W53oU3E/
 fmE0laRhAs4borxCJgOwo2k5+pklzLHVOYl/EQL+Nyy39jeLzhpIEeQlH2fNPVqC2mDU
 7HO+Pt17hgJU9gcjT/IchZ7NAa9O0yl5pw9Q4H6ImxTUgGR/KtDNpvROpaN6CMpF2qQv
 kIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+GGpQB1eoOvtXRgcP9cErq9HPOsKMWs+3BfVhk5Dh2w=;
 b=bvkey9ft35p/ICSfeD+4rxCx9jxnl12OEPUgHROv8c0UyHIWXoNt53kkqa6VT3Ums7
 /qS9zzsWQQxs8OcDB4OKjpecGUWWmmrkv1nVZ/PIieS8BQyMhxiyTare299Iygwjjum5
 ZUu0Vb6kWLu5+38PO9tB5BZSApkGuERA/FxhoTDZdbIXVlFSxebA9aq0oC3YmWjXWFIy
 6d0Gi4ZNyNUeZ8xxHXymwb1WmJyDm0H134j6igpcEcziihl7wIUDYlwjSPI4rzJ7ryRB
 k1XdVBhI/1i9cMD7uMip4jMxdM4PNOjyDrVi84jvpEsJydUQOgxabGrSCazXirgReZR7
 sVUQ==
X-Gm-Message-State: AOAM533r/YSAh8qB5VFthiFAM+aozfA0125budmQFqN4jdIlQ7jchyIY
 j0ZlBLI52j1DBDpHOO/WAV5eXw==
X-Google-Smtp-Source: ABdhPJyELC/Nwio1dFl3sO/VK8PLLU2EqustpT6Gxg2fQDCTHVW17MAX8bRKjL8jJcOzOOPUo8WR0A==
X-Received: by 2002:a05:6512:1521:: with SMTP id
 bq33mr608727lfb.118.1633127610451; 
 Fri, 01 Oct 2021 15:33:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j16sm312325lfk.257.2021.10.01.15.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 15:33:29 -0700 (PDT)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
Date: Sat, 2 Oct 2021 01:33:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on
 command mode panels
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

On 11/09/2021 19:39, AngeloGioacchino Del Regno wrote:
> In function dpu_encoder_phys_cmd_wait_for_commit_done we are always
> checking if the relative CTL is started by waiting for an interrupt
> to fire: it is fine to do that, but then sometimes we call this
> function while the CTL is up and has never been put down, but that
> interrupt gets raised only when the CTL gets a state change from
> 0 to 1 (disabled to enabled), so we're going to wait for something
> that will never happen on its own.
> 
> Solving this while avoiding to restart the CTL is actually possible
> and can be done by just checking if it is already up and running
> when the wait_for_commit_done function is called: in this case, so,
> if the CTL was already running, we can say that the commit is done
> if the command transmission is complete (in other terms, if the
> interface has been flushed).

I've compared this with the MDP5 driver, where we always wait for 
PP_DONE interrupt. Would it be enough to always wait for it (= always 
call dpu_encoder_phys_cmd_wait_for_tx_complete())?

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index aa01698d6b25..aa5d3b3cef15 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -682,6 +682,9 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
>   	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>   		return 0;
>   
> +	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
> +		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
> +
>   	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
>   }
>   
> 


-- 
With best wishes
Dmitry
