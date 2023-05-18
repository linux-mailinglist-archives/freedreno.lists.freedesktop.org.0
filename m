Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F3708845
	for <lists+freedreno@lfdr.de>; Thu, 18 May 2023 21:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8040B10E544;
	Thu, 18 May 2023 19:20:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1258710E53E;
 Thu, 18 May 2023 19:20:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A858E201C8;
 Thu, 18 May 2023 21:20:05 +0200 (CEST)
Date: Thu, 18 May 2023 21:20:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ycwywmgy2pby2jglwm7tfjqgliizbi7ue75x526hdkik3kjtrt@c4eb4bgucgxb>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429012353.2569481-4-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/msm/dpu: access CSC/CSC10
 registers directly
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

On 2023-04-29 04:23:53, Dmitry Baryshkov wrote:
> Stop using _sspp_subblk_offset() to get offset of the csc_blk. Inline

the offset of.

> this function and use ctx->cap->sblk->csc_blk.base directly.
> 
> As this was the last user, drop _sspp_subblk_offset() too.
> 
> Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also much nicer to have idx renamed to offset, and having it on the
left-hand side of these `blk + REG` expressions.  Thanks!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 43 +++++----------------
>  1 file changed, 9 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 37cd5f4396c6..fd9714659293 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -136,30 +136,6 @@
>  #define TS_CLK			19200000
>  
>  
> -static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
> -		int s_id,
> -		u32 *idx)
> -{
> -	int rc = 0;
> -	const struct dpu_sspp_sub_blks *sblk;
> -
> -	if (!ctx || !ctx->cap || !ctx->cap->sblk)
> -		return -EINVAL;
> -
> -	sblk = ctx->cap->sblk;
> -
> -	switch (s_id) {
> -	case DPU_SSPP_CSC:
> -	case DPU_SSPP_CSC_10BIT:
> -		*idx = sblk->csc_blk.base;
> -		break;
> -	default:
> -		rc = -EINVAL;
> -	}
> -
> -	return rc;
> -}
> -
>  static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
> @@ -210,19 +186,16 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>  static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
>  		u32 mask, u8 en)
>  {
> -	u32 idx;
> +	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
>  	u32 opmode;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC_10BIT, &idx))
> -		return;
> -
> -	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx);
> +	opmode = DPU_REG_READ(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE);
>  	if (en)
>  		opmode |= mask;
>  	else
>  		opmode &= ~mask;
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
> +	DPU_REG_WRITE(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE, opmode);
>  }
>  
>  /*
> @@ -530,18 +503,20 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>  static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
>  		const struct dpu_csc_cfg *data)
>  {
> -	u32 idx;
> +	u32 offset;
>  	bool csc10 = false;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC, &idx) || !data)
> +	if (!ctx || !data)
>  		return;
>  
> +	offset = ctx->cap->sblk->csc_blk.base;
> +
>  	if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features)) {
> -		idx += CSC_10BIT_OFFSET;
> +		offset += CSC_10BIT_OFFSET;
>  		csc10 = true;
>  	}
>  
> -	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
> +	dpu_hw_csc_setup(&ctx->hw, offset, data, csc10);
>  }
>  
>  static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
> -- 
> 2.39.2
> 
