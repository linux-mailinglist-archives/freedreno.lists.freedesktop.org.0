Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2B54CA8E
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 15:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3652010F6F1;
	Wed, 15 Jun 2022 13:59:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECBB10F68E
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 13:59:40 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s6so19011245lfo.13
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESJKapWNnw8tw1fCS4q6ugXslWZGCzhXQrREzvrDX9A=;
 b=mlHWN7WMxxt1qnpdtMUUAzh4kLmqQZlbcE3yEaIPgSq7bw+wcj2+u0KnWMG6UvXnxj
 SGEAmmYaINLO4Twb6oUTiKUMSkgMbQ9BY7JQvuXOK1TmirS2++Vf41hP896BGzyGt5mR
 6hOPqYBYSxkQCbAdddof/6Hl/0tcIawUC1SLzEG64c8YpUzxfeq6unLEbTlT0Ciux/1H
 dDxSuEmptUvTIAAeCwPAtSGZJFV9fvbxzJcuW54uPsbuhoALsrup0sbiBWiGzLEIMgXv
 U1S7vxMgtE0Qivb7LTzSP+UdAqA08UegxZe8bweuWX67JxkoMk2DC3kX1+bJUw2w1gEK
 13Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ESJKapWNnw8tw1fCS4q6ugXslWZGCzhXQrREzvrDX9A=;
 b=fHZoq5EDOLOX2sd4AI4KS+crYCv+cSed2PfMnKjS9C7JbEuyO0myq8Sg1P4RV7F2Og
 gL4z3ghdRmLl2Pksybgdh+0J06H5KzyQMe/vsUJkV+JKbtGIeiojIuJu2Fj0ojX6n52b
 /xHtD48kv0+L9yZW1JD2iLcJJkc9yfaFw5zMttVoe/LAimdEb58aBgPAQMcQISp59jyi
 he7pJwn1YHzmjeV/qxsyF8NWEKRHuJIApTDh4s98hJpMCm16Z0OSJRNBSBFipRublkzt
 ooPDoeniGV9kCS5GeNny784efAW0eLP1UZ7ngv2WwEXNegonh/r83q0L+JPeSTZEmG4g
 ocAw==
X-Gm-Message-State: AJIora9lRh/Qoko3EnDJSkv74kMi7WwLI6VcqsfHmQmrRvWqrxPWKM9n
 aEVnKh/qCvt/VS2ya0EsgAtNjw==
X-Google-Smtp-Source: AGRyM1sZ1VgoM4AmEjYKT5MIQE/MAC9Lf8h2/BsOzxicN29oYsvzMkY3Cxb2IYT7Ds5RdmwC6UwG7g==
X-Received: by 2002:a05:6512:e95:b0:479:1087:2eaf with SMTP id
 bi21-20020a0565120e9500b0047910872eafmr6286782lfb.274.1655301579194; 
 Wed, 15 Jun 2022 06:59:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 06:59:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 15 Jun 2022 16:59:33 +0300
Message-Id: <20220615135935.87381-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/5] drm/msm/mdss: check for core clk before
 accessing HW_REV
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rather than checking whether the platform is an mdp5 or dpu platform,
check if the MDP_CLK is provided or not before trying to access HW_REV
(and skip reading the registers if the clock is not provided by the DT).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f7b4628986b8..d81d8fe3584e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -32,7 +32,6 @@ struct msm_mdss {
 	void __iomem *mmio;
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
-	bool is_mdp5;
 	struct {
 		unsigned long enabled_mask;
 		struct irq_domain *domain;
@@ -186,6 +185,19 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
 	}
 }
 
+static bool msm_mdss_has_clock(struct msm_mdss *msm_mdss, const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < msm_mdss->num_clocks; i++) {
+		if (!strcmp(msm_mdss->clocks[i].id, name) &&
+		    msm_mdss->clocks[i].clk)
+			return true;
+	}
+
+	return false;
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
@@ -198,10 +210,11 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	}
 
 	/*
-	 * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
-	 * mdp5 hardware. Skip reading it for now.
+	 * HW_REV requires MDSS_MDP_CLK, which is not used for MDSS device in
+	 * older device trees. Skip accessing registers if the clock is not
+	 * present.
 	 */
-	if (msm_mdss->is_mdp5)
+	if (!msm_mdss_has_clock(msm_mdss, "core"))
 		return 0;
 
 	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
@@ -345,7 +358,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 		return ERR_PTR(ret);
 	}
 	msm_mdss->num_clocks = ret;
-	msm_mdss->is_mdp5 = is_mdp5;
 
 	msm_mdss->dev = &pdev->dev;
 
-- 
2.35.1

