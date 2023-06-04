Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C27219E5
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 22:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D8F10E17C;
	Sun,  4 Jun 2023 20:35:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E1910E18C
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:52 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f3b4ed6fdeso4955480e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910950; x=1688502950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oXWv92/YQvcSL7BkNAGtHY7pS94v05uKS+kdUroQoA=;
 b=LkvMQgeo3ws6sLix/VpSD1bG9JNtLBy2G94Cf9G1GHtCCczL5H3PHMyU/iMLc8T/PF
 1QabypGwf+1AtMrVYDiMqsaut09wVhNLRiRNwMO85/s3RxZ54DItwWgeST5Ib3LZYG1I
 1Ufb0d814L5VQ8F9Xjkc2c1+NxuelRa0Fom4hoPHpBzxpXfjDp5saETQSA6ZXoqhvnJF
 9HkEzTu0KlUxRUVwt9rd2AQnZJqA5AsqN3n/jtBVVCANowaDHPpMpmdjUNLWufficY4i
 sO3dHWGMtDgkEMAfwhkVFF2PaUBWjlNv25qEr61rXmgBJc0ShRSJqoJMxw7ZPOqgFDjZ
 woLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910950; x=1688502950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oXWv92/YQvcSL7BkNAGtHY7pS94v05uKS+kdUroQoA=;
 b=bB05BWqB1UivWbgL8SRsvwRXaSWvuDvpRrVxODqIrQqBbHbH3grizmP43lD6BR/epE
 JPp3obYKczCbwbSwCr+rcL0c4JduXRgo26XcZAqh+LcWeoZE0VDNZsoZ92IX8syjP44+
 z2RYpYIsZ91WH47eD1WZsikxeHV3XoZtd3B7DPl1PQ/9Wk/V6K1yCj01YjeL5XTvR6aw
 xkpxJUf8h7hQfEwhv2AiNQPOsMJHZ4451hT3btFNGR6BPAj8Wzf/+lyJ/8Rd6wdyAqEh
 wx2yVlsEZDnAgRc9TOs+Zsug1GSo3bETqcyDrU+7/jkt+roDsvS0RDLRMfzN7uKr6y6z
 slBQ==
X-Gm-Message-State: AC+VfDze6qeOVRjVLp7pS8WK6swjr+3DgTMu1Pm6jYidpvDUPgLGMAp/
 t3p2acTJJEMoRX5xBYATJBaJ8Q==
X-Google-Smtp-Source: ACHHUZ64yQIpAMmpGBusTxhCA+dRRCjHt8YJaXo/2kCHYWVzJzVQeAxYZJ78MSYjNFK+9jHdlZP1Sw==
X-Received: by 2002:ac2:47e6:0:b0:4f6:2156:51b5 with SMTP id
 b6-20020ac247e6000000b004f6215651b5mr1168139lfp.35.1685910949886; 
 Sun, 04 Jun 2023 13:35:49 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  4 Jun 2023 23:35:25 +0300
Message-Id: <20230604203532.1094249-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 15/22] drm/msm/dpu: inline DSC_BLK macros
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
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 20 ++++++++---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 24 ++++++++++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 36 +++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 24 ++++++++++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 10 ------
 5 files changed, 86 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index c289fbd76080..ab13032c0082 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -212,10 +212,22 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 };
 
 static const struct dpu_dsc_cfg sdm845_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x1800,
+	},
+	{
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+	},
+	{
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x1800,
+	},
+	{
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x1800,
+	},
 };
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index b26a7d4b0ce7..05a38fd60cd3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -259,10 +259,26 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
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
+	},
+	{
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+	{
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+	{
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 4259de1dbfc2..f0037c1c4e4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -258,12 +258,36 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
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
+	},
+	{
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+	{
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+	{
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+	{
+		.name = "dsc_4", .id = DSC_4,
+		.base = 0x81000, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+	{
+		.name = "dsc_5", .id = DSC_5,
+		.base = 0x81400, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sc8180x_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index b268466b2b7e..85b52fc82784 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -259,10 +259,26 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
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
+	},
+	{
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+	{
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+	{
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x1800,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm8250_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 67cc22210c4c..adc09a87ac48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -490,16 +490,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
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

