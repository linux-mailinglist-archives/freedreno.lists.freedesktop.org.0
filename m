Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A68C4730F1E
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 08:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7291010E10A;
	Thu, 15 Jun 2023 06:12:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34C610E10A
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 06:12:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f8d2bfec3bso15470635e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 23:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686809529; x=1689401529;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rpWOmwDSt+z+64rm58oIzJXIEETiedOwDzwPnwvxBHk=;
 b=rpk+WF+pdG7/Sb15a/lR9gXKBBAPT3dJS5CdgQRC/AWnQcA3+Ir0llWkX9aaPa/PWs
 F12NZHoc5pQ9Bi/2O0KSRWxHktocJsD11bm+apa3v+GriWSqlxF+sKQ+mQb3Lem+a+P5
 B6i+5dLXn+g3ZIW9dBTQpyeOdtYwU8K9YsXz4FU9mbvWPMFGVKlboVSHiie9X9EWnwEr
 ccjnk+2nDUsQpiKy5594R93YbykzdLfp8mER+3QYFuInIMty5l11T1XtdDAA/ZFAO2An
 HpuvnWgax9Dogilt7TXMbROBRI6IM4klt/Eu2t+oEQ4lJCCxShFNnCKY/xLIY3WYkafF
 /1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686809529; x=1689401529;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rpWOmwDSt+z+64rm58oIzJXIEETiedOwDzwPnwvxBHk=;
 b=R97iekohNzZtSBcUGa5EGcSspyEGyOYpldRru2YVaAVOapvyJvuIFUcL5x2dIMwqfq
 DZ+9lCPtkcxcSeu8AZsdpIuMOwvaLenaS3jTw6YHryaFbfMmOtiXGeGacpo5D1BespE8
 UcPF5GU9He/QFuZt4yizwAXNBJE0ShPG9SXOmm2RLuaqIyI2EMYtmzlJhWYwsswtGbOa
 nRCPvjd+l9lve3KuUuGd+yPPCcBuAcg9cUTmNoEHl63YrpXQOKMUQNvaP+4iB0p23GYf
 W1N8vHWnnD5V3dwwRYAsuhZHaUQGF3/DTYIvgNrOLfTOcFuQFrFiry7zr4D6KHBS5CHz
 +90w==
X-Gm-Message-State: AC+VfDxLsDNZYiLPXHlEiHONYZvP2NcljAgqyT2Wd+DHKfsOCOo+MxHP
 cack/Oz91jFR33axhWCvjnvaBw==
X-Google-Smtp-Source: ACHHUZ6adgIiYZgnKzwPArgDDhuEvq8E3Oj3Y90DeXnPLa0f/nAfch8wddp0KPRgSa28YeKe6BOiGw==
X-Received: by 2002:a05:6000:c1:b0:311:1568:1a27 with SMTP id
 q1-20020a05600000c100b0031115681a27mr609451wrx.58.1686809528867; 
 Wed, 14 Jun 2023 23:12:08 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 s3-20020adfdb03000000b003047dc162f7sm20036912wri.67.2023.06.14.23.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 23:12:07 -0700 (PDT)
Date: Thu, 15 Jun 2023 09:12:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dmitry.baryshkov@linaro.org
Message-ID: <7a0b1715-c419-43a5-9627-ca512d4f5f91@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Freedreno] [bug report] drm/msm/a5xx: really check for A510 in
 a5xx_gpu_init
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello Dmitry Baryshkov,

This is a semi-automatic email about new static checker warnings.

The patch 736a93273656: "drm/msm/a5xx: really check for A510 in
a5xx_gpu_init" from Apr 9, 2023, leads to the following Smatch
complaint:

    drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1753 a5xx_gpu_init()
    warn: variable dereferenced before check 'pdev' (see line 1746)

drivers/gpu/drm/msm/adreno/a5xx_gpu.c
  1745		struct platform_device *pdev = priv->gpu_pdev;
  1746		struct adreno_platform_config *config = pdev->dev.platform_data;
                                                        ^^^^^^^
The patch adds an unchecked dereference

  1747		struct a5xx_gpu *a5xx_gpu = NULL;
  1748		struct adreno_gpu *adreno_gpu;
  1749		struct msm_gpu *gpu;
  1750		unsigned int nr_rings;
  1751		int ret;
  1752	
  1753		if (!pdev) {
                    ^^^^^
But the existing code assumes it can be NULL.  Do we really need this
check?

  1754			DRM_DEV_ERROR(dev->dev, "No A5XX device is defined\n");
  1755			return ERR_PTR(-ENXIO);

regards,
dan carpenter
