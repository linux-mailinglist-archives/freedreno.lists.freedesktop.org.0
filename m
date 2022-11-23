Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611A636BF5
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 22:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C694610E641;
	Wed, 23 Nov 2022 21:04:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31DA10E623
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 21:04:12 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z4so5844573ljq.6
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 13:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BL3dVpq4lInuNIJjCsSuR/7YS0AX1mCMhw4iqXJEL4=;
 b=Pii11tTJEWXqdPtDtZmrubLFVnpOkE5p5lqN5IVEykTUegm9WmZhWA3fqLoMUvenbT
 eLobFUp8evmILhKxD1UaNfBjsxWy8XxPvucHiK+ot4fSFsot6/FPSt54LQInzoB7dER8
 1DO4uYRmg6S0zh5mmFgaLRqGfCY04ouSjVrGFUYq0BHrw7Anr/AM43RQJTFSSvre37oF
 6AT6vxLCq/66BqUFqClkuBSwAMH8U3U1a1eTZaBwkzTQcTNKQnhmFLLLLi5eehGVbNMH
 q+Ebcc/fgXQd2CI3Bqf1GxOBMdnRT+KKrunFDaZH5UtFyYMdP4np0e5Z/ZXhduVnW9ML
 27HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BL3dVpq4lInuNIJjCsSuR/7YS0AX1mCMhw4iqXJEL4=;
 b=m3tB6isvcz0I4CT7XmppVrxTOc4uiO7mehGV8xBj30si8Fq7msMOLnC711y84IiN2E
 U7g6oC3jZ5zfTnNLdBFBf82bOmtUT/tbIECtTfKduKCvUr0rix7BnFPu41q1J8YK6Ot+
 8HwwSvZ/x9RuN5X4SRntYOJ6PbqhTlKX4AE6jGOUJHXSoIJTcXrO3mt01FH+5bPqQd0n
 L7pJl26K1ZX3MrTQWN5IzTcAiUw+15B60aFsXORKpb2L146TtpQ0WVIH54dup/6C2Kfu
 dEQaWPWjanK8L7e8ZlqnxTAu6OoosO+6xyARlRhmTZ2QKulQJ6el+dJtDhTm7BDiGbNO
 K1BA==
X-Gm-Message-State: ANoB5pmEEXknjFOFsMxkUMhpZa8erURk7KLpaDEmk8f5K44bEf9WmarL
 Iq174g876zusJT4WU64/07rl5Q==
X-Google-Smtp-Source: AA0mqf7OHJ55sOzx13XCGgisDIl9E4avBxDZGbPFWdgpeCuwNJQmQB+9qxJNqPxCFK3/69FNUm3vmQ==
X-Received: by 2002:a05:651c:32b:b0:277:8d3:4298 with SMTP id
 b11-20020a05651c032b00b0027708d34298mr8811264ljp.302.1669237451083; 
 Wed, 23 Nov 2022 13:04:11 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:04:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 23:04:01 +0200
Message-Id: <20221123210403.3593366-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 08/10] drm/msm/dpu: add support for MDP_TOP
 blackhole
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On sm8450 a register block was removed from MDP TOP. Accessing it during
snapshotting results in NoC errors / immediate reboot. Skip accessing
these registers during snapshot.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38ab1568..8da4c5ba6dc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -82,6 +82,8 @@ enum {
  * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
  *                         compression initial revision
  * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
+ * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
+ *			   in a failure
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -92,6 +94,7 @@ enum {
 	DPU_MDP_UBWC_1_0,
 	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
+	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f3660cd14f4f..4ac14de55139 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+		msm_disp_snapshot_add_block(disp_state, 0x380,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
+				dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
+	} else {
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-- 
2.35.1

