Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82570CCD3
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 23:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AB910E39F;
	Mon, 22 May 2023 21:45:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FCC10E2B7
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 21:45:33 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so7727880e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 14:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684791933; x=1687383933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+32966TgCsnZHHISjlCuxLmScv3wYTVuCXEogzJX5l0=;
 b=PKbs1Sftn+C4z3k3p8AxqFgjaOquUkL/Nk55v/22Elk+KiuV5WGRnis+lnXSkpybMh
 Hdnj/mOEhlKpDJ4Lzi3Fe0EOBLkMIgcW/u2gluL90E0ojX/xCUtfJUxekuYEx6I/afsh
 icSSjP9Z2u1/rJeXRYLO0395ccWm8FV9BoTJMuSaG/PHKCsTtn1paiaj7HI72wO4GAnj
 dhCzjJaVZE7S5K4lnoAwSu8qK6J+tYsCyblYdzGMFGYSt63XoBl+CeflRpVLeFAbXKJ+
 2rzK1/to7dR1VXK7QbGXs/CNXtk5ojGEE3Yjis1Mnc+7Fmy4YwjmW0TcemdR7UQ+X+Ep
 f0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684791933; x=1687383933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+32966TgCsnZHHISjlCuxLmScv3wYTVuCXEogzJX5l0=;
 b=AjTH440/d0DsM1eMLyoHEv3JXf0nc5MBqS2+Saa2VHsqnFeNvfnkkMSnYdD1s26SGK
 hVOuR7ZMXhZLwxCTlu3nuZQ5FjJR4jekn9Gm0PWHCUo/D9Qo2/e2ZazQeB2Oxr7Y6ymP
 Yd9o4p+Zezfe+cC5Gdg4zY5GQy1E4FeekufKQ8rHddTFVXS8sY3z2nEubqE48m9QEIxM
 6AwOHnzf2FmRi/xF2Mqu8ZsIPUTCJF+pHN+MDfrqMA3kP6yd95Spwn9Cs8FwVm3Ha54E
 kbv8fuCrCHBQsiZoo9fVfFe3+h641c4x86WmKo1Lkvq+PfZcKP7BtFUSnp+7okqrdePU
 B1lw==
X-Gm-Message-State: AC+VfDyzIvSVouE38jLNIIJ365YKJAE2yf8+15W69M9AvNcbbZT11pNV
 Uq7nRhfJOIWBJQ5eOW+myrqonA==
X-Google-Smtp-Source: ACHHUZ7H6HQIP0q+P0CZsnbVGDMNjFVv1BafI1+S0GRMALYPJadYg6JkJDKxi3bXmCol7YKI9ybwgQ==
X-Received: by 2002:ac2:4a68:0:b0:4f4:b378:469d with SMTP id
 q8-20020ac24a68000000b004f4b378469dmr911796lfp.41.1684791933271; 
 Mon, 22 May 2023 14:45:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 14:45:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 23 May 2023 00:45:27 +0300
Message-Id: <20230522214527.190054-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 6/6] drm/msm/dpu: drop compatibility INTR
 defines
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

While reworking interrupts masks, it was easier to keep old
MDP_INTFn_7xxx_INTR and MDP_INTFn_7xxx_TEAR_INTR symbols. Now it is time
to drop them and use unified symbol names.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h   | 13 -------------
 6 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 649784aa6567..df88e3f2a548 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -161,11 +161,11 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 1e87c7f4775d..4d9936d41464 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -107,7 +107,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 3082657f06f2..65fa65b954db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -151,11 +151,11 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index ca5b82bc8322..b8158ed94845 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -169,11 +169,11 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index dd7c87f772ea..6a12e882b5b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -173,11 +173,11 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index f0b92c9e3b09..4a46c0900e04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -39,19 +39,6 @@ enum dpu_hw_intr_reg {
 				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
 				   -1)
 
-/* compatibility */
-#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
-#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
-#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
-#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
-#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
-#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
-#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
-#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
-#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
-#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
-
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
 /**
-- 
2.39.2

