Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856647677A5
	for <lists+freedreno@lfdr.de>; Fri, 28 Jul 2023 23:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A1310E152;
	Fri, 28 Jul 2023 21:33:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DA810E152
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 21:33:28 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so4447225e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 14:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580006; x=1691184806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fq4BsQ2n3v4yrWlc5gMVHf5q5uxQavIrNzukx+hQcbg=;
 b=SuOgeAwCl5UFgYI1zwafXHwKmUs5tX9+KclAvcCwMbqbo53sQgQkSLlmcZZiIsg6/7
 nG6EBN3byXNUmYQh0mtG5J3zSYYW8Q8LrqketcvEDrKwwlMLrqyKGAVfQ3kIA8bqXyzC
 enGg4a3fBhv4mFIknxuLzEQthggIgjuaF2fF4pibrjxigfsvDbkNWSOtulkUxKIcB9ll
 0yst9T3+wKBaxKgjB1toIncKCUzKDwHbD3OlSejqL8aaH3Val9IrNm+s05FNDbK6Nv1P
 QbWlDZRT1A3KWvfhaJByQrvAk1PB46DmKpH9xUXXnxlenooEa8EA6lqTumbWvgQbAe91
 ayPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580006; x=1691184806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fq4BsQ2n3v4yrWlc5gMVHf5q5uxQavIrNzukx+hQcbg=;
 b=ZPeII2Hx7XHjSmcGwbhccG9/du/c9fppD9clOz8+LMECPMY0Srle6hJ0bSaOJOpTyK
 Y4lhUJ//hTuH27yOC1Hmqc7ND5J/hTsRMjRAv5MvEvSk/+qLZv5uCEzLRnLGnGXYKomX
 mjkrcwzkuLJjM/XvPpOmhYrZ7zEbZKbvio4UNfEHnQ3P6KAndDo8SdqymkpXPmOtH6a+
 SmDa4bo4fuB9VjISnnZn7W4xg8K2XqGdUCNNxH3SxZtTMXAx8+o4SxgQEKbvyUS5ty0M
 EtD11HTm3AmIbz637jDL8U9r6wlQali5cYXD62rsy6ge9WE4T25t2sNyk9uG3nPY+2Qk
 oaEg==
X-Gm-Message-State: ABy/qLYpSwKGIb9RZwHE3cAOPGXU5kn+H6zT5KuwcNa9cpM8frA7UVNi
 bGewplYQY3eygGPb5kXtVx2cDCn/iaamXQNzV1c=
X-Google-Smtp-Source: APBJJlG0jWCkBUs/qSW+BdPHzdvTVHlr/ObZOV4IBCRNvXKCqc5nMZR+B+dFyaKNqaQYf2RjYRrssg==
X-Received: by 2002:ac2:4ec5:0:b0:4fb:9772:6639 with SMTP id
 p5-20020ac24ec5000000b004fb97726639mr2719718lfr.6.1690580006246; 
 Fri, 28 Jul 2023 14:33:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 14:33:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 29 Jul 2023 00:33:15 +0300
Message-Id: <20230728213320.97309-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/7] drm/msm/mdss: rename ubwc_version to
 ubwc_enc_version
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

Rename the ubwc_version field to ubwc_enc_version, it denotes the
version of the UBWC encoder, not the "UBWC version".

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e38929205134..67436a5a8cf1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -27,7 +27,7 @@
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
 struct msm_mdss_data {
-	u32 ubwc_version;
+	u32 ubwc_enc_version;
 	/* can be read from register 0x58 */
 	u32 ubwc_dec_version;
 	u32 ubwc_swizzle;
@@ -205,10 +205,10 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 		    (data->highest_bank_bit & 0x3) << 4 |
 		    (data->macrotile_mode & 0x1) << 12;
 
-	if (data->ubwc_version == UBWC_3_0)
+	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= BIT(10);
 
-	if (data->ubwc_version == UBWC_1_0)
+	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= BIT(8);
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
@@ -224,7 +224,7 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
 
-	if (data->ubwc_version == UBWC_3_0) {
+	if (data->ubwc_enc_version == UBWC_3_0) {
 		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
 		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 	} else {
@@ -507,13 +507,13 @@ static int mdss_remove(struct platform_device *pdev)
 }
 
 static const struct msm_mdss_data sc7180_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
 };
 
 static const struct msm_mdss_data sc7280_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -522,14 +522,14 @@ static const struct msm_mdss_data sc7280_data = {
 };
 
 static const struct msm_mdss_data sc8180x_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 };
 
 static const struct msm_mdss_data sc8280xp_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -538,13 +538,13 @@ static const struct msm_mdss_data sc8280xp_data = {
 };
 
 static const struct msm_mdss_data sdm845_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data sm6350_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 0x1e,
@@ -552,27 +552,27 @@ static const struct msm_mdss_data sm6350_data = {
 };
 
 static const struct msm_mdss_data sm8150_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data sm6115_data = {
-	.ubwc_version = UBWC_1_0,
+	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 };
 
 static const struct msm_mdss_data sm6125_data = {
-	.ubwc_version = UBWC_1_0,
+	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = 1,
 	.highest_bank_bit = 1,
 };
 
 static const struct msm_mdss_data sm8250_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -582,7 +582,7 @@ static const struct msm_mdss_data sm8250_data = {
 };
 
 static const struct msm_mdss_data sm8550_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
-- 
2.39.2

