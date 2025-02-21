Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49032A3FB84
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 17:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2630710EAFA;
	Fri, 21 Feb 2025 16:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GmoqzwKO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC69F10EAFA
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 16:37:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5461a485a72so2374469e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 08:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740155876; x=1740760676; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HiCM9rHR9ep2t2LpEOjyyuBT+CM+zVgh9rP3wMq2c10=;
 b=GmoqzwKOQFh+DS+S3NYgEXwTiOQUjTnvljaveRouMp9F8G24FTns3eo67vMzUXtACu
 zxZt04fYMMHw3l2HIhUZqdI3Jl8mrBKmFk7qF4X/+u0+WW8NMFLsCZpNd6G4vMoVzHlI
 lW3so+ZoaSLePCmWcNf5mpJLjcTYw0B8AF+dlBmWnLgS74tkYHbZLMirSXZeFzHWmJc9
 YQ/3JYT7sKTIOIHg9JFgCrJ0hRMp9iOHhLMpn+rmK5v0SROTUGawOQVjLlzdUwMFL90m
 mTtFSwidWXYh+PN0jS4XD1Lyc7MDd9jSMiMYtxFgyieI+qGqQG7euO36S240vVkUqqAF
 bF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740155876; x=1740760676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HiCM9rHR9ep2t2LpEOjyyuBT+CM+zVgh9rP3wMq2c10=;
 b=JeTfld1DcRn+55sjP7GaI3/hGxm5JNPTIyGGdz16afmqYdh55/DmEgCNEzp57YXgne
 jUIB+RLOvlt+3foHDmB8Qn1xP/pyiBUScuICiFp9wuiHpxtfSez7/Bj0pg47Plbymk3B
 tEA0Ku6T51Qir0S1ysnkGYHFr4mx3DoLcupV1jvVpCCvQOHF8vu4gbc+Huedy0I2HKXg
 htfQX4s50t+B4Q4OyziCGIYVQKmXrnZ+guAP3Oqe6N3smCtFHYYaG+i5v/OqbgtvOgJ+
 SvZiyH0IZXLfgk9m0wX+/Z3K96tgTS3HLUO9p8O42lQDfsCuJKo4IRuAq1oJmq6+ELJO
 4WZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDBYSjH0HV6Ki0vgjX5aq1uEtabR3cooz/f2KsI5/AiS9azskiL+8EXcyVpTaC4eQbh64YRbYbJ6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytVCogVRy06t5B6cnjqm1xtML4PU4h1TMQ7lqNVJBNo741te/h
 2YGqSjLw6Dx5XH4Yv97lcKRJ4jNAwNl3Cex0k+wBPyBPlbsWhdpJ+mCvLgsofc4=
X-Gm-Gg: ASbGncve2KnvlU12c7lzK9QNnIIisC6fMDvde02LSIKGDyO7+h7UJfo54EdJ5DSQZHA
 K/4ib6PUmAUwokYXggW2N2m2RTx1hjXPcM2mEo7hIsy+2utuE58E49eAdW/XfhFQF55k34US6A1
 S6GLKVEnJSq9bAdOyzEpSP1X8Ux7ciCBKtGrZSsdPxo2OW0y4vCAz8dLEViI4QVNL/9XPK/AG1k
 KXJvXNExqxpacKctE+ZhSzpRZY4/+h4i7Jhjp+ORrPFUckVof27yyoMCSi8rEoNvCflvxaqg3VZ
 1hlwlEyPzu2V0c2pX/OXwnnMEkWdfJkf+tINLkKds9TDjYgov13TYQFJl/Tp3vIiBNm8gxT6/ln
 q0f3uHA==
X-Google-Smtp-Source: AGHT+IGoFXuun5GJ97Xvt7Zgkc3Ne28NUcJZxPJK51Drj8l8NBtis2PX6e4XOtShtMwtO68U8U2oOQ==
X-Received: by 2002:a05:6512:e99:b0:545:c51:4a0f with SMTP id
 2adb3069b0e04-54838edd8e6mr1785885e87.4.1740155876184; 
 Fri, 21 Feb 2025 08:37:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461dea980dsm1758346e87.63.2025.02.21.08.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:37:54 -0800 (PST)
Date: Fri, 21 Feb 2025 18:37:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/15] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <5sio6so2dcdadxps4russkuk4i4duui3oxcl3aeiafkbsw4ag2@g6l42epivgpz>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-14-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-14-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:16:03PM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 134 +++++++++++++++++++++---------
>  3 files changed, 107 insertions(+), 40 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
