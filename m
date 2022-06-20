Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E0550E45
	for <lists+freedreno@lfdr.de>; Mon, 20 Jun 2022 03:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5A611309C;
	Mon, 20 Jun 2022 01:03:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD26C113096
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 01:03:07 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b23so1669209ljh.7
 for <freedreno@lists.freedesktop.org>; Sun, 19 Jun 2022 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4q2wCt0JYx6qaJhRwDPoSmA5b4OihaTxL4gA7npr16U=;
 b=rsI0vlVTzQzpkdIbqpbf/7eqtUrBOHQcOmH/dDKHYQyv5w5BnNiuqXzOQGLDDGvNzS
 fXsuP66NJgPfGZbfopbYc87BIePz/YSODREPdzBXbhEJdIfIa0niozFq4mWuxf/whC7b
 Sn/Juaqe/sNT4rPQmcvOnABx6ltNxCPc+v0DQHCFjEqw5fMeiLN1t8kCLiRvZvw+U8fF
 l4ULH8eirH7Mo2IWeDTh9SwJ3DB9GFLDnDPzigXv4D9TggLZ2RxZ/V4ZrtM/De2MbVDn
 l7g5B3ov5FA9Dt06RaAnUetHRjDdOifIlcTDrkSvVabk6cglPvixLhS1uP2B8Z6RpVzc
 Sjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4q2wCt0JYx6qaJhRwDPoSmA5b4OihaTxL4gA7npr16U=;
 b=pfdWz8h4QwYB+fLC7Lrz1WDWCzlpG1G+IGakp0s6YNRyPt4F/KiqY246iGtZ8ZfFBY
 //+AMtOoqV+vb8OnkzgW0JmrjLF1I399I5mh9DzupusnKyGerTQJft6dIKvVbgHXTvVf
 gHKXYwNZuwl8MRgyh9f2ECMz2kVtArEZZ8IkZUgRfWRqfjGz56ofYxKS6YSnpI5+vedT
 1PI4wf+cVCyn7s5pCgvBGu9HXrZjbA5tU6fEg973vKVRAO/GvvvZz/lgbzLoibeqTlW5
 TzNsQQsVPdAQjw1D8AmViWC4rM9p8B9C53aB4xOLsJbELI892k25L4EENXCYsreQs9dx
 vAXQ==
X-Gm-Message-State: AJIora9MS8zXP6adR3e34ROtYoiOV+O4Wf6odEL32d7eJBmNED6Qmg9U
 eN/zoBQb3s9qFvgaaYU7WzePIThBemBz1NTv
X-Google-Smtp-Source: AGRyM1tdp2xX6YI5PZBzkZwM6r8spgP1XYPDAPFEGuYiS7i9XQ32d7gqAd9JIP49mvbblK054b7l8Q==
X-Received: by 2002:a2e:a553:0:b0:255:9114:dbff with SMTP id
 e19-20020a2ea553000000b002559114dbffmr11077244ljn.208.1655686986055; 
 Sun, 19 Jun 2022 18:03:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a1-20020a19e301000000b00477a6c86f17sm1550334lfh.8.2022.06.19.18.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 18:03:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 20 Jun 2022 04:03:00 +0300
Message-Id: <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/3] arm64: dts: qcom: msm8996: add
 #clock-cells and XO clock to the HDMI PHY node
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

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock. While we are at it, also add the XO clock to
the device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9932186f7ceb..c0def6dd7f00 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -960,9 +960,13 @@ hdmi_phy: hdmi-phy@9a0600 {
 					    "hdmi_phy";
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
-					 <&gcc GCC_HDMI_CLKREF_CLK>;
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&xo_board>;
 				clock-names = "iface",
-					      "ref";
+					      "ref",
+					      "xo";
+
+				#clock-cells = <0>;
 
 				status = "disabled";
 			};
-- 
2.35.1

