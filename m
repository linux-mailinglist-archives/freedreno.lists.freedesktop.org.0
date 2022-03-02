Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50254C9A1A
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 01:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A20810E781;
	Wed,  2 Mar 2022 00:52:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A8310E781
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 00:52:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g39so67395lfv.10
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 16:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWC9HLvSBhB6Pz8h3N3F3AQ0kWvVsZWnOAu1rbrD3T8=;
 b=kFWE16Aoaj+o//Zn40/+etJqsbR+TZiRHqtnJsI4Wog2t4S6E4CxC6ghXAduSbJ7UT
 thVeHdkT3kso/hcUs38OYn6eAL65hSDNXuayQoJSyYJDPJsMAeDwSdgMhda9CjVIGSSS
 9UR9oX8fr7HPnLeOw6hY6crk5HT+Nknf6x3SwnSeZ7k27Bf7Oa7noyyqemREOVIZizMh
 QeWpgE+3gnWmbj/NKI1NqbzIefp7Zk0xmkvMqymGJvbgP5GrSt5UWwHruw2JQdBaMvVM
 u4qgyWgrchX3iceBmKZr8HKg4bWQPzevxyoJS629sZwO/ALPB1SloRM8f705ZAcDA5zB
 Wo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWC9HLvSBhB6Pz8h3N3F3AQ0kWvVsZWnOAu1rbrD3T8=;
 b=kxrax4XF6rxVWkBS6PgD//62UawmQpBDJuqONwyD2B3kqhTNmLImYpj+aHW6YvlIx9
 lpou4e+w/PFW3A6i4a0kTNRKnbulJmjbapU6cY3ybwLmssb890qbjUg38Zro67HgfAiu
 wJ3LPLF80f80AOhcoWe8KROz1UnEeriiTzggjTbz3jv3TgT1K8PHKGLGr8KCJ+MjJItu
 yHstuMEDRA8yTsJu30tOEZpEh44IFmuEVyTvDZ6SnhlKQceu5KIZEaFx0gucbYuFyFit
 Cf+JOqGpUGifqtWD3+pSu8hUku9qf0Y5xn4K5Nw/enyDRpLNGbqM7WQr4AumRtYAfwIY
 ORSA==
X-Gm-Message-State: AOAM531QW/OSefdmsPCLFtPLRTLlWZSRoJ57CkQi+GWT4hMvvIoIAyAd
 PAlRys+nTeUOBSTmbF1zprTcVg==
X-Google-Smtp-Source: ABdhPJym3l2+Hs9czgroqBDyOci3cO8rUBNuuvJjNmEzzQ1BKImUtnbRIkY8c6HLvLBt5WHRuMLJWQ==
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
 b2-20020a056512304200b0043796f5e68amr17760636lfb.449.1646182332278; 
 Tue, 01 Mar 2022 16:52:12 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:52:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed,  2 Mar 2022 03:52:06 +0300
Message-Id: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/5] arm64: dts: qcom: msm8996: Drop flags for
 mdss irqs
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

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

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

