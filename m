Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E3C79796
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 14:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C336010E876;
	Fri, 21 Nov 2025 13:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NfmlWkik";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72E310E878
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 13:35:55 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42b427cda88so1434166f8f.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 05:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763732154; x=1764336954; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FujnxFm5ivLcwpnSmnbmilDQnkpA/LjD6gSJ0lqHxLU=;
 b=NfmlWkikX06Q6ZZjaZgZKurfAjGDYL/oVz42osI4FZf1Hp/JyHX0UsYlV2x+JrT1jj
 Zltpdm1acWpQ4wWZ/S5A/0MSgpaXxvxxgYr3YzBn0FhaV8/Q1IltBHxWXb00gArt3T3Q
 YbtbAHOZLRRtLJFLcYIBMpWdPLeItvq30Md7FaKM7QqlKDJsg/TUwaLB/G2t369Ewq8X
 UrnH2NsCYUh4Epwd4RdD/fZUEka/sH32MZEnmn11JJKoCaAOzXbvaohm411zg2RELvTl
 x3luojqNUt4BAz0tpmnKv0PlyeyM5wejOXdHWdRVisQD0YGXmPFIl1U0erw1j0LqjyCQ
 Iuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763732154; x=1764336954;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FujnxFm5ivLcwpnSmnbmilDQnkpA/LjD6gSJ0lqHxLU=;
 b=kqrRH3AUpbsUcctjLqgiV1FI2GfMO95HDuzNSAltfqwZQiKzmbGSZvcmCtGtcBtcpl
 ozb0AC0HUOmelCxrWAtu4h6953V/TBnaLt0uS9/PWv7Yj3+5q9dNpfjXziXQHyWIuZfY
 g5x7JQOgRlkISGzIaJhIW4ObWOiu0u73MIdo79eKZGz1ZPHlTEitYs12qsSmuv30Jcvf
 7l9yTC3k/QbnAP+uLcZmKLaiMxToNwJiy3FlSQDp0rT+/hVX/x+hzqMZ6UgS5R/7/7Zb
 2snjlePNsBMLi7eAeO08S2u3Pq1uDeHgHHlqAC02f486FcIrL44/jXm2D7S0Zs5cyeWZ
 qVSA==
X-Gm-Message-State: AOJu0YwwRvE/1MAvaTtSR362ubMsfNP4EwakejtjD2EvQXHmJ+34462a
 6Oe0apMNLF5KjMd8yxoN/H1s0V3DjT/it8pN+t/wMklPrT4tu2P54ALZ7U2EgcfPWq08zgTA8vG
 IKzQ5
X-Gm-Gg: ASbGncsnfYww4M6bSGvqxM2p3zWcmCJuILvIoIGDnpGXFoXGOClHF8kJLXmAi0xLBgf
 3BYJfaxAVh3WzCErwIGNsyJ1mP8v2m6aOtQ4pZc8p8pBZeOIOZoQWRD6KDhLYfm3304E20boG2N
 KeZTI0lPKgKrEbMyuGUmSIgscGGU2MnGvpDwF7Up8LoFC7mAwdDf9EVU9kHyOgxvZGKpuIypfSU
 5TqvUHh2DTFVSCotD6J7vhaTXd1kjh5qF8cCf9mX7dRgsC/vxqyShb4nw9dXPc1sFcbv3W2+HP+
 CoQQc9kstlxS85YPWrnpgkRnHehZCI/a2uQ8nRI3uUbOdfN/sogCU/Pg/dMsDUtGfL9DZMK433w
 bgm5n5OkqOcb8pvYq+hl5wry9GN3tp35ivnmdJJ5+U9dflC7YgPmEgrLwAWTdi1RpKGwyuCF9LK
 6knV35bVV4E5r10gCjT067ksl6Hb0=
X-Google-Smtp-Source: AGHT+IFL4RIfODnC3Xft/b9rUyzCzdpRstSWAR1b3FROq1ghsn0tXaWoufPoenRQ/MbubK4imRNfsQ==
X-Received: by 2002:a05:600c:1d0e:b0:477:bb0:751b with SMTP id
 5b1f17b1804b1-477c01c4d79mr23072935e9.27.1763732154060; 
 Fri, 21 Nov 2025 05:35:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42cb7fb8a29sm11286059f8f.30.2025.11.21.05.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 05:35:53 -0800 (PST)
Date: Fri, 21 Nov 2025 16:35:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <aSBqtjkOKOJrK8D0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Akhil P Oommen,

This is a semi-automatic email about new static checker warnings.

Commit 491fadb2b818 ("drm/msm/adreno: Move adreno_gpu_func to
catalogue") from Nov 18, 2025, leads to the following Smatch
complaint:

drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)

drivers/gpu/drm/msm/adreno/a3xx_gpu.c
   524		struct platform_device *pdev = priv->gpu_pdev;
   525		struct adreno_platform_config *config = pdev->dev.platform_data;
                                                        ^^^^^^
The patch adds a new unchecked dereference.

   526		struct icc_path *ocmem_icc_path;
   527		struct icc_path *icc_path;
   528		int ret;
   529	
   530		if (!pdev) {
                    ^^^^^
But the old  code assumed pdev could be NULL.

   531			DRM_DEV_ERROR(dev->dev, "no a3xx device\n");
   532			ret = -ENXIO;

regards,
dan carpenter
