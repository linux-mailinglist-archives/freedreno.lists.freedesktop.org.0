Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD9C4CB297
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 23:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D5A10E79F;
	Wed,  2 Mar 2022 22:54:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1030410E613
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 22:54:18 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bn33so4392080ljb.6
 for <freedreno@lists.freedesktop.org>; Wed, 02 Mar 2022 14:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uWYgqqLgLSrzMGcU/c8VpQ903XzyE7Iyx95nft5xtCU=;
 b=yUhGLvoDYM7EGTgSWKGyiuNP8zOlvEdxuUArj2J6w0D0cJKxFfwzRJ1x+B3tkvl4QL
 FAUZraMGzkjr4KaiRL7QC0VxHtuxc0T94gF3T3E8zPEksPB3U5n8lKJqarGZY1LWVlks
 UD4o6c+ISrCn+VzT6dALwzYVitC1ruanqV7pUx5DtbuPgt27nsIxDpm/0B/ZAehdO9i2
 rGoK15xDlR1f62eXiI+w0YkGpVFhkFfzFSxYA8DehI9yauBOhM4Hirj35xUucwVuJswi
 6/3VXdmYASwVI1wtd9TP4BgQNTXeHsNm5UnhxCLMhCQ0Y4kUAieWUnfQR7sxF8fc7HSY
 SiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uWYgqqLgLSrzMGcU/c8VpQ903XzyE7Iyx95nft5xtCU=;
 b=molnRudmUKruVLUCrQuY4AQFNXKaOTj/64f4SPddYaTQ77TeugCyTew18cAbnKsMnw
 ZnafdwkLPUaUK++aEn+sMjbEiJjYd37MKVXkuPjkfgT8hKDY2DfRAqL5VgsnPEDd80c8
 Wem2cV6JEZRr7j4AgHL01wIx5VY1kVPrEG9ByDrxVEimM3nRwNRAfljXRPIFnGEw0AQH
 Jj3BOOsvfKnsp3s/HJgttO8G89I5tac4gJbL/lmnivNbpWuc1v7dZF1GCFM0DU361YDE
 20VjikcjtNdV1lHcgxJNJ3YSbm0z4hbAmOlgJ81LsYG8hTbD0+YaoTt0AbpiH7oiBRWZ
 hGkQ==
X-Gm-Message-State: AOAM533HeGf4ntHt3B7jXLN+qUgrqNi8lvVKdR3qPlL0HyjxPl/OwyLt
 hbyvKDRUxm6dnIHKXAmKzZlqZg==
X-Google-Smtp-Source: ABdhPJy+WeZGHzDyYc4ub06RaPnlnutlWjYKCiDmtAafNgeiIUAIAH01atz6mseIX0v4aQDtIMQeBQ==
X-Received: by 2002:a2e:a370:0:b0:246:3f82:2fe7 with SMTP id
 i16-20020a2ea370000000b002463f822fe7mr21921508ljn.350.1646261656429; 
 Wed, 02 Mar 2022 14:54:16 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a05651c105a00b00246585ccd53sm54236ljm.75.2022.03.02.14.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 14:54:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu,  3 Mar 2022 01:54:08 +0300
Message-Id: <20220302225411.2456001-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/6] arm64: dts: qcom: sdm660: Drop flags for
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Fixes: ab290284398d ("arm64: dts: qcom: sdm660: Add required nodes for DSI1")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..1d748c5305f4 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -163,7 +163,7 @@ dsi1: dsi@c996000 {
 		power-domains = <&rpmpd SDM660_VDDCX>;
 
 		interrupt-parent = <&mdss>;
-		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <5>;
 
 		assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
 					<&mmcc PCLK1_CLK_SRC>;
-- 
2.34.1

