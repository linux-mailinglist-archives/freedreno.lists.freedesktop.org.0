Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817773C2AAB
	for <lists+freedreno@lfdr.de>; Fri,  9 Jul 2021 23:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9266EA96;
	Fri,  9 Jul 2021 21:07:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CD289E08
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:38 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id r16so10107377ljk.9
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ruiXLO7i2Zgr/es66juPmk5DrrHM+R4l9xvmPO0wKI=;
 b=NBfnO8ZkIO7Aj1Itk/7t8wa8TmS1ul3vPzV1MY0z1h+jwnwyQ85hPtj0C5QWXEANNZ
 Mzav2gt9bUUpcT/420r0CsIE7yx95Bu+F2UXVacjs3U7MTuhjdId4yVgsTLlvI1B0MPD
 3SRBIlET2M8P0f8adtEvG4aRsQTlCnP9nluWrEmNLTMxd9HiOPOzbBwzO1lciGbuO8uo
 9s/bJSSrxPdhG7+XfHRuCnlQoqJ9lJdDm0rkcpEweAR2TXXL0wFVB9O4WjvLUMCe8q03
 Z1HiG91Lnig8SLTxMoDuDXixlm7FQ/lO9gktHtDZMdbnH15uEVM993UFArv4rx939S5q
 4c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ruiXLO7i2Zgr/es66juPmk5DrrHM+R4l9xvmPO0wKI=;
 b=GgvmyQuaaBzoWdCgdkfsvbW+PagdWitzmhs2GOWV9E81pExgajoWRqBrzbVFUmaklO
 bkjLqWp9iEkQarL+TuBNk17EBRXtaH9T8dnmbZIQqdx0AnfbHulZs/erOBAX303kp818
 AhQ/qdMyXoOaz5Ha14bZ8dtDWZi2aA8Puqvv82E7X5s8X2kd5pJCMyYynNjl2+OSbWRj
 snBGMhkCKZ9ifha0rXl6mCpyl5JvZRO0uV3HrvAs1zmjbRx5AcgW98AceJ8Mi+0MhKJT
 qRu5iiuv3S6m4taobpK+TzHJTA9MfiUt/Bdd81whCWuqL7PwMFXNT+YUQ0/Q/K6mvJXm
 bnGQ==
X-Gm-Message-State: AOAM532Lsu7i6iljSAbHOYPP9gpN6M7o/C45p8+ZhvoHtL2xjb+H0X89
 ebN+mACXND8dfIqcOfr1pf+38g==
X-Google-Smtp-Source: ABdhPJy0V2KQdfAmyWdLWEOI0be3277bOL6PRhs7MlAS6wZasoXD+Aid9V5BiCdcg0T4EDWRxPHFKw==
X-Received: by 2002:a2e:8295:: with SMTP id y21mr15033177ljg.482.1625864856598; 
 Fri, 09 Jul 2021 14:07:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Date: Sat, 10 Jul 2021 00:07:26 +0300
Message-Id: <20210709210729.953114-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 5/8] arm64: dts: qcom: sm8250: assign DSI
 clock source parents
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..69bf2e90cbce 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2491,6 +2491,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2558,6 +2561,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
