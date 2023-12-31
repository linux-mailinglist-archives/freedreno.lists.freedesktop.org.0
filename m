Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71182095A
	for <lists+freedreno@lfdr.de>; Sun, 31 Dec 2023 01:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0E10E144;
	Sun, 31 Dec 2023 00:44:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C57B10E03E
 for <freedreno@lists.freedesktop.org>; Sun, 31 Dec 2023 00:44:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e80d14404so3767954e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 30 Dec 2023 16:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703983439; x=1704588239; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
 b=ok7cRCAbtpW9+l6uMPTuivC4+d5NaNVRzvqvco2JCfyY03dt+J2fyJ+lKH4tP3uf9t
 CKp/BR7rcJQ+VC4DACVmGavZWMA60B4G9uo1+j8Zt0sfyiI18BKKusLLzXD0IGHBkP9b
 zLKkHvLJkmhfxWmHk8AsuSO0CFMjd9kLITdT4Dt/bR2+rlkL2RfIMLM6FRZBbAJuvDY5
 4aF88JBL8z2ij4R5BP9RABglEnLS/Lf+5GQKltPABuYQkX0+C5wjM7FNek/NskSLedLc
 T0VMy7tEGjjkVL0pZ+oAeFAdYB9fVxa88j06ulik7j27iLkyIoFnuIAzbOFW8FSV4lI7
 cV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703983439; x=1704588239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
 b=E26M2D0Fqg+yzjl//iphL8kRToQ/ck2yD0zRw9tt9qnN3P0baUqUtFZxyP2Ys0dZnn
 NtHlr9ppE79h+cJYZ3iFtT2EJLI5g2kqB7Zot9y80WA2HKFPvA1k9jKSg1EC4LrUtbdm
 xzqkGHPHEFBZAMCpPUetF1Kai8EyRImKPUVePEAOi1FelWBdWvXfcxfT0kE+7PvSTzU4
 q9ts20677L9dvtsnn28v5vE/qQQuKxTPaxKzWcudvbb4B9QbppS62+sX/eQit+lnN5sr
 ajmPSQA4Vy7lDHTGTrMASbdv1R7Q5RqPQn3ClQ4CEuvl1Kiwiif+Jj4nnAvPGhea8SYx
 SADg==
X-Gm-Message-State: AOJu0YxzUZ6N+VPrrSyvh7v4v33M874diqswq2sFGw72fokW/erUroBp
 ObqzhxoW+zRItbUgzEon07uTgjAFnmzBdw==
X-Google-Smtp-Source: AGHT+IFj+ETuYeyccWGVEOUFdVJpyDVzBfxtMFjrfs+4rnbGgjA7Pql4p2q+zrzbJLFbmClJO/Lx9w==
X-Received: by 2002:a05:6512:12d2:b0:50e:9a16:103 with SMTP id
 p18-20020a05651212d200b0050e9a160103mr89205lfg.31.1703983438874; 
 Sat, 30 Dec 2023 16:43:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 16:43:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:50 +0200
Subject: [PATCH v2 03/15] drm/msm/dp: parse DT from dp_parser_get
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-3-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nbI6O2jVJmJKDcIwmvwKvAtsadxXm7JZt5ZEib+SKuc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlJot5ruSYBM2dWO8mK76xKYFScuAQwatTME
 7msN1ztCbWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SQAKCRCLPIo+Aiko
 1dYyCACxhk++LQcxDQ33qtIafnZZqojTBqhcEN2pKX+xCPd8oJKgD3bGBJJQ5a1M4SMe1M4DrIt
 dcQ0IkcShE23vffDIpoSXXDrtFrpGbvdr754m/ww+7sQMfED1+rTwJYGRnytelca4chMBl6tqDk
 tgaqxO2tv0F2K3u1QLwVX7LTJm1lxVrC8iLnOzDECksGyBiO9M+bC8FDb1KgOdXx1SPUh8oJbQA
 gizgtfGN7nobo+ExnWNlp0Phq1I34yTyXgn1L5SZ9ndk5/M/tZdPzSJIxApqxfM8r5U1gW+Id/4
 vCOmsAY4+Qdf/fS+5FdcV5po+maMzR6scUT74maLvy6myLka
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It makes little sense to split the submodule get and actual DT parsing.
Call dp_parser_parse() directly from dp_parser_get(), so that the parser
data is fully initialised once it is returned to the caller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

