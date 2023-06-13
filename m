Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8275572D58B
	for <lists+freedreno@lfdr.de>; Tue, 13 Jun 2023 02:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDF010E305;
	Tue, 13 Jun 2023 00:10:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6BC10E2E4
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso5838917e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615025; x=1689207025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cf/AQwGGAN91WY1BSdoZBUPW0tOiF03giLPK9ej2es=;
 b=wtr6BqCbcESF+8VB6tDT9YgDhkhM9kVvKNtAmWxcop5QABNrJNE0KmOTtsZlf9FeYj
 vaYZXmepsfmtb7DKIR23fF0EfmBxzHytKh7kS6b+tkZNx2PXIDMWfQYd50SwWKowK+Fc
 rTiSw46AH9B0DqNPT8vLbeO2NQvq05+SoiiuUYknVPS09rYUxrkmMJfI2mrg+IMKJZN/
 RSfqMY8r5E2oEzCKQX99RySSjJb4GOOFhXaigMHZc/FEDSHOSu8ysEj/zEDSviCs9XVM
 U2rPV+RG3sF/Ux01NPM6AwGhgs9UBYc2kUJzHMHbSuUgYxupsWBOz442/nZV84zNyVhN
 Haww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615025; x=1689207025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2cf/AQwGGAN91WY1BSdoZBUPW0tOiF03giLPK9ej2es=;
 b=gF1NtUu9vchPVPv9h83LP+9qGh5Gsj9iepqamY7CNyTn5iKXkSndhBQks9dKPdXcCd
 iN/vM8/dS3i+v7fX6ZlV3JUrmsRyoebTmAgEvXvJnuEq1Flo853A4Lj/hfgfDZq3c2qi
 s1N0HYhAARDjgWb8xldZ/pVwrmzp74TJnbECgaL9vS1eYaR/6gUwPolCYOD/pqlrm78+
 2bZgHcya6TFL1bGlg2ELGpoBElB0wrO/k02qKN0JchLl4e4wXos3XL39uL8kX0PRKDYB
 Cu2mFlshPEv0//SQqGfuzWMVmVMUZahdHzymJ9dfr1qSEeB672KdRMwP9wvFomem5+8/
 Ej0A==
X-Gm-Message-State: AC+VfDwx9M37RmiOWR3s33eptR3Y6uV41RHH2zVyYw1h6ZoajniKUbHM
 QJcdLZ5CIxnOBFQqsPIDU0p+hA==
X-Google-Smtp-Source: ACHHUZ4bt+UPM9NrFKfuVPyGTDJpiAH/P32XJJe1VKj1AtebZmgtEveR+LToIrbt8d+EBQ8Oty/+iQ==
X-Received: by 2002:a19:5f0d:0:b0:4f6:26de:502e with SMTP id
 t13-20020a195f0d000000b004f626de502emr4279307lfb.43.1686615025118; 
 Mon, 12 Jun 2023 17:10:25 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 13 Jun 2023 03:09:56 +0300
Message-Id: <20230613001004.3426676-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 16/21] drm/msm/dpu: inline DSC_BLK macros
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 11 +++++--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 17 +++++++---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 21 ++++++++++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 31 +++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 21 ++++++++++---
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 +++-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 10 ------
 8 files changed, 91 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index a07c68744b29..7c3da4033c46 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -200,8 +200,15 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 };
 
 static const struct dpu_dsc_cfg msm8998_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x1800,
+		.features = 0,
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+		.features = 0,
+	},
 };
 
 static const struct dpu_dspp_cfg msm8998_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 786263ed1ef2..ca3bb6a1a93a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -224,10 +224,19 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 };
 
 static const struct dpu_dsc_cfg sdm845_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x1800,
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+	}, {
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x1800,
+	}, {
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x1800,
+	},
 };
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6b9bfeac6e0a..5b068521de13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 };
 
 static const struct dpu_dsc_cfg sm8150_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 414f0db3306c..ba5420f334ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -244,12 +244,31 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
 };
 
 static const struct dpu_dsc_cfg sc8180x_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_4", .id = DSC_4,
+		.base = 0x81000, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_5", .id = DSC_5,
+		.base = 0x81400, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sc8180x_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index db3a65b011ca..01b61467a700 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
 };
 
 static const struct dpu_dsc_cfg sm8250_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm8250_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index bf1c0024a55a..20262eb56b48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -136,7 +136,11 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 };
 
 static const struct dpu_dsc_cfg sm6350_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm6350_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index bf50ae6c525d..b9984ae6e7ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -90,7 +90,11 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
 };
 
 static const struct dpu_dsc_cfg sm6375_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm6375_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index eb046079bb37..f563e513cbd0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -482,16 +482,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.sblk = NULL \
 	}
 
-/*************************************************************
- * DSC sub blocks config
- *************************************************************/
-#define DSC_BLK(_name, _id, _base, _features) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x140, \
-	.features = _features, \
-	}
-
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-- 
2.39.2

