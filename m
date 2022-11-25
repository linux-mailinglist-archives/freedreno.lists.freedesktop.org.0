Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4710B638A2D
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC34410E764;
	Fri, 25 Nov 2022 12:37:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265EA10E755
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:37:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso3290464wmp.5
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dx2lQyIeBTqpqJ7X6Q0LzKVhxGjP5f4ToZ9EXleXAr8=;
 b=zL1kLPDxZd8QFdr1kbsDaEbxJo5nPTa3ap05Rfe4QZjimKYqzsubfXUXxysfcNGUI+
 TsW4yI7Kzs8nDVwrQCnVJyQqek0Fv2wvN8u3eSloAP++Hk5YBQOg97G2zypVK2hFEWlA
 ElowF0V6CwhPaRUoQdIlKf4vdF34xCPdpVGV/HCrNI5rApZXWeWb6CmcvtWeslRMqLe2
 kXRULzCzdCnsyuYMLGKO3CIsXdFQGp97A6jmOPJiZXHyItAvK7b8wp/2Bu4EQ9nni+1l
 KYqD/HgkrlVjlSbE+DxAcMffIasPjPybObBNNSxtk3n9p9I8+BWwUz+uBe+PvGTRSIaC
 HV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dx2lQyIeBTqpqJ7X6Q0LzKVhxGjP5f4ToZ9EXleXAr8=;
 b=Rq4zfZbPMgCnhpWIapeMgJw8H2rYsf36U6uyZGY8Vra5YjVnjs4VXAhlxwr1jJ4Qcu
 NKLp4DkMDtSaum1e/9qZ2m4Z/gGfWrGcKylURvcL/uLYSZBLO5Qvhmic85nYpe+zmgS7
 q82PraI3rrw2F2F383QBQn4/gmEd/cLGLOH29TsoAWy544628PGTiw+eLYPpwwIGcHqQ
 oOXgpNEGwMrn/i1znDqoUGn5d1msemkJQZCee2pj49d8gtJXurRoXdh4u8+rrGTmT8fW
 VSdtcRzJgetaPDDV8hKhDulSqeGuKqc74vm49oFgc9JFihQfeziJ2Gy8Mla626riQirL
 Ku6A==
X-Gm-Message-State: ANoB5pmqCHG79xDyETcfHVzPQxsczHdt4OYK3p0rd+ZGRcxphdj1rPwy
 2kEj/o4FVTL9QB6wc9Zr5LO/kQ==
X-Google-Smtp-Source: AA0mqf5x4cWUrXL5IEWLm84sdI/yALSHQjV/u+S/A6ZSDK1EiE1plFgxTlYUNwfJSCErQBdxPi3WTA==
X-Received: by 2002:a7b:c048:0:b0:3a8:3e58:bb9b with SMTP id
 u8-20020a7bc048000000b003a83e58bb9bmr17356780wmc.168.1669379822645; 
 Fri, 25 Nov 2022 04:37:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:37:02 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:37 +0000
Message-Id: <20221125123638.823261-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 17/18] arm64: dts: qcom: sdm845: Add compat
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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5420205417c81..c14e49c9655c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4522,7 +4522,8 @@ opp-430000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4593,7 +4594,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

