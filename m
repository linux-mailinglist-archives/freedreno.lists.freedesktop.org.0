Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E9A30240
	for <lists+freedreno@lfdr.de>; Tue, 11 Feb 2025 04:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5B10E412;
	Tue, 11 Feb 2025 03:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UFRhgMGm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEACD10E2DF
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 03:42:11 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-545054d78edso2723308e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 19:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739245330; x=1739850130; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3h3R+b42z3JbozwtWpuKCcLFhvPQJ2gwAjSjK5sbxtE=;
 b=UFRhgMGmk8kadEJqn6TxIp7pnEYz0csDy/I79/bE42XjiegEwGb6aGpJyZTvbZhUTX
 NZHyAOuVge0a7hEiD+VbuBWTvhV8OWvEKWiealS52ylzb4HPCtHIKJBToyY9szuTwoUy
 Xf71ZMx5PwdEkUVua/5hHrn1kijF0EPyVU1PolUrQq+pFksf+hd4xC0uQBVEO9xZZ1eR
 42G5S7n4xTzZxXSFPxD3vIXqa8FY11lokOZ9HdsLaKad8PI9oN+8lokyDeAK8urAzyOw
 aG7wY20BUab1RoFWaRrFdvQJeXvoLvooQ9fprLIPiRqg40Tc9ts+MIxHUimnHVhVgm7M
 TVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739245330; x=1739850130;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3h3R+b42z3JbozwtWpuKCcLFhvPQJ2gwAjSjK5sbxtE=;
 b=XYIn0iriowLQcT6qKWpvx495s5+08aSech7zayaNI4e3HUK9yOSFupYv+R3GsPifbs
 UQrSSL6/r+tyNi+3OaOdgc2cccxtmILz/GIarzWo/2D3j1PZeMjx8BA8cdcZzCn103y7
 wjKMyDn04awrPZaNJxyfAlV0YpuqHrUcbb60J7KaZRowmp6jftCjfeNRjVa1a1zZOhRd
 f1hlQiFZoofWwraRA0bhpTxG1ffWNi5zT92zrbNf/fNPox8dE+0xLBjvYa9nK3cC2mjZ
 T7h1mk/PwKtwD/wDeS9qI8CZ+xzI4AxLTY7ous0d+yw2AMHrbj4wScBh/Q/i9efZ2w4k
 iJEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUETaw6K6FYhgxLmsi3MraPArhgduhHz2Sw63lcVsyafuZDRMRkUSJmjHR88/xFgCseiUdhBfKgLw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywec+U4jou7PfF1I8YuooTtea1GPOzbvmY4wABmiM+0IxxNr+AH
 XtJ2GvEh1Bq1OfhtuaxmBV7QKf+/YL4ziGl0JV+gALm7zA6uiP73O41sOAuooRk=
X-Gm-Gg: ASbGncsAqP5YzamKr+kMBFdN01JhfYat9eJ/OpSHYUlVs7W6DxzQq5IOYIYAHvYquLj
 qmJ7OshDtZPolg1llYgOH7+IYNfiUuFi8kdCTraHrdcOwwL3IXtCBMW7BQ8kFpa8rSqVQaL/l0K
 RQcT/OjhzYHwl0uQGTMp3054nXrb+TrcbAh1vJ0FGudcFvEEm2ieiI+/NVmWL2iZ0cOYq40Y1Pe
 SBqsjfE83pm/MHbGI/PNYVi9K773tZNZf6yZRQPEJds98ytTsfAA6nKIvRPyL0FqRVGfvZ2RyGp
 fpbz0PwISBEJc2bF53cDPxpKnD0bWNUiX1al04xwm9aJzi/9ywGMo5na06J0cu/IVEsiRQ4=
X-Google-Smtp-Source: AGHT+IEpuTZOAkvVDyVOUqFsqHiob4PAIXyJxs6eBLCg9MdHYmCorlqmyE3GpuhdGXaaTLkizjdVqQ==
X-Received: by 2002:ac2:5f6a:0:b0:545:95b:a333 with SMTP id
 2adb3069b0e04-545095ba432mr2186571e87.16.1739245330219; 
 Mon, 10 Feb 2025 19:42:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450608a74fsm804870e87.179.2025.02.10.19.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 19:42:08 -0800 (PST)
Date: Tue, 11 Feb 2025 05:42:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] drm/msm/dsi: Use existing per-interface slice
 count in DSC timing
Message-ID: <guhjhtm54xttaech3jpnsqqzfevadure6clecb5elruxxd6trd@sunww3caiial>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>
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

On Sun, Feb 09, 2025 at 10:42:52PM +0100, Marijn Suijten wrote:
> When configuring the timing of DSI hosts (interfaces) in
> dsi_timing_setup() all values written to registers are taking
> bonded-mode into account by dividing the original mode width by 2
> (half the data is sent over each of the two DSI hosts), but the full
> width instead of the interface width is passed as hdisplay parameter to
> dsi_update_dsc_timing().
> 
> Currently only msm_dsc_get_slices_per_intf() is called within
> dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> documents that it wants the width of a single interface (which, again,
> in bonded DSI mode is half the total width of the mode) resulting in all
> subsequent values to be completely off.
> 
> However, as soon as we start to pass the halved hdisplay
> into dsi_update_dsc_timing() we might as well discard
> msm_dsc_get_slices_per_intf() since the value it calculates is already
> available in dsc->slice_count which is per-interface by the current
> design of MSM DPU/DSI implementations and their use of the DRM DSC
> helpers.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c   |  8 ++++----
>  drivers/gpu/drm/msm/msm_dsc_helper.h | 11 -----------
>  2 files changed, 4 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
