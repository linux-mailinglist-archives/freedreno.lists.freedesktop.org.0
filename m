Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0183870B282
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 02:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA6210E21F;
	Mon, 22 May 2023 00:42:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7787810E21E
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 00:42:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af30d10d8fso15477151fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 17:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684716150; x=1687308150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LOzPobYlC2VJQ4A8wiKtjp03QoZTADqwD/v8ClHAvyg=;
 b=SuQPA0Jaa3BwdVOg3HARRiUy269QcbA6O7yq6Pc0rm3/YOLDCLkMxueXRD00Jbjob1
 fghM/DjmCQn+fhr83Br5lDLC8hfESrPOwEhM0OwnbtUV76zrdeDonIchGu/nYaODK8Ng
 3ffelWHUZs1sjmFgSqAIfHIuJEG2Px+Reg9cnY8sGM0f3BJq0WW1C/7Rd/LgN2sKEh2T
 NlP92sC66+ekM2xMLW5feeU7ziqmgtipfeX6yLa94bbCjNWUK/uTcV7QV9LWY73Lrk76
 t2F8iVzo8xlvmx7NIWSpBhLmAC9fwhRUYtNpYlIOfxE8y+yRWNgrr3JRcnosbDKKsPr7
 QOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684716150; x=1687308150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LOzPobYlC2VJQ4A8wiKtjp03QoZTADqwD/v8ClHAvyg=;
 b=kuJCdqtiUEJxaBaIGqmlF3Wonu4bo5pFFs/i6cIH7/6QUkoLNfZ+eqhFDH1NrTn7pn
 LjtnZOsJ37vVoG9Jp7xw1NOtOu4OwkNbdZiaLWVYDR0G3oim1c5ackuhPHhuSa3QqXEp
 4aB/AKzzrdNhjk6DjUr3qxB900IVevuE7Alp6LthmvQBjvAt09nrw/kIZvrOZFU+7Xuy
 9t5phiEuqljfsh68XPQ5/rQuHzbUWT9jWOWKSuCkniZqk5l7R0QJmsrMxop4qVBpGLS2
 UEiZoU9wdyDSHvmDNndd3X4oMZqhRqhv78akUzb/7lHasqCSYWY4uy3/A2Zvi0/Ncqt5
 rImg==
X-Gm-Message-State: AC+VfDykFujpZDe3X+9s0FVVgwoxBsupC3pqIeXQ9zDblmWoABvQSlnK
 wDR4feHqoLW5l7R7+7sy3Fetnw==
X-Google-Smtp-Source: ACHHUZ4ggFhhA2hNrKjtxpGMbVrJXZV1LH3tuH4c5IaHWg2GABMg6MdloukTTdkTvAEqvYCsNDdAtA==
X-Received: by 2002:a2e:81ce:0:b0:2a8:b7e9:82ee with SMTP id
 s14-20020a2e81ce000000b002a8b7e982eemr3385826ljg.1.1684716149896; 
 Sun, 21 May 2023 17:42:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 17:42:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 22 May 2023 03:42:23 +0300
Message-Id: <20230522004227.134501-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/6] drm/msm/dpu: inline __intr_offset
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Inline __intr_offset(), there is no point in having a separate oneline
function for setting base block address.

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

