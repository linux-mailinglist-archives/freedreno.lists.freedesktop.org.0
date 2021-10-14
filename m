Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3F042E3BA
	for <lists+freedreno@lfdr.de>; Thu, 14 Oct 2021 23:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9443F6E20C;
	Thu, 14 Oct 2021 21:42:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A2D6E207
 for <freedreno@lists.freedesktop.org>; Thu, 14 Oct 2021 21:42:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t9so32108313lfd.1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Oct 2021 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqc1ktG4tuWsHfc38SjZC7Pgbw/3KK9LBH/pBCG7bqk=;
 b=de+MsU0Qj75+aFoPTFEa8N8j4oU0lNy4gc1xqYBp9cPtS0aqFpbiS5aGWOacufpcg5
 xVE2HF6P5vnbDCG9eM1YpY/ZlT+t9GUhcp3xTcdxyRTxpJgsbIprIuJZJJ0VxVmbZClM
 4zfY1oOR0Ro51APygd+6TC1zMlclXLnnNec8kxhoIuAm/PvgJd1pEAP0XduSREhsDxaf
 S0Fig6lSuSiso7p3KFGYeVCEt8aUt7yiKDdTLMEfww8ZIXp7ZhDGZmrJ5643zOPu32RY
 vv6+gbNN3JKTzl0mlYuq9JK4YdQtg37beUr8y37oGRaY5oDcxtHn1lIsXaQHyaoYk0B4
 L4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqc1ktG4tuWsHfc38SjZC7Pgbw/3KK9LBH/pBCG7bqk=;
 b=HlbHAgxsYkEurGdZmkaNhWE4OXcKR8sfznxaI5h7jmpjyHLsHIhr/+W3jMuRX2XKbF
 sUe2HgeJBi/pPAZawBrCwewdTcr5opAqXuNxq2uH2uv4qGagav4L0IlVZayzbQSN8MAq
 Yv6beg6o2bI5phsBvjSYWKjckqStY3xTivb0YL7GYHl55o75l5LuSF5YJZedSZS5XEgQ
 y1UuKuvrFHOHF2M/2H++HPzPHZCQO73OSGoBEvHwh8eRClOYYTADU8Btd/XmIDIZqIJR
 Yx5E1/k7z9ui7/rtLoS75sDJUlrZHYNMqUElwsmsIUkYuMRZ80/rJajOfPcfPo3eF6HN
 4gLA==
X-Gm-Message-State: AOAM532ug7EZX5uU0akZNjUXBRvoACZnW9H/jirWFzabztfgJkDYRsLz
 c7eK/dGvMsST+7/NYowM6wgpvA==
X-Google-Smtp-Source: ABdhPJwXoKb13UGNSiQ8eOg0XJDg6uLdUtqzN99nvekkRjTiOtOeSq9+tsYVCxkJVH1Z3ZGS5o7QKg==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr7447165lfq.9.1634247742039;
 Thu, 14 Oct 2021 14:42:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y19sm301970lfa.123.2021.10.14.14.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 14:42:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Fri, 15 Oct 2021 00:42:21 +0300
Message-Id: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] ARM: dts: qcom-apq8064: stop using legacy clock
 names for HDMI
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

Stop using legacy clock names (with _clk suffix) for HDMI and HDMI PHY
device tree nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 87e5194114d5..6a51cf014994 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1420,9 +1420,9 @@ hdmi: hdmi-tx@4a00000 {
 			clocks = <&mmcc HDMI_APP_CLK>,
 				 <&mmcc HDMI_M_AHB_CLK>,
 				 <&mmcc HDMI_S_AHB_CLK>;
-			clock-names = "core_clk",
-				      "master_iface_clk",
-				      "slave_iface_clk";
+			clock-names = "core",
+				      "master_iface",
+				      "slave_iface";
 
 			phys = <&hdmi_phy>;
 			phy-names = "hdmi-phy";
@@ -1453,7 +1453,7 @@ hdmi_phy: hdmi-phy@4a00400 {
 				    "hdmi_pll";
 
 			clocks = <&mmcc HDMI_S_AHB_CLK>;
-			clock-names = "slave_iface_clk";
+			clock-names = "slave_iface";
 			#phy-cells = <0>;
 		};
 
-- 
2.33.0

