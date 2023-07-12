Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951107507C0
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 14:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438C210E517;
	Wed, 12 Jul 2023 12:11:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B19B10E4FF
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 12:11:51 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b6a6f224a1so113250271fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689163909; x=1691755909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgNwhxKw4bZ5s3ucnef5zeiAhvXraBKd19jFSLqsoHo=;
 b=Xxn+9ZtM1kISF8G9nVeegH/A6WkZuCAm2YNYaVXpgwQFrcxyVO3yDfweNVTo1QQcrI
 /fLBioGmRtQu+F0rNf3s8E2pUJg7snx91MzqrHPUTSa19+fRvMlT0J0/TmDnLe5LKXvC
 5bhFxIuQEZqlLjx7hEzlkxyMKxmc/1CIIKkvJL4NarAEllpvzo5X85W6z75HoJVU4Yfd
 0dtW4QvFdpfUjEryhZlHaIXJrdKIeKyBsNcExxFoW7rSkui9NeZRbm488zHQtyUhBYfj
 FmYz0aEJtLUWS4MkBmXDinhO5XfilIPufWDo6JbZFSyPE866cYtPueRHdSsQbZSK4bIp
 8RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163909; x=1691755909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rgNwhxKw4bZ5s3ucnef5zeiAhvXraBKd19jFSLqsoHo=;
 b=ka7aVRqL2+OVbmdd3jY3xN8Y6yBsh4UM2fyYYEYx/f/6pjr+3BNXWbUjTNAYx3ZHIb
 s+WI1DrbGPtFDWmbptvhdQnH73TtFrNcX9ygUyL4uZg9InEFw6ArNWjriBTBpbwFxLbd
 9Zd+bqw2vYwGBbqDaBFIuhxM6G2WIR48JbsjVo24gpil/kiNMThmfyhrk8YTCtXaBcPU
 Sir0x0ZGUie/bSH6HXK4/2pAp2dj3oxGZySRkjgvvjsjcqwzQUQVR22X5HUO5UeL9RCF
 l/aEKsI/F7+HUsYB31D7OOvSzbTcf0mz8OWrWZ6Kj6NgOFNsHbMfCYey4cuJjGDgAADy
 Zf6Q==
X-Gm-Message-State: ABy/qLaYE7bSEYaEaEovVQ2DITOGhUNw+TtSKZfVnoljHX6/A9DSByXn
 XwG9Q8hE5RyrY4s4I8BEFK+LpA==
X-Google-Smtp-Source: APBJJlEoBVM7oIZB/8fguZjY6IW3oxraLQ8m9VrI4T5KyvjsWvgOEl+fZugMh6fH6yINf2SjFudqWA==
X-Received: by 2002:a2e:300a:0:b0:2b5:9d78:213e with SMTP id
 w10-20020a2e300a000000b002b59d78213emr15976449ljw.22.1689163909736; 
 Wed, 12 Jul 2023 05:11:49 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:11:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 12 Jul 2023 15:11:41 +0300
Message-Id: <20230712121145.1994830-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/8] drm/msm/mdss: Rename path references to
 mdp_path
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@linaro.org>

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 304a6509e1fb..809c93b22c9c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -48,8 +48,8 @@ struct msm_mdss {
 		struct irq_domain *domain;
 	} irq_controller;
 	const struct msm_mdss_data *mdss_data;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -62,13 +62,13 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	msm_mdss->path[0] = path0;
-	msm_mdss->num_paths = 1;
+	msm_mdss->mdp_path[0] = path0;
+	msm_mdss->num_mdp_paths = 1;
 
 	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
-		msm_mdss->path[1] = path1;
-		msm_mdss->num_paths++;
+		msm_mdss->mdp_path[1] = path1;
+		msm_mdss->num_mdp_paths++;
 	}
 
 	return 0;
@@ -78,8 +78,8 @@ static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
 }
 
 static void msm_mdss_irq(struct irq_desc *desc)
-- 
2.40.1

