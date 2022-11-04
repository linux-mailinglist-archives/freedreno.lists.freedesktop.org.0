Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C622B619746
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B06E10E759;
	Fri,  4 Nov 2022 13:14:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AC810E74A
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:14:05 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o12so7352855lfq.9
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0A+163PsmJ1ptBHVITMcGJc85uOhQS9+0yCpVsRSF0A=;
 b=gs5fqzhhKvrVEkw0m3PxqCwS3XU7Ha/eC7UnZkIgDKPXNl6mMBrEs4g3n6kv5P/BLU
 n6srU+YmAXb8O5n7O/zykMB7QxzgGq8NyuCG6tNswAaPuuVLcxlH6eSuMuxG6lP48H4t
 7Jw4w2XD1n86b+sfaN+90ntGLEpxKii1TK++ErUAsrCzzpp1DmRgMTMrMrazVG/RlgOK
 kWzi7l6TgcxiYzlBwdmDUU4phfutGvCW76YGhV9Ubiggcn1qVsGl2VmhL3XEPbjuDa1d
 uYKrrJYfi23Q5g5cDbqwoX8HUq5tN6mK0Q/yCoV2vZk2GqtHNjLxPBOqeB+r64CPURPV
 iviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0A+163PsmJ1ptBHVITMcGJc85uOhQS9+0yCpVsRSF0A=;
 b=l6cyD1CUBc21fKmb6Gx/KuEosHCzxgOKhJlqdtU+4iNYX2+buKHVGe06lNtv+/O5ja
 6cJseIx1J3+iadz1V8cuqDPz1rc59LHsrmknc6hRc3s6jpxBmxuL7ouksoUOeq38rQzD
 /7re3okRGQ6hMSb/nFfN9z/21KNIifjkoGOnVeta47ip2EBZrxYGrJQvKvNR+w5rTD2d
 NdRYz5kDZDkLkAe75X39WuzSNSZ7Q//tOT5ZJqgYSZGBcmTj5AoiC5KTwtjnyh/8KlVA
 5LZfDE9kDl0quvJVqGCMsJMaeiU1UVEwrgy+4iNwfNVWXJR/g3aQ50HpbQnXEfvx5tZJ
 IwZA==
X-Gm-Message-State: ACrzQf1S5lB/n1ZGPLx0WgQlfb+U6ttnECI/EKwKHKfso2YgDoD3dzyY
 qKP1mxPI0hNTv++/dakbZBSXWQ==
X-Google-Smtp-Source: AMsMyM78O/BAXjokK2yZirFBQBDA+Dd92E2KeDs1dZNLPbeZ2SBLnHkkbYexiP8Obr8tEv0r7+lKYQ==
X-Received: by 2002:a05:6512:282c:b0:4a2:1c88:e1e0 with SMTP id
 cf44-20020a056512282c00b004a21c88e1e0mr13111661lfb.501.1667567643428; 
 Fri, 04 Nov 2022 06:14:03 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:14:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  4 Nov 2022 16:13:56 +0300
Message-Id: <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable
 display hardware
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
configuration (yet).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 38ccd44620d0..e1a4cf1ee51d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -442,3 +442,21 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p91>;
 };
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l6b_1p2>;
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5b_0p88>;
+};
-- 
2.35.1

