Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E6A436E2B
	for <lists+freedreno@lfdr.de>; Fri, 22 Oct 2021 01:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354DE6E4F1;
	Thu, 21 Oct 2021 23:17:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3D96E4F1
 for <freedreno@lists.freedesktop.org>; Thu, 21 Oct 2021 23:17:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634858232; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OxueeXUcJyBf4Ljs92fQitq6dCev48vrTPYs1hDXVCM=;
 b=cwAVeYlBcP+NJkVRzdHwz3Epoc4eWo/xEd9k8uaFOvNb7HiE4c9fKtVbDa4Rq+5/juo2gPSU
 gCDA4XBI/ElUOXRlYgjtPtz9xvcKffWALMqZq0sHRT3L6r7f5Nhvoed2v/2akh+de8GXCJb8
 VGSiLlke66Ud9tI2pnTK12BYJIw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6171f4f43416c2cb70556751 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 23:17:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 52C68C43619; Thu, 21 Oct 2021 23:17:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CEB4C43460;
 Thu, 21 Oct 2021 23:17:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Oct 2021 16:17:05 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
In-Reply-To: <20210930140002.308628-8-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-8-dmitry.baryshkov@linaro.org>
Message-ID: <afe17ee7977bc967ddc0b35253d4e8f0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 07/11] drm/msm/dpu: drop dpu_csc_cfg from
 dpu_plane
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
> Simplify code surrounding CSC table setup by removing struct 
> dpu_csc_cfg
> pointer from dpu_plane and getting it directly at the CSC setup time.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 96 +++++++++++----------
>  5 files changed, 54 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index cbafb61404d0..103d4bd7585b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -537,7 +537,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct
> dpu_hw_pipe *ctx,
>  }
> 
>  static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
> -		struct dpu_csc_cfg *data)
> +		const struct dpu_csc_cfg *data)
>  {
>  	u32 idx;
>  	bool csc10 = false;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 27263bc1a1ef..e8939d7387cb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -262,7 +262,7 @@ struct dpu_hw_sspp_ops {
>  	 * @ctx: Pointer to pipe context
>  	 * @data: Pointer to config structure
>  	 */
> -	void (*setup_csc)(struct dpu_hw_pipe *ctx, struct dpu_csc_cfg *data);
> +	void (*setup_csc)(struct dpu_hw_pipe *ctx, const struct dpu_csc_cfg 
> *data);
> 
>  	/**
>  	 * setup_solidfill - enable/disable colorfill
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index f94584c982cd..aad85116b0a0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -374,7 +374,7 @@ u32 dpu_hw_get_scaler3_ver(struct 
> dpu_hw_blk_reg_map *c,
> 
>  void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
>  		u32 csc_reg_off,
> -		struct dpu_csc_cfg *data, bool csc10)
> +		const struct dpu_csc_cfg *data, bool csc10)
>  {
>  	static const u32 matrix_shift = 7;
>  	u32 clamp_shift = csc10 ? 16 : 8;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index ff3cffde84cd..bc2fdb2b8f5f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -321,6 +321,6 @@ u32 dpu_hw_get_scaler3_ver(struct 
> dpu_hw_blk_reg_map *c,
> 
>  void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
>  		u32 csc_reg_off,
> -		struct dpu_csc_cfg *data, bool csc10);
> +		const struct dpu_csc_cfg *data, bool csc10);
> 
>  #endif /* _DPU_HW_UTIL_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 4259c4ecde9b..b8836c089863 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -90,7 +90,6 @@ enum dpu_plane_qos {
>  /*
>   * struct dpu_plane - local dpu plane structure
>   * @aspace: address space pointer
> - * @csc_ptr: Points to dpu_csc_cfg structure to use for current
>   * @mplane_list: List of multirect planes of the same pipe
>   * @catalog: Points to dpu catalog structure
>   * @revalidate: force revalidation of all the plane properties
> @@ -111,8 +110,6 @@ struct dpu_plane {
>  	struct list_head mplane_list;
>  	struct dpu_mdss_cfg *catalog;
> 
> -	struct dpu_csc_cfg *csc_ptr;
> -
>  	const struct dpu_sspp_sub_blks *pipe_sblk;
> 
>  	/* debugfs related stuff */
> @@ -605,51 +602,59 @@ static void _dpu_plane_setup_scaler3(struct
> dpu_plane *pdpu,
>  	scale_cfg->enable = 1;
>  }
> 
> -static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
> -{
> -	static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
> -		{
> -			/* S15.16 format */
> -			0x00012A00, 0x00000000, 0x00019880,
> -			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> -			0x00012A00, 0x00020480, 0x00000000,
> +static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
> +	{
> +		/* S15.16 format */
> +		0x00012A00, 0x00000000, 0x00019880,
> +		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> +		0x00012A00, 0x00020480, 0x00000000,
> +	},
> +	/* signed bias */
> +	{ 0xfff0, 0xff80, 0xff80,},
> +	{ 0x0, 0x0, 0x0,},
> +	/* unsigned clamp */
> +	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
> +	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
> +};
> +
> +static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
> +	{
> +		/* S15.16 format */
> +		0x00012A00, 0x00000000, 0x00019880,
> +		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> +		0x00012A00, 0x00020480, 0x00000000,
>  		},
> -		/* signed bias */
> -		{ 0xfff0, 0xff80, 0xff80,},
> -		{ 0x0, 0x0, 0x0,},
> -		/* unsigned clamp */
> -		{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
> -		{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
> -	};
> -	static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
> -		{
> -			/* S15.16 format */
> -			0x00012A00, 0x00000000, 0x00019880,
> -			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> -			0x00012A00, 0x00020480, 0x00000000,
> -			},
> -		/* signed bias */
> -		{ 0xffc0, 0xfe00, 0xfe00,},
> -		{ 0x0, 0x0, 0x0,},
> -		/* unsigned clamp */
> -		{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
> -		{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
> -	};
> +	/* signed bias */
> +	{ 0xffc0, 0xfe00, 0xfe00,},
> +	{ 0x0, 0x0, 0x0,},
> +	/* unsigned clamp */
> +	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
> +	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
> +};
> +
> +static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane
> *pdpu, const struct dpu_format *fmt)
> +{
> +	const struct dpu_csc_cfg *csc_ptr;
> 
>  	if (!pdpu) {
>  		DPU_ERROR("invalid plane\n");
> -		return;
> +		return NULL;
>  	}
> 
> +	if (!DPU_FORMAT_IS_YUV(fmt))
> +		return NULL;
> +
>  	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
> -		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc10_YUV2RGB_601L;
> +		csc_ptr = &dpu_csc10_YUV2RGB_601L;
>  	else
> -		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc_YUV2RGB_601L;
> +		csc_ptr = &dpu_csc_YUV2RGB_601L;
> 
>  	DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
> -			pdpu->csc_ptr->csc_mv[0],
> -			pdpu->csc_ptr->csc_mv[1],
> -			pdpu->csc_ptr->csc_mv[2]);
> +			csc_ptr->csc_mv[0],
> +			csc_ptr->csc_mv[1],
> +			csc_ptr->csc_mv[2]);
> +
> +	return csc_ptr;
>  }
> 
>  static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
> @@ -1070,8 +1075,13 @@ void dpu_plane_flush(struct drm_plane *plane)
>  	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>  		/* force 100% alpha */
>  		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> -	else if (pdpu->pipe_hw && pdpu->csc_ptr && 
> pdpu->pipe_hw->ops.setup_csc)
> -		pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, pdpu->csc_ptr);
> +	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
> +		const struct dpu_format *fmt =
> to_dpu_format(msm_framebuffer_format(plane->state->fb));
> +		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> +
> +		if (csc_ptr)
> +			pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, csc_ptr);
> +	}
> 
>  	/* flag h/w flush complete */
>  	if (plane->state)
> @@ -1187,12 +1197,6 @@ static void dpu_plane_sspp_atomic_update(struct
> drm_plane *plane)
> 
>  			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, cdp_cfg);
>  		}
> -
> -		/* update csc */
> -		if (DPU_FORMAT_IS_YUV(fmt))
> -			_dpu_plane_setup_csc(pdpu);
> -		else
> -			pdpu->csc_ptr = 0;
>  	}
> 
>  	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
