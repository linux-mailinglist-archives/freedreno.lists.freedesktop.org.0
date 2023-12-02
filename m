Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D9801F22
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 23:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66F10E029;
	Sat,  2 Dec 2023 22:42:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FAF10E229
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 22:42:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bee606265so492828e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 14:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701556969; x=1702161769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3aih6OHSDkGdiO3pHVc1FL+ZZ8/szuX4lHE6IeURhsw=;
 b=NXKTFF5j3WQfaaNuwhpq53GydjuSTXuu7+jEhQGyTAO3n7N8lJq1J1OHKwpNGJXpBC
 RwBazPneCQx+TDQYwAQmv63ZqP1RdjzrHrt1nLvAtiE3rd2aDx10dvr+LeQbza3T0zoj
 bSuw+Rx+wW3NRxeCjAxcGlx6TIqy9oibwRtjI5QEGF9qeLNaPQ7EeWYyJjWJq6ayXoXV
 MAUy7L5NB6wEXBfG+Z0EDwMl9AGNdD6fxlVViyoeBGxygXEE6oRzjAvIAkjQb3qPP8Q1
 vpWsMsOGGI2tEt+tVknAzLRpKAOhAVKomz3SWPf0xr6Q+2OpCM/B7whKZnFlli4caTrT
 5NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701556969; x=1702161769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3aih6OHSDkGdiO3pHVc1FL+ZZ8/szuX4lHE6IeURhsw=;
 b=SMTF9URVf/p5exikoKsCj8t1UNz5c8gQmtGJXyOPFzEBdFO0iqWC58mjQkB0oODdE0
 8kePWvc8VZIBNkpx8ty73bPnfUkCwnqkSdhK/mxGx7xihabeeue6mHE70ffhzZ/ewwfU
 ifQ5OSMC4rUR08dZKU/l3eSSzDV8o9hQwzFQEkYrXoV0ClBFBwL73t+3IoQWWUPyIIjC
 +KNRMmEcDfFgE+5wLkR4ta6Qxfe32fdIo+GQM5jqyrtQkIXAIA/5T1TBlD9PESlqHkQA
 bgsMy3Fg0RDLc89FHtBuDNwDQ7/dW3BSaosJcp+b0dqldTR0vDc3u5XBR4/d/ntz2txS
 /IXQ==
X-Gm-Message-State: AOJu0Ywl4Pnd48cDZIkirWwBGFd7Czs6IPRg0osT/wvb3r6Yq903w5gR
 WvJ7I91QTkEYCd2+Gs24r2M6sQ==
X-Google-Smtp-Source: AGHT+IHZeVKOmByoJTMNtpTseW+90giyj7nm8L2MlkKFWc7pmChImdK+NbNbAAwO85Bzsqca44SybQ==
X-Received: by 2002:a05:6512:104f:b0:50b:e1ea:f7c5 with SMTP id
 c15-20020a056512104f00b0050be1eaf7c5mr937950lfb.138.1701556969321; 
 Sat, 02 Dec 2023 14:42:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:42:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 01:42:44 +0300
Message-Id: <20231202224247.1282567-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 1/4] drm/msm/mdss: switch mdss to use
 devm_of_icc_get()
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Stop using hand-written reset function for ICC release, use
devm_of_icc_get() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 29bb38f0bb2c..53bc496ace99 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -50,14 +50,14 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	struct icc_path *path0;
 	struct icc_path *path1;
 
-	path0 = of_icc_get(dev, "mdp0-mem");
+	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
 	msm_mdss->path[0] = path0;
 	msm_mdss->num_paths = 1;
 
-	path1 = of_icc_get(dev, "mdp1-mem");
+	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
 		msm_mdss->path[1] = path1;
 		msm_mdss->num_paths++;
@@ -66,15 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_put_icc_path(void *data)
-{
-	struct msm_mdss *msm_mdss = data;
-	int i;
-
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_put(msm_mdss->path[i]);
-}
-
 static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
@@ -391,9 +382,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = devm_add_action_or_reset(&pdev->dev, msm_mdss_put_icc_path, msm_mdss);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.39.2

