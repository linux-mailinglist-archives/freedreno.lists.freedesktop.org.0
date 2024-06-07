Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAF900CEA
	for <lists+freedreno@lfdr.de>; Fri,  7 Jun 2024 22:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD6310E08E;
	Fri,  7 Jun 2024 20:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vWxYsVex";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AAC10E0FA
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jun 2024 20:30:19 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52b950aa47bso3866492e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jun 2024 13:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717792217; x=1718397017; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SJTzxe5ddw3ZN3ejg2VHMhuR5Wz3A7+WGmdxaZHLCtc=;
 b=vWxYsVexlH+kYKeLGWBtFDNTnUzoxfBJBp6LFDlF71dxmmbQDvDSqniNsWfDWFSufZ
 Cs0vOfD+7S1WwCM3IpOGISBkGv73btJ7mk/kfEFusabSWaEFLNyBCmhYYbB+ib224cFp
 96etsYzOOVesWt/HngOeMy6oxdNTR1OjpEuY+YyRRAuVbOANwlqytVCqNaLNBFM3eKvs
 ZE5bybGV1mJCPQZMH8WxwPjeTeAAqmqW+Ns45tA2/8O37jUoJXY38sK47zgY4z3Fb8iN
 9R9loMJegfw8Tk9cAXrIY41Q/9OBOMob9KsoaXcflqhX3lFDVvnWfx48ziLdy/6clqKn
 dhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717792217; x=1718397017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJTzxe5ddw3ZN3ejg2VHMhuR5Wz3A7+WGmdxaZHLCtc=;
 b=qh23mbhH1cnCXflP52eLB6I9i549XpK2TmNxk1hROGajRUOJVtiwoc4mBStBAKPjuL
 xPKcMq+6y/AWzaT2hVDnsuqdBmW8TZyQ+GMF+i+X1yITcR0gGotfEioE20M5D86hBQkb
 pztLzFzz/4SUMQLfd10IPzWnwCyHK/LX4bswOmQa2vKx5oU+5X7qOSN+7gCr3/VupmZb
 KBkHUKLQHArC9Ya7lPgRH8QhbvINCuJqN9PnuSnos1rK1XB44e1wm9CDyS6yJn2ACOd0
 QoVvo2qOb2DGPEuyU4tBPWetg9gBn0gLO2ZEVw24p5PsAmAJZk+2DlGgfEP2adP3TZIk
 EKTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIQPLWDiBMitPa06Rk+M9fUwfb3eCVzjWI7zu4BNy2IhSbRK2AlK7fyLHewPXmf4MFuMCzGkJOXn/Kb+n3Vo3ngIa7x75hHVDaeuU4cCDt
X-Gm-Message-State: AOJu0YyVKzi/nAQtXsQ0bNEEWjxFNRskvAOOiT//bIxjH26FgCI2+8bn
 MC6TSUoMXa2ndxzIdja9o4vHycmeZaHfnb/1HitddwM668L6/LPvF06j4/lpmiw1JG6lj0dhcXA
 1
X-Google-Smtp-Source: AGHT+IGXgq8j9ZQSdjhR2WRP238Fqx1W2VoFAvOkFfDn+JlkqIE2s+YVCpbU2MO5IYDF067L6l+FEQ==
X-Received: by 2002:a19:ad45:0:b0:52b:f2ab:1303 with SMTP id
 2adb3069b0e04-52bf2ab143dmr524832e87.28.1717792217335; 
 Fri, 07 Jun 2024 13:30:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb4347001sm646147e87.288.2024.06.07.13.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 13:30:16 -0700 (PDT)
Date: Fri, 7 Jun 2024 23:30:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
Message-ID: <ugh3ohzktjxyus4t43jywmrwatz6t4zqz66nm2wdfjou7zu3yd@g64z7gp27wl2>
References: <20240607-memory-v1-1-8664f52fc2a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607-memory-v1-1-8664f52fc2a1@gmail.com>
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

On Fri, Jun 07, 2024 at 10:00:04AM -0400, Kiarash Hajian wrote:
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
> 
> Implement the region-request through the corresponding managed
> devres-function.

Please at least compile-test the patch before sending.

> 
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> 
> Changes in v5:
>     - Fix errorhanlding problems.
>     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com
>     
>     Changes in v4:
>     - Combine v3 commits into a singel commit
>     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
>     
>     Changes in v3:
>     - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
>     
>     Changes in v2:
>     - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 

-- 
With best wishes
Dmitry
