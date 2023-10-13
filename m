Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA437C7E74
	for <lists+freedreno@lfdr.de>; Fri, 13 Oct 2023 09:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25C10E5CB;
	Fri, 13 Oct 2023 07:17:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C003B10E5A9
 for <freedreno@lists.freedesktop.org>; Fri, 13 Oct 2023 07:17:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-406618d080eso18978135e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Oct 2023 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697181433; x=1697786233; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kWaFz4n8BLo1UJoI34jBeJHgdxXO/CE+i3BR2uQsDEA=;
 b=mexGIOP3yXqEjPuEKFJbb1ir4146HS+9GCUh02YmBx1eQJmCC/EM7d2W7pR2SN9xRH
 s4TM7Gk/i17bBFvVSaC5X/Q4ug0DNocnKUAiScrXkNylhNk2/B54oNb/pGUMrPB/2b3Y
 xWcOCcQCmXFQ7llpyYpQiTR5kAFVo0NWFwpcUat2B/RPBkXvfPwzf5/6J3GvknXpUj3N
 0+ZmDKLzZdIQ5WLdJOKMCk0nFmdudp5jGV2M9YRU/XBmoC6uwCmn2oPPTSXKgfmQdNJu
 I5IExFMIzU5aHeVg+zf4OCQzD/uTNXXhErwqgkykn1mzYgOsuhrUbk+4g0Zm3skdMFs5
 bj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697181433; x=1697786233;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWaFz4n8BLo1UJoI34jBeJHgdxXO/CE+i3BR2uQsDEA=;
 b=eH3cT3/4o8yqPxWEnuRw6UhJGGaf/XBomyHm0Paq+i5Zhtnj5aDsHsAKwiDr8RPKiS
 xk23fU+yiGA7d49ZGtKNc9yUIFxHMZ3e0rQrfVExMGmG8AEbtHM8MW66y+8Dfg9Z4lv7
 GnIKdF0X6+vGD39MjZ70+7pkIedJQxCe+RIHaN48xnU2AkNu23wlunpIvWOL0+eJDtL5
 T5BOxfBxClvqXKL6RbRCVh+xLbooeoKwbPigCdaOzSR8sfl2Ed9kVAbj+zPnD5addztx
 T7WUbNkxqgIVYyGKEebHvr2d42IabWpNW944SFPfpVAnyAPuP2LKZFBdE3Qivpd4Iwnx
 rHuw==
X-Gm-Message-State: AOJu0YxI3ZEO/bFHJBCzw0NeufbCfhyPcmUxsUnA4YjA+WbLsVsV8Rwb
 wGpoRVQBjDFrkxf0sb8ovjDRGw==
X-Google-Smtp-Source: AGHT+IEMChUF1nF5n5VUZpjuNffyhQxqCtCzn921jYAb9ji1wXEYdUyTy8LrYKKnYNgqSRFV3TqNLg==
X-Received: by 2002:a1c:7c0a:0:b0:405:39c1:a98b with SMTP id
 x10-20020a1c7c0a000000b0040539c1a98bmr22624232wmc.20.1697181433171; 
 Fri, 13 Oct 2023 00:17:13 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c20cb00b0040531f5c51asm1751016wmm.5.2023.10.13.00.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:17:12 -0700 (PDT)
Date: Fri, 13 Oct 2023 10:17:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <5de18b71-c3db-4820-b35e-262b4cac35fc@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Subject: [Freedreno] [PATCH] drm/msm: remove unnecessary NULL check
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
Cc: freedreno@lists.freedesktop.org, Su Hui <suhui@nfschina.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This NULL check was required when it was added, but we shuffled the code
around in commit 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation
to the _probe function") and now it's not.  The inconsistent NULL
checking triggers a Smatch warning:

    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
    variable dereferenced before check 'mdp5_kms' (see line 782)

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 11d9fc2c6bf5..ec933d597e20 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -844,8 +844,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 	return 0;
 fail:
-	if (mdp5_kms)
-		mdp5_destroy(mdp5_kms);
+	mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
-- 
2.39.2

