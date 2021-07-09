Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8DB3C2A9A
	for <lists+freedreno@lfdr.de>; Fri,  9 Jul 2021 23:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991E26EA90;
	Fri,  9 Jul 2021 21:07:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46136EA91
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:35 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a18so10114571ljk.6
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRPyZtijc6uk0x4+zCe1BE4IuABWQ/ZgPDiu1mKL+ac=;
 b=WuCcdZ5WE17+D1gtYJAFYA0nto07KkKIHq0dexTzKOQFFLXLp/uaaHlynG1SXQm8q3
 jiJ2TekztfBUp+CICFrRw47wN4AwHwv+0rJ1/rWkPyl+1RusvS/U7XO1QO/N4aJfcpJE
 7howfdeA1yXzDKFrG1N/qTNbYPtANE3zOgpJMbdEK9kF6GFEgVPB731eM/74y+VH2C6M
 fWuQw20sbx1XXQ+6I0cplrKoF5xLeKz1PxCHRp+LKYuBc/hxsOK15EPUhL5a3fbYNjdH
 lc9ecUbQGIUaWbxXMMocOoM3POIjn1XfDp6coOpai1by+GSODwUIv//Tm6T+xXJ9Qh0h
 hnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRPyZtijc6uk0x4+zCe1BE4IuABWQ/ZgPDiu1mKL+ac=;
 b=rUUqzziA0dGWmPLNxE+42oroIJNrsCGRSF6TCM4gV351UthwrUEZEteqARB3s+Xe/A
 gcuTB530ALE7iCmyz61blQ0KLSaZDKt9ue6P0PR3xLsTYjJtnkVUw6HsQ75W6MlhQsws
 rY+xxGKZl0ZujmoxEBeS9+a92vTLb8Pt7e6PiF9TF7Ycjiaorif6Od2nW/89fVFbX2nB
 /5ARsRQbr/byfHWB8KNxDO1yO68vZQ6BR6sWOdfMeyO+6exPD3bvKHHNSX6y+nqjgWzt
 tBfj2+fl/lsqBIE/moaYDNopEbVB4/CgvMENTAirOWLwfLOKXwXwdYdXJSHiKfe2nL69
 WG1A==
X-Gm-Message-State: AOAM533Rj2w64EN/QI6AHfr3PGSm4iDsKNQxoJ5y3b39Z5YuQhcwXw64
 heAJtRuA0LX3bM9p1Mg5jRJFuQ==
X-Google-Smtp-Source: ABdhPJzfQ+Y5th8/JtbN7r+h/Lc9cNUsgU3ZLsL+go1aC1KvJ37uO8CDMgsUK0REATmNQLFiWoOxjw==
X-Received: by 2002:a05:651c:4ce:: with SMTP id
 e14mr30354888lji.176.1625864854260; 
 Fri, 09 Jul 2021 14:07:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Date: Sat, 10 Jul 2021 00:07:23 +0300
Message-Id: <20210709210729.953114-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 2/8] arm64: dts: qcom: sc7180: assign DSI
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6228ba2d8513..bc765598d24e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3081,6 +3081,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
