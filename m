Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5E708841
	for <lists+freedreno@lfdr.de>; Thu, 18 May 2023 21:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649A410E53E;
	Thu, 18 May 2023 19:18:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCBF10E53E
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 19:18:54 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BD96320077;
 Thu, 18 May 2023 21:18:52 +0200 (CEST)
Date: Thu, 18 May 2023 21:18:51 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <6hp66iutp2zduthg5po3dk4bgedqg5wze5k45cgnubyvm67tdn@x35ahepyajsr>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429012353.2569481-3-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 2/3] drm/msm/dpu: access QSEED registers
 directly
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-04-29 04:23:52, Dmitry Baryshkov wrote:
> Stop using _sspp_subblk_offset() to get offset of the scaler_blk. Inline

the offset of the...

> this function and use ctx->cap->sblk->scaler_blk.base directly.
> 
> Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Much cleaner and simpler this way.  The checks for sblk being NULL
should be superfluous as every catalog entry provides this.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 27 +++++++--------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 83a091f978e2..37cd5f4396c6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -149,11 +149,6 @@ static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
>  	sblk = ctx->cap->sblk;
>  
>  	switch (s_id) {
> -	case DPU_SSPP_SCALER_QSEED2:
> -	case DPU_SSPP_SCALER_QSEED3:
> -	case DPU_SSPP_SCALER_RGB:
> -		*idx = sblk->scaler_blk.base;
> -		break;
>  	case DPU_SSPP_CSC:
>  	case DPU_SSPP_CSC_10BIT:
>  		*idx = sblk->csc_blk.base;
> @@ -195,22 +190,21 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>  		u32 mask, u8 en)
>  {
> -	u32 idx;
> +	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
>  	u32 opmode;
>  
>  	if (!test_bit(DPU_SSPP_SCALER_QSEED2, &ctx->cap->features) ||
> -		_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED2, &idx) ||
>  		!test_bit(DPU_SSPP_CSC, &ctx->cap->features))
>  		return;
>  
> -	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_OP_MODE + idx);
> +	opmode = DPU_REG_READ(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE);
>  
>  	if (en)
>  		opmode |= mask;
>  	else
>  		opmode &= ~mask;
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_OP_MODE + idx, opmode);
> +	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
>  }
>  
>  static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
> @@ -416,25 +410,22 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
>  		struct dpu_hw_scaler3_cfg *scaler3_cfg,
>  		const struct dpu_format *format)
>  {
> -	u32 idx;
> -
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
> -		|| !scaler3_cfg)
> +	if (!ctx || !scaler3_cfg)
>  		return;
>  
> -	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
> +	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg,
> +			ctx->cap->sblk->scaler_blk.base,
>  			ctx->cap->sblk->scaler_blk.version,
>  			format);
>  }
>  
>  static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
>  {
> -	u32 idx;
> -
> -	if (!ctx || _sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx))
> +	if (!ctx)
>  		return 0;
>  
> -	return dpu_hw_get_scaler3_ver(&ctx->hw, idx);
> +	return dpu_hw_get_scaler3_ver(&ctx->hw,
> +				      ctx->cap->sblk->scaler_blk.base);
>  }
>  
>  /*
> -- 
> 2.39.2
> 
