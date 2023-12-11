Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B976A80CFEE
	for <lists+freedreno@lfdr.de>; Mon, 11 Dec 2023 16:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5C910E49A;
	Mon, 11 Dec 2023 15:44:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B1C10E495
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:52 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so5851844e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309490; x=1702914290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6BCa40Bk06u4mdi06VIe+toE7TP3wktrYRk6UifjscM=;
 b=E9CM7oa6CSlsuo23u7Z1zH7HH1KN7iSKEQtE+Rnomlx0sS5jJPOEtIU+jBBfhHsy14
 etmU0K1E9a4bhYjM9lhxYYn4+XUdf61rq4XBv+oIDySX/AWLTLoHNns4orsI2BOjW9pP
 kjGEn1ahIo7U8hjhaOrf43YJQLoXsZdgo1Y9hkd8UzMOCMGqsEj1zSfGUgOyMPbJOJAQ
 EIyPp+0UarEGLJHR37Yz/5TR8T82Lm5kV42P/n3Ms56JmRTKEP/CyrgF8WbjY5xF1XLI
 fgBJiT3ngramXOp0UAvWertYkdKh6d5fGPHaS/LEBrHuJcDSX2wOl38pMklSvF3Mj381
 AcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309490; x=1702914290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6BCa40Bk06u4mdi06VIe+toE7TP3wktrYRk6UifjscM=;
 b=PLKgU6GK2EhOfsmxPPZzlSi3vsxEGs1W8i+cgyxV1toyIEopm8bkJMrWAW0WeNoeLe
 zYymf3v6FGqngkCgXOQRjLdte0clLi2xj0u3uXtlArl2kyfHIdGAHZ4/PilpBytR1g5V
 dk+sjW+SLfDlFXws3JexF4uGY01TViJxC5nESEsRDIM1+qbthzOaSwmAR2dSEax6/Sbp
 T+fJqPPL+1HMD8zCRykEVzSuktmhtF3aXUp1ZIoKgEweiIS5qV+OW7jlStp5Ere1oMEA
 cWYShRwTDo8cpNaPsgqeJCHjcEXVe5hORL/VJV/vxfb5nEbkEyPs6ql2jrEOcV93dL7V
 RJ3A==
X-Gm-Message-State: AOJu0YylfdlidtxRXl1fhYrhWx261wvVb5paPTxVjfoi6t7VJWaVOukr
 beG7v6b0oXe55J7Y3y8nVVy1Zg==
X-Google-Smtp-Source: AGHT+IF2zbCIhM/tMOdHnPWJepkHLinVsdy66yYx/mp9180E3chYulcELhXu5gH8TyI+9J7CE8Hn7Q==
X-Received: by 2002:a05:6512:3c88:b0:50d:151d:db93 with SMTP id
 h8-20020a0565123c8800b0050d151ddb93mr3025139lfv.9.1702309490570; 
 Mon, 11 Dec 2023 07:44:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 4/8] arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
Date: Mon, 11 Dec 2023 18:44:41 +0300
Message-Id: <20231211154445.3666732-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
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

The SM8150-HDK uses two different regulators to power up SuperSpeed USB
PHYs. The L5A regulator is used for the second USB host, while the first
(OTG) USB host uses different regulator, L18A. Fix the regulator for the
usb_1 QMPPHY and (to remove possible confusion) drop the
usb_ss_dp_core_1/_2 labels.

Fixes: 0ab1b2d10afe ("arm64: dts: qcom: add sm8150 hdk dts")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 6a036f9ba1c9..ea4d75308ac8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -138,8 +138,6 @@ vdda_qrefs_0p875_5:
 		vdda_sp_sensor:
 		vdda_ufs_2ln_core_1:
 		vdda_ufs_2ln_core_2:
-		vdda_usb_ss_dp_core_1:
-		vdda_usb_ss_dp_core_2:
 		vdda_qlink_lv:
 		vdda_qlink_lv_ck:
 		vreg_l5a_0p875: ldo5 {
@@ -221,6 +219,12 @@ vreg_l17a_3p0: ldo17 {
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l18a_0p8: ldo18 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 
 	regulators-1 {
@@ -563,13 +567,13 @@ &usb_2_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l18a_0p8>;
 };
 
 &usb_2_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l5a_0p875>;
 };
 
 &usb_1 {
-- 
2.39.2

