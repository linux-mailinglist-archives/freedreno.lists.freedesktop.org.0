Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAD82024C
	for <lists+freedreno@lfdr.de>; Fri, 29 Dec 2023 23:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863110E2DC;
	Fri, 29 Dec 2023 22:56:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8445110E2DD
 for <freedreno@lists.freedesktop.org>; Fri, 29 Dec 2023 22:56:55 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e7b9cca2fso4415531e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Dec 2023 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703890614; x=1704495414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWBx35fV7am+45bKhj9ZTSkIR2B0OijQCf07KK7Jt+Q=;
 b=ncRy9wv54YQJ0JiRx22mB4WFN3Ckpdj6fQENsqVSgOqdJlLVPeV0z9SXmGPhVJv7S5
 sv1pOhH8elfiIRbe61sCEZROvH53fDrKtF3lcStgTdOaGmdjqgqmYoyOoLIi9BCS+iRt
 n+Zq8lKw/19AOVb6ZMdTich2QPPbNRP7O7TyCzecHY9GHb7TwByfvpZb7kAt8+QYQfVC
 RM7GGHBTjnh9Jil8fbO4ZlGgXKhmYfhPuPHdSCEbd+QLzHz1ztnybQ2ZNyMZEPksxv4k
 KsZWn1DzAUmn2YNE+SGFfqla/cm3PQunCW273mo7fA3NvCDUXBbK5Udx69enmG/RVphO
 IG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703890614; x=1704495414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWBx35fV7am+45bKhj9ZTSkIR2B0OijQCf07KK7Jt+Q=;
 b=N+MZm1yoQYtrrk9JlKwORwgNLwADF/qOGjGrQCKtWD/LUQG110plgBW00KCt5gGLNF
 QzJg0dFgqgxw0q3mrQUqkWAvfQwi8A3QtI3Ipi82LJ1iJeYvKu+v/wWEyHPaY0jGYSp8
 oNpWIoInVS3Vtq4XHQMVY02TXebq2nPt0bpO5brAlKUjxKoBMmBwtMU/jK7QhT+v2FRR
 q1ot+fOf62+qaDxVZAropJXJpml0J7VbM0gDJ1ZLhkWwHtvE425adDS8+d34Am8SKiWC
 vkEh+RVF45GqrSPk0Ven44VID2/uhv2ctbQisIYlN15sdBkHQa2RKOXpq9JCbvDNFhnC
 uR2A==
X-Gm-Message-State: AOJu0Yyr4DEbPd4i4sIUt6msIcPy5xvUrUW593zt11ZJxui0n0kAG5/U
 nAXEVLeikPu/PLsI9+2FnhpUdRC8NsfpYQ==
X-Google-Smtp-Source: AGHT+IEsqRR6tFpvAIToSg3ICrRygtYsNovZRsfVa0nASyoZr6OoPbwyPxFEPhrlxt6uLlFRSiEtQg==
X-Received: by 2002:ac2:58ca:0:b0:50e:7c6e:dcaf with SMTP id
 u10-20020ac258ca000000b0050e7c6edcafmr3144927lfo.35.1703890613826; 
 Fri, 29 Dec 2023 14:56:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:56:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 03/14] drm/msm/dp: parse DT from dp_parser_get
Date: Sat, 30 Dec 2023 00:56:39 +0200
Message-Id: <20231229225650.912751-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It makes little sense to split the submodule get and actual DT parsing.
Call dp_parser_parse() directly from dp_parser_get(), so that the parser
data is fully initialised once it is returned to the caller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 8 +++++++-
 drivers/gpu/drm/msm/dp/dp_parser.h  | 3 ---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d37d599aec27..67b48f0a6c83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1266,12 +1266,6 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	rc = dp->parser->parse(dp->parser);
-	if (rc) {
-		DRM_ERROR("device tree parsing failed\n");
-		goto err;
-	}
-
 	rc = dp_power_client_init(dp->power);
 	if (rc) {
 		DRM_ERROR("Power client create failed\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 7032dcc8842b..2d9d126c119b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -315,13 +315,19 @@ static int dp_parser_parse(struct dp_parser *parser)
 struct dp_parser *dp_parser_get(struct platform_device *pdev)
 {
 	struct dp_parser *parser;
+	int ret;
 
 	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
 	if (!parser)
 		return ERR_PTR(-ENOMEM);
 
-	parser->parse = dp_parser_parse;
 	parser->pdev = pdev;
 
+	ret = dp_parser_parse(parser);
+	if (ret) {
+		dev_err(&pdev->dev, "device tree parsing failed\n");
+		return ERR_PTR(ret);
+	}
+
 	return parser;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 90a2cdbbe344..4ccc432b4142 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -67,7 +67,6 @@ struct dss_module_power {
  *
  * @pdev: platform data of the client
  * @mp: gpio, regulator and clock related data
- * @parse: function to be called by client to parse device tree.
  */
 struct dp_parser {
 	struct platform_device *pdev;
@@ -76,8 +75,6 @@ struct dp_parser {
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
-
-	int (*parse)(struct dp_parser *parser);
 };
 
 /**
-- 
2.39.2

