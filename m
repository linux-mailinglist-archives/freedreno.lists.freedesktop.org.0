Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA5917B37
	for <lists+freedreno@lfdr.de>; Wed, 26 Jun 2024 10:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828F10E7C7;
	Wed, 26 Jun 2024 08:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c/Rujox4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95CA10E7C7
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 08:45:11 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52db11b1d31so916431e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719391510; x=1719996310; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hzxdCXT91751HJvUEbEVilPPM8qkMSIeAMEqqDe5ss4=;
 b=c/Rujox4B3AescujhvCEaqAi7irF8i/CtnrphighKLm6RBTNoRpzBK00xSIoyYtrPs
 0WoKTPNGhqu3p9pjzKlsAK+UtoJ4e2Rh2/nQfAI1xZpLR4fgQV/BVgGQSQgOJ0lqRGMR
 Hh79CBISxswAOD7txCgavctlEj3wBQJF5Y+18hxVszNo6kE41REFui+XNh1nIq4FBrMN
 9kd6KktDO1Sa4KPJe6Eg1zqHy3/La2Y8mlt1tICAJuP54KQGNizNWWJAshaSP2BIjbFR
 xZNLwjXFKIvVNvCFIYT8BF3JAkM62ZPoHDgnG2fc62fG7ldtmRJf7+QSIZ0RmkLW9aPu
 MFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719391510; x=1719996310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzxdCXT91751HJvUEbEVilPPM8qkMSIeAMEqqDe5ss4=;
 b=Wf8sAemvr/uqlIoxGUiA59xHHGTuLY2VxJ3PHX8+IcqWNR2fU0YZf9A3GWsgTAZmHm
 7kkGt9wpdflbGrRE3nLoyHQ7faXfzk+mx80au8ARC0zwN6EyP2Lw3jzu7ZylRlpbN9ud
 M1AvE9nLvqz4PIea9oo3bN5BhTrcwaH7+63JuQqwr+nhLabzcfjfvSHOf8M0XTwNMyMk
 rJbqvtKHn1aOGw43xxpQkbu5vnwEvg8/x9tcqUtrTpszgNmEGlvtR5upOQdpd4LMb0wD
 i2ba7i8/UWF+faE5E1LiYsVoVHqFZKBMoXtgJFx5umCxErjxYwC9rcbntxcfxWcKe4w7
 ctyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiXDnY/LmYZPzbkUh+iBCN3pfgx24COVO8jgZrbx3NDQXcNDZLKOs7fcYzb9VXoeMo9ALVLTSZZUcbHDCFKXGBjVZonPHTG3N280tO9df3
X-Gm-Message-State: AOJu0YySch1xEcDlIRpSoRI8xzC6Nz9irP28TVzLTYzzLZU+IZLOf74h
 C1MFDxZs00DaRSdms4zdKV39lhbAww8RFVhQNBiT6ftInfEJMW+k/LbdnGDA+yo=
X-Google-Smtp-Source: AGHT+IEfNnaYv5wFcwXGDonyXMCAQRs6U5hhIUgaupgn52qc7BZELI6S6uPQT6f7cTlAU8Kn7qOOxA==
X-Received: by 2002:ac2:5f63:0:b0:52c:a002:1afc with SMTP id
 2adb3069b0e04-52cdf7f66f2mr6580219e87.34.1719391509740; 
 Wed, 26 Jun 2024 01:45:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52db1a5b45esm180539e87.46.2024.06.26.01.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 01:45:09 -0700 (PDT)
Date: Wed, 26 Jun 2024 11:45:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: fix a7xx gpu init
Message-ID: <yrhlsznrz3zt72kjizwfoit7st3qtdpug2lgruzpjditik5kh2@a7yu6in37kvo>
References: <20240626-topic-sm8x50-upstream-fix-a7xx-gpu-init-v1-1-ff0a0b7c778d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-topic-sm8x50-upstream-fix-a7xx-gpu-init-v1-1-ff0a0b7c778d@linaro.org>
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

On Wed, Jun 26, 2024 at 09:53:16AM GMT, Neil Armstrong wrote:
> The gpulist has twice the a6xx gpulist, replace the second one
> with the a7xx gpulist.
> 
> Solves:
> msm_dpu ae01000.display-controller: Unknown GPU revision: 7.3.0.1
> msm_dpu ae01000.display-controller: Unknown GPU revision: 67.5.10.1
> msm_dpu ae01000.display-controller: Unknown GPU revision: 67.5.20.1
> 
> on SM8450, SM8550 & SM8560.
> 
> Fixes: 8ed322f632a9 ("drm/msm/adreno: Split up giant device table")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
