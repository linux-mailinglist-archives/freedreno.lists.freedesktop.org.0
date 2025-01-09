Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096AA07513
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 12:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AE410ED7B;
	Thu,  9 Jan 2025 11:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i1HueGXP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1919D10ED7C
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 11:50:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so10219805e9.1
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 03:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736423413; x=1737028213; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SBUIkyq8HThi2u/QbO+9Ek4VXanc8mg0IJge15zLjYc=;
 b=i1HueGXPRAqV4nwUNppXRQUm28V4fYI/SqF0aHr5fzbW7MoMYKC6ipU/9Ltq4pV+Gq
 uWqG+Gxvo87jtQSlh7hMtAP/xTEvrfsngpDnamE/6NAr1/nNWiFYUxJLSQujvvW2vevw
 /4zQc7XIobLhDq/KsJledq5B2nItZVLV9Dg9+wGT0vHidsovFNzJaNZXRTbHdP7eoxUz
 1cYdt5a+ZOJk84lRBitKHmwZTE6ldNHNIX4llHqlNvvNC6bPvVHa0j7/kUMbT9Chp1V6
 WAzj8YQgQlF6zgncT8Rr1mybOk/HKp/nwg3rpSX1PdFoSuRKoLE5NxBoEBVPU8RZXwO0
 jD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736423413; x=1737028213;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBUIkyq8HThi2u/QbO+9Ek4VXanc8mg0IJge15zLjYc=;
 b=OycNt5nyNS+F+sziD4qvGnkKP8hDV/rPkCIzzou1HRr0hvadgdrD6JH4PGhWF/ZEj7
 RC3fk6+T86gKCuOLikAMCRZV0pTp8mkoUb7kWCwKKtCCujc+copmC+pKwMlQVz0bzlLm
 ZNw84bHZ8V8GwFwKpIws7N1KyW35avs8lvW7qUFfD8YpSBOMJIXSv4wu1OL6Pq2mjec6
 VXoapY1isq78tuKR45L8tiR1s0DTMoRiyRFhN6q4L/0rCfAY84BzTVAP9NJyhOH45U2T
 2KJxcIy9zyA3sHZRbFTzLfrAneC36e71/6yVKqyIngaTBlfotNqSMoXk2NCgkJDD3LiU
 0UMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgkQquOoc00GnFgbGNiFG0TIhJF7EwEJTcZx5GV7/YGITossj/MfMS+PTHfc3O/OQlnHuOvTN5bHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMkFr02jBI4ahbnpdWAl/MqbqcTRAFi6cEy/tSeoaePUlAuOsi
 j/j+uJ2VX1PBugmllRuNEA03/uQjheBhDWVnTtm9vKO45/2mdAc5H4zoKFohKsw=
X-Gm-Gg: ASbGncvDeIS2bHlY3g4MPx/qn9bEOlUXjPKCLMg737I/H0us+e8fdL2dSknR96NQRCn
 gHii1zzPG+6M4f85swP/Zlb4WcbI0huwbQ/fpRruQ+Ssb6AICOaIhnoaP6ARg5MMYLXmnM5N7nR
 5vC7ci8WfIV6xFRIBEzbx0r5vYwzybbqZu7PFY4IwvROGp5WxS36zgrGy/KrmD9u6zUIt3ZzWo2
 J+LcoSeeGa3ySlmA4/xvlg03fpYJyQPMzodgiIvFe51/WMBB9EWZNk=
X-Google-Smtp-Source: AGHT+IE6bPuwfgpmvhR0wnVywkO+uV/zmxqYUYfEIWBePuS9J7kF881P4MIK7Z1l4XbIG4X4Nze9zA==
X-Received: by 2002:a05:600c:3152:b0:434:f9e1:5cf8 with SMTP id
 5b1f17b1804b1-436e271d3a2mr66267645e9.31.1736423413467; 
 Thu, 09 Jan 2025 03:50:13 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3838a3sm1628874f8f.33.2025.01.09.03.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 03:50:12 -0800 (PST)
Date: Thu, 9 Jan 2025 13:50:10 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z3+38i2MTgwNGKSU@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-4-918949bc2e3a@linaro.org>
 <zfyl7xvkackpv2tfabvcjqt6e3uxxgyxwg6t4fvjrlzeg5m6nf@wc5suvzcm54u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zfyl7xvkackpv2tfabvcjqt6e3uxxgyxwg6t4fvjrlzeg5m6nf@wc5suvzcm54u>
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

On 25-01-08 16:25:31, Bjorn Andersson wrote:
> On Wed, Jan 08, 2025 at 04:31:46PM +0200, Abel Vesa wrote:
> > Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> > 1.4a specification. As the name suggests, these PHY repeaters are
> > capable of adjusting their output for link training purposes.
> > 
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >    requests, while passes through all other AUX requests
> >  - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > The msm DP driver is currently lacking any handling of LTTPRs.
> > This means that if at least one LTTPR is found between DPTX and DPRX,
> > the link training would fail if that LTTPR was not already configured
> > in transparent mode.
> > 
> > The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> > that before link training with the LTTPR is started, the DPTX may place
> > the LTTPR in non-transparent mode by first switching to transparent mode
> > and then to non-transparent mode. This operation seems to be needed only
> > on first link training and doesn't need to be done again until device is
> > unplugged.
> > 
> > It has been observed on a few X Elite-based platforms which have
> > such LTTPRs in their board design that the DPTX needs to follow the
> > procedure described above in order for the link training to be successful.
> > 
> > So add support for reading the LTTPR DPCD caps to figure out the number
> > of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> > at least one such an LTTPR, set its operation mode to transparent mode
> > first and then to non-transparent, just like the mentioned section of
> > the specification mandates.
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 24dd37f1682bf5016bb0efbeb44489061deff060..ad09daa4c8ab5c0eb67890509b94e72820bab870 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -107,6 +107,8 @@ struct msm_dp_display_private {
> >  	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
> >  	spinlock_t event_lock;
> >  
> > +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> 
> As far as I can see these 8 bytes are read and acted upon only within
> msm_dp_display_lttpr_init() below. Any particular reason why you don't
> just put them on the stack?

Sure, I can do that. My rationale here was that this caps hold more than
just LTTPRs count. Thinks like max lane count or max link rate are part of
the LTTPR common caps. There are drm generic helpers for each one where
you need to pass on these caps. Yes, at this point they are not used in
the drm/msm, but looking at the i915 and nouveau, they seem to be
useful at some point. This is why I followed the i915 to safekeep them
in this container struct.

Anyway, I'll drop them from here and put them on stack.

> 
> Regards,
> Bjorn

Thanks for reviewing!

Abel

