Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD197525875
	for <lists+freedreno@lfdr.de>; Fri, 13 May 2022 01:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E4510ED8B;
	Thu, 12 May 2022 23:36:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E0610ED26
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 23:36:52 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bq30so11738136lfb.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 16:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x2qQH918JYdrczWJIIm8XRXT3abBOAyM4GeAzsiuGrc=;
 b=imgXlkwZphoRfEqY61B9arSGf+5S1bk8yxCfn8aW+WCvAiHMbcRdL/HTR67jooTHpv
 rlAFiCo4+TNI21fUjWYOtZfkzogkS02oS+2HutSM9Wd21kr4heZbyBFAJ+m28xSsbtKc
 QwIJ0Bf4VKKlRxvVDq6TT+BBzLfZi8MICxrfPZBD+K5NBhOT+ZYOj8oLtpjCyBEhSRZz
 KkKTLUPO+kLTFVbcp7ZqhtJEE8dewNuOhoEuzZ6uTOcjuCOdARIBom0bO7qi0+WfX1h3
 vLPB8fN0ApvR/UVgwZM8MxJO8zah4w1TF5T3VhtgzoPXCaWORmQWBoTmarjeAyF2F8mc
 HN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x2qQH918JYdrczWJIIm8XRXT3abBOAyM4GeAzsiuGrc=;
 b=I95EZlW1fa3H9sSohQFkf0rpmEFG1W4kE7/MaPIOHOZhP1sGgNCoKJjz1sC/Ci/4hj
 EQMo+iwLkChRQUnGLUPYyq+dbFCK2NlSxJnMhA/QufO31MyM34/TAw3tXtlDOvWaVAD+
 b9pKSRhu9NhZlLF03d1kdsHkaPqi07n5ccGW/qVw/mo6Mh0Q8NG0pRZlUq2gSmldpUr3
 p+Ap/EMRz1fYf2XBTVQJ7p2o5X8BIwi7uQENRJQ921/pwGFwx3cRQCXS6T7UOQSKfxWK
 wPrKviodUSwG/rkp99RJG1lMnZM/7I5cZ/W+P56fzVUK2JEXZk14MTsc3uDzUWquvJgO
 qZAg==
X-Gm-Message-State: AOAM531+eiz0aVyZ1ctwJ9jBzjgBsCfcb7b9QMFNB+Ggrd3GCEV1AWXU
 aV9G8hED1RneqPNIsMmolmDE552OlU7TkA==
X-Google-Smtp-Source: ABdhPJwQmW0wytK6CIsH6M30YJ8vzgMgIGQyJDw6fDiVF6pGuAn0bMDE2gbxsjPKZlzZjlb1hqkmsQ==
X-Received: by 2002:a05:6512:68c:b0:473:da9a:66c3 with SMTP id
 t12-20020a056512068c00b00473da9a66c3mr1430381lfe.531.1652398611128; 
 Thu, 12 May 2022 16:36:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:36:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 13 May 2022 02:36:43 +0300
Message-Id: <20220512233647.2672813-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/8] arm64: dts: qcom: sdm630: fix the
 qusb2phy ref clock
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

According to the downstram DT file, the qusb2phy ref clock should be
GCC_RX0_USB2_CLKREF_CLK, not GCC_RX1_USB2_CLKREF_CLK.

Fixes: c65a4ed2ea8b ("arm64: dts: qcom: sdm630: Add USB configuration")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e8bb170e8b2f..cca56f2fad96 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1262,7 +1262,7 @@ qusb2phy: phy@c012000 {
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+				<&gcc GCC_RX0_USB2_CLKREF_CLK>;
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-- 
2.35.1

