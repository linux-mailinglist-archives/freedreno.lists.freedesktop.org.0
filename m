Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C698A70AF1F
	for <lists+freedreno@lfdr.de>; Sun, 21 May 2023 19:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCCB10E1E3;
	Sun, 21 May 2023 17:10:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E7410E1E0
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 17:10:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so1773380e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689029; x=1687281029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ce2Sf/arm/2sDQ9h8KlweNzbt3B7za2ryd0YJK2Ei28=;
 b=bdJNvVJ7PdwkMr9C2sArIHopNO1LM8RV4h+qF7zJ7hzqFf3B9tKYqFURb3yAHVo+t8
 21GuZjO5Ip90D8x2lgFgTSjKX/a4qSjHlukR5H0M1PCsTrjJiQGaWpdmfc6EKSw424lJ
 DsS1w7mICeC/1ZMWRqkkshU/xPfnHGhxoQtq+V62jedi/7kBQ8FJywvFzmHq6Ya+35S/
 VmoGd7FjMZ4yz1qPV+V2UkMjyfGx3B0shXZGB3efqDovIiPt1jDHs7+ypPqXwn6yUwoo
 QdloExCUYuFUrfBHgGBuGOxi2AKslbExgUzQ1lUiq+w+Ky4Wf8yjz24i3m5/Zsmo3aSq
 vTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689029; x=1687281029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ce2Sf/arm/2sDQ9h8KlweNzbt3B7za2ryd0YJK2Ei28=;
 b=e+PMtlpyrtNFZlLjdAa2uBaxni5/SWtcTqe8ITWqRLg0LK3ePmot035PF7nsENxwdr
 Kty5XE4xMhXUwHJrlxg0oLXIeR+wL0+v1IuBMkvwscnJGS3MnIeopf12MXWTc3lvVa6M
 rkJD/uxUbrazNL7Wk7XX+dsILDmLtFwvjsw+FT+2aNRsnv9xahLml/cNwaLwnPmzuD2k
 U2nvoQlRVpH+OH5FvVAGwrYEg7vro61R1MravNitvoWiUUJ8bBc3FzpN9Ba6ZxnF0hSl
 4DsYm4c24L2Ci2zHp8UE7P+UJdima/yIJdRdx/yElEoAy0je80FRtOtMDagoFpD15iwV
 l/6Q==
X-Gm-Message-State: AC+VfDxuBc7Jwu6D4TdrEDVwGFNai7v7QvDfl4wzztbhMhzeLyKMMreA
 1VnNp16r3MJfHicRT7EwTKWY7uyOOev9PopYqoQ=
X-Google-Smtp-Source: ACHHUZ6Nu1X4HznrfLGlgYAHOnKm4PAenPbFbvbBkOoZWLi6XNBHLEGMum1dh+w400pSVDUQRfeFhw==
X-Received: by 2002:ac2:43a2:0:b0:4f3:a1db:ad4 with SMTP id
 t2-20020ac243a2000000b004f3a1db0ad4mr2688696lfl.66.1684689028919; 
 Sun, 21 May 2023 10:10:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:10:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 21 May 2023 20:10:21 +0300
Message-Id: <20230521171026.4159495-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/6] drm/msm/mdss: correct UBWC programming for
 SM8550
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

The SM8550 platform employs newer UBWC decoder, which requires slightly
different programming.

Fixes: a2f33995c19d ("drm/msm: mdss: add support for SM8550")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e8c93731aaa1..4ae6fac20e48 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -189,6 +189,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 #define UBWC_2_0 0x20000000
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
+#define UBWC_4_3 0x40030000
 
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
@@ -227,7 +228,10 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
 		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 	} else {
-		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		if (data->ubwc_dec_version == UBWC_4_3)
+			writel_relaxed(3, msm_mdss->mmio + UBWC_CTRL_2);
+		else
+			writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
 		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 	}
 }
@@ -271,6 +275,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		msm_mdss_setup_ubwc_dec_30(msm_mdss);
 		break;
 	case UBWC_4_0:
+	case UBWC_4_3:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
 	default:
@@ -561,6 +566,16 @@ static const struct msm_mdss_data sm8250_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sm8550_data = {
+	.ubwc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+};
+
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss" },
@@ -575,7 +590,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8550-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.39.2

