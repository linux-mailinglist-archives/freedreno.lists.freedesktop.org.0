Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799A544BD5
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E9811BE93;
	Thu,  9 Jun 2022 12:24:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BE211BE6C
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i29so20969240lfp.3
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUn1WOp+JZSnlJIDDrxH+O9fgRsQXrcw9L2S+Zca6OM=;
 b=EtrvkCBe0NgzfUAPrPX2jYHqaxd/nG9HcYiVXsFU+ROL/t8759M9ti0tkbthJGhTpQ
 HLie4OUOUEFIAcYrpJkr/uIWCtaS5fAFy5r8kYfNsx7HeHi2PIoa0c5sa4nSrXc9PthH
 KP5FvRtOq+0Is+pyI4ZLIqxActQUQ3VAh8RzP3oYkFYmhPkicqRkpAKYqBNBM9paCEAZ
 UeGXRs/kZFFVf02ZI6fDc5QOoagK030Y3J5D7U+M4siq/10TKQahS63WQQ0dk+s0eYqX
 xKocU+YtXkTBMux7h14v/cjRX13BKBP8dJ7fR5V6ZdX/yoUxt5cm2OIud1h786P/UPMY
 3CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUn1WOp+JZSnlJIDDrxH+O9fgRsQXrcw9L2S+Zca6OM=;
 b=xytJe5F6IOaVAKNVZ8SoWOQaXBEm3DAYWxA4MD/kUHeyMmZWGFLJoPGoNnPScKbT7E
 PHj5upz9pXK+34yY1YkqkiLQcCcij+8vAwSYnFlw0gbzr8pLMriXqkfsLjUvWBbxLtGK
 tiGpZ4oEflI8w8jHNz8F4xfmI0BxKXb8GcvGgyjCIwKXdkDzCWaQVOxPPjZCDP4xwmqR
 NfNouoe3p3qzUIxS7iPm2Nk1xcnHZEnywTGZOoyfP49KNrgUrVlzYpO/1PHF5ycu0RyA
 jw/2adnHxqPCzoB8XFqUaobewJYxEFTDqljPPHziQ6P6ggU4j6fiVgyyHdA6FkeDG0mt
 LAjw==
X-Gm-Message-State: AOAM5308wun3EefSkBZCXlSbWFNCqsUO9zqUfkjJkeojzsWMXEOGML8j
 IT6epgaJ4WUVaH6bi50cl9U6xw==
X-Google-Smtp-Source: ABdhPJwCXoEf6TkZjW0q7EHMhRCvA2o+dBUu8Cm/IqQaJmBV3E7VjgKjZV1hohNlh5iKc8A/ZUwXZA==
X-Received: by 2002:a05:6512:130c:b0:477:e2ea:396e with SMTP id
 x12-20020a056512130c00b00477e2ea396emr68244331lfu.489.1654777443367; 
 Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:49 +0300
Message-Id: <20220609122350.3157529-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 13/14] ARM: dts: qcom: apq8064: drop
 phy-names from HDMI device node
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

The HDMI driver doesn't use the phy-names to identify the PHY. Different
Qualcomm platforms have used different names for the PHY. So, we are
deprecating phy-names propertty of the HDMI device and dropping them
from existing DTs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 34c0ba7fa358..391ad85559bd 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1420,7 +1420,6 @@ hdmi: hdmi-tx@4a00000 {
 				      "slave_iface";
 
 			phys = <&hdmi_phy>;
-			phy-names = "hdmi-phy";
 
 			ports {
 				#address-cells = <1>;
-- 
2.35.1

