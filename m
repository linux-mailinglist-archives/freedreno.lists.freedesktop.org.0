Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F97507AF
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 14:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AD810E501;
	Wed, 12 Jul 2023 12:11:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6155410E508
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 12:11:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b703caf344so107003061fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689163908; x=1691755908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ak/4m2ZtLvYsyQLN5mEcIECptOKDjtOww2+EFLTDsFA=;
 b=UT/DL+yvtZwqu8Bw23s8gXkNmEjkOvr29JajtyZR9zNdl03auXUWImanRKSlZPBJrC
 Wt5acaLsfMKYnw8oxQI1IhiKwWfbjW9ZJfTPtBqmq/NFT6+GPjGVqqpfUMbPK1Nc4yrW
 3qmDC9Ph6gQg78sJeax0MHZKyUa8H0PIlY3rQ+yUnHaUiKrYr23pMlLoR92Tltjay5WZ
 ekj29n2mclpJ8h6Z033ppqbBN8iSjYBIGxgu/W3bdEOw7SVtRWeIgKgPwJ9C6E6hSpRw
 63XKn2KIuBQbZVNKJewLsI4Kt9E7A0fTecABJRV/r/RqClFUM4rCurjde4lEg0i/ZdnT
 ZMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163908; x=1691755908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ak/4m2ZtLvYsyQLN5mEcIECptOKDjtOww2+EFLTDsFA=;
 b=B11pS+p6ExJdV0C15xCCnFQhibd9DOPCJLMNHd7fH8fKCdHzoGV6QHLgVs69Vj5Jdw
 +7ms4DBj/Q/P3rhuvxP5uPm/magZjp/7CLZZQE0+MMyQKZsFsZydIbHzgxnVx3pd5+6i
 0RxIxkFv6jv+JLhzLzC2o6zBxIbcnC1luFSeXo2BkJpBli9qrRSaTcNKqasVCHuh3eDn
 WRKJcxzkEiqzX+IohV+CCUtIJSb8k+lHIq7e+s0SzsRLiBvhC6oQeiCPUZbRcuqGDsm2
 arBfn15aWucu9dyuNdgiTTwiTOK6+gkXE915m7kAwM6H3PpQo4p21Zl3GyfVEnP/6iEP
 FoSw==
X-Gm-Message-State: ABy/qLbErs2amswGq/V2bky/78pup2V+ZOLB+unmpajdggGXWZ8fKl+1
 301oD+NMxSDrNW6FX6mvacqgrA==
X-Google-Smtp-Source: APBJJlEy9OFzVSND7Rz0PWrlHPMarIxtgAW71RzV0taqj1FGBSFbaTJ11xkPWaHQS1oMiGcJRHm7Jw==
X-Received: by 2002:a2e:7019:0:b0:2b6:da64:734f with SMTP id
 l25-20020a2e7019000000b002b6da64734fmr15443800ljc.47.1689163908053; 
 Wed, 12 Jul 2023 05:11:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:11:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 12 Jul 2023 15:11:39 +0300
Message-Id: <20230712121145.1994830-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/8] drm/msm/mdss: correct UBWC programming
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
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
index 05648c910c68..798bd4f3b662 100644
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
@@ -569,6 +574,16 @@ static const struct msm_mdss_data sm8250_data = {
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
@@ -585,7 +600,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8550-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.40.1

