Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4865E8AC5
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0960310E59E;
	Sat, 24 Sep 2022 09:29:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA6C10E59D
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:29:12 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z25so3726588lfr.2
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=e0x+n06hV5mMu68CdHdoiGvRmngz5GOt9vNpZJY16Rg=;
 b=A4Ia+iMkg7q1KZc0e5t3tnHCjWwXPP19hIwQGyKINHOThQuOY04Y9oEupgiP1kjfCx
 Lddaxj+ftBazMurQtdWEgQaY/PoEn1vO4J4TYD6/feGhpQaT1zkkMPpwxdTNohmLfqcE
 goCUQYKDO3phBJjEFQgSlvJyPT+f42EQIkNvpaZ8L4ydYQ5jgUSNhmPBCxPAIVdCiVcA
 U6DknBtakaukK5Vqg/dZUE9eANznmUB2xjoq8WS+H5m3zLu1fWvK9kmo3HOQaD89iY1z
 1qu0AVoAOcik6buhmWR+YbN4xqTm4mgEZgN7xvgPdxrOm4f4xgmltTR74mzzuEBCWaZg
 BEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=e0x+n06hV5mMu68CdHdoiGvRmngz5GOt9vNpZJY16Rg=;
 b=HABHmE5nDC1853QWIz6eTuRtaxhCkQSs6W/Akn96CHICloVt6/GOGFuFHi1R3Qj1dv
 IMqUi/zvy4L/dTjK2GYekiejfnoGLhlsjyFLHs3pA0+r4uiYKg980WFUyUgaYOOblVSw
 XRTPXDFGZd8EhdLY56MHLim/ozPdoMGgoWpwqbxbJDIz3xur7tXtKg0XT9BwOJN4gASO
 v+IvFdVkLW8WzyKIHDoYamGbOmCbZWAEBp4/lhO6LYjO4VmajX5x6Y3cv5YqWu45ESmR
 izwAhc5s4LhJC8Gj1CoxwNgws1tawmhdR5QzPCcLPwr31+BsWqqafSqS5cNyaxSwG5dO
 MUvw==
X-Gm-Message-State: ACrzQf2oTYB5Qgf3Fp0lk/YWmLtkBufWVikn3VGzdud0zcng14UVnuQe
 or/KrReGelhnoRDIRIaxRLBNRQ==
X-Google-Smtp-Source: AMsMyM6u2fZyvcRB2sCwnQ38Ns95A5PFsTtukBYF2ddfLMppMdFmN6x0MPy+enNFQEE81mQAGyULkg==
X-Received: by 2002:a05:6512:c12:b0:49b:755d:fde9 with SMTP id
 z18-20020a0565120c1200b0049b755dfde9mr4656911lfu.181.1664011750727; 
 Sat, 24 Sep 2022 02:29:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c24-20020a196558000000b0049472efaf7asm1828118lfj.244.2022.09.24.02.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:29:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:29:09 +0300
Message-Id: <20220924092909.175418-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] arm64: dts: qcom: sc7280: assign DSI clocks
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The driver (and the DT schema) requires us to assign DSI clocks in the
DT node, so that the clock tree is setup propertly.

Fixes: 43137272f0bc ("arm64: dts: qcom: sc7280: Add DSI display nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 13d7f267b289..d5c01ee1d2fa 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3636,6 +3636,10 @@ mdss_dsi: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi_phy 0>, <&mdss_dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
 
-- 
2.35.1

