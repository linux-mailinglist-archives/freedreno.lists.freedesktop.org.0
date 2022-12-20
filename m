Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C8B6520D1
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717B310E3E2;
	Tue, 20 Dec 2022 12:37:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2228210E3CC
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:37:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i7so11581044wrv.8
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZI/lLtloM4Tug4sA61Civ+cVcFduOFVW5YccHSGp9ig=;
 b=eF+PhFf5qeLqtrw+IAez0BiPQ9HYoGvX7UcXyiaLnVZqXe2DyTL24DuL9/CjVL/1d6
 vwOE00klSdPx0UJBw06rX1r9eWdiqvwMisycqNx2T3dJgfgGdDNMRypzNpoau9JGIn9M
 D8QShZEwthKERVHWXBLSPsiDzXIcL8Ht0iXtukVcVMDRCZoH70Z25Az1jFFtHx7EW7/1
 ipEBrGdVlVthSpOBV7pLccubnfw7OKa04pJVPUzoaPqQBPDA2V3zipvjhZ2CJ1BuEFlR
 uEoNYxvPcJm9N3n4n37aTsURsMiCLWCB8c9eZDvK//Wf+ggp3G1c62W/bk3fQYJ/qWV1
 AM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZI/lLtloM4Tug4sA61Civ+cVcFduOFVW5YccHSGp9ig=;
 b=YRth8EIQOXnGndL/F6JhUTzhDEFjclM05cN/gmokQ7UC03ozi/nLZg8E5IqdLfsxVs
 OUlIblC3xYCxX47db+VZXed5WFZeS7qZgbBSVkCJqEV4H2+vIczdVdVdDAmeolJ/RGzu
 F2r9E8GtSywJZuIBUuS7Vkb+uIcPIFTvXF6p+n+UvmtF6KlYA0CGWo2+UKIkikq1U2Ln
 ub09P3nwGsNQ2Bn6na0/+Nd3ziE88PhCFs1tyyVzQYuDcsbJ7dXzUL2kfSshwM3qRspY
 E+0j9UlUeRNbQxslb96x8ovX5LNwRCUDxYwGr4zV9c+ylWfuIxpFw0Z/ByhvnX3kNgyx
 Q85A==
X-Gm-Message-State: AFqh2kqShLgZWzj+t8FDEXyy76WYr2xxlBAIFVesWVcFpbla4eRJSP8E
 kVgghlp9wPM66vBBzIa+EWhYt5wA2gOHVJhaqWQ=
X-Google-Smtp-Source: AMrXdXvpt552/j2eYpyiJEvx8Y8iUdWPP8nWFBZn584KDHLE94EqwOEvXHfAl0Y2Sy4/Ct53UZYcSA==
X-Received: by 2002:a5d:4143:0:b0:262:3647:c1b1 with SMTP id
 c3-20020a5d4143000000b002623647c1b1mr997538wrq.58.1671539820722; 
 Tue, 20 Dec 2022 04:37:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:37:00 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:33 +0000
Message-Id: <20221220123634.382970-21-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 20/21] arm64: dts: qcom: sdm845: Add compat
 qcom, sdm845-dsi-ctrl
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sdm845-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm845 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 65032b94b46d6..623e5d7dddfd2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4645,7 +4645,8 @@ opp-810000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4716,7 +4717,8 @@ dsi0_phy: phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

