Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5B4CB295
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 23:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EACE10E5A2;
	Wed,  2 Mar 2022 22:54:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DD410E5A2
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 22:54:15 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 5so3389391lfz.9
 for <freedreno@lists.freedesktop.org>; Wed, 02 Mar 2022 14:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zfVruM9Td3Qe8hMUXW/2W8vzb/CFZlBCaj9qNxMrBZQ=;
 b=SGDqdhhUoyUk04TyuwRLj5nU0/n+pQJk8CyLPjKi7op48hE9Oi5PG0XgD+plY0lBTd
 YFe1dD838csgexBoNIArITbGMar8UJOYBpr4mhgLDUD8p5jhXs/tZLg/vK1RHvJtEfi9
 g16OOJLslG7KgpYDVDHIVRMeuvrg3cLaaN1a21Vtnk9DjihknS5bECQW2O66o5wyuyc/
 t+hu5WB1XPe8k/NTBufYN59e68VwdmM9Zx0J7jbRhIjCNxIIFOfQV7h45tNTn9ivrzyu
 T/m6gyxWFroX4a1Npr6XWIZSKqTlzdM+oGbBb4OESbiHnAZTvkAHTN6Y/Fy9hrDhOK1L
 NuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zfVruM9Td3Qe8hMUXW/2W8vzb/CFZlBCaj9qNxMrBZQ=;
 b=ObT+VDKZd3yinGQzsOxeILO+xsdeHD4/XCuiYtVSdMOeg5Yc7BSOiBRduY8IXjD2xY
 kBqo4pS38GPth7R4xZRdHa5AVXydCPfUG0ezs1vDak9h6kwGSRtGaRP7VYpE69UAx8r0
 ZY+xhSJshR1DjMtab+J54IWoUM1F4c/41mYVc6oxOYxkXMR0jYj+OK9t2KbRu/fEsdC6
 MQrkcUxYTpmzXhJPYBWWjbvBYZ8R8tIpeU7Sx5j4bqPcWMYQQLh9HEDmFJVLmWonZJAw
 p6nQ/BcIkhAJw9ZPOS1VgSGqEXJnU4wnQo1DJnoblE0y8ScSAK7bZj3xa+A6WmbABQby
 chtQ==
X-Gm-Message-State: AOAM532/ySR9Km2ldAmNwH5RCMNYF9BUKa+WdsR0t2d0IAEvAgCoIm60
 /+ZGtEqNN0VzumCckavZX9kSrw==
X-Google-Smtp-Source: ABdhPJxtG5vOkVSwq2a3O+epKEVFO0+KA/Fssvm52be6GqZuJov2slZ3MzxvMZGWGDO0S36/SIIl7A==
X-Received: by 2002:a05:6512:3408:b0:443:c898:520b with SMTP id
 i8-20020a056512340800b00443c898520bmr18979256lfr.465.1646261653800; 
 Wed, 02 Mar 2022 14:54:13 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a05651c105a00b00246585ccd53sm54236ljm.75.2022.03.02.14.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 14:54:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu,  3 Mar 2022 01:54:06 +0300
Message-Id: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/6] arm64: dts: qcom: msm8996: Drop flags
 for mdss irqs
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Fixes: 12d540375736 ("arm64: dts: qcom: msm8996: Add DSI0 nodes")
Fixes: 3a4547c1fc2f ("arm64: qcom: msm8996.dtsi: Add Display nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..0597d865a4a6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -788,7 +788,7 @@ mdp: mdp@901000 {
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
 					 <&mmcc MDSS_AXI_CLK>,
@@ -834,7 +834,7 @@ dsi0: dsi@994000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_BYTE0_CLK>,
@@ -904,7 +904,7 @@ hdmi: hdmi-tx@9a0000 {
 					    "hdcp_physical";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <8>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_AHB_CLK>,
-- 
2.34.1

