Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7A54CA90
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 15:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E87F10F53F;
	Wed, 15 Jun 2022 13:59:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A1710F625
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 13:59:41 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i29so19090214lfp.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bEZ1NYwvFdMufdWC263WCaYuMJCoQlXujRGSLpZbvcs=;
 b=HoEHo8nE7GLoRGEAW8WNXManvVcmOERlVef/MFIQmTjnWqI9n6KuhjFTXXyu467mCP
 wDh3yHjP+hfr8e5XXVLtM9JYP1iaPcbWylOLxKPlzGt/4ZN4vUsGM4wkkfqEqZgrPUJj
 6XnAa9Y+TFfOkXp/XWOpWTP9A2OAC4uaAadarau8UYJkQ0zyAahzmsTeOy5sxn+qGAlz
 OU2WDv5hp1Et8LCqN47xtG2o1ZtZvdqbJBPwYyT7G0uMMIodTLUgFeJk7aw2tVkeGFdD
 Ax3Hi6obgp4xhkf1fxYH4dN7M4sWY2QfeafWwwSNRedp46CDBYOM3J8nenyAoYAL9a4M
 JvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bEZ1NYwvFdMufdWC263WCaYuMJCoQlXujRGSLpZbvcs=;
 b=uaVoH0yEO8H2mPI8TTQPGPPbeaHbqiDttLMR4xTOEX/5NKb79gNWzuwM0o5HeLZ10z
 iIN9hOpy0/H2MNbeQw/m6t7A+je6RS5eNNONHDnE/m4aFXco3LpURnK/Y4XimN/huHFk
 xxLmHSedH4JgVbcc6OlLi1g4aCcwQz2DnkyaYhwyUwWx+29QFitBTLuknYU3cFG6DJM5
 ukksW7ttNLyvbC30ADYtOk8igewbTQlNj1JH4sOZtQhf0htdYCXafOn/4oFXsx3BPaJC
 cXHnbErsmevrw6rBk83OKmYdOMltfwxf4npqF+3191MvsDrmDzCBQaR/lbjCmmA/WnVx
 +M1g==
X-Gm-Message-State: AJIora8yVcY6gS378Bj4snFvh+S0PpeI6KlCHfwzoqSILRDw03hw0fTp
 wVQINAvaKosOhjjzlEtfYv5goA==
X-Google-Smtp-Source: AGRyM1uXl2s7Akk5f7xlXiXmsBx1wbqbRqPDTlvwERbZp7pnN9o7vXDeIEsp8qtITl4tR0HL0nb1SA==
X-Received: by 2002:a05:6512:3b8d:b0:478:f9f3:962b with SMTP id
 g13-20020a0565123b8d00b00478f9f3962bmr6579960lfv.169.1655301580074; 
 Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 06:59:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 15 Jun 2022 16:59:34 +0300
Message-Id: <20220615135935.87381-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/5] drm/msm/mdss: move is_mdp5 condition to
 msm_mdss_init
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

Move is_mdp5 check to a more logical place, to the msm_mdss_init(),
rather than getting it in the mdss_probe() and passing it then as an
argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index d81d8fe3584e..ce8ff5bfe55a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -329,8 +329,9 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 	return num_clocks;
 }
 
-static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
+static struct msm_mdss *msm_mdss_init(struct platform_device *pdev)
 {
+	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
 	struct msm_mdss *msm_mdss;
 	int ret;
 	int irq;
@@ -420,11 +421,10 @@ static const struct dev_pm_ops mdss_pm_ops = {
 static int mdss_probe(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss;
-	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	mdss = msm_mdss_init(pdev, is_mdp5);
+	mdss = msm_mdss_init(pdev);
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
-- 
2.35.1

