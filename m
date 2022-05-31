Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06596539106
	for <lists+freedreno@lfdr.de>; Tue, 31 May 2022 14:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9A112AE1;
	Tue, 31 May 2022 12:47:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03082112ADB
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 12:47:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id be31so3357710lfb.10
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r3/jevdsJSGVl1zPrKNV30Bc3ZiH/kytNoUeRC1cAXA=;
 b=bWeYY9xDhw4LSY+wJKq6IW22lA25aembLAAZ1jfzd9z/S5T6WXwzIOSGArZpy+vOJA
 BRIr443Mz8RxaoZtbq9WR8mMgD47whTt3RqSqVyiSYINH8a4EONkpokC1800PjnANbIE
 tSOfH3v56CyZ+1WHYucF8EsJxRMD4NZxEtLnqER082bcPH0BFd7Nusz55Y+VyoDQsjFe
 c3Tjs5s4Yx3YPUPwfTHj/ADT1ffYS/Pvvb7KCIOfCqXJ8K6nVezv8vnqkLTircFvwM+Q
 4DAR6rb3wvM419QwHEnHSN6tfsDy+89R/QxeuWjI3ko34zt4Ri12AsCT1F85MYL+OF61
 tBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r3/jevdsJSGVl1zPrKNV30Bc3ZiH/kytNoUeRC1cAXA=;
 b=yxZcrFSqLlbIZmJ8JC80CyuwGQ5q1zp2YTX/Md2b192F9yHG7iG4qSC5WAdAcA5UUU
 DNAltNUxAHYRX8VrKCSdE025eRTtjMCf0uiz2McqdZue8NEVJo1aT2iabVIHlf8AQhot
 NBka4D8ZZlnFFuHrKyDrliK/y+0py/RJdFU/yB/6mVf5CCUTfj+3QOPWyMveTqetDgGM
 MpZRx8M3U66pUoCJ3LnHj0KSsFp1tEpWx8RepI5N7s3YjHmsWHyqYDBXgljv7QHwLBq9
 H+EyOM7fDEm/r76NEavyT28r8NmlAhQCqRqNCqTClIv26/O8xO64zO9qOSObNb31+mYQ
 FVDA==
X-Gm-Message-State: AOAM532fkJxr2//nj26TTT7bbIYh0N3jIg+cRTB77B6p0WrnEWGDVJgT
 MnTtuFvc+c5SzwExm/qFIlMbdA==
X-Google-Smtp-Source: ABdhPJyy9JFGnf2TlnHouAv/1tGCvkY9vnz8IoifhlpyHrM50TMAGs6Fl69JLE4RQyoO+NCNGY54Zg==
X-Received: by 2002:ac2:5444:0:b0:477:a839:b4d with SMTP id
 d4-20020ac25444000000b00477a8390b4dmr42573771lfn.333.1654001256310; 
 Tue, 31 May 2022 05:47:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 s16-20020a056512215000b00478f3fe716asm365082lfr.200.2022.05.31.05.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 05:47:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 31 May 2022 15:47:35 +0300
Message-Id: <20220531124735.1165582-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] arm64: dts: qcom: sdm845: use dispcc AHB clock
 for mdss node
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
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It was noticed that on sdm845 after an MDSS suspend/resume cycle the
driver can not read HW_REV registers properly (they will return 0
instead). Chaning the "iface" clock from <&gcc GCC_DISP_AHB_CLK> to
<&dispcc DISP_CC_MDSS_AHB_CLK> fixes the issue.

Fixes: 08c2a076d18f ("arm64: dts: qcom: sdm845: Add dpu to sdm845 dts file")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b31bf62e8680..ad21cf465c98 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4238,7 +4238,7 @@ mdss: mdss@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			clocks = <&gcc GCC_DISP_AHB_CLK>,
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			clock-names = "iface", "core";
 
-- 
2.35.1

