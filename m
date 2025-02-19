Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F167AA3C5B9
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 18:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DE410E49D;
	Wed, 19 Feb 2025 17:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bBkGFznA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5829110E49D
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 17:10:36 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5452c1daabeso56856e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739985034; x=1740589834; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F35gCuOu8YlsVwzY+YGVE1BEl6QJE8ppkj0geSACBWg=;
 b=bBkGFznAS0BWE/OUGxldbG71DlmWvUgBSZHC06digVFf+bNu2yV8zTpnUFJEvsw5E3
 eUAd9ImAEtHg+OB492xlD66OGNMQ84bFaSu7U0BGRLdsKUOwd2Fq54NWfWUSoXeHwVKK
 aQpIMQCBe3T4tAyEEnYIYliRSxmzjqQ4bQGANMMpXwmFWUaW41c6TTjY0hBe83CooUjs
 mGGkQU9IzMk9KbDHiEpJQXiz+mLOofbVWiV+vGiziujef+8nuHoosoqrM5p0ZNsn0ZnO
 VPnu1/zIxohnVDC+ZrPlwWxI9/nVK3UaYb6OCkq7RtuM3HfRpmqSMB4wdAoSSLcR8j2J
 dRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739985034; x=1740589834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F35gCuOu8YlsVwzY+YGVE1BEl6QJE8ppkj0geSACBWg=;
 b=sOywCq8C+k3vnNM0OmR1qhic0mpEyUpHFAXQoosUGW4s8JvI/FQPMQ7nJPQFd+B+SL
 aVXJVpMmyu0NZKQu8a4hkeNKY/2E16RZgyI+h9eDAsl4Nv9jxalS4XOzY+BwN8+j06Ju
 7p0/Kiwo+ciXzHvvpD/JJT4AyG3YHs0tkgedpueuTCa2BEkTzKBURWUEjpWEgpBwqG1T
 7h+v1jo1IKcDm/J+YvAh1BJ3qbdreSMJfwVCiYsa35FsI+YZnIJac9p78L7O9xQofv9F
 Azp/FbkbO5tK0ZyWbd9twsPwd0IXkcPSkfQ62LN4sZ/6yt4Ke19n+gcEA7A/9TIBsqCP
 mcrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw0DsYGVRKCHY+9Rv1C2/6XG1zZJhKW7F3oIELhnXa05j/AA1FJUHszZVojUsvi69HlkVWexsqzkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze3LKIufHkQ/b/2AVB03cQz2mvOXvm+fhZFmVDQf8wHwe1QIrA
 Shw05IbFeHTSngmSq6tPjtSPIbLizRVa4zT8oNYUJiEYwKSE2X5YmUlgaA94n5I=
X-Gm-Gg: ASbGncvwTsdWZqWEZq1kW2jl2RoU+RoJtZnp8KEVA/WVyCbztaKFFvAIZYt7nVA3KpU
 PnjpTvB3cB+vLMtsfAD8g310uTtHcxCDXAn3/1cO4hW2mO3SIjECKswdMJpE3TYNiygmD04Qqyk
 TUaffqPppwg4Q55CGwcoeaFOGRWqNhR4GEIgC/HbmD80NQlmrDkN8JdBcItlTbQ1P8L5ghAqYyf
 JSBB3h1dt72vJcpraNpvIXm9tPes9I8CV9GgmtjrzbjawOyhCUUJfivXieSCUS1uSy+oP7GpomS
 1ptqVtToP/qx9OJzwoyZDDVT/Q0f1xI0yI/ZWetHrZcG3nQ+ubOKvwgE98j8bbTP5p7YZkw=
X-Google-Smtp-Source: AGHT+IFNdrdyD9GAVtk7sxhJJ4dLAUs6KGeB5DVJLnVCoJxAbOFvAQQeAKi5DJMc6n1MUTqkvNcKFw==
X-Received: by 2002:a05:6512:1054:b0:545:f70:8a95 with SMTP id
 2adb3069b0e04-5452fe8bee7mr6037250e87.32.1739985034390; 
 Wed, 19 Feb 2025 09:10:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54623984659sm947630e87.73.2025.02.19.09.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 09:10:32 -0800 (PST)
Date: Wed, 19 Feb 2025 19:10:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v5 1/2] drm/msm/dsi/phy: Use
 dsi_pll_cmn_clk_cfg1_update() when registering PLL
Message-ID: <mjgyuej55v3oyq57lqsm2cqjmmwy4jtkufing227gtzlsivrn5@jmscpw7ot4mr>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
 <20250219-drm-msm-phy-pll-cfg-reg-v5-1-d28973fa513a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-1-d28973fa513a@linaro.org>
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

On Wed, Feb 19, 2025 at 05:23:32PM +0100, Krzysztof Kozlowski wrote:
> Newly added dsi_pll_cmn_clk_cfg1_update() wrapper protects concurrent
> updates to PHY_CMN_CLK_CFG1 register between driver and Common Clock
> Framework.  pll_7nm_register() still used in one place previous
> readl+writel, which can be simplified with this new wrapper.
> 
> This is purely for readability and simplification and should have no
> functional impact, because the code touched here is before clock is
> registered via CCF, so there is no concurrency issue.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 8 +++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
