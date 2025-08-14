Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B763FB25CA2
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 09:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E49510E7F9;
	Thu, 14 Aug 2025 07:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UQbjO/pP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75810E7F9
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:06:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45a1b0990b2so3718765e9.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 00:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755155169; x=1755759969; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cS0/5HUZ9pMLTw61523HJPzKvIi8k7gEcgo8DCDqG5w=;
 b=UQbjO/pPhkmFDVR+XnjKjsFMM/vR0EsNsuCGzb/fmMMEnHO3xuG3wYTI4x08XKu/x6
 laAuTAayjDn9h/uyGSxy8mg9GyCyVBTcjzdNZDPLZrDdgWx870qKXncxL5lO7GqjraZO
 znEh5Q/2lfpxYDBMhI3kZf/KmzCY7A7+MnfD75/exzmAKpDyUvHraV8Wx0KNicRdF7vU
 s4c2+UMHDIrfqa9nhbu6jMJlj5ahC8OT9TAf9DAB1TVyfz5zMhecnF1XvMD5T+Uescaa
 k4iUIoqYxl74Sxa+Lt93ikpW4oy0KhId9FcjPyqQPjcIfpTiXkOg8KshM+p5jqE27P/P
 8fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755155169; x=1755759969;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cS0/5HUZ9pMLTw61523HJPzKvIi8k7gEcgo8DCDqG5w=;
 b=cVZQp9nBFMo1MepkWalGhEUXccSO2hW99yGq4LY5fkNU2YWqlS2Q1bsEL+a8PenS/s
 FWGUaRMxA2buCMrOWMZqvpp4iWm3vp4CP4Okww19OT7nkrvgE7inYrepLilxUo1qDmMs
 4aZcjKAz23MKlegzIaS7EpgYrwjc4GggSuK6fF5tNrby7LYLKrRUgaf4ITwRl1ininzO
 QUYF2t5tmIfMXEgwOnC/B9uhukQdOKm6VhAxq3jaz9Xwh+4rsR4zYfdnCubxfwmPgTZ3
 z8tcNa3EmVp+ROJElxaXAgeB9i6+lJLYwfxqgXWGvQUzo4NnR9Al0kEAAuoRqCECtWOq
 18AA==
X-Gm-Message-State: AOJu0Yy/9wk6pxXX/XLJ7d445tlWmye672u5nQKtE1ntGcfE2jIEWI12
 PS/3u87jGmqcEsCZeyHhX7AWYfJwRLei2o+Oc8pto0NAAv8ro1veDwkZMuHD4rhB+al0A9EMD9G
 5mVSS
X-Gm-Gg: ASbGnctJ2qkE40fE9aOuZ56EwqlBtG95bDngHVsTxarAxxr7P21Qy497otIqn8XkPF6
 U8fHHfNVch1ZVyLDtI6LakoT7R98rlkmzx0AKchST39nDZHqUL2PHTjSXh2NIw/paFrvdOy1xBk
 H5WWBH3MU7bKh7j0JP23xkGdv3sk67/tH7Dq01Uhst5A/tHJFR5JoEs95aeM9FEmz7aqpRI65uj
 TT7qb/9FXqBTOxhW1lzIn8f2/Vb7R2eFodG7xTj560XZRp2u4D/pCqhh8gpCLnVPlgcBP4dxB+X
 eVkmCODDEgQ9Hod4EO5GC7vNHMUUw189PcdGkOQeGp+pd6NA+NaFPWVAgjMqoZDzLT/Biay2qe6
 E9qX3C/3URYsCddHsKA1OQy8zUX+2insfi2H06dFVFiQ=
X-Google-Smtp-Source: AGHT+IGfKXYMiD1fqG6Y1UydpuaQEFurYi0HrTV1dGWQcn2Rd3hDcwOOzPRYl/BBjfQhUHwSfAccnw==
X-Received: by 2002:a05:600c:4e93:b0:43c:fe5e:f03b with SMTP id
 5b1f17b1804b1-45a1b668299mr14795445e9.30.1755155168812; 
 Thu, 14 Aug 2025 00:06:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c6d2700sm9519045e9.12.2025.08.14.00.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:06:08 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:06:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org
Subject: Re: [bug report] drm/msm/adreno: Add support for ACD
Message-ID: <aJ2K26ZBVZilC8jg@stanley.mountain>
References: <aJTL87hBAEtJb3VT@stanley.mountain>
 <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
 <aJwnNqfxZHfiVHZB@stanley.mountain>
 <cdd4757f-9433-4c80-b5b2-003d42038a87@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdd4757f-9433-4c80-b5b2-003d42038a87@oss.qualcomm.com>
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

On Thu, Aug 14, 2025 at 12:28:31AM +0530, Akhil P Oommen wrote:
> On 8/13/2025 11:18 AM, Dan Carpenter wrote:
> > On Fri, Aug 08, 2025 at 10:28:38PM +0530, Akhil P Oommen wrote:
> >> On 8/7/2025 9:23 PM, Dan Carpenter wrote:
> >>> Hello Akhil P Oommen,
> >>>
> >>> Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") from Apr
> >>> 19, 2025 (linux-next), leads to the following Smatch static checker
> >>> warning:
> >>>
> >>> 	drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe()
> >>> 	error: 'opp' dereferencing possible ERR_PTR()
> >>>
> >>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>     1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
> >>>     1669 {
> >>>     1670         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >>>     1671         struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
> >>>     1672         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >>>     1673         struct msm_gpu *gpu = &adreno_gpu->base;
> >>>     1674         int ret, i, cmd_idx = 0;
> >>>     1675         extern bool disable_acd;
> >>>     1676 
> >>>     1677         /* Skip ACD probe if requested via module param */
> >>>     1678         if (disable_acd) {
> >>>     1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
> >>>     1680                 return 0;
> >>>     1681         }
> >>>     1682 
> >>>     1683         cmd->version = 1;
> >>>     1684         cmd->stride = 1;
> >>>     1685         cmd->enable_by_level = 0;
> >>>     1686 
> >>>     1687         /* Skip freq = 0 and parse acd-level for rest of the OPPs */
> >>>     1688         for (i = 1; i < gmu->nr_gpu_freqs; i++) {
> >>>     1689                 struct dev_pm_opp *opp;
> >>>     1690                 struct device_node *np;
> >>>     1691                 unsigned long freq;
> >>>     1692                 u32 val;
> >>>     1693 
> >>>     1694                 freq = gmu->gpu_freqs[i];
> >>>     1695                 opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
> >>>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>> No error checking.
> >>
> >> We are passing back a freq which we pulled out from the opp_table a few
> >> lines before this. So it is unlikely that this call would fail.
> >>
> >> But it is okay to add a check here if that would make Smatch checker happy.
> >>
> > 
> > No, no, just ignore it, if it can't fail.
> > 
> > Or I can add dev_pm_opp_find_freq_exact() to the "no need to check" list.
> > That's easy to do.
> 
> Would that make Smatch ignore usage of "dev_pm_opp_find_freq_exact()" in
> other code/drivers? If yes, we may not want that.

It just wouldn't print this warning if people left off the error handling.

I'm going to ignore it anyway, right?  I recently had a case where I got
mixed up which functions needed error handling and I ignored the wrong one.
We still caught it in testing, but I'm also going through and marking which ones
to ignore or not.

regards,
dan carpenter

