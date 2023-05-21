Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA770AF26
	for <lists+freedreno@lfdr.de>; Sun, 21 May 2023 19:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6DB10E1EE;
	Sun, 21 May 2023 17:10:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90F210E1E2
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 17:10:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so3310252e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689031; x=1687281031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZvD39ofO02L6Mafll8o7Cr6RvsnfAzRure5kJuG8gc=;
 b=DgXi+Di617041RttyVDbYxDEjiVAOvDn2IVl7JBf6snFs0igxL2LwsL2PLGBFT6dZ8
 WVqA/5eBQadwZPASTs1SOHOWL6j+tyttILnzUxhVbcsuHMVYtQa7cBXLwt6z/06qJX8+
 w75jzmF94bf9xVF5IZKLjFjdCJXS0t+yWnTqisab5fk2FYFSBsEBpor4OVE/RzOJJDbB
 MfP1NSPajvmO7VUA/a7FHaJZOusFbbPDtnsBPBTXgFQJ3x5NNMvkHP+yeWRGmJ7ujbVi
 Zu/zAIaTSCYpxvBWRoR54J/E7KMLIPTgRqbiYZM873wSVsLtEBReVKfbmKP/Vx6OILQi
 ABuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689031; x=1687281031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZvD39ofO02L6Mafll8o7Cr6RvsnfAzRure5kJuG8gc=;
 b=YGNUO5GtZySCvKjBugnUkoqv0QkWkSPKdHlesPjtDbnkYZBu6/Ae+YCgULP0dqu2nw
 EVreItSMGySuaj78IzP8BhfS+GgEA9EqIlNuL17SzE4AXnjutRa7eq6adTusBGUxWjB0
 z7L5cb/M0BEtvFjfIWzK+G/iUzTlS+HJPTBcCE3mNV0hA9YdjKQrCHPE84Afvx8oBrvN
 z4VCRh82Yp5yQVlGcDZx+vHAzNEnK48z3n/PAGZrZhFOafBOV2wRPpf07mIub0h0Qqb2
 iSGC3+mH6ej7xOPI+faV0ItpyeS6LSB7hgbQxa4lz0b0w9MCZ0gWLrGJtDvQtumZV8rk
 +i7A==
X-Gm-Message-State: AC+VfDxcyX9TMvS7Uzm2vQTgyWt5rFj0XkSLKuUAF3Xpar3YyTFI5TOV
 oI9pMqXf4pfDe57iAVwHr5RsgA==
X-Google-Smtp-Source: ACHHUZ5GQD33SK2SC1NesPQnRiaM3+LEIvK0slB43sb6fdz7M+lFdoO63gUoLm36yJCrTw7M1x43gg==
X-Received: by 2002:ac2:530c:0:b0:4f3:b18a:6494 with SMTP id
 c12-20020ac2530c000000b004f3b18a6494mr2500887lfh.22.1684689031732; 
 Sun, 21 May 2023 10:10:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:10:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 21 May 2023 20:10:24 +0300
Message-Id: <20230521171026.4159495-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/6] drm/msm/mdss: populate missing data
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

As we are going to use MDSS data for DPU programming, populate missing
MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
programming, so skip them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ed836c659688..9bb7be4b9ebb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -264,6 +264,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	 * UBWC_n and the rest of params comes from hw data.
 	 */
 	switch (msm_mdss->mdss_data->ubwc_dec_version) {
+	case 0: /* no UBWC */
+	case UBWC_1_0:
+		/* do nothing */
+		break;
 	case UBWC_2_0:
 		msm_mdss_setup_ubwc_dec_20(msm_mdss);
 		break;
@@ -502,10 +506,22 @@ static int mdss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msm_mdss_data msm8998_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 1,
+};
+
+static const struct msm_mdss_data qcm2290_data = {
+	/* no UBWC */
+	.highest_bank_bit = 0x2,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
+	.highest_bank_bit = 0x3,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -550,6 +566,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
+	.highest_bank_bit = 0x1,
 };
 
 static const struct msm_mdss_data sm8250_data = {
@@ -574,8 +591,8 @@ static const struct msm_mdss_data sm8550_data = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
-	{ .compatible = "qcom,msm8998-mdss" },
-	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
+	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.39.2

