Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6556196EC
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755B910E762;
	Fri,  4 Nov 2022 13:03:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97F510E753
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:03:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u11so6241445ljk.6
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
 b=mexuyZaPbFBmNt59b8SQeKFWTow2tLhGA3zvXYpvIdFYqy6t7LAOTZBcDIhLv1Zzjk
 2paqotL5BZUL/bs39pcjkBbFgltoHpfig5rhi9SsuPc8KRSPPTNBGu44CpeaOoS84iGr
 hVOmyiI6L8bmMkCcvjEMALPbikYSSENUQrpoTcFefJMyqr7BBHrSbbsAIi1nNO85h8rO
 vr3pxgs4PaTdRSCBDglO3qlUDlC87ayYEXo54UhfouYI/fuSI5PmMiDb81M/VJMHfRed
 B9gvkMW4NDx8cFclVlwoZVglh0P1CcAogocB9537wW5VgFd98cQvRt1RhwZblgfyhgMk
 GRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
 b=47u1NvjBOeCGT+sMEMa7n2p3M78axrvYjuDBYLmqYXJef5TRzFpviFxSDSJSMZRii2
 jFJVOIgb1MzJ9+ygqLut+Xqt5mUijkbHY4RMCNZvzu/NkkTlPSBnuF5rVGfWgJoOuwUw
 Ohs6Mg3sFcb5rGVdgYDfd2HdthMIqG6mGcLW3Vf6st75/ekx5gCPAer7IfYK1v4Vl7/u
 wiSLWYKezk8fR7SxNEcVI4V5c+RpvG8ju+W6hZ7aSZCM/Ww02S+9J8mphdVQIEbN0MlL
 pJ4C2P2pW/qoVQiEVQcI0o1UHgFspGdx5hqW87xXRWk5fmdetV7guD8/R2hA1ej1TcFu
 yLgQ==
X-Gm-Message-State: ACrzQf31wNiXwKMLVr9g8wWKhKeEGPU/zwfA/709WHvpBFnZKE2ISVfV
 UDragQ/U63i5Qh/zfT0m8h6A+g==
X-Google-Smtp-Source: AMsMyM5ylwYxkE1TNWolGu+SI9wuT53gGEYitbyTRUL0gy0Uq5fT84X8WU4Jieq69fj7/yK3c9+gjQ==
X-Received: by 2002:a2e:8811:0:b0:26d:fd3f:c5c3 with SMTP id
 x17-20020a2e8811000000b0026dfd3fc5c3mr1990867ljh.494.1667567016917; 
 Fri, 04 Nov 2022 06:03:36 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:03:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  4 Nov 2022 16:03:24 +0300
Message-Id: <20221104130324.1024242-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 8/8] drm/msm: mdss: add support for SM8450
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
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8450 platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6a4549ef34d4..5602fbaf6e0e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -283,6 +283,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
+	case DPU_HW_VER_810:
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+		break;
 	}
 
 	return ret;
@@ -511,6 +515,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

