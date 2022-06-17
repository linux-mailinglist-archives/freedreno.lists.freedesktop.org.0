Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F391554F585
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 12:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E1C11A97C;
	Fri, 17 Jun 2022 10:36:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD1511A97C
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 10:36:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h23so6294965lfe.4
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPM1lPElVRKHfSfZkivxc6Klx1L3jnABydrUVBQMP0U=;
 b=T3xd5AFu0aHBgrFvV/NHxWYh+71RiAe0Eb5xnkHI0menhC2kuEo3wShfU2B58UUOvG
 CmBDiAG7ci86yMRjHj8W1NDYKgv9K908P/mPrNJkRxgXcFzTTPnnOxtJ6UzQMTix2MxJ
 3UXIms+ZEue6hENMMfsLhxjUTlR1oE7pPk3paU4X8FPaBXcND8kG2m1B7XFzrySfbH78
 7QcBiVWV7PN3e1u/bEfLiiozdny8GMg0M9olf3tWIQ7G4cO4z/uV1vgYzHe4GYufp3BW
 6DiUZ/JKvVenxBKCRUOp8pTwHsmV3oVD7fsu8wt4UaBigHI6hyMadTnwsn2BuKwnUVFv
 BxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPM1lPElVRKHfSfZkivxc6Klx1L3jnABydrUVBQMP0U=;
 b=pQ/FsDypYjaC8yeQ3Ql9VbHM8+piJ6MQ0be2ZyJA9b5hePCxL5/Zg3ku+9MS0UkV+t
 6Fj7lVuh0t73BELRCF/LDFkD5SfI4vYGhAjoDFyZ9gVa2q3JLYj5vzVacM85L/iOUaSj
 3RR9qbv4BcND70/aPVkMPtihQH4jUUVxJi74/UrS7A49n3FDc0AkTltChtHkq41yiCrc
 y4ILIzAEX+QCOXYjx2Mxh06JGwT6AX9nJtw0CCzXbTuQGoisu1fNrmHsSzV5oLZq/3m9
 ZhP7WqbBst6Fol7KzUAPhmmOaY2VHeN2AuHxBIlBtKK6MU/pSkVZlOFKJ4NAuQv4T2EO
 3/TQ==
X-Gm-Message-State: AJIora8jcK2Ut5YQGYMYg9ba/jzLA+t8v1mMFr2TDHFlRDXiedUxk7G+
 3+bLdHIplofPl3rhOmRl3O5U8g==
X-Google-Smtp-Source: AGRyM1vQFxmhM36CJpjLmGbKY/c+jI34RGfZYGRL2Wt7y8RQnl89EqIsPtHq0/HJz1sNjOM5CrFERw==
X-Received: by 2002:ac2:4e86:0:b0:479:242:61da with SMTP id
 o6-20020ac24e86000000b00479024261damr5242193lfr.40.1655462179436; 
 Fri, 17 Jun 2022 03:36:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 03:36:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 13:36:08 +0300
Message-Id: <20220617103608.605898-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] arm64: dts: qcom: msm8996: add #clock-cells
 to the HDMI PHY node
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9932186f7ceb..f94f10947f26 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -964,6 +964,8 @@ hdmi_phy: hdmi-phy@9a0600 {
 				clock-names = "iface",
 					      "ref";
 
+				#clock-cells = <0>;
+
 				status = "disabled";
 			};
 		};
-- 
2.35.1

