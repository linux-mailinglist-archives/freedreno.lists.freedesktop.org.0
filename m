Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382F7443A2
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 22:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487210E50C;
	Fri, 30 Jun 2023 20:55:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541D010E4FD
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so3743271e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158533; x=1690750533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sBZLEQW9zfS5g6kh68s594zhUtDUO0fNR0aOdPTih0U=;
 b=efEwQkHUzNEFTkrSIg/8PN1DasXiApxfesoPQW+gRbRkWbSiM2qtS3YD2mYQtpRRLk
 okcBTk2aYQv6v6IO4Ug/vMzG1Ni2WK7qySbQgAIxhv/oep0nl8/khYrcxWi/PJKfoN1p
 EjiIU2QFOpVXecCZ6xYxF7oUYu5Mru6S4YgoO5yvmhiX9R/1LmAkSL+id3FmZ0BfoEPy
 l+lu5Fn+ZzeU3JUyDtIKL/oI2r6NgKljeol1QreIEBe2MN+5KnxsxjT9q5OO7OoexvUG
 Nm3gLacvbB73rJAkVKzxfoNL61/rLbRxFmdMKNn5ZRzN2+wZUMJ3rvDG1Iu/pUbXT7cR
 DkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158533; x=1690750533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sBZLEQW9zfS5g6kh68s594zhUtDUO0fNR0aOdPTih0U=;
 b=WAla0+EoGTDtsC8zVl7ks5QPpCo7hhLgfUk0sCkcAtnTb7XHMEK6tvl6b9EsFedYr2
 Frn16EMmgHiWhbp11EcU3g2MFQJNPWWps7qD2BdlGt8MIG7Qaejkifks+UvPC0rBNb23
 hyVzwhbK43od9RaRQlB54sIc74WA1av2qq2/qQXOGrkugVvaxbznSkQX8o1JwxnJyHjr
 Igd/FLIr/sV2iIr/OmscTSuTOpNNCc2Xz7K7+XRz8Bh4XuM90GJYx1a61kX9Ce5D3omO
 s+rw7inIryYZFEguD/J+9OlXLNzaQyB5oIjgeytSiusEPn3z6kUJtZWGln18fhdvGtAo
 lEZA==
X-Gm-Message-State: ABy/qLYYPdZ45r0V2voMWyc3U7owBkXXzC5pTHqwHBx0/PKj9q2dOYgx
 5iv19c4TPhZD0lt10aNNUwPJaQ==
X-Google-Smtp-Source: APBJJlEHxSK3/ForlO/cwFGo8aW7QlqR6Temx70Vfj0P9Xg/OUOUhAUIlX/9DwNuiA9rBeBCpFm2Mg==
X-Received: by 2002:ac2:5f5b:0:b0:4f8:5755:5b22 with SMTP id
 27-20020ac25f5b000000b004f857555b22mr3010480lfz.27.1688158533249; 
 Fri, 30 Jun 2023 13:55:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 30 Jun 2023 23:55:20 +0300
Message-Id: <20230630205523.76823-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 12/15] drm/msm/hdmi: expand the HDMI_CFG macro
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

Expand the HDMI_CFG() macro in HDMI config description. It has no added
value other than hiding some boilerplate declarations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 621dcc981794..195e1ac90c5a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -236,24 +236,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
 static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 22c91c17539c..acfd99d2876a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -89,7 +89,7 @@ struct hdmi_platform_config {
 	const char **pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char **pwr_clk_names;
 	int pwr_clk_cnt;
 };
-- 
2.39.2

