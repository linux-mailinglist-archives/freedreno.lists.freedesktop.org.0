Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66957677A3
	for <lists+freedreno@lfdr.de>; Fri, 28 Jul 2023 23:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD22510E05D;
	Fri, 28 Jul 2023 21:33:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B4710E04F
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 21:33:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe216edaf7so1208924e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 14:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580003; x=1691184803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zcAphDeKoBf44cILmkXzAz8LYKbM2dUINvXgyHkOno=;
 b=PzNH5JjcwsULrZmp1QgeVLoLKdpncwBMQEFDd8vytFritMAgt8s9df0B18Zf5B80uC
 7asHgeKVEEd0NQZKV5cEtKpfXOTTPP0MnWGZrbgPSd77yhu2pO26FHsdI1a+MXXrBjn5
 oAvfjPxyl31ziB7KFuOP4y60ebZW9TVAxNyeIvI4sTSd3dMBmS/aBA7Y6XFb/JA3JWCb
 YOldYi2vCYLajI1zRAT4MwNjSF90rC8c70+40rtbfMy1bM7SSSaGA8kmdnoB5OlLzG4Q
 dX3Bcu7ocJ1xlgnxbZwG/Bm3xvYoOFEc+l1a7o7yxr59BZM20oQsUhnPgdS8l3jK9DbQ
 RKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580003; x=1691184803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zcAphDeKoBf44cILmkXzAz8LYKbM2dUINvXgyHkOno=;
 b=PCPUE68rOnzdfSnBGwB2VGgY119nEMA83iOLz4mttlGKAZyuInKIdTBF0pbUrdJlgn
 bsxV7l52K0e7+YW0QI6RiQKhB8neC0qxqqhhKJjDOzu31dTzoW+Zrz77uDaVyjU3nLUq
 u14Zxa8ZoV9m+ketqVzTDdrnEPLw4PwOH9F1J7Arwaq5YY51he6Ha/yQsnFDHYm6GVo/
 h4QocjrltCQ5rmY+3MISYAYViiMu4C/egTns0xWCC/zdibqdU0kA9H5EnXrpwlndz/eS
 kavebgucKC4Oy+9HIpmeIOcRr6/AHwCZF0h9BlxgbFT9nTXGmCkHk1RpiwUes4mZFyG4
 0FUg==
X-Gm-Message-State: ABy/qLZ3QQoBSdx6YtZsFWzcawtLw+wu9wPEyaD6BzpRzFWbvl0kFZ2p
 arDGJxNx4/kdh5ajeyx8/zmrKA==
X-Google-Smtp-Source: APBJJlFTuKxTMRNFHRgf3sybkewhB/TD8XOUojhCxu29lMlmBvO4HvY0H6VtlEyeuLyHKNUA8hhauQ==
X-Received: by 2002:ac2:5598:0:b0:4f8:6253:540 with SMTP id
 v24-20020ac25598000000b004f862530540mr1242553lfg.19.1690580003752; 
 Fri, 28 Jul 2023 14:33:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 14:33:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 29 Jul 2023 00:33:14 +0300
Message-Id: <20230728213320.97309-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/7] drm/msm/mdss: correct UBWC programming
 for SM8550
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

The SM8550 platform employs newer UBWC decoder, which requires slightly
different programming.

Fixes: a2f33995c19d ("drm/msm: mdss: add support for SM8550")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf68bae23264..e38929205134 100644
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
@@ -576,6 +581,16 @@ static const struct msm_mdss_data sm8250_data = {
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
@@ -593,7 +608,7 @@ static const struct of_device_id mdss_dt_match[] = {
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

