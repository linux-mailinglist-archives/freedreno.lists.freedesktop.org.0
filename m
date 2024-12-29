Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2109FDD6F
	for <lists+freedreno@lfdr.de>; Sun, 29 Dec 2024 06:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD65C10E190;
	Sun, 29 Dec 2024 05:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IoxyJ3A2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A3E10E190
 for <freedreno@lists.freedesktop.org>; Sun, 29 Dec 2024 05:56:00 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso16198270a12.0
 for <freedreno@lists.freedesktop.org>; Sat, 28 Dec 2024 21:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735451699; x=1736056499; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJc4muwRBkxyMbOj5l9DkGAvgRseaCzl9LeQVP53Y3w=;
 b=IoxyJ3A2Kv4sTeiKPxjKCPvNYFOZCHQgOcDibXzrWIN8uaG2QGJY3AudY/rtoHmRIM
 x1zG6hEDye7Kqb6LXKytva7TqCx8WnLFseITs2OH4yETahov4HmTPZmS7N3JPoVpXJ2+
 2SQbF7EGz3rzSjQmUaZ5CZMoEW8B3jlOyk4LPUD6CN7uezx7qzXXVI2ySzS6jCMIy3Ao
 9IH4uSoCVeZpsj6ZFqdPryIqAMo8/Dr84auHW3fLEdHdowbV6C1K1tQrq40VlPtf7pQX
 eC66W9kvZYKwaJdW0jUvYFqMF5UPUdvW43GBIC4b6vABtJ5QKI0R+qjUrN2nG0TRrm87
 DnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735451699; x=1736056499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJc4muwRBkxyMbOj5l9DkGAvgRseaCzl9LeQVP53Y3w=;
 b=gmiq/a3OZXr9KQAc0Hdq7YXJjPPjUNbpvemh9eIBQjsQr5fh+e2hRuNficnJSu+LCp
 3kWsSkFLr3nBAmwHx0E9MhHSmrroOVI/XJBMjynCCU9bbcbprh4X9Jp1joYyNHgMOWek
 TTDhwsudvLIJ29L2ejnV2kbMdEb7sEjNsEWParC5eYPtnuFQ7tDwfpySD1ZQfWjVavAl
 auPjqGiBWUG2Vi3g+tAlcKMoXtQGZtKToL3nglPBzYBOiXGsmC3kKRNuSbb2jL8PpD/7
 fuSEGP2UAQSoB+KPMX3HxnQCDM+lUI22gDMA4jXywW6PgIfpArdsRe8We+Xl+02149be
 a5LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxlzQzfCuuH4Mj5BJBiP9NWWz/ZBoVVGzlZ6IjY/2yA5oyt0sjf7Uzjh7/QHEX4Zi7HdAlFmbjg8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZj605RJVFgNzGnQTsbhgn8mOGYsd2s6QyPRG7VS+Ur1kPfNuM
 8lDncOqWzXy6lP+rZp/mrulJtpo7BS7rAxzrwOJCd6fKaJsJ/C1snL+5+uTGnPckOUnjKMv5FwR
 b
X-Gm-Gg: ASbGncuqtVjnNRM3n1yoZ5oYvf6xktFqigPHsBsGQuEh000oKT0CgCGZGelmFBwQfO0
 r9+su9KZpM6nJSwuRR2jC5hZJh4OMXltTkz1rJ72t2OYcnWvoRYaCQh5aKg31YrT8VGnhTuFJK8
 Tm5OIFyW/q81LU9mOZNh2ljq0lRNhnkGfMfyHaGuL6Ice6HfCLMYT3DKf7ww8lgUHDIrSXkb2vJ
 sMYbFbHEzUwLToXvm9JEPrudDWQJ9Hcn6mv8KHvm1lrhaltcloWtwUxGzI08CWjCnq4t7eL86XL
 k7WAwvi2HBTDqdqFeei6Zfv4outXhnwRDDJo
X-Google-Smtp-Source: AGHT+IHX6aaByf0LSe07w0VxUCbJ8VSAHpvOaEeLYBwJPWsRTvg0+34fCnSQJm57ezrdAK6msyIqQg==
X-Received: by 2002:a05:6512:10d2:b0:53e:39e6:a1c5 with SMTP id
 2adb3069b0e04-54229562a91mr11004652e87.41.1735447625891; 
 Sat, 28 Dec 2024 20:47:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238214b5sm2804959e87.187.2024.12.28.20.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 20:47:04 -0800 (PST)
Date: Sun, 29 Dec 2024 06:47:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 18/25] drm/msm/dpu: Reserve resources for CWB
Message-ID: <jtovhd4zsaumm27gzwlkufqywyr2he36rmo6jjm2vnchkjeugd@fdpws67sjlfx>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-18-fe220297a7f0@quicinc.com>
 <z6pebzm5yxaqqmktu4jjjy4rojkdarrqrwo4ikmv6jzku7foyf@cc325q3dfgif>
 <ddd1db49-39d8-44b6-b658-b30fe8ba4428@quicinc.com>
 <pp2uifxzgqmg3ske3mmlgznzb76eovxvgv6y6kfafk5wvoq3ou@5x7bwdkipius>
 <5f054c0a-8f1f-4b13-bb5d-505ce4dbfb34@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f054c0a-8f1f-4b13-bb5d-505ce4dbfb34@quicinc.com>
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

On Thu, Dec 26, 2024 at 02:49:28PM -0800, Jessica Zhang wrote:
> 
> 
> On 12/20/2024 5:07 PM, Dmitry Baryshkov wrote:
> > On Fri, Dec 20, 2024 at 04:12:29PM -0800, Jessica Zhang wrote:
> > > 
> > > 
> > > On 12/19/2024 9:52 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Dec 16, 2024 at 04:43:29PM -0800, Jessica Zhang wrote:
> > > > > Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> > > > > 
> > > > > For concurrent writeback, even-indexed CWB muxes must be assigned to
> > > > > even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> > > > > even/odd rule applies for dedicated CWB PINGPONGs.
> > > > > 
> > > > > Track the CWB muxes in the global state and add a CWB-specific helper to
> > > > > reserve the correct CWB muxes and dedicated PINGPONGs following the
> > > > > even/odd rule.
> > > > > 
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 83 +++++++++++++++++++++++++++++
> > > > >    4 files changed, 116 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > index a895d48fe81ccc71d265e089992786e8b6268b1b..a95dc1f0c6a422485c7ba98743e944e1a4f43539 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > @@ -2,7 +2,7 @@
> > > > >    /*
> > > > >     * Copyright (C) 2013 Red Hat
> > > > >     * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> > > > > - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > >     *
> > > > >     * Author: Rob Clark <robdclark@gmail.com>
> > > > >     */
> > > > > @@ -28,6 +28,7 @@
> > > > >    #include "dpu_hw_dsc.h"
> > > > >    #include "dpu_hw_merge3d.h"
> > > > >    #include "dpu_hw_cdm.h"
> > > > > +#include "dpu_hw_cwb.h"
> > > > >    #include "dpu_formats.h"
> > > > >    #include "dpu_encoder_phys.h"
> > > > >    #include "dpu_crtc.h"
> > > > > @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
> > > > >     * @cur_slave:		As above but for the slave encoder.
> > > > >     * @hw_pp:		Handle to the pingpong blocks used for the display. No.
> > > > >     *			pingpong blocks can be different than num_phys_encs.
> > > > > + * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
> > > > > + *			display. Number of CWB muxes can be different than
> > > > > + *			num_phys_encs.
> > > > >     * @hw_dsc:		Handle to the DSC blocks used for the display.
> > > > >     * @dsc_mask:		Bitmask of used DSC blocks.
> > > > >     * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> > > > > @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
> > > > >    	struct dpu_encoder_phys *cur_master;
> > > > >    	struct dpu_encoder_phys *cur_slave;
> > > > >    	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> > > > > +	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
> > > > >    	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > > >    	unsigned int dsc_mask;
> > > > > @@ -1138,7 +1143,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > > >    	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > > > >    	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > > > >    	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > > > +	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
> > > > >    	int num_pp, num_dsc, num_ctl;
> > > > > +	int num_cwb = 0;
> > > > > +	bool is_cwb_encoder;
> > > > >    	unsigned int dsc_mask = 0;
> > > > >    	int i;
> > > > > @@ -1152,6 +1160,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > > >    	priv = drm_enc->dev->dev_private;
> > > > >    	dpu_kms = to_dpu_kms(priv->kms);
> > > > > +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> > > > > +			dpu_enc->disp_info.intf_type == INTF_WB;
> > > > >    	global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > > > >    	if (IS_ERR_OR_NULL(global_state)) {
> > > > > @@ -1162,9 +1172,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > > >    	trace_dpu_enc_mode_set(DRMID(drm_enc));
> > > > >    	/* Query resource that have been reserved in atomic check step. */
> > > > > -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > > -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > > > > -		ARRAY_SIZE(hw_pp));
> > > > > +	if (is_cwb_encoder) {
> > > > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > > +						       drm_enc->crtc,
> > > > > +						       DPU_HW_BLK_DCWB_PINGPONG,
> > > > > +						       hw_pp, ARRAY_SIZE(hw_pp));
> > > > > +		num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > > +						       drm_enc->crtc,
> > > > > +						       DPU_HW_BLK_CWB,
> > > > > +						       hw_cwb, ARRAY_SIZE(hw_cwb));
> > > > > +	} else {
> > > > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > > +						       drm_enc->crtc,
> > > > > +						       DPU_HW_BLK_PINGPONG, hw_pp,
> > > > > +						       ARRAY_SIZE(hw_pp));
> > > > > +	}
> > > > > +
> > > > > +	for (i = 0; i < num_cwb; i++)
> > > > > +		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> > > > > +
> > > > >    	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > >    			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
> > > > >    	DPU_HW_BLK_LM,
> > > > >    	DPU_HW_BLK_CTL,
> > > > >    	DPU_HW_BLK_PINGPONG,
> > > > > +	DPU_HW_BLK_DCWB_PINGPONG,
> > > > >    	DPU_HW_BLK_INTF,
> > > > >    	DPU_HW_BLK_WB,
> > > > >    	DPU_HW_BLK_DSPP,
> > > > >    	DPU_HW_BLK_MERGE_3D,
> > > > >    	DPU_HW_BLK_DSC,
> > > > >    	DPU_HW_BLK_CDM,
> > > > > +	DPU_HW_BLK_CWB,
> > > > >    	DPU_HW_BLK_MAX,
> > > > >    };
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > index 48d756d8f8c6e4ab94b72bac0418320f7dc8cda8..1fc8abda927fc094b369e0d1efc795b71d6a7fcb 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > @@ -128,6 +128,7 @@ struct dpu_global_state {
> > > > >    	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
> > > > >    	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
> > > > >    	uint32_t cdm_to_crtc_id;
> > > > > +	uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
> > > > >    };
> > > > >    struct dpu_global_state
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > index 85adaf256b2c705d2d7df378b6ffc0e578f52bc3..ead24bb0ceb5d8ec4705f0d32330294d0b45b216 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > @@ -234,6 +234,55 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> > > > >    	return -EINVAL;
> > > > >    }
> > > > > +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
> > > > > +						 struct dpu_global_state *global_state,
> > > > > +						 uint32_t crtc_id,
> > > > > +						 struct msm_display_topology *topology)
> > > > > +{
> > > > > +	int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> > > > > +	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
> > > > > +	int cwb_pp_idx[MAX_BLOCKS];
> > > > > +	int cwb_mux_idx[MAX_BLOCKS];
> > > > > +
> > > > > +	/*
> > > > > +	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
> > > > > +	 * mixer
> > > > > +	 *
> > > > > +	 * TODO: add support reserving resources for platforms with no
> > > > > +	 *       PINGPONG_CWB
> > > > 
> > > > What about doing it other way around: allocate CWBs first as required
> > > > (even/odd, proper count, etc). Then for each of CWBs allocate a PP block
> > > > (I think it's enough to simply make CWB blocks have a corresponding PP
> > > > index as a property). This way the driver can handle both legacy and
> > > > current platforms.
> > > 
> > > Hi Dmitry,
> > > 
> > > Sorry if I'm misunderstanding your suggestion, but the main change needed to
> > > support platforms with no dedicated PINGPONG_CWB is where in the
> > > rm->pingpong_blks list to start assigning pingpong blocks for the CWB mux.
> > > I'm not sure how changing the order in which CWBs and the pingpong blocks
> > > are assigned will address that.
> > > 
> > > (FWIW, the only change necessary to add support for non-dedicated
> > > PINGPONG_CWBs platforms for this function should just be changing the
> > > initialization value of cwb_pp_start_idx)
> > 
> > If I remember correctly, we have identified several generations of DPU
> > wrt. CWB handling:
> > - 8.1+ (or 8.0+?), DCWB, dedicated PP blocks
> > - 7.2, dedicated PP_1?
> > - 5.0+, shared PP blocks
> > - older DPUs, special handling of PP
> > 
> > If the driver allocates PP first and then first it has to allocated PP
> > (in a platform-specific way) and then go from PINGPONG to CWB (in a
> > platform-specific way). If CWB is allocated first, then you have only
> > one platform-specific piece of code that gets PINGPONG for the CWB (and
> > as this function is called after the CWB allocation, the major part of
> > the CWB / PP allocation is generic).
> 
> The issue with breaking this into separate helpers/functions is that the CWB
> mux and PPB indices are dependent on each other. But I agree that we can
> reserve CWB mux and the PPBs in 2 separate loops within this helper to
> minimize the special platform-specific handling.

Doesn't it just PPB depend on CWB?


> 
> Also wanted to note that the comment doc on the PPB odd/even rule is
> inaccurate -- technically the odd/even rule applies specifically to the CWB
> mux as odd/even LMs are hardwired to their respective CWB muxes. Will
> correct the comment doc to be more accurate.

Yes, please fix that.

> 
> Thanks,
> 
> Jessica Zhang
> 

-- 
With best wishes
Dmitry
