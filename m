Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4978698557F
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 10:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286FC10E7C1;
	Wed, 25 Sep 2024 08:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nzrnnUYj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD5810E7BF
 for <freedreno@lists.freedesktop.org>; Wed, 25 Sep 2024 08:30:24 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5365392cfafso6718177e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Sep 2024 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727253023; x=1727857823; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6o6MU6ixdvNUZArkc6QNXbMB1zwtLntaWdMADJeROBs=;
 b=nzrnnUYjmaBAOtGSgymAzONtCnuvY6Pl2Mf1LTk9Ai5Xt2YNjraBVInE4+JNwTlV5l
 OtZeOMx4bD9cpugjcnYL8DBfgsr8Nq3/ovn4lm9qv32a4djkLKCtrzuk8bbrBA+Q0RmP
 rNQP3d3Ri0MG9w3BxfV3+FkZ8TlqutdhXQftJyyGh+iQp2uRopgnr3ojb/xj1VRyUu8l
 /m+Ry73MaeEoL2hn0x6RlZVWGHHEhkGYqOKlCa8Z0GGILgNOGAO5qmApg7q2F94sfw6G
 ohzQpi7HBNhpejAPj+pD+j1r7F8SQJ3mmdQEOguZ4LfaLP1FBVIVJnoPUlghfyvy7GL2
 MQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727253023; x=1727857823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6o6MU6ixdvNUZArkc6QNXbMB1zwtLntaWdMADJeROBs=;
 b=Tui+TBGFziUC+9VGPvr34ML8ORkCdCEVGrRg0GX2qoYc+YPMpvB9/JUSAwphX+toTF
 y6Tmy0g/33fyPBdKSLXrlTwDddJEzo5bcPSpm0oVHxl9YzY4UPj9b86nCA+oIrj8nD/M
 bCRLmeXzu/rBdjEk40OvnKTr7+TswVjeSSYNNdVB/EsU/2iOARdm9qllf0MfD+bVmgoU
 aANW4oCvZeYoLRGpzIpABePqC3LFn68llJYfB4z/UCm+TH+QeBwtdK32kVlOMjsT4aW5
 Ke7MzEwjlXFJoWTPqwmTymR8MzLKm/TXZ06KAunrqxZjo24zwtcrPVJ+OAYG+mtUYW0p
 lPUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLqrRwNkXYymZn7lRCwc79sDl9EKaaVp9vswnvwzXNwGJWXfTsw84v6dwbOwPUxSWFGBi0bWstSCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsLyNfwCJEjZ5c18qnFbt4bozqxsFW68QtNWPU7wt1lKY+8oTb
 GWrsrH3NHkExON5p2/xdFkAzWl9rq4wkWlzArkLVzsgfOagFo22Xpy0/3SWGONc=
X-Google-Smtp-Source: AGHT+IFvMcEx7oBAVp0S3NPQ6xpw/MxKwhCGJtPZwcS5OitwFqPn3wedxom5YNYIQKZtYLZ34wO+Hw==
X-Received: by 2002:a05:6512:1188:b0:52c:df6f:a66 with SMTP id
 2adb3069b0e04-538775666f8mr1042296e87.58.1727253022943; 
 Wed, 25 Sep 2024 01:30:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85f0d6bsm457500e87.106.2024.09.25.01.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:30:22 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:30:20 +0300
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
Subject: Re: [PATCH v2 16/22] drm/msm/dpu: Configure CWB in writeback encoder
Message-ID: <mk7syagvawspcns3tv6eh2u2fwvhoczp2fpklopwdyhltgg3l4@nsikd77xm4be>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-16-7849f900e863@quicinc.com>
 <qfqvtbc2o2xrv35caonsvhykmq6bvjpc5plnknjgkodrsoez6d@rpobkvdyqeb2>
 <fcc4fa17-910c-4c3f-8cfd-5bedad772b49@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcc4fa17-910c-4c3f-8cfd-5bedad772b49@quicinc.com>
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

On Tue, Sep 24, 2024 at 05:14:49PM GMT, Jessica Zhang wrote:
> 
> 
> On 9/24/2024 4:41 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 24, 2024 at 03:59:32PM GMT, Jessica Zhang wrote:
> > > Cache the CWB block mask in the DPU virtual encoder and configure CWB
> > > according to the CWB block mask within the writeback phys encoder
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 83 +++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 16 ++++-
> > >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
> > >   3 files changed, 100 insertions(+), 3 deletions(-)
> > > 
> > > @@ -2557,6 +2630,14 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
> > >   	return INTF_MODE_NONE;
> > >   }
> > > +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys *phys_enc)
> > 
> > it's called get_cwb, but it returns a mask?
> 
> I'd based this function off of dpu_encoder_helper_get_dsc(), but I can
> rename this to *_get_cwb_mask() instead

Yes, please.

> 
> > 
> > > +{
> > > +	struct drm_encoder *encoder = phys_enc->parent;
> > > +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> > > +
> > > +	return dpu_enc->cwb_mask;
> > > +}
> > > +
> > >   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
> > >   {
> > >   	struct drm_encoder *encoder = phys_enc->parent;

-- 
With best wishes
Dmitry
