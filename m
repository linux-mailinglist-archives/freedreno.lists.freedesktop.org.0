Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468DE654ADE
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3100310E5F9;
	Fri, 23 Dec 2022 02:10:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AFB10E5B1
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5246640wme.5
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPzBwr0BhPjdigQ+qhuhYo7cFKy33u7lIc5bsk5u6zc=;
 b=hBupnYDo+zrPv28OUFZcPoKWJ4rv8AzR38rSar7HaNpKmPE+tbCEjJbbHiY0XtFinf
 K+RTF8xkxwVQAD9mRmrCsFyLFh8IzP/jvKf3zmZ1dmPZFjh9qYcwsogWf9faDqYsDcS+
 6lg2LMbXJx65F2WCjOlEuS6D8oZ3zo8yuPQWWJwbe0+IP5cu/x0NbPlYf4lNCHTMhgSZ
 OAHn4PHtONmN9uoqqEN/bSdvxh+jLEU18QZ5WFtvgihCi8wP4NwexK+vQ0FAXx+TEGFz
 1s8tC+Tpzr59hMI+1DXaKrty8A1a0GwcLmgG4/au8ihK9sw1vSPVmvtfD3btUaFoOmX5
 qtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPzBwr0BhPjdigQ+qhuhYo7cFKy33u7lIc5bsk5u6zc=;
 b=Il6B0Wrc1SlC3ZBqZwSqmswnCq5h5m2uZmlmxrwsMsmYmaLvvi/TOYNokrNlWvg/zW
 NirqiPs6uGAHGIG6ICNEa2CU9Tx+s2m71/pj3IPhbv4GoyGW6w0cf/QZEpl/NfiT49e1
 H6Bz4k9IgI9IZWOcgzRCLWId0cpKyY317NJTBx0446GWpABPnjIbbYNuA4CpHNAmKKmh
 u7gCyRgbGr41XJSQ3I3VOT2ialxfT15GVNFS67FyxWUJDs/MzRtQCgHDHTjlSIqnN/RZ
 4sGaaMR2z7qZ43c8i1Ot7PnmhkFwBBzN6TJaPYwY9S+RB83GkVtUYVg2yV8erVBgW6iN
 l5cw==
X-Gm-Message-State: AFqh2krn9FV/g8px9zf/wS1pBuHwdm8qwJqNEAGw6wB1vWhuEogwvIh1
 y/s4qkqf5bxlvu/JQ/QUz++7wA==
X-Google-Smtp-Source: AMrXdXvcexuVZuj1tFe1orRuwvBa9r6Rhxee4ZjTIZx1CzvQWvxftsQ6BaeJBN7YTHfH9Jc3J440jg==
X-Received: by 2002:a05:600c:248:b0:3d3:5d47:271c with SMTP id
 8-20020a05600c024800b003d35d47271cmr5685315wmj.12.1671761442338; 
 Thu, 22 Dec 2022 18:10:42 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:42 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:20 +0000
Message-Id: <20221223021025.1646636-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 13/18] arm64: dts: qcom: sc7180: Add compat
 qcom, sc7180-dsi-ctrl
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

Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f71cf21a8dd8a..fbd6a7b31eac2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3022,7 +3022,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7180-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

