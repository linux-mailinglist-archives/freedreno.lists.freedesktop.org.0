Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9265D3DEAB0
	for <lists+freedreno@lfdr.de>; Tue,  3 Aug 2021 12:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F0F6E09E;
	Tue,  3 Aug 2021 10:17:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16789FF6
 for <freedreno@lists.freedesktop.org>; Tue,  3 Aug 2021 10:17:02 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e5so27552846ljp.6
 for <freedreno@lists.freedesktop.org>; Tue, 03 Aug 2021 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FsJoAIH4S+RjxCze2qp1zowJ52+FjRKDga6SkA/wG7k=;
 b=LI7tJOw368lOtxk+BRWyUom00ThyfKPx+XDNzofm7fmO6RGEQECfSzHmHJkQhjP24d
 aCA4+r11pGpT4HzFt/iwysrxYgYmkskZIsrCHVRxv2YM/z7IaSJJezhFbGBoKIZTyIIb
 HJ6OYSWmZERyJF/Gz52hs/U/jujxTpKLzmym8lzhcLWjqEQ2JpOLavGO4M3lmqpaDk30
 CJHTUlnUx3l4ORLkK6q29dAcnJUStsJq0DZETuAv66iOTPl3hzPnsnQCNLmla/ANP0YE
 KCPMzb8ffZVKYdM2Kg8cPWjZxs4MLdKLg2yUYtcIVEnuuxO9IMxvTsbrPTCRyKBkAiSs
 GaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FsJoAIH4S+RjxCze2qp1zowJ52+FjRKDga6SkA/wG7k=;
 b=rLKyOymin2A4WkhsrXTizaTVluZAmaPNKu+oorYW25iUtLc0+1KNu2qdckheXF94n9
 iQ2JWv6cUgem7N7VK+LscLTErM73pRITonlG6N+RkbP1nnCTA19CaykGdMgnGDgOL522
 fUekr3cTJqHihec2q4Q0h522KwJrext+9XEXd7Zr8HGoFpbdPkPGD+CnNv9n6xMzkUQ4
 JtSDhdXL+w59ekhtovnxSKAgvZkULfaJi3FOe84mfyxsr0dQihHUkHHWzPCn1sqmO9Dk
 GqRmuCYWfvqzU/oZ/77hIG81Xrvkkaq4S10xQVPrHPr9i2yeomx1VNp/SbsBBQtiUDqY
 3efw==
X-Gm-Message-State: AOAM532XpITWvzmDhpE3GIQ1x1Ny15iCgS7yKwiKlLzU9Af4FGO/KVvS
 ojQ78N5XGBo7yy/Z/bSiotYLlw==
X-Google-Smtp-Source: ABdhPJxNM7ZUJetzR253G1UXvy6y72lz2k4bBgzksy15ogkhFwYreU7aQMtLkhNR98G65Co0Le8vUw==
X-Received: by 2002:a2e:7a18:: with SMTP id v24mr14045030ljc.420.1627985820391; 
 Tue, 03 Aug 2021 03:17:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y10sm1056692ljj.10.2021.08.03.03.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 03:16:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Tue,  3 Aug 2021 13:16:57 +0300
Message-Id: <20210803101657.1072358-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803101657.1072358-1-dmitry.baryshkov@linaro.org>
References: <20210803101657.1072358-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 2/2] arm64: dts: sm8250: remove bus clock
 from the mdss node for sm8250 target
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Remove the bus clock from the mdss device node, in order to facilitate
bus band width scaling on sm8250 target.

The parent device MDSS will not vote for bus bw, instead the vote will
be triggered by mdp device node. Since a minimum vote is required to
turn on bus clock, and since mdp device node already has the bus clock,
remove the clock from the mdss device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4798368b02ef..1df03c809d02 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2470,10 +2470,9 @@ mdss: mdss@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&gcc GCC_DISP_SF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "nrt_bus", "core";
+			clock-names = "iface", "nrt_bus", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <460000000>;
-- 
2.30.2

