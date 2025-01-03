Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66A2A00D97
	for <lists+freedreno@lfdr.de>; Fri,  3 Jan 2025 19:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A568810E918;
	Fri,  3 Jan 2025 18:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cIrLI3iB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FE110E918
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jan 2025 18:23:31 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5401c52000fso12752952e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jan 2025 10:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735928550; x=1736533350; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CEJ8oonqtcvJ6IAkiqfllwsDWGyyWC08rfpdJ62V49g=;
 b=cIrLI3iB2gwTKbQpZ203f0b0gv9RSLGBVoX0ynez8YVCwi7XqbSHoXi0cK4U82WJc8
 6cqoh+y0jbXMg8oR+ZCpzB294HcdkcZlAoTaSXykbfzcFH5usZhXuXG+CNZlgP0tRgwg
 vYYmJrKZkVwlzhUg/1S/jnm1k4C450bBYXH0m37RtmxdXwrDsLTcA4sKTHEVHHKJMRri
 LJimO6e17xxm1MLDtwMr9JVWk5LFpQyDRLAN3G2ai0EAiKMBeiDQ9qLruOQRKMVMC2DC
 k+8/rrdk9gvvhbd9H9iOR3mAbWA1nx/NZh2GvKJf3YpSp/wjXbwkxpRVhsoms60Z6uSp
 NUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735928550; x=1736533350;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CEJ8oonqtcvJ6IAkiqfllwsDWGyyWC08rfpdJ62V49g=;
 b=NXgws2BN36zZZVlgYUNSyNE6guwgp8F8JAIqHtim4lAe+VPgAPioOY62XM0jqD7soM
 XVX9R0MI8J4YlaogZxBq0os3c+NuZbCsYAfbtjpqrjFFgVCrwYGgaEq9LRfts8+g6umi
 SHoACmu4fxVILn0+aIBELkt9JOUSLaHMwWy4JHMxz9+PvtT17N2gZFD/EgX7i1gRCpMH
 zRcByluHCQsazUH2jIC2Iep9fW2vZebGDQBHen7cJ/r7I/UB623gu8lgeX/zz0mn51Y/
 BmasIJGwO8VFpVAk9CpkbL3DrbqRTcc5hOyPfZngRC2kcRzxc/MMmBauUFJEOXUHRJbq
 IrNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJudWR2sJ7lvH53jvJ0zIWjY8Zay1S3zFoWNpTejzWrXm3qsax3YHQUSKWWZMpHCacnf1/SJvdGoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7T/WuRQ79uSTuEWAa0bH0uLrtQN/MUXfIkJ4Rx1JWd0LEYb+i
 tTP+VmSLEspA1CipSEVv+58esxiCGrcPmZSMKM5kF9ZrzXTjYubPsA4csjPoiSNlfHUT8i6Z2Ui
 nsgM=
X-Gm-Gg: ASbGncv5SOjXj+XlWa/wfTWz5cyN5BUJ4gL0TLPZWUmAHW6FLj9B4Yu+t9fFvMlqog1
 ASdEb1zVlpRp32YNYlWtA4MjIbWYyFEDpxE/jQ9uYl+YPgEXi2jOOQDLl9WExhHX204wOPRxmxS
 GqaYBsO7EAUgVqOGxsmusEfe4e+rRlyvZZdO7gJzEsbRsjJDzAYn5OE71qCjKOP5aHOvveZ7RpM
 P1O9UNSX7wyUyn+PNjjKiM6puWEZl2rd4Sw7899hIiDmOFI22bDBoeYPFEEO0U2TeBspL+dF3s3
 hobV/CI+/HEaFBgT9FXxnMsi9b7BEe5AE5WQ
X-Google-Smtp-Source: AGHT+IEvvepfOBU+EsQDIAwIOdIqeI1ZlSV0iPdxp215z+zkJx6XJtR+bJJEVpMxCwPG4qFEfl+uKQ==
X-Received: by 2002:a05:6512:23a0:b0:540:75d3:95a4 with SMTP id
 2adb3069b0e04-54229538b24mr15437986e87.17.1735928191141; 
 Fri, 03 Jan 2025 10:16:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813692sm4128190e87.125.2025.01.03.10.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:16:29 -0800 (PST)
Date: Fri, 3 Jan 2025 20:16:27 +0200
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
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <a4akor2liqafta53zeev22x2pkqwzo5szwidr2ruzdvttvze5h@jtio3jue7ez3>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
 <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
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

On Fri, Jan 03, 2025 at 10:03:35AM -0800, Jessica Zhang wrote:
> 
> 
> On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
> > > Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> > > to account for concurrent writeback
> > 
> > Why?
> 
> Hi Dmitry,
> 
> This flag is necessary to specify that CWB mux(es) need to be assigned for
> the given reqeusted topology.

Why is necessary? Please rephrase your statement (we need foo bar, so do
baz).

> 
> > 
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
> > >   3 files changed, 20 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > >   		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> > >   					    &crtc_state->adjusted_mode);
> > > +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> > > +
> > >   	/*
> > >   	 * Datapath topology selection
> > >   	 *
> > > @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > >   	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > >   	 *
> > >   	 * Add dspps to the reservation requirements if ctm is requested
> > > +	 *
> > > +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
> > > +	 * enabled. This is because in cases where CWB is enabled, num_intf will
> > > +	 * count both the WB and real-time phys encoders.
> > > +	 *
> > > +	 * For non-DSC CWB usecases, have the num_lm be decided by the
> > > +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
> > >   	 */
> > > -	if (topology.num_intf == 2)
> > > +	if (topology.num_intf == 2 && !topology.cwb_enabled)
> > >   		topology.num_lm = 2;
> > >   	else if (topology.num_dsc == 2)
> > >   		topology.num_lm = 2;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
> > >   	int i = 0, j, num_ctls;
> > >   	bool needs_split_display;
> > > -	/* each hw_intf needs its own hw_ctrl to program its control path */
> > > -	num_ctls = top->num_intf;
> > > +	/*
> > > +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> > > +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> > > +	 */
> > 
> > Why?
> 
> This is because num_intf is based on the number of phys_encs. Since in the
> CWB case, the WB and real-time encoders will be driven by the same CTL. I
> can add this to the comment doc.

Why are they driven by the same CTL? Is it also the case for platforms
before DPU 5.x?

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > +	if (top->cwb_enabled)
> > > +		num_ctls = 1;
> > > +	else
> > > +		num_ctls = top->num_intf;
> > >   	needs_split_display = _dpu_rm_needs_split_display(top);
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > @@ -46,6 +46,7 @@ struct dpu_rm {
> > >    * @num_dspp:     number of dspp blocks used
> > >    * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> > >    * @needs_cdm:    indicates whether cdm block is needed for this display topology
> > > + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
> > >    */
> > >   struct msm_display_topology {
> > >   	u32 num_lm;
> > > @@ -53,6 +54,7 @@ struct msm_display_topology {
> > >   	u32 num_dspp;
> > >   	u32 num_dsc;
> > >   	bool needs_cdm;
> > > +	bool cwb_enabled;
> > >   };
> > >   int dpu_rm_init(struct drm_device *dev,
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
