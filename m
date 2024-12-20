Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA339F8C3E
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 07:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053B310E06F;
	Fri, 20 Dec 2024 06:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uAP4YjT9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE2A10EECD
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 06:00:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso1650149e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 22:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734674430; x=1735279230; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lztogWLUolK8A0gjuG8auzrWDWfVBR792pZiblADSI0=;
 b=uAP4YjT94G8JRuvf8F0ETy0dm9UXrwmnebyLJjHENOuTS9uoklDyRMEQ7mxHbkw5zW
 v5tejYkP3IVwm+X03sclUFipaN3iT99aKxLl4YRyj+/nXJrrSYG+AdhPOhKLZULX1jTE
 QLQm6hBEwow1vxjXJ2zgiNcsGpielZSWkddMuxMXrJkwH/3zhWaxoHPpYYEKG+ikAs3j
 fxtqReu/AnlyE4HOZyswN8gMUr3HWA2oq/U9pSgQRBaeHt45+1oq+Wf59f4pGyLr6qDH
 UnNA1NxIvKpbczfGLHWq3cpG0eG58LTyWO5sWGQUBzBtFrDv2Is7GiwNoKYsNd6VIm/y
 SBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734674430; x=1735279230;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lztogWLUolK8A0gjuG8auzrWDWfVBR792pZiblADSI0=;
 b=dKY0IYvd/Gvlzmg9imCVekHElpETILPUY2FlNE7+uBn2BMNL5AemPL5lmGrix4MGwh
 M8XQLim99LXWZAk1zwQv7Agj29Ebbw6+dnGvTWdP7rWzpsEoNQIliCidqe5/3+WJ4XBA
 vR8SeEaPro+8rkwKE0aOL6WPJWT24WC0V3rC7fI+xkA++OsA7s4EK4v7B899tAf87IG2
 MXmTO7r1O0luRLLe6m69xiGOMrEJekIOSNwiK/ogTBNfshHWQ9NWU4PipJzHNyi/n3M9
 4R2C0ihBgzfUjnMdw2WXuUj8ueaVHLznwTUKaqgEiCCWoHPGsJopEM8mI1ZLsLh/JwBZ
 MyfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT2EcgmFwPbvcqeFtFg6uA1IQAP4WUqYyvcibU4ARL0QYyJzIOUhD3dfeMuj8dHcN/qr3j9AY1otA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYzy0cO+i1hUt6LD5pu89XJDy7icy8mpTvLk/8H0DxCt4nYr6M
 kA+4JPuEuCVEBje6+wDwW/Fm+CYIBHoz6pU6QVPqzQRx+U+VzGD9r4PInP3jdaE=
X-Gm-Gg: ASbGncuRSPVOGfLS8nBNPfDbTH/LM4PduVeURNHZl2xoJ9e5gHkIKKJU23P4Zce4XH+
 XMKuagoFXe41ACMDGafz8Akqov5WyZVaFzHo9t+pQ9hCi/ddDjmcBo5BDF/WjelJ2JlZUUIxXww
 Oz1Xlce0oAqv+FVzwdeA0q8MLO5v1nUMDlye0jM0JZf41LJHu5lOTDj4/6oakV9fwfplDF6y1jF
 DGDJ/DTMpv7IHVAoidV2avPNFFteVNcq4tM7NdM+HiAaPLUeC1tahyQ/GCqWnQMPWppJGVPxTee
 kr2rClnINHd6sclWVkQglVQDw+xbsykaQW4/
X-Google-Smtp-Source: AGHT+IFiEdq38m3N3tZdESWDddegsXGp5KSA4zDLDiDMTHVXrl2c04WWztsil1xL9Q1eYop5O6E+PA==
X-Received: by 2002:a05:6512:3405:b0:542:2a8b:d56f with SMTP id
 2adb3069b0e04-5422a8bd614mr136330e87.4.1734674430475; 
 Thu, 19 Dec 2024 22:00:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223835779sm379307e87.282.2024.12.19.22.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 22:00:29 -0800 (PST)
Date: Fri, 20 Dec 2024 08:00:26 +0200
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
Subject: Re: [PATCH v4 24/25] drm/msm/dpu: Reorder encoder kickoff for CWB
Message-ID: <dszctcu5mm4hudc53gqpjklcugah5lisvvfkbmejeywgceqyl5@dqzopvt2lb7s>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-24-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-24-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:35PM -0800, Jessica Zhang wrote:
> Add a helper that will handle the correct order of the encoder kickoffs
> for concurrent writeback.
> 
> For concurrent writeback, the realtime encoder must always kickoff last
> as it will call the trigger flush and start.
> 
> This avoids the following scenario where the writeback encoder
> increments the pending kickoff count after the WB_DONE interrupt is
> fired:
> 
> If the realtime encoder is kicked off first, the encoder kickoff will
> flush/start the encoder and increment the pending kickoff count. The
> WB_DONE interrupt then fires (before the writeback encoder is kicked
> off). When the writeback encoder enters its kickoff, it will skip the
> flush/start (due to CWB being enabled) and hit a frame done timeout
> as the frame was kicked off (and the WB_DONE interrupt fired) without
> the pending kickoff count being incremented.
> 
> In addition, the writeback timer should only start after the realtime
> encoder is kicked off to ensure that we don't get timeouts when the
> system has a heavy load (ex. when debug logs are enabled)
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 74 ++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 14 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
