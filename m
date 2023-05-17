Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5F70739C
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 23:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C881889101;
	Wed, 17 May 2023 21:13:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892C710E495
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 21:13:21 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 255F33F84B;
 Wed, 17 May 2023 23:13:18 +0200 (CEST)
Date: Wed, 17 May 2023 23:13:16 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <oqodgwsp4hybx5fzy7n72kl64t4bjrb5rvxbytledcjeh6a2cg@474be3fom6rm>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-1-30270e1eeac3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v11-1-30270e1eeac3@quicinc.com>
Subject: Re: [Freedreno] [PATCH v11 1/9] drm/display/dsc: Add flatness and
 initial scale value calculations
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-17 11:51:10, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Was this r-b dropped because of changing the return types in v10->v11?

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 0bb0c3afd740..528dfb5e25fc 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -25,5 +25,15 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
> +static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
> +{
> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
> +}
> +
> +static inline u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}
> +
>  #endif /* _DRM_DSC_HELPER_H_ */
>  
> 
> -- 
> 2.40.1
> 
