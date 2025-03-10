Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B57A5A4A6
	for <lists+freedreno@lfdr.de>; Mon, 10 Mar 2025 21:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847CD10E2BA;
	Mon, 10 Mar 2025 20:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M8WeATvQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EC710E4DD
 for <freedreno@lists.freedesktop.org>; Mon, 10 Mar 2025 20:18:10 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30bfed67e08so27022861fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 10 Mar 2025 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741637888; x=1742242688; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Na0+//dCirkAQ9ySuY1KKDPsWyMmAsRZj0GKZr2mXwM=;
 b=M8WeATvQmX8MuXFDWX3zoycilLC3oagmLkM6IVNUU2+W5tIgHamjpOCPDWlONlZgIE
 WXlw3X6J+T6M3WPNlQ/tRsJpcU05XNp3dkyG+VPh7ahbnxBAmaNTY/cC+9b7gmwuWKii
 aa4lbaIvrfD/0RL3Qqc26BvlG76gQkMRbXk04hCxejMXSlhY5Ixh9UGw1+gxzYbmgfkv
 ClVSZotlo9gjrRRt9GSDKvavHK/beWoJkmTJNeG+wFHTIjqV5gNYX9qXdy1TmNT/XLkR
 xeUsujPul1dVqSc/jCf8Gd1PnYxDl6mxL4OSttagQOJ0lcy6Vb/RUEZza6Wpr8m+jE9R
 5yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741637888; x=1742242688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Na0+//dCirkAQ9ySuY1KKDPsWyMmAsRZj0GKZr2mXwM=;
 b=Lv7jVndgCZa4TTXrxSRCrWLzWsOl6BeAvLhzKjg+5+4bb8R99EbSYVJNSR8m1hajgZ
 LiJV2WGaFwiWPZRs4iMgK95p3JpOFPlEFjEkhIoQgF2c6tfYu+qETwh9utWd/QDGVPzP
 nWSbtr1BEfW/5Jezu/X3dHZ8/E6vmSubeqBq9iNbv5lFxvMfilAxN+x1q639UAnID2Aa
 P1b0xpCPtKWUFxR+UyjuJlxu9+OHWVHpWECr1bl4Rkc2jV2L4W1dtKFXGaOKmhES8A61
 8TERpRZ1IQU8Pqwu1M/79sNK0nguv2+Uk5V8B6P3LCA4wdydaleQc07K9uxuqwRfhFXy
 pqKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTntskmyTeJi0hNkpRHf6YHkXIYDU5pJ7xyhhdR4y1E1JEgiWxx9n/T1jkNlFkVRCIw4UOwd0HxPw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs0Davg/4ayzghpgVvipVhNRnQw5Ja09YBk4kET7JGeUtUlQT0
 xgSXQA6y+vDVNQCKQa6P0+5ru2nREseFA4v/TVUuPHHxDtXbJYgk36Ub2KlhlUs=
X-Gm-Gg: ASbGncvOq2arPCjar1C0x7jc5BIZ/zn+MebAcE0ZshltPspzFktOL83VosMNxdNazzi
 JG7oAuG5g2mtUnYFuGGF1LHDs9bcpF5DkHawMHX7bhBFL+Olj49H8A8ali/aAbtPMcZwYLTW9fO
 9+Av9F9eM8tzepcf8pCBA9vMuPoNX1CbvhGL72fyuogCKZemBvIlDV7lcljb0xqHvnHFIpTo/nP
 oNZV+q0IwvEUsySFJnsgRBoce6BuYs4mlBD/30UIyTqgDwEudaX/EAOtL6Fo6aNOIoaQ1Cb7Y/7
 UWYaGgf/3iyKgxm+ObweqDAoPZaQUvtK+fZ/dnsyuJ6yjOTKZPS4Cr1tN064YTEF43e49smsHOQ
 //AHsIstZerWYX0nWOgY9hj6B
X-Google-Smtp-Source: AGHT+IHcA7kOtf3sam4WAbu1ps2qyynLobUE0HG0axG5MF7JuYSDH5Zq3T6DIc7mWO7eWXCbFWGVLA==
X-Received: by 2002:a05:651c:3c3:b0:30b:c569:4665 with SMTP id
 38308e7fff4ca-30bf46468dcmr39513851fa.29.1741637888405; 
 Mon, 10 Mar 2025 13:18:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30bef40f9cdsm16595941fa.48.2025.03.10.13.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 13:18:07 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:18:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-invisible-married-firefly-945c84@houat>
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

On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> > values in the VC4 driver.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> >  2 files changed, 10 insertions(+), 7 deletions(-)
> > 

> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a2016555aefa81d7934 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> >  	 * KMS hooks. Protected by @mutex.
> >  	 */
> >  	enum hdmi_colorspace output_format;
> > +
> > +	/**
> > +	 * @tmds_char_rate: Copy of
> > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > +	 * KMS hooks. Protected by @mutex.
> > +	 */
> > +	unsigned long long tmds_char_rate;
> >  };
> 
> This should be in drm_connector_hdmi if it's useful

That would mean bringing the state to a non-state structure on the
framework level. Is it fine from your POV? Is it also fine to use
drm_connector.mutex for protecting this? Or should we be using something
like drm_connector_hdmi.infoframes.mutex (maybe after moving it from
.infoframes to the top level)?

-- 
With best wishes
Dmitry
