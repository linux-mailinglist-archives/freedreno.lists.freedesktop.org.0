Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBCF765638
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 16:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F7510E598;
	Thu, 27 Jul 2023 14:45:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BC910E594
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 14:45:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso1808976e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690469146; x=1691073946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozXv1DbyX/9IhURbF1Fhd2b0LEweNNt8AgMpeAaCDSs=;
 b=f9wp7aF+JtlvjPCrxW+wyk6MQOJhgz9FgjxG/z6ZPtxWdM81p5lw/WJ9D7L7f6OWP0
 DxPSFOxjJGzy/0oy3rFjThgKNk2yok0MadMiMQT866V7H3M49e8S4D3DRdQgxBy/o7Aw
 23mm1HMpVVKB7MNkivPFO/6UaB5/QhRsuQlPNTgKRj0NG5xCTFNl4wfH0bE4z82pdg/Q
 Gt5TgpJu5zr9U8QVEEXpynYF10tTsw/EfM0FahQFz8L0pcv6lxzHAnE6Rwj2NIfpaj3J
 +/opyClhe25uissfWfgvrjavAjzh7HT6KxH65ujzcCgpu3sZ0EqxqbYCvnFjjD+XFefg
 cM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469146; x=1691073946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozXv1DbyX/9IhURbF1Fhd2b0LEweNNt8AgMpeAaCDSs=;
 b=Tvb8dIfqAK/TpzlXy4lxOpTBDDoqbLqLRzV0bVJT40fyxglpJvdwqeaUCpW/qQhrIZ
 Vm28vRJTmzKarOBhQ20gLtpFD00De2muo6tBHUPUkOx7I/ReRKIVRC5NA2euXBxAGOfw
 Mc5GJ2y40oe399QfjFDwRtN+pkPcvLMjI0bknymWRVVXF2vIafNipAApkt6Mc5UmO1u8
 N2UizI2rX/Wm/PJsvFoIh2JV3JE70c2SzDUFAXlrpYHhjXmvaRdVt57qwRzyjrw74q4G
 zS1G9CisNit0j7VfyGF2I0JqiDJY90WfKVAOWMenNPlnW620OiSj7eb2Fv1MRpAQ18Gs
 iYUg==
X-Gm-Message-State: ABy/qLZDRwBoVNEuLJp8IfKfFiTaakg6QBv8rnOGBzqbG+tuwP7U9D9p
 Kd2qKxpQOrzK6vGJGUmwtjE+7SrGmNWqKNW8loE=
X-Google-Smtp-Source: APBJJlFhMrD49VU49jXEomb0dk47f28sgcEyHBNeyokLEu/IKGXr7EkYXVKw7fd6oWwSDZ4pdHuCYA==
X-Received: by 2002:ac2:4343:0:b0:4f9:586b:dba1 with SMTP id
 o3-20020ac24343000000b004f9586bdba1mr1947280lfl.4.1690469145967; 
 Thu, 27 Jul 2023 07:45:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:45:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 17:45:39 +0300
Message-Id: <20230727144543.1483630-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 1/5] drm/msm/dpu: inline __intr_offset
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
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Inline __intr_offset(), there is no point in having a separate oneline
function for setting base block address.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
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

