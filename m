Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C93B98554A
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 10:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC89510E7BB;
	Wed, 25 Sep 2024 08:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jMvGmndq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF27110E7B1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Sep 2024 08:17:29 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso10125964e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Sep 2024 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727252248; x=1727857048; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PItdsNbKJCVfD2sQE4FIY5JPIF0NlmLuFR81Hxp3WNA=;
 b=jMvGmndqmrBmutyfvAjjNmF0KueuwASNid1LwYZD/67bApzW+5A+sJf9FzD9PcZWRZ
 GDIMtlL6CwIg/8ANUVKfo4oF7yDckaOvskbzBKEFs1GnPxg5Ogi0t1Bkg5xZnjAjoI17
 pvYRsqZ26eNUQJgnctP+CQK8Xn6mj5puITGxro1S2lW5KxguHEg5/0REXMPIYrcKZpFX
 edp9Wr9quyzph4XuyWbmOxrC3c4aKlRXbft4Q4f3lwydKWdT1s99xVzAxXzWDWHRWBWn
 araohrp+ir2TJkxrCXpE+hYYpY55tVSfHZYE9StS/mmCwHn/n2ycCPhodPCJxpPRIOf4
 z1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727252248; x=1727857048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PItdsNbKJCVfD2sQE4FIY5JPIF0NlmLuFR81Hxp3WNA=;
 b=f8dm1sCv6NU0R2IoiXQWv4/8cQbLn5kfBsfbvtJCfenB/+VmxzjKbZeqmRD19rG3xa
 alz8Ow1vhXQsjWEKDUe00ReJc0PvnJJ9VmCmV+Am6NMGPNyh+bN+76l5soX53y+Q0mhh
 EX6ORbu2Jk5Jn1YkynqPz9OP7pqdSMxbYa4N4y6H8RalCXmeuHNcRWfprISx2gHTVkbd
 LV21ZgP7Dwb5dsFx7YIU8mEmjcWQ+W2+1HcHXNsK4+OYjkrMK7Yl9LaXO4zaEZs2Vzb5
 DhJDDA+TW4Jxbe+nylwdR1nncEedgaIlK9c0BVtMIpz6fHFtXt7xj5glebZqzu1rqN4F
 Zm9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5mThRdE3VsO/xITChBBDz6oMhYAHLbQ5FnitUnw43Ifoa+XeZrMGbOSC0GKvO2XuBgxG/Nym1GXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyEDoZfdjvBO2fFOrsagkSXFQi9X5imX6SPO+iyXtII9MP07uZ
 m4j8acpR0mzgen+9TGGBfuqe61I2m7bbdv1f8jKtShxDwmse/r9OsaxxZapU67M=
X-Google-Smtp-Source: AGHT+IG5Nl0ptMYn5BJw3VOSRd7OvrwuUcJMu7vRDsBX1yDILY+iinhIQlUl9VUjVqNtD0ZEUfaV2Q==
X-Received: by 2002:a05:6512:33d2:b0:536:7377:7d23 with SMTP id
 2adb3069b0e04-5387755cf84mr1477993e87.40.1727252247573; 
 Wed, 25 Sep 2024 01:17:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a8640978sm452536e87.126.2024.09.25.01.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:17:26 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:17:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 06/22] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Message-ID: <tr2uoiypchf7wcytayvae3e26ye72vyoq763l2ysclwa25bxz7@ojtglsboe63f>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-6-7849f900e863@quicinc.com>
 <4c7spborzltmvjlbd2o4uwknraitjtf34mqt7r3x2ospnaidyn@abvn5zdumvwt>
 <b66264a9-2ff9-482a-96e0-453d55bc651c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b66264a9-2ff9-482a-96e0-453d55bc651c@quicinc.com>
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

On Tue, Sep 24, 2024 at 05:37:30PM GMT, Jessica Zhang wrote:
> 
> 
> On 9/24/2024 4:16 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 24, 2024 at 03:59:22PM GMT, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
> > > from dpu_crtc_assign_resources().
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [quic_abhinavk@quicinc.com: cleaned up formatting]
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > [quic_jesszhan@quicinc.com: dropped clearing num_mixers in CRTC disable
> > > path]
> > 
> > Same comment as before: the code is still there.
> 
> Hi Dmitry,
> 
> I thought the original comment was to move the dropping `num_mixers = 0`
> chunk from the previous patch to this one?
> 
> Sorry if I misunderstood.

Code move is fine. The commit message should reflect the code though. So
if you have "dropped clearing num_mixers..." in the commit message, it
is surprising to see the code actually claring num_mixers.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 32 ++++++++++++++++++++++++++---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++--------------------
> > >   2 files changed, 31 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index b918c80d30b3..d53e986eee54 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> > >   	dpu_core_perf_crtc_update(crtc, 0);
> > > -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > > -	cstate->num_mixers = 0;
> > > -
> > >   	/* disable clk & bw control until clk & bw properties are set */
> > >   	cstate->bw_control = false;
> > >   	cstate->bw_split_vote = false;
> > > @@ -1164,6 +1161,7 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
> > >   }
> > >   #define MAX_HDISPLAY_SPLIT 1080
> > > +#define MAX_CHANNELS_PER_CRTC 2
> > >   static struct msm_display_topology dpu_crtc_get_topology(
> > >   		struct drm_crtc *crtc,
> > > @@ -1208,9 +1206,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > >   static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
> > >   {
> > > +	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
> > > +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_CRTC];
> > > +	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_CRTC];
> > > +	int i, num_lm, num_ctl, num_dspp;
> > >   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> > >   	struct dpu_global_state *global_state;
> > >   	struct msm_display_topology topology;
> > > +	struct dpu_crtc_state *cstate;
> > >   	int ret;
> > >   	/*
> > > @@ -1232,6 +1235,29 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
> > >   	if (ret)
> > >   		return ret;
> > > +	cstate = to_dpu_crtc_state(crtc_state);
> > > +
> > > +	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						crtc, DPU_HW_BLK_CTL, hw_ctl,
> > > +						ARRAY_SIZE(hw_ctl));
> > > +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +					       crtc, DPU_HW_BLK_LM, hw_lm,
> > > +					       ARRAY_SIZE(hw_lm));
> > > +	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						 crtc, DPU_HW_BLK_DSPP, hw_dspp,
> > > +						 ARRAY_SIZE(hw_dspp));
> > > +
> > > +	for (i = 0; i < num_lm; i++) {
> > > +		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > > +
> > > +		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > > +		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > > +		if (i < num_dspp)
> > > +			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> > > +	}
> > > +
> > > +	cstate->num_mixers = num_lm;
> > > +
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index ada9119326ca..36b677cf9c7a 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -1049,14 +1049,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	struct dpu_encoder_virt *dpu_enc;
> > >   	struct msm_drm_private *priv;
> > >   	struct dpu_kms *dpu_kms;
> > > -	struct dpu_crtc_state *cstate;
> > >   	struct dpu_global_state *global_state;
> > >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > > -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > > -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> > >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > -	int num_lm, num_ctl, num_pp, num_dsc;
> > > +	int num_pp, num_dsc;
> > >   	unsigned int dsc_mask = 0;
> > >   	int i;
> > > @@ -1083,13 +1080,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > >   		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > >   		ARRAY_SIZE(hw_pp));
> > > -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > >   	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> > > -		ARRAY_SIZE(hw_dspp));
> > > +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > 
> > Please don't mix reindentation with the actual changes. It makes it
> > harder to read.
> > 
> > >   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> > >   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > > @@ -1115,18 +1107,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> > >   	}
> > > -	cstate = to_dpu_crtc_state(crtc_state);
> > > -
> > > -	for (i = 0; i < num_lm; i++) {
> > > -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > > -
> > > -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > > -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > > -		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> > > -	}
> > > -
> > > -	cstate->num_mixers = num_lm;
> > > -
> > >   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > >   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry
