Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14072436D6A
	for <lists+freedreno@lfdr.de>; Fri, 22 Oct 2021 00:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D40B6E4D4;
	Thu, 21 Oct 2021 22:24:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2776E4D4
 for <freedreno@lists.freedesktop.org>; Thu, 21 Oct 2021 22:24:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634855079; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Nz3m5FXwi9y6Y4F2zLFGhez/TDMz+KApwbGiRVj60G0=;
 b=bwBorRHV/VH4Hhd7L4HtmflG3cDkPjft1T8aw5OVd/HKpy3gTZoHA9hjbUJQXgNLNa8bw5I7
 7vG/qrMjMYHds3hGnH9fO/FEkp4vc+ulgPmHj27JtpTyPtmgFP8u8faKd/A86vE1aLzQQwFX
 QEzbco2EY7EOrYvLG55Vl9ZeTgA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6171e8943416c2cb702e077d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 22:24:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6838DC43460; Thu, 21 Oct 2021 22:24:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 95044C4338F;
 Thu, 21 Oct 2021 22:24:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Oct 2021 15:24:17 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
In-Reply-To: <20210930140002.308628-3-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-3-dmitry.baryshkov@linaro.org>
Message-ID: <f2625a3f82f535fd544f72c53a0033ff@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 02/11] drm/msm/dpu: remove pipe_qos_cfg from
 struct dpu_plane
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

On 2021-09-30 06:59, Dmitry Baryshkov wrote:
> The pipe_qos_cfg is used only in _dpu_plane_set_qos_ctrl(), so remove 
> it
> from the dpu_plane struct and allocate it on stack when necessary.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++++++-----------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 5e0d06f26e53..88d726133b8b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -105,7 +105,6 @@ struct dpu_plane {
> 
>  	struct dpu_hw_pipe *pipe_hw;
>  	struct dpu_hw_pipe_cfg pipe_cfg;
> -	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
>  	uint32_t color_fill;
>  	bool is_error;
>  	bool is_rt_pipe;
> @@ -422,38 +421,41 @@ static void _dpu_plane_set_qos_ctrl(struct
> drm_plane *plane,
>  	bool enable, u32 flags)
>  {
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
> +
> +	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
> 
>  	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
> -		pdpu->pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
> -		pdpu->pipe_qos_cfg.danger_vblank =
> +		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
> +		pipe_qos_cfg.danger_vblank =
>  				pdpu->pipe_sblk->danger_vblank;
> -		pdpu->pipe_qos_cfg.vblank_en = enable;
> +		pipe_qos_cfg.vblank_en = enable;
>  	}
> 
>  	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
>  		/* this feature overrules previous VBLANK_CTRL */
> -		pdpu->pipe_qos_cfg.vblank_en = false;
> -		pdpu->pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
> +		pipe_qos_cfg.vblank_en = false;
> +		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
>  	}
> 
>  	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
> -		pdpu->pipe_qos_cfg.danger_safe_en = enable;
> +		pipe_qos_cfg.danger_safe_en = enable;
> 
>  	if (!pdpu->is_rt_pipe) {
> -		pdpu->pipe_qos_cfg.vblank_en = false;
> -		pdpu->pipe_qos_cfg.danger_safe_en = false;
> +		pipe_qos_cfg.vblank_en = false;
> +		pipe_qos_cfg.danger_safe_en = false;
>  	}
> 
>  	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] 
> is_rt:%d\n",
>  		pdpu->pipe - SSPP_VIG0,
> -		pdpu->pipe_qos_cfg.danger_safe_en,
> -		pdpu->pipe_qos_cfg.vblank_en,
> -		pdpu->pipe_qos_cfg.creq_vblank,
> -		pdpu->pipe_qos_cfg.danger_vblank,
> +		pipe_qos_cfg.danger_safe_en,
> +		pipe_qos_cfg.vblank_en,
> +		pipe_qos_cfg.creq_vblank,
> +		pipe_qos_cfg.danger_vblank,
>  		pdpu->is_rt_pipe);
> 
>  	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
> -			&pdpu->pipe_qos_cfg);
> +			&pipe_qos_cfg);
>  }
> 
>  /**
