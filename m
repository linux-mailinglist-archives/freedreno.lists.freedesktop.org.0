Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180FF636F4F
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5AF10E66F;
	Thu, 24 Nov 2022 00:48:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E7E10E66D
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 83-20020a1c0256000000b003d03017c6efso2134185wmc.4
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7igFHyhmHKVMXZXEAa2K1RzngdOwodMFmdy9026aRg=;
 b=YEe/hyEyRdcFpHn2Lry6PI9e8vGou4lqu2Uskax8y5DfDT18K9yhn+xY241N5V/tr8
 QhE2JGxzmfNEldWqkV4HG5VxG7cCPaeiEnoHytGpbw/Cr361+rpIzvDQ2QPT8BcnmGoL
 6qLxU5uoWQmqnLXOB0Cvg3JFoG24thWU/tOFbp6bAFLWsow3EikljXNqGwLwVtl+9lzY
 XNN7D1bxz5K5IST/GZo7LfJgnuuPQ9kwrBD05HX7Gr+UXpNxUPEJW7ymqqhbf4hXUTVi
 BCWLREPMRwoQ+2Qnv4NMDHsPENh9DB93FBnqNcizOrZBGIm87lc/UARi108ETS3XXqyw
 rIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7igFHyhmHKVMXZXEAa2K1RzngdOwodMFmdy9026aRg=;
 b=PvzAg+FwKMNAdY0Yo4QiWxFp4qyaLGpPv4iQ4gjud82oCqYCsBI4hsnoPN8ZU0TL+C
 SvpJUVuYOJqqoNv3YTB3SALBbYoH4dHk/QjKRIhNuv3+qUVqmnXBPym5LU4HrWy78K7X
 2wY0O9XhPuswJqLKmlxrK04HWm9Op4WCaXuF8y/7/xcEG7JSQiURuWSSJko4QO1BoH3Q
 VJb6WV8ZN6OlTjfqZNclEtyWa1Clb1kqFh1SQShNDH7PMYfVHsVyy6wkyrZLNgRmsA5s
 1N0Bvjxt7lbb7N7LTYXEeecSm8I6ybhfZqHyqAraraFjg4C8vDGwEMD+Kwsy1erdpN7v
 xEVQ==
X-Gm-Message-State: ANoB5pmTx4lsRig+RAzd+PDgk2AjJaONBzbB+zDZ4fg9PdsqXCTr0A2T
 k85NSk4Oq7qEzwWzn87Ih+eFUQ==
X-Google-Smtp-Source: AA0mqf5OriOC9F/2TwTB4Y4eYvlM0v1V9cnS9OKowIQTOHik3qyaYvVjqSvphXR3oB61luMGH0dQKQ==
X-Received: by 2002:a05:600c:354d:b0:3cf:45ff:aca with SMTP id
 i13-20020a05600c354d00b003cf45ff0acamr12885545wmq.53.1669250899212; 
 Wed, 23 Nov 2022 16:48:19 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:18 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:55 +0000
Message-Id: <20221124004801.361232-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 12/18] arm64: dts: qcom: msm8996: Add compat
 qcom, msm8996-dsi-ctrl
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

Add silicon specific compatible qcom,msm8996-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8996 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 081e20a63c610..9f6543579dcf0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -968,7 +968,8 @@ mdp5_intf2_out: endpoint {
 			};
 
 			dsi0: dsi@994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00994000 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -1035,7 +1036,8 @@ dsi0_phy: dsi-phy@994400 {
 			};
 
 			dsi1: dsi@996000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00996000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

