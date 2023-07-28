Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB97677AA
	for <lists+freedreno@lfdr.de>; Fri, 28 Jul 2023 23:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2DB10E78D;
	Fri, 28 Jul 2023 21:33:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBDC10E497
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 21:33:31 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so4447947e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580009; x=1691184809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n0nmQkrFJ1qTPckiGBd/pQx7xzpmDvjfPbdpqRUAvKg=;
 b=IZYBx41OdMDoVKczPPi9p+OFE/GF68QAiP/6RdFsxBz1dvHDdk1U6fApz34gJ1nkhq
 qFmhuqPTRH9L9sknWaTZFh/2yvxpAX5svFrnlFh5R8N3YE55Qq/AU5JKDX6iBnAZPOCy
 J+wOyPjYeeqAEn6AZLAZZeNZd/rH0ppH6sxk5YCrmG+N7Ypn1dKD7H+QP3CyymIRdIuz
 bVoG0oH3OyfBgIoMOLuizs8uPrBMN9+ky6aRh0wXzf1Zh4vBNUceCHI1jUkUuY0VXFSe
 tKmW5zlg1syNmrSJNEDyw2z+Z8DVkEGoX/3rggDP1V2uinIMxIM2i6yPgVyoyt9Qbf4r
 T+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580009; x=1691184809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n0nmQkrFJ1qTPckiGBd/pQx7xzpmDvjfPbdpqRUAvKg=;
 b=gtolnk7SbF4ikWHPollJae2bTGNO7wvgvaGMG1ff7JdXDakqZKx8v54ckhucbcx1W1
 r9jFPCXc4hfEuk8Q/XoE3tmJUiqHx/kAVB4pWUHaPdZqk1bKTqNcvYG+FFAjDnXRU+0x
 HPpqx5HWmEUZe5Lra5mdqUu1VSqlN7kKaYEsDuVIEBlSDK4MKPVSgW81aMa9okCFk0et
 adhquYIBAe40bjIU2R74My0r6tFt/K80qTTukiluF6ycYhMoqL+sdevwJLdEqaBiy12c
 vT1VKZDVavqDpznoO58RtKCcZx799ls9G3dAb7p+KvVnGdkJqcbRjVwx0uW0g93R3hDt
 CoPg==
X-Gm-Message-State: ABy/qLaZqCpjIbo/J45i+K6WHdiXKRI4Uv2eRu8SYXtqqL7R4rs1zzv2
 KDwleyi4CWn1epA6lMc2bZuqlw==
X-Google-Smtp-Source: APBJJlG2M61J+6qFH5o3JAMVC7nbKN6aqxJaAONR/c9d/dlPYtaMAQvSYGfPBTm2RiGt+Zk1b6+uJA==
X-Received: by 2002:ac2:5f7a:0:b0:4fe:f24:cbf3 with SMTP id
 c26-20020ac25f7a000000b004fe0f24cbf3mr2431232lfc.63.1690580009632; 
 Fri, 28 Jul 2023 14:33:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 14:33:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 29 Jul 2023 00:33:17 +0300
Message-Id: <20230728213320.97309-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/7] drm/msm/mdss: populate missing data
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

As we are going to use MDSS data for DPU programming, populate missing
MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
programming, so skip them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 0189811bce4d..c2b4cf9ad2eb 100644
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
@@ -558,6 +574,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
+	.highest_bank_bit = 0x1,
 };
 
 static const struct msm_mdss_data sm6125_data = {
@@ -589,8 +606,8 @@ static const struct msm_mdss_data sm8550_data = {
 
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

