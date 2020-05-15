Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E221D42B1
	for <lists+freedreno@lfdr.de>; Fri, 15 May 2020 03:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC40E6E0E7;
	Fri, 15 May 2020 01:05:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE30D6E0E7
 for <freedreno@lists.freedesktop.org>; Fri, 15 May 2020 01:05:37 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t7so268011plr.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 18:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6eDmVoxMjvhjUTcVq+QS+luvVgKfEd6UeTKYi0GYY/Q=;
 b=nC6qh/RRtLo5YkFASVNTjzmS6hB2wcHOSlCr6oyH+TRQvoERZi7p4K1Xcm4kuC4zfI
 IPZu7/uOH/jDh4/sS6a6Wl7/uYnk7PYrM5mxSbz3KCnEHIgK9FBWlUpMFggDwzTHihUK
 oVuWf5zTDw/mr7UpS8XDlsrUQ8ldUVXmPUc90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6eDmVoxMjvhjUTcVq+QS+luvVgKfEd6UeTKYi0GYY/Q=;
 b=HC8QYB02dBg8hoMpqtD7IT4rO9IjgE3VqgM3dZ8cagwSemMoYmMtHaQPL2JrmXEYAZ
 aCaLOrfJs0SA1S7M7I2b1PBzdw4cRsX+NfkBx2O5+1yG04JiKaY1HdRM0oUCa1RVTf0n
 WYtDnXYn1Y+TbYFOEOlDQ5KjRN8LioU2WNy6gLs3zfB+bpXcKSMr2kBZmdK8d5Oa27go
 K/8VDB1MQThTl+0nlSi0K6a/4/kepyT3WK2BkRvmpJAFcoIV1yBCXluGaUORcBzAzVak
 83ODK0vgzXI2jX0VtngVieSK2Ni8IyQYP/UEAclahssFp9QuilLx6udRAVTLV+t9pD0a
 hedg==
X-Gm-Message-State: AOAM531pYZnm138ew+UEY1UgLzt5LiEtrltZtbrikTnIl1hH3gZ7qbl2
 w6/kOf5hBSMnb0qJ7RPPZ7smkw==
X-Google-Smtp-Source: ABdhPJwB6PAoOJYeS3qdfXHG1VARwSCyiTzJNK443oUUSG4LRJTMdwSgD9Whi8xkSHQq+C2mHa74PQ==
X-Received: by 2002:a17:90b:c90:: with SMTP id o16mr717743pjz.59.1589504737439; 
 Thu, 14 May 2020 18:05:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id g14sm363169pfh.49.2020.05.14.18.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 18:05:36 -0700 (PDT)
Date: Thu, 14 May 2020 18:05:35 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200515010535.GX4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw
 to set DDR bandwidth
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
> This patches replaces the previously used static DDR vote and uses
> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> GPU frequency.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 2d8124b..79433d3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> 
>  	gmu->freq = gmu->gpu_freqs[perf_index];
> 
> -	/*
> -	 * Eventually we will want to scale the path vote with the frequency but
> -	 * for now leave it at max so that the performance is nominal.
> -	 */
> -	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);

Is there a particular reason to keep this one liner in a separate patch?
I think it would make sense to squash it into "drm: msm: a6xx: send opp
instead of a frequency" and change the subject of the combined patch to
something like "drm: msm: a6xx: Scale the DDR bandwidth dynamically".
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
