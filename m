Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5C732CC7
	for <lists+freedreno@lfdr.de>; Fri, 16 Jun 2023 12:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E4F10E59C;
	Fri, 16 Jun 2023 10:04:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0958410E5AB
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 10:03:58 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f6170b1486so774695e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686909837; x=1689501837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Z6dm2XLnqrBhq2Tt8Kc44vvonw+W/q8cr8K+n2c5Go=;
 b=ER+1mSQoN+LrCoHIhIDwWOWDvhN4sKfYCGwbqa9BX5FNdOVf1yD0qdeGDrfLdpTr3n
 e7VAGjKpt25MbHuH7IhAZut6r+qZRgxcwsFyIaO9g5J5l6MlXGdC8RV1ctpxCsOEhh51
 rKzEbZYJ+O7YzTVTE8IcE9Dv7a+mly+EG4M6JtYk8VpsqqHTarpxGChTzwn2ogjErpA2
 vsVLr5V9Wi9U5BwOkUJribtg+fQmCPqeMOhoNOXnB56uRC0qcG8FdM0+VRvVqw9Lc29a
 95SERoJmN4lXTfCFFn/sTo1byTVjtd2h2w+GoMHf5P0Ph/xAtpDKd4vjSP6vHyJL4pgZ
 8CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686909837; x=1689501837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Z6dm2XLnqrBhq2Tt8Kc44vvonw+W/q8cr8K+n2c5Go=;
 b=IA6QURgQLHpv2e16tpV1SHMuuVu9g5xwPDrPcP6LxbDKs818Pxb71bjoLWAubUOT3O
 q/ohDbz8IUns19t4XxHVxQtM0BI6q+CVd5s6lD1Y7w+PitydjufsMkkAkzoaPbRU7Z41
 sdo+Vm0Gkj6e8bdifcUH8gaEot1GtuAzqEfeTa9TOZJnL/mzma1hS8Xuw93K2+MeRy9C
 JXo4MI9GjL8WGjPzktphp0mzv1TECqwrga19t9BL8ZKqUGgqN4EgmLCslL6QUicydhbD
 ay0VmncrSwsUiM5T5IwXBuT3AI7Ck6i6/L6CxULb4o1mHc06WSKXrFgfD+7hsvdm7CU2
 KmwQ==
X-Gm-Message-State: AC+VfDy/j8QygF1SfUMu6NEX78brFvQ/YBWZhBKYRUb3ELVBYW64U92K
 hLlp5PsBUFqObCED0c1Epe/P/w==
X-Google-Smtp-Source: ACHHUZ6da952EzINTP+fYB2k6K8jCZOEu52m6Dxh5mtwiNhlNZH+IAkQkxj5M1wAUmGERapImilFfw==
X-Received: by 2002:a05:6512:2247:b0:4f7:6350:6bee with SMTP id
 i7-20020a056512224700b004f763506beemr2915542lfu.16.1686909837209; 
 Fri, 16 Jun 2023 03:03:57 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
 by smtp.gmail.com with ESMTPSA id
 r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 03:03:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 16 Jun 2023 13:03:06 +0300
Message-Id: <20230616100317.500687-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 08/19] drm/msm/dpu: drop zero features from
 dpu_ctl_cfg data
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

Drop useless zero assignments to the dpu_ctl_cfg::features field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 757ac648a692..e0cc1ce3f3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
@@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9fb8ef21c7f0..f52e1fa27e2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
-- 
2.39.2

