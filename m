Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D3654AFD
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B1E10E607;
	Fri, 23 Dec 2022 02:11:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82A910E5F2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 i82-20020a1c3b55000000b003d1e906ca23so2565084wma.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rImy9qzQNsvaZKsJD53z0ZS74yDDaR5L8OHuycyt/+8=;
 b=ybMeU7y7av/S/lEP7iuZrBMiP7gGL2G+whHNzpQgxB8Z7ojkkJ8yUruH2HhQ/SqlaU
 LQNK1NluoOprtN/vTg7MMwx9R2SrlK+ISepy8YzQ1jq9mdwSJub+Wcx02H+3j0oosiK1
 5sczwwz7wy5WS09bXFylOzrGaD3Y/uuzMPI87/kjs3TIO5jHx2DpgAvuTI2lfF9PsH4W
 l7P6jPn8KMWmHQzfCJfDlTjifIP6uIp8bNcMCKAINuZUZBS1IrGheySqUIQKRFun88Ad
 VFTeBj5nit+XULivjRDmh1jhoXt+iBegSIcmwy49qqblyJc7JOLVCu0+IfJAnUt9CJ4H
 sGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rImy9qzQNsvaZKsJD53z0ZS74yDDaR5L8OHuycyt/+8=;
 b=ihqvXdmCQDPYkkS57aiDvzhhwAq86jKNL04tQvBqytYiRvjhAmbcMxYH0DIu0g15M2
 kZASmNJuOUeAmuW6WQRijbf4D5KjCp+E+0/nsOEK6/sIdZ/NK4veXJzMs28uugZ4CanC
 jIe1lluaKRCOlLY3rfpPal1M8s9oPuYSQaA/O0VNggr3uDDCT1beDUUPKSDN1F4WuLEp
 PYtMIOkWVyKOy6pla6TKfGbdxHJktCqDtP0vI38GDm1hBCH19Mdr0Utq9eiVB/Cp7buh
 ywRX+y4vapyRpaJQIPi4Aw3zhmQkaeQSfiusFjYpmoUDfoOMn8TT1I7HECFT7CBMFgld
 hHSQ==
X-Gm-Message-State: AFqh2kp3UO/vn5bu2uhReWrV59Nzb5+9b2Z7ktGka3yiWL7akVqRdU3I
 mzYCZ12zJi+/rYNjuu2xnhGNWg==
X-Google-Smtp-Source: AMrXdXuzuSn3gs7o1D4dqMt4ziGo2rqNRIYplOTGXwzVttpFa/c6OL+Zc4YmiLUJuOBl/Rel7TCWtg==
X-Received: by 2002:a05:600c:3592:b0:3d1:ebdf:d58b with SMTP id
 p18-20020a05600c359200b003d1ebdfd58bmr5591037wmq.5.1671761444369; 
 Thu, 22 Dec 2022 18:10:44 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:44 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:22 +0000
Message-Id: <20221223021025.1646636-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 15/18] arm64: dts: qcom: sdm630: Add compat
 qcom, sdm660-dsi-ctrl
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

The sdm630 can use the sdm660 mdss-dsi-ctrl compat. Currently it has the
same set of binding dependencies as sdm660.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 13e6a4fbba27c..8b9c7421bc0c6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1572,7 +1572,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm660-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

