Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0356CE41
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 11:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F362910FD53;
	Sun, 10 Jul 2022 09:00:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FF510FEA1
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:45 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bu42so4330211lfb.0
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAQx/uD//KZplcIf17mKmrkwaSgdfWCTgLFjJOi8JBA=;
 b=rOjMZ43DqoxJgFj3QPiMHbZR9iTkTBjzhTPtTgr8fzHTouwAvwktMoUdvYXZNGZa+6
 ZSGmyuFkAoDUINlKhQaIfm1+oOAGUCodgVNjnz3W7QctgogCpIB6rcMMDLY24xb0JjdO
 /RCxluPQupBeX8K/7kX7FPGbiiHieY5PkjlDktMIHqyb1Q+cx1kmgaEMA1QiAeFBIi54
 yUD0YjhXrfYkTeV1tObWK3ZPtnN8cUKJEPP+90E3nF+zZ3gVsG+ViIZWG878phsADem9
 rsgwg2yqvPird2j+ydB8iS94eqosnrOSEF4alCR55Pd32RoieQsjecpNj0TzK+m0iAiV
 //kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAQx/uD//KZplcIf17mKmrkwaSgdfWCTgLFjJOi8JBA=;
 b=FoVV9/Zb2d76mpQdK+wvMqHsKKGuL2Kt1PGRyjO9Vn/cbdRGJbmGV1fvBgX9dNzySO
 DJcBI22dQuSVTunwsDvM9sTV3Hk/18Bye1FV9BGu6JmW/5CXhH+MjoPEyabcGTf+KUfC
 X+h52WE9RGsuevHP5JVMEsX/rlUtnHXqRoQaXfeYoI/5IG8fQtNGCac1jmCFt1dmCw12
 UWYxpblz7Q31gHNq7hcCxAqVrj09I9rZAB2r8RC/9ADDMr0V+jgJS+eYaDzk3HgJJlGW
 LbapZghIwzdpDdVt+Mg2A7ACzSOsakmfIsWD4bswSDVY/ENy+EKDPTn8jZfk0inWQEnA
 t+ow==
X-Gm-Message-State: AJIora/S/d87U/1hUi0s9I+0JfHuxAf9ZE+U41lGsHxv66RwbgvoYiHt
 6quOoQTfOEUZalGxsXFAhbI8HQ==
X-Google-Smtp-Source: AGRyM1uPGPmg6YRGI5I8EVD1Xyyv+ctzqdaU2D7fon7kgwpGTp3SHUsZa4iW2yqenvkC1QIPdnLMDw==
X-Received: by 2002:a05:6512:108c:b0:489:d110:a8a4 with SMTP id
 j12-20020a056512108c00b00489d110a8a4mr2866086lfg.648.1657443643626; 
 Sun, 10 Jul 2022 02:00:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 12:00:32 +0300
Message-Id: <20220710090040.35193-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 03/11] arm64: dts: qcom: sm8250: rename DPU
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 43c2d04b226f..48c60df59080 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3444,7 +3444,7 @@ mdss: mdss@ae00000 {
 			#size-cells = <2>;
 			ranges;
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8250-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

