Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21B4B0B7A
	for <lists+freedreno@lfdr.de>; Thu, 10 Feb 2022 11:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA9210E7FB;
	Thu, 10 Feb 2022 10:55:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5293310E7FB
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 10:55:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id o2so9682293lfd.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 02:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gAbvkkOMr7PxpULPtXuB0NxD4mTH8ipHNDayBfqdakY=;
 b=KurLFWxVHDrlTwpwvUuZQ1Mh5fqIYbgqlEzuomiNqwTvgqpguB4OTtOqbR8bs86gRg
 vD2Q0Ir7QyYtRQjV4HymrwX1TKUb3zrQpocNjaNbb3lAxjli8wee0ZozTwg4aKvvjPFL
 Y/G/SPrvNs88DXKiKIDeBYJhsaDlTeQz5Tg9yF9Mukp8TvNbbB7EtOv6KoUNl9y335pb
 AWTvG931NnBR/PrLaEkFKCwPPbrYZ+/6WC590Jfm8xgHBqVUr1OrpjMGqmQpql7eOP6s
 tNRg9yNPzp9ow7/NAy8kYN76F6hsXQPodez1XUSQZYH1lI8UC2Wjn/Ioo/YNZcn8iI5e
 gKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gAbvkkOMr7PxpULPtXuB0NxD4mTH8ipHNDayBfqdakY=;
 b=vYlv85ZM/stGyqf3Bmh+qBaaSdsGKfK0h5n5sDJQU221l/fKvRseToJLIkE5Ho9RPV
 Kj/PIDHJkPYw9JRQ2etuOPnY6gv6cBLJj9uMoREQPsERT+LqgCAzZD6aFVSJppiFGOgx
 mJeQfsCKTVq+GpZE5S6VaM65fxkndes4Bt//iw0Jw/0yF4rMfuedaOUoSmS4XAA+DHCd
 Ufo9jm1j6k3qsEZSrtN4y/B/YIwUas30yYakxrHsKsld6Gn03GfEL5SFQ50TbJlHcRhs
 66/lxeFisHO6gF55624AOMREUpJjSN+QGeehU7x6uDit+7hBc50qzxuUktg4YI0skTf3
 Vamw==
X-Gm-Message-State: AOAM530kM928ofLjsfDTlFRqA5kyFfhKTqLIqpwgd0VSLEW7sYaVu9bi
 qKrQULwmQcvjak8CbkKIwAbnpOXhERiSSw==
X-Google-Smtp-Source: ABdhPJwwSMqQiT+3qMl2wffuwYEg7FwRpyq6E9ToujIF0jMlsoGmBMJxIdnAVQKe0fK/8rkVJd5dRw==
X-Received: by 2002:ac2:598e:: with SMTP id w14mr4783080lfn.218.1644490530615; 
 Thu, 10 Feb 2022 02:55:30 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d38sm2218378lfv.8.2022.02.10.02.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 02:55:30 -0800 (PST)
Message-ID: <3035968b-8323-5380-afe3-4ddcc1ca65c4@linaro.org>
Date: Thu, 10 Feb 2022 13:55:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-9-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210103423.271016-9-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [REPOST PATCH v4 08/13] drm/msm/disp/dpu1: Don't
 use DSC with mode_3d
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2022 13:34, Vinod Koul wrote:
> We cannot enable mode_3d when we are using the DSC. So pass
> configuration to detect DSC is enabled and not enable mode_3d
> when we are using DSC
> 
> We add a helper dpu_encoder_helper_get_dsc() to detect dsc
> enabled and pass this to .setup_intf_cfg()
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

You seem to insist on this.
Ok, lets agree that you did not test any other topologies and let 
anybody adding support for SDE_RM_TOPOLOGY_DUALPIPE_3DMERGE_DSC handle this.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           | 7 ++++++-
>   3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 34a6940d12c5..ed37a4c21596 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -70,6 +70,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>   	intf_cfg.stream_sel = cmd_enc->stream_sel;
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> +	if (intf_cfg.dsc)
> +		intf_cfg.mode_3d = 0;
> +
>   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89cd456..218009855fca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -284,6 +284,10 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> +	if (intf_cfg.dsc)
> +		intf_cfg.mode_3d = 0;
> +
>   	if (phys_enc->hw_pp->merge_3d)
>   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 49659165cea8..6d5268b7da90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -536,7 +536,12 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>   
>   	intf_cfg |= (cfg->intf & 0xF) << 4;
>   
> -	if (cfg->mode_3d) {
> +	/* In DSC we can't set merge, so check for dsc and complain */
> +	if (cfg->mode_3d && cfg->dsc)
> +		pr_err("DPU1: DSC and Merge 3D both are set!! it may not work\n");
> +
> +	/* set merge only when dsc is not set */
> +	if (cfg->mode_3d && !cfg->dsc) {
>   		intf_cfg |= BIT(19);
>   		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>   	}


-- 
With best wishes
Dmitry
