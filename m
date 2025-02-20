Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC580A3E8F4
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 00:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586D510E9F9;
	Thu, 20 Feb 2025 23:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dOl32k7w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F86010E9F9
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 23:59:04 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-307bc125e2eso14659921fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 15:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740095942; x=1740700742; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OMtrq7jLHSed46Czeo2rEh53wj+rn3fFBHyDQDyX/HA=;
 b=dOl32k7w1zU85coN6JDOmTzWV3aVCWRNSOMQZcTk/HdiXpHMXOuAtR+FHVyjHR7/2a
 eoW1JGKquKdNfoa2T6+bvxmDwIGTF1swA1tpRJknt9woLKbGj1y4SGG/Zzr1/asbozAp
 7QqGH2Q+H2lr4vI6RuY4uYaAPmsj1OiNLYSLIFj/PMpCxxPMlYU2izifS7zNXt9ynWe3
 U/spSlrAT2dwpg9oBl71m5a2BHiy34OTHbU3i5EBk/jj0xBGsC72/FBWWzCsmyX+oeTa
 Dx9Js+W1SfF5FNxVkEHEsfL7c8iCNyDVwpLWhUcim1mXWS+nn5iQEm3+uCcywtCi9H0+
 jQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740095942; x=1740700742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMtrq7jLHSed46Czeo2rEh53wj+rn3fFBHyDQDyX/HA=;
 b=Y6D9v5o6frUxQXZCqOFXjcYc1heDn/+DZYjzI9g5/FmXgqhlq7lT9spGF0MccuCKNG
 NVgxkfjVSQoaCrLtf0AHmOVwbBoO8Th3rsTl6gFeMpsv0ri2+QblKMagMIIeCBNzgtla
 SP8CjmSW35C5w56Wq3Gna9Y0O4kIk3W71CspFo9zBfl40R0lYoY9Gcl6wuvoar4IznIB
 wD7sVk8M/ET9wJVSAgC17EaZm4Fu0f++Myj2/ZdBMzjytl73ipciMoAnF80tuSgFfVm2
 nwO4dNsMT6PvOIEZQn5c4Td9d2wvh/pZVP4iNh3/OKVUYMorTT2YI2+3mD+ZAvK8wQrM
 fNNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+xgSAdx/j1xF9vgGYUXXhec3dMYF8X212GdSvQGlHQj8s5sMLPjRAwVuA1KcLY4l+LSNEbdlTlds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLeBXNamjmsYh3oA3Jn1r0ZTAG0sci193aiRmw2Z+YkCXXvLIh
 9A3ypzo2ZbHabphYG5DtRvrMfJ7O68UW96c7KcthYfTeUwvR8wNnJqfpcHDfuLQ=
X-Gm-Gg: ASbGnctXYCfGynA2+flqMC6EL4FPKZXMPrXneUmksi3I7kJb0sALrO7OhPrEuTtA8tD
 KV23xrn6p2s9My2UmpnL1a8g9F+xkFQGQYJx64yf/7S0CP9GL1XL7yYeOAETiAW7kCbHB+PBmau
 zU2xxwLmju+OUljpCP747nLnXYKkfIRChj4U3/uxo00LzFHvo1O4AojcvyHNNfEucqcq/RRHnGJ
 /qnNOAuNCktIH9yAR0IcpFDtMEfVlrT5mKUroeGCbnnwTtLNPg46/1fhJQLoUFF/R2kGmp4sZQ9
 Qvrr7jmkJ+Qb/S8wxXPYk0LCMfSZeeOsGAHjRMjR03VrJ+peodW8yopdIRUeyn/qbIBeW5M=
X-Google-Smtp-Source: AGHT+IFRmoaRAMtXQeskCBCDhTrEaQ+Ff7h67LqHPuXzExls+JzAw5IkkULjzP9XZbzdpa2zldli3A==
X-Received: by 2002:a2e:7009:0:b0:309:23ea:5919 with SMTP id
 38308e7fff4ca-30a5998baa8mr2567221fa.31.1740095942262; 
 Thu, 20 Feb 2025 15:59:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091fbf58cfsm23285251fa.110.2025.02.20.15.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 15:59:00 -0800 (PST)
Date: Fri, 21 Feb 2025 01:58:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/msm/dpu: allocate single CTL for DPU >= 5.0
Message-ID: <7vcnej2hh3knti66dfyatbcyrlygbwqtwdlumpf4aqmupuopcf@pcpkbn6fs4h4>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-6-71ca67a564f8@linaro.org>
 <4aix26abutkas2fpj6ubu2hbqeljpgr5e3m24akeb3jz33limj@c7rymwz6zmft>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aix26abutkas2fpj6ubu2hbqeljpgr5e3m24akeb3jz33limj@c7rymwz6zmft>
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

On Fri, Feb 21, 2025 at 12:34:12AM +0100, Marijn Suijten wrote:
> On 2025-02-20 12:26:23, Dmitry Baryshkov wrote:
> > Unlike previous generation, since DPU 5.0 it is possible to use just one
> > CTL to handle all INTF and WB blocks for a single output. And one has to
> > use single CTL to support bonded DSI config. Allocate single CTL for
> > these DPU versions.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index 5baf9df702b84b74ba00e703ad3cc12afb0e94a4..4dbc9bc7eb4f151f83055220665ee5fd238ae7ba 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
> >  	/* Clear, setup lists */
> >  	memset(rm, 0, sizeof(*rm));
> >  
> > +	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
> > +
> >  	/* Interrogate HW catalog and create tracking items for hw blocks */
> >  	for (i = 0; i < cat->mixer_count; i++) {
> >  		struct dpu_hw_mixer *hw;
> > @@ -381,10 +383,16 @@ static int _dpu_rm_reserve_ctls(
> >  	int i = 0, j, num_ctls;
> >  	bool needs_split_display;
> >  
> > -	/* each hw_intf needs its own hw_ctrl to program its control path */
> > -	num_ctls = top->num_intf;
> > +	if (rm->has_legacy_ctls) {
> > +		/* each hw_intf needs its own hw_ctrl to program its control path */
> > +		num_ctls = top->num_intf;
> >  
> > -	needs_split_display = _dpu_rm_needs_split_display(top);
> > +		needs_split_display = _dpu_rm_needs_split_display(top);
> > +	} else {
> > +		/* use single CTL */
> > +		num_ctls = 1;
> > +		needs_split_display = false;
> > +	}
> >  
> >  	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
> >  		const struct dpu_hw_ctl *ctl;
> > @@ -402,7 +410,8 @@ static int _dpu_rm_reserve_ctls(
> >  
> >  		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
> >  
> > -		if (needs_split_display != has_split_display)
> > +		if (rm->has_legacy_ctls &&
> > +		    needs_split_display != has_split_display)
> 
> I deduced a long time ago that the check for rm->has_legacy_ctls is not needed.
> 
> needs_split_display is always false on DPU >= 5, and neither of those SoCs has
> DPU_CTRL_SPLIT_DISPLAY which means false != false is false, and this condition
> never triggers on active CTLs even without checking has_legacy_ctls.

During the transition time of 1 or 2 patches there is a window of
DPU >= 5 and DPU_CTRL_SPLIT_DISPLAY.

> 
> Other than that, this is all successfully tested and:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> >  			continue;
> >  
> >  		ctl_idx[i] = j;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index 99bd594ee0d1995eca5a1f661b15e24fdf6acf39..130f753c36338544e84a305b266c3b47fa028d84 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -24,6 +24,7 @@ struct dpu_global_state;
> >   * @dspp_blks: array of dspp hardware resources
> >   * @hw_sspp: array of sspp hardware resources
> >   * @cdm_blk: cdm hardware resource
> > + * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
> >   */
> >  struct dpu_rm {
> >  	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> > @@ -37,6 +38,7 @@ struct dpu_rm {
> >  	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> >  	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
> >  	struct dpu_hw_blk *cdm_blk;
> > +	bool has_legacy_ctls;
> >  };
> >  
> >  struct dpu_rm_sspp_requirements {
> > 
> > -- 
> > 2.39.5
> > 

-- 
With best wishes
Dmitry
