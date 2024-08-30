Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039199667F6
	for <lists+freedreno@lfdr.de>; Fri, 30 Aug 2024 19:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF84510EAB3;
	Fri, 30 Aug 2024 17:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p9m4Sa52";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E0C10EAB0
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 17:29:48 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5334adf7249so2842251e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725038987; x=1725643787; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gKq8Bys/USH6KZ1qBw1qwYVQ6z8sgBRiOI37jtuxbtw=;
 b=p9m4Sa52K/mFzYacUrkpoSVXLgtQIisS21b0VlN6DN61TNlUvntzoo8Xspodb469qM
 +8hamXvnPXxsn4UI9fibaL855o1wPhJL+EY6e8yYHZJdBvAu3r7Be3iNt0amJLW2NeqM
 KoaI9i/lXUxYhY9bUwU0ZSpWR04rZS/MGF9HZOgfU5DrLfpjIm1zfhgz0taD28528bdr
 8mi95iL4+YD+rKC2YS9nj8VEZYD0kXjV2aauGQwoYC/CIAtRQ7V18wgVt/FO5i3hxQIo
 57Pvm0MsB0dnazzhZUXVMP0VwWyu1qzZQ9nBBUyyx7pyHY6mAw9wXF/yF2Di7j9hYC0V
 n7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725038987; x=1725643787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKq8Bys/USH6KZ1qBw1qwYVQ6z8sgBRiOI37jtuxbtw=;
 b=tcgUimG2zOSdXYHv/ablBsQWsiCwLIK0FVlv3SsR+CWoUuIDExCi8SWsoBCmGuQyQH
 5UuTuqYNeihD4tdusifnCDSv9zWNGw7c6WAaJwPqolqwsVELNVOHysghCNviOdr6TfZf
 d/kFitEIttMmYj2sivRmUtn0qSDsGSFMUr7AYRWGzLRis/e8dgky1So1shA76JosPo8G
 C5CkTuBli7Ey+vyIsuspl07SsYpSdWJg7TIOGd+H3ElHXyi+b2Vt6RsaUsqJEIBXVNi6
 gKqJ21iAU0NKtCumgmizjtWGmTMKu31rjdWN6xOt40JuszS6nRHaQllKO1GICXb7Ps9z
 9NKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6z7zFxdGeqF4wFQO5cJW741CdTTbb/BwEvvyaCqssNXi6TDxAZFCyFRol32IY+LeNmxoDw4Tpj8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxsnyCIScrJmE/ZVzlIKdeyqfiPTX7qm4w1rndD7pd8YAYVwfg
 DbSsUvCYdqrdqwU3w64AuW4u9B1HONDBVDKUS2wg8grx8YDZGeW1YSD8N3L4Z40=
X-Google-Smtp-Source: AGHT+IHxxcADvc+QZ/22lw1wDm/AXNztt8D4qol0EtkLRXo6WdtzvIw9t2cOGwGJz4GOWOGI05INZA==
X-Received: by 2002:a05:6512:2344:b0:533:48c9:754d with SMTP id
 2adb3069b0e04-53546b41e00mr2294513e87.34.1725038986104; 
 Fri, 30 Aug 2024 10:29:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079babdsm693823e87.50.2024.08.30.10.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:29:45 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:29:44 +0300
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
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 16/21] drm/msm/dpu: Program hw_ctl to support CWB
Message-ID: <vsg4izby2zjcdtkwteti6by7sl5rwddzqw32yhnevhobgmy6cg@hx6n7tthwj5l>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-16-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-16-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:37PM GMT, Jessica Zhang wrote:
> Add support for configuring the CWB pending flush and active bits

Details are appreciated.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  8 +++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 13 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 30 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 14 +++++++++-
>  4 files changed, 62 insertions(+), 3 deletions(-)
> 
-- 
With best wishes
Dmitry
