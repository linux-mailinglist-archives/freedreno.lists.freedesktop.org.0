Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ACA70FE53
	for <lists+freedreno@lfdr.de>; Wed, 24 May 2023 21:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAE010E591;
	Wed, 24 May 2023 19:14:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE5C10E372
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 19:14:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3C5521F49A;
 Wed, 24 May 2023 21:14:06 +0200 (CEST)
Date: Wed, 24 May 2023 21:14:05 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <7e5axjbnbhtdbrvtpcqnapp3p2xe2ekgj3aizssps2zesfhs22@trhwxetiif7p>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
Subject: Re: [Freedreno] [PATCH v14 3/9] drm/display/dsc: Add
 drm_dsc_get_bpp_int helper
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
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-24 10:45:16, Jessica Zhang wrote:
> Add helper to get the integer value of drm_dsc_config.bits_per_pixel
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Nit: if there comes a v15, perhaps this can be squashed with patch 1/9?
I always thought they were separate because one extends the header while
this extends the C file... but now both extend the C file with helpers.

> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c | 13 +++++++++++++
>  include/drm/display/drm_dsc_helper.h     |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index b31fe9849784..4424380c6cb6 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -1436,6 +1436,19 @@ int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg)
>  }
>  EXPORT_SYMBOL(drm_dsc_compute_rc_parameters);
>  
> +/**
> + * drm_dsc_get_bpp_int() - Get integer bits per pixel value for the given DRM DSC config
> + * @vdsc_cfg: Pointer to DRM DSC config struct
> + *
> + * Return: Integer BPP value
> + */
> +u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *vdsc_cfg)
> +{
> +	WARN_ON_ONCE(vdsc_cfg->bits_per_pixel & 0xf);

You did not add linux/bug.h back, presumably because Dmitry added
another use of WARN_ON_ONCE to this file in a previous series and it
compiles fine as the definition trickles in via another header?

- Marijn

> +	return vdsc_cfg->bits_per_pixel >> 4;
> +}
> +EXPORT_SYMBOL(drm_dsc_get_bpp_int);
> +
>  /**
>   * drm_dsc_initial_scale_value() - Calculate the initial scale value for the given DSC config
>   * @dsc: Pointer to DRM DSC config struct
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index f4e18e5d077a..913aa2071232 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -27,6 +27,7 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc);
>  u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc);
> +u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *vdsc_cfg);
>  
>  #endif /* _DRM_DSC_HELPER_H_ */
>  
> 
> -- 
> 2.40.1
> 
