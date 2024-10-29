Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE79B538B
	for <lists+freedreno@lfdr.de>; Tue, 29 Oct 2024 21:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5046410E701;
	Tue, 29 Oct 2024 20:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jx/sTk/v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB0D10E6F9
 for <freedreno@lists.freedesktop.org>; Tue, 29 Oct 2024 20:28:36 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so6711821e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Oct 2024 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730233715; x=1730838515; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SEtPoch1KoR98uLkD2M/MwAujNigB9ri8LwRUBc+TqU=;
 b=jx/sTk/vAOkPqyXxdyGh0c09inmDjcG1OMm/zfRJyzCjxLyKV6y3V8sg/6ZeX4KRqj
 64bOG7y9P2GAuBJhDtk9+lrU/iX5cjHzzpu+zKaBBmBcy8erPdzghbxV4UgrjKV0hWy1
 bX0Es1xF0BlZGF7j+tVfmQyt0IIqpRhIbTShoaYf4uZhxxm81lrOyYHVBvXKNiT1jaav
 Aq1yH15bestuNOz1fgYKD9+iqFEtTdvTyq0iGeFZP0Swzy7okr7g+il0t6qnu2xLAFTw
 ocIJZOarMxTyEoU2iQVc5i1ZOhjimoQADstLqhHLN7HNNDCBKzUuBOqXhNcQEiwKM2UC
 tj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233715; x=1730838515;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SEtPoch1KoR98uLkD2M/MwAujNigB9ri8LwRUBc+TqU=;
 b=wGhnuFAJ5CUbG2pp97T//m1qSndUn38lfcfmqmXTwGcjrT2G8iHfcqPFH+HD8toeZR
 NSrW8C4JWtCF056jbxr1NFRUGnjruDuR2ZpW9MIiSO5Yt6P2UEw/yTdeRYJkSnhXIaNL
 euywnP8orpV71rnjNWobdXYFxl7xTbJJwGONN4+vttg7aBuKl829ZM2mOi6EJ+5w/9mq
 rQlWzKu2gnPeLJnmscq8E/Q/UegNXXidm7N2rVVdJ5EHmdOJX/i4qNqXJRb+naKfhQbg
 DBKXgHF2QOGttjPOpSPz9cT+sioQW9WJ64uejDkU9EVyKCqfpwSYWjt0naau6fNWbY0i
 AfbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBa+OymDcwb+NBgi5+H/RjmHJ8lj/wzRuXOfsOxCWl82rPBGCmcljKQrHZj3vO1LmqWyE/dvBpIec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMiYA0Y3Yrda3IsIrQ/+ScskxIzEIJUj3Bdc7vMMw1i7q8+ByR
 P3kzWMspivGuWtIE3h33ybWvu1dIQX9rRqxsB10IlpNYP/NgdhxWtcfTYCbks0g=
X-Google-Smtp-Source: AGHT+IERcizDS9gxoPr08iGXhgpfd8+mcHYlosMRiOwuvcl9jqLkC4m+bfUVOpVFHaRSyvQMCWY9Zw==
X-Received: by 2002:a05:6512:1310:b0:535:d4e6:14e2 with SMTP id
 2adb3069b0e04-53b348f1399mr7054410e87.36.1730233714555; 
 Tue, 29 Oct 2024 13:28:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53bb81a597fsm46449e87.96.2024.10.29.13.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:28:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 22:28:26 +0200
Subject: [PATCH v2 3/3] drm/msm/dp: tidy up platform data names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-msm-dp-rename-v2-3-13c5c03fad44@linaro.org>
References: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
In-Reply-To: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4881;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0CfbxTye5gSogyDuujv60SUYTMbj7IHTroKhJCVLqZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnIUVsQmH5ZyvBTVveOX4cpYYZmmle+02lT6ir+
 LVDzfff9taJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyFFbAAKCRCLPIo+Aiko
 1U93B/9aUs8eRWL0sH+TrGv6cp4qJ4qgz5KlVwtLFTcx0c1vWf2ymgh2i5qdzkCQKXKX7jpzBEM
 P6rEmCdUBf+qStZ214uuiq+SrpAVndKKqlbRCway/G4Jynbul0P3KptzufTPAEbz39JzXEbFvVh
 V+OS7amu4cGdjEnf14moA6HSGl82rOauaXzZJe5FzzCx7nL5i3XTN2bnYJEH+j2rqDad1fiWg6i
 zO2PR/jZh4ChFnMp2e0bWg/ca4yG0YpWd5nFmqykGNtICOsnf0z0fs1CTj8XAYnG9/OK02yXNGb
 3X/5RUhfPLXO2iekx3tSsiOPF/JH68lDxRjJYegZDSZMyqnF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Follow the established symbol name pattern and rename platform data
structures.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5cc349f672c0..aba925aab7ad 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -118,7 +118,7 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
-static const struct msm_dp_desc sa8775p_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -126,25 +126,25 @@ static const struct msm_dp_desc sa8775p_dp_descs[] = {
 	{}
 };
 
-static const struct msm_dp_desc sc7180_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc7280_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc7280[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc8180x_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc8180x[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc8280xp_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc8280xp[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -156,12 +156,12 @@ static const struct msm_dp_desc sc8280xp_dp_descs[] = {
 	{}
 };
 
-static const struct msm_dp_desc sm8650_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc x1e80100_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -170,18 +170,18 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
-	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
-	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
-	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
-	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
-	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
-	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
-	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_dp_descs },
-	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sm8350-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
-	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
+	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
+	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
+	{ .compatible = "qcom,sc7280-edp", .data = &msm_dp_desc_sc7280 },
+	{ .compatible = "qcom,sc8180x-dp", .data = &msm_dp_desc_sc8180x },
+	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
+	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
+	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
+	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
+	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
 	{}
 };
 

-- 
2.39.5

