Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93072147198
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2020 20:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB116E103;
	Thu, 23 Jan 2020 19:16:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13326E103
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2020 19:16:38 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id w2so1991109pfd.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2020 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6wtdQZE06z+aORJTnpPZKoEwjECFJKRvpZenOyG2pbs=;
 b=fTwlNQnSmBYcTlW2X4DkUAm58zuHxoeu1OEc1vVlBWKcW7LfEspLDnJ4HX4efyba1l
 uObRu4eaRbt9SL8oC69dLx0ZzK8f0kGqGgDXBigb4khY/TnOqcOfpmpj0x3bKD/JteV6
 Jwk1lWXngMbf/5avCtsxAskWpmpWiUPoVg32g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6wtdQZE06z+aORJTnpPZKoEwjECFJKRvpZenOyG2pbs=;
 b=diFzEwJ8yRlME+dGINbHmiT/gXtU9a23hxYP8JcUyWaeneGVRaoMFzkVeBz+4WRedh
 jvila79ZxC0YEugDcMuDZhKhJfkEgkG+ENtqg2jANuW2xJscmr9yr4y8mVmMuQktDApJ
 AQZUXm14BhLOjpv0hldieV3KZZUDx+y5ykgyGzHz04KLr2aZmETklb+Ft96yljd+9Mun
 PS3VhpmJKPfYXgwOGpSJfXj5P1XmkyJ47l6sZqRD+4tdKyZVKtLbhBj9F8lPfXax7BES
 EHP/jKF+4LqvDbtTN5XhtT36Popky5ifbMilzHAKShDcuXJegXCAsUPRC4GgtOSO5UPR
 Acsw==
X-Gm-Message-State: APjAAAWKLKmu0lsOL8uUUHkdUAUv6S44Cxq7e3RYvrRmZlRYSV3EFDnX
 nYff1RoAmvBMjPf1DlCdX2UlOA==
X-Google-Smtp-Source: APXvYqw0a9ZjVf1aQi0SykCpNbX3nRr/2knF42uGFzUQInRewtmQbXeOhyiUEjTVPoGuKU6GqXuSJg==
X-Received: by 2002:a65:4d0b:: with SMTP id i11mr336402pgt.340.1579806998644; 
 Thu, 23 Jan 2020 11:16:38 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id w8sm3323441pfn.186.2020.01.23.11.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 11:16:38 -0800 (PST)
Date: Thu, 23 Jan 2020 11:16:36 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200123191636.GY89495@google.com>
References: <1579797756-10292-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579797756-10292-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix a6xx GMU shutdown sequence
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Jordan,

On Thu, Jan 23, 2020 at 09:42:36AM -0700, Jordan Crouse wrote:
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") missed
> updating the VBIF flush in a6xx_gmu_shutdown and instead
> inserted the new sequence into a6xx_pm_suspend along with a redundant
> GMU idle.
> 
> Move a6xx_bus_clear_pending_transactions to a6xx_gmu.c and use it in
> the appropriate place in the shutdown routine and remove the redundant
> idle call.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 36 +++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 -----------------------------------
>  2 files changed, 31 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 983afea..f371227 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>
> ...
>
>  /* Gracefully try to shut down the GMU and by extension the GPU */
>  static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>  {
> @@ -819,11 +849,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>  			return;
>  		}
>  
> -		/* Clear the VBIF pipe before shutting down */
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> -		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) & 0xf)
> -			== 0xf);
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
> +		a6xx_bus_clear_pending_transactions(adreno_gpu);

With this the variable 'gpu' isn't used anymore in a6xx_gmu_shutdown(),
please remove it.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
