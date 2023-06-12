Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B572D4C7
	for <lists+freedreno@lfdr.de>; Tue, 13 Jun 2023 01:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C4010E12E;
	Mon, 12 Jun 2023 23:09:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7571D10E12E;
 Mon, 12 Jun 2023 23:09:17 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C6159201A2;
 Tue, 13 Jun 2023 01:09:13 +0200 (CEST)
Date: Tue, 13 Jun 2023 01:09:11 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <dbt3zbvagd4vrrrvpjokshebiebjaes77lvjv5ithsxggcdlrj@ce4l2ykex7bm>
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: do not enable
 color-management if DSPPs are not available
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
 Yongqin Liu <yongqin.liu@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-12 21:25:33, Dmitry Baryshkov wrote:
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
> 
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
> Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Yep, this indeed makes the CTM blob property disappear from the CRTC
resource:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6e684a7b49a1..1edf2b6b0a26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>  				struct drm_plane *cursor)
>  {
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  	struct drm_crtc *crtc = NULL;
>  	struct dpu_crtc *dpu_crtc = NULL;
>  	int i, ret;
> @@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>  
>  	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>  
> -	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +	if (dpu_kms->catalog->dspp_count)
> +		drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>  
>  	/* save user friendly CRTC name for later */
>  	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> -- 
> 2.39.2
> 
