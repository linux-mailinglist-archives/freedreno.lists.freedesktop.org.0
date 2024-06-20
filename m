Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0EA91157C
	for <lists+freedreno@lfdr.de>; Fri, 21 Jun 2024 00:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D3710E28C;
	Thu, 20 Jun 2024 22:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dUdcTQ4q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3341E10E134
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 22:17:05 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ec4e565d2eso299931fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 15:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718921823; x=1719526623; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UgRdH6j7DUCb+zgLlAkqo1mbZKrdFkN7NmGemmI69Mo=;
 b=dUdcTQ4q35B7MYrw5Whspqmw2HOn/ZqEfw8hxVXJw+eADTM6XqmMDxFaFBWNuZPH+R
 nIb5mfsGXw47godyMMgKr77JN2DESiFCzxAtzUZdufPLRf7TiubeevQKCzPZNLe83waI
 3Zgjxxr9MWxWxtZ8pfM9zo0kQQ+e3JzLVectkBA0wicaPRqCK/EdOBdjVzH2l1eFmw9I
 Dfy2CECu1YP1rGsNKrXexU+SxEQ/hj1sY3QIz+MKq69XSQMsFvzpRE1K299I9Pe4tDOe
 /y489eXPkDixSCRFj+wR8SecZyNBDJjwwesa+mHjo6Q4du/vjEjllLqkEVzRJsJqRGYQ
 6BdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718921823; x=1719526623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgRdH6j7DUCb+zgLlAkqo1mbZKrdFkN7NmGemmI69Mo=;
 b=GbKZLImFWogMFF3DG45JoZ4IargNVD/+fnt80W5NOQnYZTeqycnvh/CHlzMDDmVjAZ
 DliL2xKVf0h2e6OcZFHqVcodSDoPVBLWpldI7BDpwKZ17tzoy+9p+iwXM/vQhOhPzKFn
 LDEgySGbg3TZpguXiNsoksIOhdwURvUBQXPZWlAZScQph6GyrjBCuV/zL7GQKsf2TCn6
 QzZnMD624kUTFR4DiogL+4A1PeP1At2sBXFjf4xf+U8TL3qMhyIV2Y6+xL22aTqdtFiM
 +rhtvVVhC/b3CDHQ+mYCjEc9NePoreh9yhVY6zL2W4vjkis1MZOKyRiWNPe8DrQyZBSR
 kdFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNpm3AfRqGksf08thEPA85CmsvagKKMcanuYvdWVd4mst76wNO9xt6+Fef6cnP3WAzRkwAsYqsHsBJeAJPEfMt03DULaVfhFBMs7YxEBkj
X-Gm-Message-State: AOJu0YxMzTkI09EmSAzaGsdDFCY1kP2FBluXZhT/YrjI4EjPBFoa3B7m
 SkCloLfXWpHlNPPrZ8IdQcg6Tlv5d7koLFgt5OtHy30mo2US1jR1O/6vPLEkh5k=
X-Google-Smtp-Source: AGHT+IE93loPZY8t+qpr1EOLX6L8UuNIadiY+NRCLEISi9+lkOYFgSNULvv5TbnvPEp081aaMmtqTg==
X-Received: by 2002:a2e:b0f6:0:b0:2ec:1f9f:a879 with SMTP id
 38308e7fff4ca-2ec3cecae0fmr43261131fa.31.1718921823111; 
 Thu, 20 Jun 2024 15:17:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d708862sm409371fa.35.2024.06.20.15.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 15:17:02 -0700 (PDT)
Date: Fri, 21 Jun 2024 01:17:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
Message-ID: <hj5xktzlbcrrbqsz2l3men5gmawzeszusixryhjbhm4g7gej7q@tcqvslat4wy4>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
 <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
 <xymopystyfjj3hpqes3uiw2g3dqynxzvz23snrbfzf2judgxnt@j4nmpcbuy7a4>
 <6d416e1a-1069-8355-e9f3-d2732df081a3@quicinc.com>
 <il2bg6bsu4nu4lpztzwo2rfonttiy64grxcsn7n4uybn3eui77@jxyzd744ksva>
 <8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com>
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

On Thu, Jun 20, 2024 at 03:05:16PM GMT, Abhinav Kumar wrote:
> 
> 
> On 6/20/2024 2:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 20, 2024 at 01:49:33PM GMT, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 6/20/2024 1:32 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Jun 20, 2024 at 01:27:15PM GMT, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 6/7/2024 6:23 AM, Dmitry Baryshkov wrote:
> > > > > > The mode_set callback is deprecated, it doesn't get the
> > > > > > drm_bridge_state, just mode-related argumetns. Turn it into the
> > > > > > atomic_enable callback as suggested by the documentation.
> > > > > > 
> > > > > 
> > > > > mode_set is deprecated but atomic_mode_set is not.
> > > > 
> > > > There is no atomic_mode_set() in drm_bridge_funcs. Also:
> > > > 
> > > 
> > > Please excuse me. I thought since encoder has atomic_mode_set(), bridge has
> > > one too.
> > > 
> > > > * This is deprecated, do not use!
> > > > * New drivers shall set their mode in the
> > > > * &drm_bridge_funcs.atomic_enable operation.
> > > > 
> > > 
> > > Yes I saw this note but it also says "new drivers" and not really enforcing
> > > migrating existing ones which are using modeset to atomic_enable.
> > 
> > Well, deprecated functions are supposed to be migrated.
> > 
> 
> Along with rest of the pieces of the driver :)

Step by step :-)

> 
> > > My concern is that today the timing engine setup happens in encoder's
> > > enable() and the hdmi's timing is programmed in mode_set().
> > > 
> > > Ideally, we should program hdmi's timing registers first before the
> > > encoder's timing.
> > > 
> > > Although timing engine is not enabled yet, till post_kickoff, this is
> > > changing the sequence.
> > > 
> > > If this really required for rest of this series?
> > 
> > No, it was just worth doing it as I was doing conversion to atomic_*
> > anyway. I can delay this patch for now.
> > 
> > Two questions:
> > 
> > 1) Are you sure regarding the HDMI timing registers vs INTF order? I
> > observe the underrun issues while changing modes on db820c.
> > 
> 
> Yes this is the order I see in the docs:
> 
> 1) setup HDMI PHY and PLL
> 2) setup HDMI video path correctly (HDMI timing registers)
> 3) setup timing generator to match the HDMI video in (2)
> 4) Enable timing engine

Thanks!

> 
> This change is mixing up the order of (2) and (3).
> 
> > 2) What should be the order between programming of the HDMI timing
> > engine and HDMI PHY?
> > 
> 
> Mentioned above.
> 
> > What would be your opinion on moving HDMI timing programming to
> > atomic_pre_enable? (the exact place depends on the answer on the second
> > question).
> > 
> 
> So
> 
> -> bridge->pre_enable() : Do HDMI timing programming
> -> encoder->atomic_enable() : Do timing engine programming
> -> post_kickoff() does timing engine enable
> 
> This matches the steps I wrote above.
> 
> Hence this is fine from my PoV.

Ack, I'll skip this patch for now and repost it separately (moving the
code to pre_enable function).

> 
> > > 
> > > > > 
> > > > > I would rather use atomic_mode_set because moving to atomic_enable() would
> > > > > be incorrect.
> > > > > 
> > > > > That would be called after encoder's enable and hence changes the sequence.
> > > > > That was not the intention of this patch.
> > > > > 
> > > > > NAK.
> > > > > 
> > > > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
> > > > > >     1 file changed, 26 insertions(+), 7 deletions(-)
> > > > 
> > > > 
> > 

-- 
With best wishes
Dmitry
