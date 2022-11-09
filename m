Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22C622B95
	for <lists+freedreno@lfdr.de>; Wed,  9 Nov 2022 13:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6009A10E0AE;
	Wed,  9 Nov 2022 12:32:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1840210E0AE
 for <freedreno@lists.freedesktop.org>; Wed,  9 Nov 2022 12:32:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id b9so25537505ljr.5
 for <freedreno@lists.freedesktop.org>; Wed, 09 Nov 2022 04:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WYqSosc9RTf4G5K7ZFMgG3ZUUjnL4PNjxqWvrPWzWl4=;
 b=kGDbfRND4Kifgfb81lt1Gg/URNoCOhKEg8Q/4nsTJGduHsB7mYRkkGNZOhfIk3nBuA
 qMfTP5pj0CIKWexodMjQcBTS/TLUAXP0QdhOR+0IVvCEZkFeUhaVxvL9MrvtMTSoaPOb
 PKOp65momoK5s8T0OABIf03dC0hwvmpE8s6zh9NeLuUnR4AXg5RhKUAXsQikCzqwbsmf
 zNJZ4cAkelnZt49r3+5L5g6ocLhmgxhQDE/E6s0gWqjtoBuyS9qFWiEgoLwS3bRJoamN
 e3U8/IrwYnLUrjXGIkKQRz1jlzN0Aq+R/MxUjhlaxjsWgV0JGBu+X6PTymw6PZ+aw5PR
 MuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WYqSosc9RTf4G5K7ZFMgG3ZUUjnL4PNjxqWvrPWzWl4=;
 b=mj9nLledtzSZqo4QITJgp9k1/TQpOR8UYIDOgf2pWrvhkQIQT5KeqmksLtHJJmRCAo
 V9Y0biBitzodOR6UNje7wlepR/D4MX0UTZeP1tXe6IKQwN460ibI3ZKouHCw6XDQXs+v
 ooZ3zZGAp3ds4VQQ1ANVNLMz0s8/KKPzJxVPqL4mXSEuirwsDk/wsoDDKIpbgzBUaaG5
 WVt0N1psBg10c5hIPOQ63dQfpK1d0u/FzIz9EbET6uvJ7TgTh3FROGLsthRpFtfeqHWX
 pfjANIvk72nugfLzFXhXuDHANKF+bAXpJt4Nyb7fgngRRx4K1F2YXlllNqjDXioB8kjM
 2BDg==
X-Gm-Message-State: ACrzQf1Dv0pvEEIpMLiv1dUN47lEj4ie6g72VVs1IM3dOHa5ErKCxWhE
 iUhz9lbX0HfIy4qzmnPHG/rL/w==
X-Google-Smtp-Source: AMsMyM572do/uCqzRdF+mXcjQ9iI2p0r+OwN04vx1L8n3x8NHMb/tO8E1/EUmroWb/3Yf5qmgI8CDA==
X-Received: by 2002:a2e:be28:0:b0:277:81ff:b8c4 with SMTP id
 z40-20020a2ebe28000000b0027781ffb8c4mr6168515ljq.260.1667997123330; 
 Wed, 09 Nov 2022 04:32:03 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a056512118100b0049f53b65790sm2203850lfr.228.2022.11.09.04.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:32:02 -0800 (PST)
Message-ID: <7dedd020-179d-ba40-f97e-6560326fc421@linaro.org>
Date: Wed, 9 Nov 2022 15:32:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
 <1667996206-4153-4-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667996206-4153-4-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/4] drm/msm/disp/dpu1: add color management
 support for the crtc
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/11/2022 15:16, Kalyan Thota wrote:
> Add color management support for the crtc provided there are
> enough dspps that can be allocated from the catalogue
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 ++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  6 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 53 +++++++++++++++++++++++++++++
>   4 files changed, 77 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4170fbe..6bd3a64 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -18,9 +18,11 @@
>   #include <drm/drm_flip_work.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_mode.h>
> +#include <drm/drm_mode_object.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_rect.h>
>   #include <drm/drm_vblank.h>
> +#include "../../../drm_crtc_internal.h"

If it's internal, it is not supposed to be used by other parties, 
including the msm drm. At least a comment why you are including this 
file would be helpful.

>   
>   #include "dpu_kms.h"
>   #include "dpu_hw_lm.h"
> @@ -553,6 +555,17 @@ static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
>   	spin_unlock_irqrestore(&dev->event_lock, flags);
>   }
>   
> +bool dpu_crtc_has_color_enabled(struct drm_crtc *crtc)
> +{
> +	u32 ctm_id = crtc->dev->mode_config.ctm_property->base.id;
> +	u32 gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
> +	u32 degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
> +
> +	return !!(drm_mode_obj_find_prop_id(&crtc->base, ctm_id) ||
> +		   drm_mode_obj_find_prop_id(&crtc->base, gamma_id) ||
> +		   drm_mode_obj_find_prop_id(&crtc->base, degamma_id));
> +}
> +
>   enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
>   {
>   	struct drm_encoder *encoder;
> @@ -1604,8 +1617,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   
>   	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>   
> -	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> -
>   	/* save user friendly CRTC name for later */
>   	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 539b68b..8bac395 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -300,4 +300,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>   	return crtc && crtc->state ? RT_CLIENT : NRT_CLIENT;
>   }
>   
> +/**
> + * dpu_crtc_has_color_enabled - check if the crtc has color management enabled
> + * @crtc: Pointer to drm crtc object
> + */
> +bool dpu_crtc_has_color_enabled(struct drm_crtc *crtc);
> +
>   #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 4c56a16..ebc3f25 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
> -			struct drm_display_mode *mode)
> +			struct drm_display_mode *mode,
> +			struct drm_crtc *crtc)
>   {
>   	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
> @@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> -		if (dpu_kms->catalog->dspp &&
> -			(dpu_kms->catalog->dspp_count >= topology.num_lm))
> +	if (dpu_crtc_has_color_enabled(crtc) &&
> +		(dpu_kms->catalog->dspp_count >= topology.num_lm))

See the comment to the previous patch. It still applies here.

>   			topology.num_dspp = topology.num_lm;
> -	}
>   
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
> @@ -643,7 +642,7 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state->crtc);
>   
>   	/* Reserve dynamic resources now. */
>   	if (!ret) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 552a89c..47a73fa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -13,6 +13,7 @@
>   #include <linux/dma-buf.h>
>   #include <linux/of_irq.h>
>   #include <linux/pm_opp.h>
> +#include <linux/bitops.h>
>   
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_file.h>
> @@ -537,6 +538,44 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>   		dpu_kms_wait_for_commit_done(kms, crtc);
>   }
>   
> +/**
> + * _dpu_kms_possible_dspps - Evaluate how many dspps pairs can be facilitated
> +                             to enable color features for crtcs.
> + * @dpu_kms:    Pointer to dpu kms structure
> + * Returns:     count of dspp pairs
> + *
> + * Baring single entry, if atleast 2 dspps are available in the catalogue,
> + * then color can be enabled for that crtc
> + */
> +static inline u32 _dpu_kms_possible_dspps(struct dpu_kms *dpu_kms)
> +{
> +
> +	u32 num_dspps = dpu_kms->catalog->dspp_count;
> +
> +	if (num_dspps > 1)
> +		num_dspps =
> +			!(num_dspps % 2) ? num_dspps / 2 : (num_dspps - 1) / 2;

Ugh. No. Please spell this clearly rather than using nice math and 
ternary operators:

if (num_dspps <= 1)
   return num_dspps;
else
   return num_dspps / 2;

You see, if num_dspps %2 ! =0, then num_dspps / 2 == (num_dspps_2 - 1) / 2.


> +
> +	return num_dspps;
> +}
> +
> +static u32 _dpu_kms_attach_color(struct drm_device *dev, u32 enc_mask,
> +						u32 num_dspps)
> +{
> +	struct drm_encoder *encoder;
> +	struct drm_crtc *crtc;
> +
> +	drm_for_each_encoder_mask(encoder, dev, enc_mask) {
> +		crtc = drm_crtc_from_index(dev, ffs(encoder->possible_crtcs) - 1);
> +		if (num_dspps && crtc) {
> +			drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +			num_dspps--;

Please.  You can do this at the time you create the crtc. It would be 
much simpler.

> +		}
> +	}
> +
> +	return num_dspps;
> +}
> +
>   static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>   				    struct msm_drm_private *priv,
>   				    struct dpu_kms *dpu_kms)
> @@ -747,6 +786,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   
>   	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>   	int max_crtc_count;
> +	u32 num_dspps, primary_enc_mask = 0, external_enc_mask = 0;
> +
>   	dev = dpu_kms->dev;
>   	priv = dev->dev_private;
>   	catalog = dpu_kms->catalog;
> @@ -796,6 +837,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	}
>   
>   	max_crtc_count = min(max_crtc_count, primary_planes_idx);
> +	num_dspps = _dpu_kms_possible_dspps(dpu_kms);
>   
>   	/* Create one CRTC per encoder */
>   	encoder = list_first_entry(&(dev)->mode_config.encoder_list,
> @@ -808,9 +850,20 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   		}
>   		priv->crtcs[priv->num_crtcs++] = crtc;
>   		encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
> +
> +		if (!dpu_encoder_is_external(encoder) &&
> +			!dpu_encoder_is_virtual(encoder))

if (dpu_encoder_internal_output(encoder))

> +			primary_enc_mask |= drm_encoder_mask(encoder);
> +		else if (dpu_encoder_is_external(encoder))
> +			external_enc_mask |= drm_encoder_mask(encoder);
> +
>   		encoder = list_next_entry(encoder, head);
>   	}
>   
> +	/* Prefer Primary encoders in registering for color support */
> +	num_dspps = _dpu_kms_attach_color(dev, primary_enc_mask, num_dspps);
> +	num_dspps = _dpu_kms_attach_color(dev, external_enc_mask, num_dspps);
> +
>   	return 0;
>   }
>   

-- 
With best wishes
Dmitry

