Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA80AAEC39
	for <lists+freedreno@lfdr.de>; Wed,  7 May 2025 21:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554E710E1B1;
	Wed,  7 May 2025 19:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qHnAscmp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D1810E1B1
 for <freedreno@lists.freedesktop.org>; Wed,  7 May 2025 19:35:43 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54fbf721fd7so31674e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 12:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746646541; x=1747251341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mBGWEaSSPZ+Q97XJTP872I0ALcCOso1Sz1JLgKAI3qc=;
 b=qHnAscmppi5wR6ajT+fpk2jRHZIRunfcPGPF8O7T6yhiZytUX04vhAutbdhycVg2Wp
 c1UrrYAhxsVL7GOix7Ka9qF9ftjQemiFp4ivCU0ZZ0NlbK+l4RYTChjOLa8uH6PwiM7Y
 zqmNbosprlDApWJgr6G3vT8ePqzP0ZVnxLRjZl0Yx3zSS9kCFTvGZ98nkjor0ZxASkde
 o+ZkSmCrcV9Mqd67TTed04XWeHJIM/78zyIYdKkYd7QLGbXBnyth99KMl1FQkgY986Q5
 V+gTDeNBllTT+e8Ao4663USrImR187t67w8RMjbzU6EYxY9oEzXw9RTMlX3gUsV32nd6
 xokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746646541; x=1747251341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBGWEaSSPZ+Q97XJTP872I0ALcCOso1Sz1JLgKAI3qc=;
 b=mZzUm/KIHvhSgjoooSXjjoeyzzsoh6/fHN6jMUrooZyta3Pmuak5v66wFn61TTVFqt
 6Z3pucCVNYhSmZaPTKsEsRlZI3MbWYGRBs2slZ4gw6E6dbzDjOkUI2UN82HPmI/iX+5W
 kLAaI22Y+WKdxnKhRP+m8+yytrzLocmrAcB8ZCPP1oPZU1x4WBxZQEXSec8Qn0D+bdBh
 iFc2Z+ayTxsrocSLqlBgUsMGwnxixXpQZSwyvuvIBio+VueugCDcYi2RJfe/zUNBDofC
 n8m3WXrH6bHLhG10LUqpE+Fz/KS0ARF+h2kN9FIvmxozBBj0TvQHcO3gg5bkfwbxiDZd
 z49Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9raZLs/7rffcsyiugKUSmYb1ZqmxuUJ5gvYte6O5gdVuP4SjgTnm2GeMEkyzG75sQekvbZnYfO/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx4Vza3YZp2m86bgkguIXoGG3U1nfx0MBgStooPk/nO+3hsgzW
 hyr/nrOSxRrTORpbzfHSjR6xgrs/WSXzGrAOn9sBgCF+hTmlamb+e/4o1wHusPQ=
X-Gm-Gg: ASbGncueQ41NS9NlLF1ENGu47bTpIznpJTLn/JPp4fG6BjnHPww64bafsVcqfooDRKT
 /bQfROP0eM9sS7HUQKKvO76wJxOG3MZKunX/DqU/K3OLQtKqrAKfmXzVCT3RZ7C3tcPchkVe/AC
 E3+Fw5KcT5EFMJCfEkZ0NePby2G5YQZyMpJWfjE/Y5Fhtr9hROOABabgG3JZ73Pp42FDFxDmOGD
 oOw4Y4GqXFfAGEGk9P5THZjaFDOvqdfcEgjoPuphFT0aZwvqrf2Z/LBR5nZvyjbwCFxtU89Pikf
 ISL/huhoeFPNDvHv1NMCCvp5jtVw8OPMcosIEy3uMuQQ4ljQnlyELREDvPpLXgfraGlcaRmH46p
 naWDsD9lX4+jhshdpce2EAKPPYGALtw==
X-Google-Smtp-Source: AGHT+IHtds5bXFRbjMaPBJlpofIW978QDvrZvNl3nQjdXjulUScc7U1SYUPoyT7fCQI/v3vFhasjCw==
X-Received: by 2002:a05:6512:3c86:b0:54b:117b:bdba with SMTP id
 2adb3069b0e04-54fb965209amr591699e87.16.1746646541125; 
 Wed, 07 May 2025 12:35:41 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi.
 [88.112.131.206]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee00fsm2432066e87.120.2025.05.07.12.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 12:35:40 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: mdss: use devres version of interface to populate
 children devices
Date: Wed,  7 May 2025 22:35:38 +0300
Message-ID: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Trivial change, there is a managed device resource version of
of_platform_populate(), and its usage simplifies the code a bit.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402..116e8f93f8c8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -550,7 +550,7 @@ static int mdss_probe(struct platform_device *pdev)
 	 * Populate the children devices, find the MDP5/DPU node, and then add
 	 * the interfaces to our components list.
 	 */
-	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
 		msm_mdss_destroy(mdss);
@@ -564,8 +564,6 @@ static void mdss_remove(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss = platform_get_drvdata(pdev);
 
-	of_platform_depopulate(&pdev->dev);
-
 	msm_mdss_destroy(mdss);
 }
 
-- 
2.45.2

