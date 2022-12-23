Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3BB654AE9
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4875310E5F1;
	Fri, 23 Dec 2022 02:10:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18F710E5EC
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bs20so1289597wrb.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
 b=vqeD+GlPbNoU1iixZcMJrhkLCEYwaPHVNlmadjIDM660EGop7Dw+juHhBEMfPwDR9f
 V93Qy/Ni7W5maOq1BnYYEoIamCBIaplOcqJR5Aj95ONahGt3xG5tZ/QNjg7mYQiq9jKt
 NCuTcmYROOfmCbirKfz9qnws180iOP/gI2d2KvT2mQfzoJDs0BzW/l+qP0nvxApVxerY
 sxK+eypnJgn9srIcGKLRU3jpGeB73ZTVUFcXQJxKM3rBB26kY1jh+mTR5zBAdGwTbT01
 qG4Fo6o/gsPXUQdvHzMWa5FvFtUew0c99FxTpkBoTXGA2eJURv/CzaXs5XnjFBrAQFwO
 EkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
 b=ulwo6BQ9M/y+DfhL7WFMmazE+218bHm+GvJNGr0gjskYaAdUnYF/sqAbR4P3c7cl9a
 /RqX2AYAjEfsRsIkrZUj4rXr0gau5VXwfh/9EolrSEdO39pimd3e/lySsj0siyIgtUAF
 JrwjVmkmlX+j8UL1GoX+odiC/OLx/8K9tecVtFpwdVtuPBCX8ulCHrDn85CbGQtinFuq
 TR2b8b2m5n5ZhPdgbuCh2amOyH2iCPz5RdXKfsyFnri+fDOnm7ANUuk/ZxD6NxoTLzaH
 zhpzPazHhAf7h6WDp9RwmpPAEz7ljv1ox8BJpIdTP+8Y0z7J3R/E+m4FKmGSYEe2jtU6
 iXow==
X-Gm-Message-State: AFqh2koOUtM9g/gw8xZzsdx9Viw3nkVHxdW17sZ+BKcpJks19c67c4dx
 NRBXy/6TWtuzNoF23iIwy7hBoQ==
X-Google-Smtp-Source: AMrXdXuNYc1TxK5uyXFod8fCjIYDorJ/xtarU5lUvC1JFyaHnMzuOIxlwK+dAxQK7vlDSOmjld4SVw==
X-Received: by 2002:a5d:4578:0:b0:260:6b09:fa17 with SMTP id
 a24-20020a5d4578000000b002606b09fa17mr7750880wrc.9.1671761443341; 
 Thu, 22 Dec 2022 18:10:43 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:43 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:21 +0000
Message-Id: <20221223021025.1646636-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 14/18] arm64: dts: qcom: sc7280: Add compat
 qcom, sc7280-dsi-ctrl
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

Add silicon specific compatible qcom,sc7280-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7280 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0adf13399e649..a437ad4047f52 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3906,7 +3906,8 @@ opp-506666667 {
 			};
 
 			mdss_dsi: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7280-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

