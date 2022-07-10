Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9658D56CE3C
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 11:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5512110FEA1;
	Sun, 10 Jul 2022 09:00:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7610F4CE
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:43 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id w17so1495689ljh.6
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bs8QcdQy1djDK+VwdSiBURhhZ88rl9ZJFN4yb8iwpTk=;
 b=Z5xFyCHBCVYLY1mZfAZfsU5c6pkVZ6MlPczZS71RWrQtF7VcFHZWX+qWZQOndLG8gU
 /QDhAD750LzOVIsSMGx4baiRCUGNJ+eg/BNDKDTmrVbr6LbavUuG0Mw7pl/sF4IS5K5s
 WINEfm+3j8naAu1BDaM2uc1fGxE4hPH+85YzKm9Vl0HvcR+9H0/UrjOz9q18mH0f196y
 Ti+/Nn4PikZKK3HJF3xBiRd6pODr3wESjRBH/sN8LNTbFDZE5t1Xza31PouWU5HT4z+A
 BCFTzxgiuG6mhXVT0km2NOm58Z+WVrmhgiZMGy2bddifwdDYpIC92W95TnPXLGZy+w7m
 xggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bs8QcdQy1djDK+VwdSiBURhhZ88rl9ZJFN4yb8iwpTk=;
 b=a8Z1Ova3L4rE2BT3gIZcKefd2eU7AxPqi/fX+HNWKV4yjV5F/szthoaOTvQa2jo0Vp
 /lpRwa4QPlotYyMnDinOn2gvSGGmioGrwWsJZ65K9C/AeDqIvRhY870H5BvKvGlSJmEd
 6oMfDOHNLS5brB/PLa1XSADQNfhlmfqy0gJZ3FekOsAFTOT9cWr2cnUsAxWde+6eB5Dn
 8zVufYXXUplMs9KoR+7fc+JCvNd6xmv27vkWEZmxYtUtpc55+ojUqSt117DesLjYNRft
 OMqEAr9elOXmwi4jdbx/qPnDmb8qF/qgvXGhxo49fZtHtS0rvxPv2RIQIR53hMiElkls
 kdRQ==
X-Gm-Message-State: AJIora9ZuwO+x7VlshPL6+mbDWvxg6eMh/oh371cgVv3TGJaQOaQ8fcX
 DSN1NJyixR/8YMCcRV3DbjUo9g==
X-Google-Smtp-Source: AGRyM1vAAXRUW/u9eNMC5CQ2DdLm7LWjiipCc6GIG3Ei2jlPeO67YClCuNTtwAwSpvGfp3/lv9hZ7A==
X-Received: by 2002:a2e:bf20:0:b0:25a:45a6:7587 with SMTP id
 c32-20020a2ebf20000000b0025a45a67587mr6997088ljr.377.1657443641951; 
 Sun, 10 Jul 2022 02:00:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 12:00:30 +0300
Message-Id: <20220710090040.35193-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 01/11] arm64: dts: qcom: sdm845: rename DPU
 device node
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

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 32ad5972a642..7c66f490e822 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4265,7 +4265,7 @@ mdss: mdss@ae00000 {
 			#size-cells = <2>;
 			ranges;
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sdm845-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

