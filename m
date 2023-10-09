Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A527BE773
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0438710E290;
	Mon,  9 Oct 2023 17:11:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8955210E289
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:11:15 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5068692b0d9so3769483e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871474; x=1697476274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yj6njcBJvVSdEt/itrCaxDqmJfa3khgLnrpbIsNXMlQ=;
 b=WAxXBS1s8wZft5xayMMV2tf0xvc3KYVZy4cZAySjMgqQqOHo0f3+KENDxbXrKNbkSg
 AqdWRayE9tZRR5boUrfvLiHILbyAErq1uEht+N9m1anPKgZxqNFMGq4l8xE0XB0Ux0IP
 1R8X0CVVGghVGY1flZauXVKNO5oVDYxGuJWUDl7fdA1Ho5aEdzm2XpAhuKrTkwZSnnh3
 NYpTCsyKmBR1KtYgiaRxCLbeHHUz+bp2bgazI3F2fUTuF6cCizZ+QGsynCLSSLqZuLhO
 PGeVzr1LThX04rS0v3w95X3a/blqIWeUDaZD0MHrZPpedme1gUCmxpVPrdLVGczatsUb
 nMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871474; x=1697476274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yj6njcBJvVSdEt/itrCaxDqmJfa3khgLnrpbIsNXMlQ=;
 b=t9w9KX9Ik6SEAKOYa+D2KTfe1T0f6wJb95HOpnZdflrG2w3kXCZCvDpNhw6IJPBfkH
 hAcKaauzOtELXJdASzMIHi5EmMGKdk2AOaAw2prvrwGpIGABnY2JHDdazoaKaBi1AxGc
 fIXRn/ICiWVBu39/2JO6adm2ux3iCVuvlVC4AwPR93fnXqd29QoG7zruAPGKtGvQTG/J
 0yzEI1e7LnwC35cQVUFK+vW+9PY4F1axFcOj4Fqv2Co32ynm2aFcdMQeogU8hX7cR9kY
 CpfN2sioILLEMtZ3DvPfnHVbfEPm06tHnaj2RkBaEQbcG5GqdV6EtyA6i4zUeH7r6t1Q
 ouVg==
X-Gm-Message-State: AOJu0Yx+Jgtxw8allWB1/P1XpcYjw7uxdZYQ4n6pYx6DEqB6Xz43upVV
 st3BhuIRB/4z79doZOJEsXeBtw==
X-Google-Smtp-Source: AGHT+IF6x9eUIfqM1YlOqJeCkA5+e7lU1HnygagGf6z5gj4tauD5DVNCC9HYvmV7lqMjEci6dxJsVA==
X-Received: by 2002:a19:771d:0:b0:505:6ede:20b0 with SMTP id
 s29-20020a19771d000000b005056ede20b0mr12446558lfc.58.1696871473848; 
 Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 20:11:10 +0300
Message-Id: <20231009171110.2691115-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
References: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] drm/msm/dpu: enable writeback on SM8450
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

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d0214edcbb0e..9a3d1286d160 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -32,6 +32,7 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -326,6 +327,21 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8450_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -423,6 +439,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.dsc = sm8450_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
 	.merge_3d = sm8450_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8450_wb),
+	.wb = sm8450_wb,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

