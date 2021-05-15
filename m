Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864923818FE
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 15:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FDB6E328;
	Sat, 15 May 2021 13:12:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A296E1A7
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 13:12:24 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id o8so1784715ljp.0
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
 b=Uv6MazY9XNEXNTEONgwnHe0oOXRGuDo0b633L9TmxeAMKHNMdElnpQxc2m11x78BYE
 XsSy6yfX2SvK/BgTmrn1J+s2NUMEJKYmoAxYLf0D7JeJl92OGakS/oSEAvVKZL3QByMH
 gGy/uqAHHAoHnQ9vV8Jt2YXxwltQIDRHJpHVVmtHtoYp5lq04Wo12RpE5dRWHsxR7g9G
 l+gsLXbS7ua17YOR02tNw+LaE0KKvchfT5UG7lQoFraNajjYCWV4bPbLhP83+qzT0Gzs
 WyJWGBHoB+CfG9QtkL4n+ROCRcCEn7iR3E33bnvly3COciRyXZSSOiHN+9Wz5ibSU96O
 QoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
 b=o9giwv3soqAw3GjUUkwj4Jkt8OFy+eHGH6JDIkHhL/tbXM7E3IU4xs147hFVU+yyya
 /Kgm98QvxOWrWDOn7WO1CiB3j25M5LAATzIYrlcFS0/38i4ifmQ7P3mfGO8XQiTQ2Emr
 vRjEDHiB/rf8XdkA6M6VraCS3HQiJ9e9GHt72wpvZ59iDBAzYVoRXQflU5h0o+784yj8
 R18hWOiNX3sjmzEg5RfBTMwbJBLTxym8Gkad514DpHR5jrunysbQkjYwdBNfCqiOXGeb
 SgzWTPA/6C8RmSogbT6tAx3S+gLVqm04DmHu/rfF2CQbxJ1X7y51cHfDPdnexIPIlSQI
 soww==
X-Gm-Message-State: AOAM533Ljc1YVLxAuwSQfTpO5Pz1pwmUKj462PWQk788oq8YSxBiWanF
 y0p3BWqgqL8AfdFyrDQrTJ8kLw==
X-Google-Smtp-Source: ABdhPJx4JwjGkjf2+ERd282AHyLy6MuHHJwWFDuM056vtz6NXfDNDM1FmZ5MZCoMRJln3Seq4wYFqw==
X-Received: by 2002:a2e:7a0f:: with SMTP id v15mr41795283ljc.242.1621084342980; 
 Sat, 15 May 2021 06:12:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 15 May 2021 16:12:13 +0300
Message-Id: <20210515131217.1540412-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 4/8] arm64: dts: qcom: sm8250: assign DSI clock
 source parents
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..b6ed94497e8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2445,6 +2445,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2512,6 +2515,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
