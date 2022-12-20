Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8C6520BC
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569B710E3AB;
	Tue, 20 Dec 2022 12:37:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBE410E3AC
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso10987542wme.5
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
 b=O9ARsqeRlkHqlFnRGCHa2dOCBlZCTEEToZrHu+6qz0OfBUJFX9Eot4K8S7utWQ/yJ1
 ME9jgXI2WWeKhbGPNAGIPaQIhTNdVHWaoaxdy2fsSucCXHdhc4tpGmKC5+J8ALRMcYRK
 /fBTXmKh4PJMs+tn27WR+vrO8QX/3mGmgJlYE6IL7tKZD2eTK9j5I0RrzAHVHWd24rmV
 wTq/fWL4pUhevnKQzdUSF6psVU3yDvVzIOpF8H+2FjgJaUmMH1Lo7E0F0SLaQS4bxTb/
 Iv2j7ldZ/kcAVxmBUYxYEldS9MON7Nvu3+PhCamN6hNs8vWyknFoMxleSZ026GhJIQBZ
 2RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
 b=QNUjG0qHJAj7+Z+7YtOV8cy1kNH93v4M6Uh0ZFAa13erPNifZM5pWSBjQeiTeEWlpP
 /Y/RccZOGXdS6a+EMWyexhFXWxwMFoIg5t2qGOltMAlpe+mygXpdh0Ql1VmCrnKPp10T
 DeumNPP+n1WwST6ZTIjsm4oePwzY5GItBNQ8mBTXAuhjrkEMYHFqGvD995eLUmVEVEIS
 asjQmIjKUnM3pbCdomUGMwbGp3II9cKMDJs9qiRvebtPvSoMM+pDg+RwrwdtzBvfwJ+u
 kofi/fkEZV9gttYmPek5tvJmFeGEfYDsQgThHAt0Hd/l61222cqSTvVjQVT9+qQpfA/M
 8eTg==
X-Gm-Message-State: ANoB5plebWXnqRVKmtijufPymrx5GzERE+DsdROSSZ3bSA5wCCE2WqM+
 14xHwqOJLteGZmWG2odJCrEBoA==
X-Google-Smtp-Source: AA0mqf4NXA4SWHt2nfjNUNn8kBNAzpqqphrFZ89q8nt0gHH8Yeya7czTmnjuIooMSUSU9Z6PAkWGgQ==
X-Received: by 2002:a05:600c:1c81:b0:3d1:e907:17cb with SMTP id
 k1-20020a05600c1c8100b003d1e90717cbmr34576993wms.1.1671539812355; 
 Tue, 20 Dec 2022 04:36:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:26 +0000
Message-Id: <20221220123634.382970-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 13/21] arm64: dts: qcom: msm8916: Add compat
 qcom, msm8916-dsi-ctrl
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

Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 2ca8e977fc2a9..ffb4ce8935b37 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

