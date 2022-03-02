Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D4D4CB29A
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 23:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5C110E7AA;
	Wed,  2 Mar 2022 22:54:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09D110E7AA
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 22:54:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id 5so3389712lfz.9
 for <freedreno@lists.freedesktop.org>; Wed, 02 Mar 2022 14:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I/L0yu6xWoay6PlawGPpd06J/A2WPkL2s2cqdaEK+Ks=;
 b=b94OIzWbOWEGzrng+NGPHaIrx/8QeINkda6Ml263QN1J+oQbqRkOIt79judywV36nB
 EBELVRi8yLkxbmFX9xDQBOzTD82Z8GHuMPr9QqAmkk/8aX4gGfrJMhf7vN/QEESU7Rja
 5wGREPlwRjZtPgCOwYPgqYrpeFszqOv4ZyaMCnIwKmhVGQQJb7BWnoY/gYwyplXQ7cJ7
 pDtSBof5k3cxKJQjQauif9RtTCMu7hwoSPUTNCH4yZsGSr4m0EQRl7un2VYmVI4Nj5zU
 wB397Lrqu67l0iW2rxkW3I01a82yBW9G2DcU8LVMVAdxTf3Gs4KQUBGUjlefnJ5Q7eJB
 INRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/L0yu6xWoay6PlawGPpd06J/A2WPkL2s2cqdaEK+Ks=;
 b=vTM1xExwRjxZtb6YR5mjkdDo0xaOKoxOLIPLwApbXwu76MDazqWb7BZUL2RxmBlGtp
 +RMUWwqy/BwuFfUPmavGvSouzhRskdLwqbM62mVdAfN2A3cAV+GoG+VkTVjc3T6ABYvK
 IunFkxflYmJfmmHXmdBO21OO7nzV2m7sFhZjUWgB7x2RSjpwyHByCaZos6Xpogjf3BIo
 5JJ9A5S06y5EWXyiPaTNcD0RnFoYncrX9VH+vThWoPskegwS7B7iZGpJhkCabrSQt1eu
 SVN9NlaZbvQEB8RfP+wrug8fslmfyg2MgnQgLsd41TLgIkvLtSVFtiT/Fk5Tqa1mtJyQ
 oEQQ==
X-Gm-Message-State: AOAM532K5afuWpyxCDbqklzfLgKiCoozHsX3TN+L3zUNw/W4bviDvEOq
 LS2CDTRHotnSEeTy7axZ1lbX3Q==
X-Google-Smtp-Source: ABdhPJwwvQR0vD9FZ299QAiPm1IxiWVuAajuPYm5A9TWGw/1UDW6EZnSZpLduvd6UfFyY/mSiEZLoA==
X-Received: by 2002:a05:6512:ba6:b0:42a:84ee:d9d9 with SMTP id
 b38-20020a0565120ba600b0042a84eed9d9mr20848149lfv.353.1646261659976; 
 Wed, 02 Mar 2022 14:54:19 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a05651c105a00b00246585ccd53sm54236ljm.75.2022.03.02.14.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 14:54:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu,  3 Mar 2022 01:54:11 +0300
Message-Id: <20220302225411.2456001-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 6/6] arm: dts: qcom-msm8974: Drop flags for
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Fixes: 5a9fc531f6ec ("ARM: dts: msm8974: add display support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 412d94736c35..3b9af5e24907 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1495,7 +1495,7 @@ mdp: mdp@fd900000 {
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 0>;
+				interrupts = <0>;
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
 					 <&mmcc MDSS_AXI_CLK>,
@@ -1530,7 +1530,7 @@ dsi0: dsi@fd922800 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
 				                  <&mmcc PCLK0_CLK_SRC>;
-- 
2.34.1

