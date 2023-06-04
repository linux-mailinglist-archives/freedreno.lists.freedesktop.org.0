Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E507219EB
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 22:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B78310E18A;
	Sun,  4 Jun 2023 20:35:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70BC10E197
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so5072047e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910951; x=1688502951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dc3R7izPKXFelK9ig5pM4WqZLaqqhBlHalLlxgNquAc=;
 b=DiS8Rofrsew7+QoxH8KwiVaKygOILJlCPoQfrQbiwSUcSvT4rSDgzvHMeQkE6pIXmX
 eLhknye9AyU6R3BHWeYGC81+cKtPmokHBuxQXsGb0aT5N7NIExTctLKSxUrf6zMIcElO
 6RdE0FGQUSD/5jnAV4GDLoXhBq0zpxv48qMoANIpXabHZUwvVvn9CY/u0FTw8REkjoPT
 vl83a5RvzhmjffwTBiYZkibwzU6LRMifopiVEEielIoDVaUE9jonPBBQhI9/Vj/nr+f6
 elb0cv8Wd7UC7j5eug7/8bd3LeqSgnt8gTpiNWlVYLriueqc0RFOjU8j2ytUfOwfYMwQ
 jSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910951; x=1688502951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dc3R7izPKXFelK9ig5pM4WqZLaqqhBlHalLlxgNquAc=;
 b=NMbDT5dUUNF4y5RuSIzir5C6ftMgdFS/TnOuSV+ja3VsvnyZwx9hpkVU+FnML+hAo6
 q4SrcARmMbfiuqrvN+G68qpHfgRPlV2v/Pdc/XpXFyQ+uZ3hdPYQ9y3UFswOKWbqmNlO
 d9qjxjjQwfWfK9+tLW+uZXaCaOiimM3WnNXZ7I1a4Rfv7Jmo6YjQWgGDeeud5vYt0VeK
 ZQG277hURWX7u27prgAQrbLecNg30PbXMnQVK+8j5YVwVfML5MYdfRqFq419pFa3T8aQ
 x8en8652eQMpTW2cUtrDBzNheuNnYuexEWXp/e/av3MDmW2PKNnuMb2UDrUMO+HDRBif
 hS6A==
X-Gm-Message-State: AC+VfDwT2w+MMO/CzWfVw8dFrv4tLfW1c5w93ko0/oi1n/y3yuATO/p0
 uscMyphXTphMrpex18267x1M4w==
X-Google-Smtp-Source: ACHHUZ4v/V3FT1qgaKkmeqzRvq/6ZZJuBU20m5z52EqaxpmqZMkyyXJa+t/Is+rFriIF/JcK+9xMGA==
X-Received: by 2002:ac2:5587:0:b0:4f3:91a2:279 with SMTP id
 v7-20020ac25587000000b004f391a20279mr4850847lfg.61.1685910951188; 
 Sun, 04 Jun 2023 13:35:51 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  4 Jun 2023 23:35:26 +0300
Message-Id: <20230604203532.1094249-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 16/22] drm/msm/dpu: inline MERGE_3D_BLK macros
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
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 18 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 18 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 18 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 18 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 18 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 24 +++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 24 +++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 11 ---------
 8 files changed, 115 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 05a38fd60cd3..e247fc86923f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -253,9 +253,21 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sm8150_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index f0037c1c4e4c..b840e2197660 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -252,9 +252,21 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sc8180x_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 85b52fc82784..cff747c126a9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -253,9 +253,21 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sm8250_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 1c215f04669c..840dde8b9aad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -251,9 +251,21 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_intf_cfg sm8350_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 8a3f946f5622..16d62cb5bf30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -255,9 +255,21 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 7e305a686055..cfb24fc8214c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -259,10 +259,26 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x65f00, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_intf_cfg sm8450_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 9c8f3b1331ae..4e81e42fcd80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -275,10 +275,26 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
+	{
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x66700, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_intf_cfg sm8550_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index adc09a87ac48..ebd070a47f31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -479,17 +479,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.intr_rdptr = _rdptr, \
 	}
 
-/*************************************************************
- * MERGE_3D sub blocks config
- *************************************************************/
-#define MERGE_3D_BLK(_name, _id, _base) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x8, \
-	.features = MERGE_3D_SM8150_MASK, \
-	.sblk = NULL \
-	}
-
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-- 
2.39.2

