Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9D570CCC3
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 23:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666BB10E18F;
	Mon, 22 May 2023 21:45:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5338010E2B4
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 21:45:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so7727832e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684791930; x=1687383930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fa8BHx1lA9j88mBXlfwu5ebCF6YQtqactm4fwTM5QwA=;
 b=XvtsMpoW0JLA8cC9im5lhJicTOFSaXxK4sysS6vnAQBxbQUa/UH/uBXrfFcVKb88dD
 SLGbejG6Cv6cpdlnTr2nXVpW4c9m8Qh1BTsPS9zOiEIarrc1ZhN+WdiMixL4rxd6806B
 bJTiSbpUfdKE/18dTCd+HvFF1YpHGKWqjsE1R8SOQ2pBHt7EG42ZdEpYt6rImZVfphiT
 1TagZhb9iNg2o5k3lBNaRf7kMso9ygrhdi283otUfZIGJLbtDI87innhmX8asBqzjAH/
 /s0t1pJvqrR1jOtQSFD3tnckvAAREVrPlccnTtVdA5Mw1Zjjwp4ik2jEfc2keCAFs8RS
 17Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684791930; x=1687383930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fa8BHx1lA9j88mBXlfwu5ebCF6YQtqactm4fwTM5QwA=;
 b=RemYq0zOKEuAZWz8A+PHeHkfL8dJM3qJDIonIr6Jex0vFdYG1c9yx31mQDgPgULChS
 iLxQ/FaiUKyQGrTriRa6AYgxL/UZ7IKAzkWr/t+0Z6ZB33XUoX+SMq6CNfLtOgYKb+Ot
 9KVwhnL1QS1PlGosMJTcltojBUFnSKCt53TAL2qE2gOv8MrOatxdrDMK3L3CqTI1a87l
 C1uWjoeKgPOBEtxfSWM02KhVTbCWch1RuEyclGomoYhhjWUKkR5JeMbbM/Vowddbd+Hf
 /G45OVDyBCjdokFUhNKo/IypyIht4fWp+r4bh+2cd96L7H5C2QJcXHqtpHxOXZhpOEZp
 BMgQ==
X-Gm-Message-State: AC+VfDx/OMi5ZRkJU7n9L9Z/1FfIH4Gp8f3Pggy1lritH2qS/Hgpr/u0
 tAiQFGGl4SF18f8dZRjLRauQbg==
X-Google-Smtp-Source: ACHHUZ5HK3klvkeuvXJkv8sVA8m8TZjFu2oS1/9VQKo+mZqjv5AjwTfQAOidLsncNAHbux/vrHW1ZA==
X-Received: by 2002:ac2:5a0b:0:b0:4f0:18e2:c0d7 with SMTP id
 q11-20020ac25a0b000000b004f018e2c0d7mr4573578lfn.60.1684791930098; 
 Mon, 22 May 2023 14:45:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 14:45:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 23 May 2023 00:45:23 +0300
Message-Id: <20230522214527.190054-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/6] drm/msm/dpu: inline __intr_offset
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

Inline __intr_offset(), there is no point in having a separate oneline
function for setting base block address.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5e2d68ebb113..0776b0f6df4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	return intr_status;
 }
 
-static void __intr_offset(const struct dpu_mdss_cfg *m,
-		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
-{
-	hw->blk_addr = addr + m->mdp[0].base;
-}
-
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
@@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	__intr_offset(m, addr, &intr->hw);
+	intr->hw.blk_addr = addr + m->mdp[0].base;
 
 	intr->total_irqs = nirq;
 
-- 
2.39.2

