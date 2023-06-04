Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89D7219E2
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 22:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C9510E041;
	Sun,  4 Jun 2023 20:35:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F65110E171
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:48 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f6170b1486so2564416e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910947; x=1688502947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36kQhxFeam8qz/Q/+Y9jB2KTwOtYKJQDVld1ZtCsR6A=;
 b=VKrbQ2v64ys44JEPp4aFqZ3TQvsES/XYl+dvEokSbxi2E36yp1IKLrLHAxQ8hoWVM+
 yGaUokMEvxI0A0/+hxq3K7vmFsZ6qZ4+dDzPOOWhBJSlJ/TH89szQ3qfDu0NcTfZpIZ+
 fDXyJO5kteteBxNHP7NkEALbEmg7HVcZ5uZX0Nl895iuGGj6YVa/2vZJD4sdd7dzWZ5u
 pHl5ImlTINWHBFlxAmCrUqM2zLWORS+rF8gTeQpusM1ShDJZOFKe/XkNaFNBgZb4Ust3
 o2Tco2NHHF/pV+Rmq8cdakRSBQs0vpydft/pXwRkAJjDLXvDYUkX3iEh5Z3lG9dLtv9y
 GH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910947; x=1688502947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=36kQhxFeam8qz/Q/+Y9jB2KTwOtYKJQDVld1ZtCsR6A=;
 b=cl2iyTZ8HtXNrrCJZ49rwxP+Of5N9fVoNgJQlJG/YEs7D+WokK/bYkUT1kYA6uUo8/
 kxGoEt7uAxeS9Kx5o63YTIF3OoCOoJKR6WwPyqRwrtcJQfmin5MV7PAw1J8SAcr92tWF
 S826spJy4E/9CZZgikopP48Za455SA1UArlsfWPzsmvjXHsB/wgr/WUWoCvIKuUoQbIJ
 qneBuJuYy5DuK14azYM1tjO5USy7no4ts1gj2KAkgGjTaYEg8yciWGs0Rdp0yfX9OvpZ
 0BwNUuV413Z6KYvrnBL09rnyjweaoFrn2CyU9uicPb3mLtCoUc/6iQuKn/vhx4r0d+pQ
 cw9Q==
X-Gm-Message-State: AC+VfDwtdf+mg1pxPLg3EgVRIOAfJLIp7iNB+Re+2rkk+fMTL6aDRX/U
 OoLCHfZQgLdafK+QRztTTGJEMw==
X-Google-Smtp-Source: ACHHUZ5+Gu2ScTywGbauiXB/jMy1raLPasiE1Z9wipRARb0u30Z4aWZp3Wpep1PgmZrfbyKngasAjA==
X-Received: by 2002:a05:6512:220e:b0:4f6:29b1:c872 with SMTP id
 h14-20020a056512220e00b004f629b1c872mr303322lfu.34.1685910947695; 
 Sun, 04 Jun 2023 13:35:47 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  4 Jun 2023 23:35:23 +0300
Message-Id: <20230604203532.1094249-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 13/22] drm/msm/dpu: inline DSPP_BLK macros
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
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +++++++---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 32 ++++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 32 ++++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 32 ++++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  8 +++--
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  8 +++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 32 ++++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 32 ++++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 32 ++++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 32 ++++++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  8 -----
 13 files changed, 204 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index ff5b487d07c5..a51c1af0d7b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -180,10 +180,18 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 };
 
 static const struct dpu_dspp_cfg msm8998_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &msm8998_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &msm8998_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	},
+	{
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	},
 };
 
 static const struct dpu_intf_cfg msm8998_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c9bfa5cdf671..9f101e462a4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -173,14 +173,30 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8150_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d6a2912e6aa3..a31767a3d7f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -172,14 +172,30 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sc8180x_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sc8180x_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 12930da6be9d..28f8469a48ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -173,14 +173,30 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8250_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sm8250_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d058c93a6243..db2b95e7429e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -102,8 +102,12 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sc7180_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sc7180_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 3e87e3aa3e7b..7724277059c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -68,8 +68,12 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm6115_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sm6115_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 38917fc4107d..0195645f9f6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -65,8 +65,12 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 };
 
 static const struct dpu_dspp_cfg qcm2290_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg qcm2290_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 357c518d0280..ecc6c377a72b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -171,14 +171,30 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8350_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sm8350_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 74f5f5f946f3..cc726794f054 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -111,8 +111,12 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sc7280_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index eed326ca4356..8f43de4cb2e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -167,14 +167,30 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index c85bcc57411a..91fb41db5fc7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -173,14 +173,30 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8450_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 
 static const struct dpu_pingpong_cfg sm8450_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 32f9d5d2d961..e5b06ab13403 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -192,14 +192,30 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8550_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
+	{
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sm8150_dspp_sblk,
+	},
 };
 static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 102c385e2dc3..9a8e5e429e4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -441,14 +441,6 @@ static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
 		.len = 0x90, .version = 0x40000},
 };
 
-#define DSPP_BLK(_name, _id, _base, _mask, _sblk) \
-		{\
-		.name = _name, .id = _id, \
-		.base = _base, .len = 0x1800, \
-		.features = _mask, \
-		.sblk = _sblk \
-		}
-
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
-- 
2.39.2

