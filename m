Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61EB24090
	for <lists+freedreno@lfdr.de>; Wed, 13 Aug 2025 07:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FB910E1B1;
	Wed, 13 Aug 2025 05:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="emindVgY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87CD10E1B1
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 05:48:43 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45a16e52e54so2092385e9.2
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 22:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755064122; x=1755668922; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VfE8Ic+gnHdIsqClfpGya7590Y0IfLe/MfkuvgEeOQI=;
 b=emindVgYWE0sLUud6aUB7Qxvcmpr+Kzt1iqlMvKa7nO70WnfawHIEJFTqi8AwZN+93
 TlDFk+nMipIMjvI/syydu5SHViyHCGUPZIGFqhGBKajiUmtbLoUEhCXjYrHg3cObh9DQ
 I8jTkV8kAeqy+5xB/nEWKJeoKvIdh+X6DhYP9nhhB5G1afLvA1lnHBVfWitmbAVO9le6
 ZFMnIQ18Ag7+GaRUkl1NuAsJggE0luap0+Zb87zXwEJ06evEVxEMT9Y6Jwuyy+5GgUUk
 TSW5RSDibP0b/UTNFANYEf16/roC+awK/289FeuOoUnz0jVw0k77IrQ39Y790L2avsYU
 OXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755064122; x=1755668922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfE8Ic+gnHdIsqClfpGya7590Y0IfLe/MfkuvgEeOQI=;
 b=lvpkQLWLV4pJ4ZcGyYoIIDLmLkVScDCZjenJbHjwj6dqXbpZuIiJ6BeE2ZATaLpB2F
 6DyKzlDq/SJLf67NNZanLhEwH1wYuUEdPJgIvogxr+A7a5vPDLlxl0eNk0ASUMcYdxVt
 QfjteiSLRtpbkKCyC85E16NbcDUozlS/vA+mh+5ihp2QlJY/8cwU1rkDiWEgA7Udk+aA
 Q95iIHtIaxcglR6WUn6QCnSKd94QMlcRametGGfGKo1nX6KQW6tLFpLWuA+J6p0o4nb7
 XQnJHpHx5Np3ZoDoXbZ5hdVWbeS1RkNfB/bV+ir/uhvAhpw/PIbbPMQUUvYrIEuGEao+
 7gCw==
X-Gm-Message-State: AOJu0Yw474CzKTw/pRjxuYxmQc+pq2SYsfeC0lVh0hbZypDiW1rTilYk
 +jaYcMoAVbpy1GBVLy2czdNUWqYyT+Xszw+7GSTh8yIgGvAB9EX4DgBDVeR5pJg/bZk=
X-Gm-Gg: ASbGncuj5Wj2qYBo7psfMEHAY6Z2o3+F8yrBzkh4O9rd4KdLOBC2pflk+zNsbguuE7J
 dcEhbpxYf448wWmXzOp001zp0YQfUtJmDORUJslMtxocOq+h7ewbrzFKVTV7cJjZK039pvdiw2B
 mwjprSRJPSFK+uRKbnzSz571EylmrFtBdNuJrEnJlSMZVWd7n1tKCDpGefPBxMIUrv4FyQ1oYNI
 Jshx9Ea+ejEYQHrk/TJ0/lSVYk14WXoSdD8vS1mJ87dJWRKRo2I2ubvZqHY/dxWp8bvwnM04WYd
 Q+ks/ebvJfHEwpjj1+340PlSr+WxuE+mocAGWTgNKzbDNkHVM99QwVPzSltAUfAsP8unsuO4ZyE
 JSS68bbHRT2Q/y9K/U465jU1FNFRF3OGPc5HosBqHwPw=
X-Google-Smtp-Source: AGHT+IGDADxwxs8qNCE610oaTrPtgNxpPncJXnpNk6rKjrbCLBihfX3yefCi6OCmakHlPFQo+xz50g==
X-Received: by 2002:a05:600c:4e93:b0:458:bb0e:8cda with SMTP id
 5b1f17b1804b1-45a1663514fmr14098455e9.17.1755064122176; 
 Tue, 12 Aug 2025 22:48:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c475067sm45936463f8f.58.2025.08.12.22.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 22:48:41 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:48:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org
Subject: Re: [bug report] drm/msm/adreno: Add support for ACD
Message-ID: <aJwnNqfxZHfiVHZB@stanley.mountain>
References: <aJTL87hBAEtJb3VT@stanley.mountain>
 <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
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

On Fri, Aug 08, 2025 at 10:28:38PM +0530, Akhil P Oommen wrote:
> On 8/7/2025 9:23 PM, Dan Carpenter wrote:
> > Hello Akhil P Oommen,
> > 
> > Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") from Apr
> > 19, 2025 (linux-next), leads to the following Smatch static checker
> > warning:
> > 
> > 	drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe()
> > 	error: 'opp' dereferencing possible ERR_PTR()
> > 
> > drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >     1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
> >     1669 {
> >     1670         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >     1671         struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
> >     1672         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >     1673         struct msm_gpu *gpu = &adreno_gpu->base;
> >     1674         int ret, i, cmd_idx = 0;
> >     1675         extern bool disable_acd;
> >     1676 
> >     1677         /* Skip ACD probe if requested via module param */
> >     1678         if (disable_acd) {
> >     1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
> >     1680                 return 0;
> >     1681         }
> >     1682 
> >     1683         cmd->version = 1;
> >     1684         cmd->stride = 1;
> >     1685         cmd->enable_by_level = 0;
> >     1686 
> >     1687         /* Skip freq = 0 and parse acd-level for rest of the OPPs */
> >     1688         for (i = 1; i < gmu->nr_gpu_freqs; i++) {
> >     1689                 struct dev_pm_opp *opp;
> >     1690                 struct device_node *np;
> >     1691                 unsigned long freq;
> >     1692                 u32 val;
> >     1693 
> >     1694                 freq = gmu->gpu_freqs[i];
> >     1695                 opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
> >                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > No error checking.
> 
> We are passing back a freq which we pulled out from the opp_table a few
> lines before this. So it is unlikely that this call would fail.
> 
> But it is okay to add a check here if that would make Smatch checker happy.
> 

No, no, just ignore it, if it can't fail.

Or I can add dev_pm_opp_find_freq_exact() to the "no need to check" list.
That's easy to do.

regards,
dan carpenter


