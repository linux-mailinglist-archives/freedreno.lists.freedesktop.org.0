Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A62738941
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 17:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5F010E4B4;
	Wed, 21 Jun 2023 15:33:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9543A10E4B4
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 15:33:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f954d78bf8so2874448e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361599; x=1689953599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cinDdKc7qcFMBG/ILqluH58R0lxOnWl8AXgWQvYj7y8=;
 b=b9Uw8PP6PLmB5enJ+YN/gAWstIZcK2d6cPFFyC+HnhzhIc4frOT4XfJBKmua/afreb
 IDZChcMC5maApOrqooiLfSHE02o2EiXZesginJJzWeZeqlUHRrG7jR80XtE3AiI7VmtC
 HZI4aSI1i9RimFa0fI3huEzlOcx4k5B7HTtBTVo8pPX928LSi/n+Gm7Ydzk80Bodg6W4
 32pdtMhAkfrKubVOvWraqT0AGWi0lueXE5aqgqRb0pQK8xF4e/GBqKld5i8nFHpkZ3IK
 GxJDe2d8G19zTxKfCBHCpquAI37gAW+/c5doRep6NLvS6/FgoagpIE5JH9jYpF4uYU7G
 beAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361599; x=1689953599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cinDdKc7qcFMBG/ILqluH58R0lxOnWl8AXgWQvYj7y8=;
 b=l4Bwr0T0L/k84QHgh2ln9BdZfKWmA0hFdNKphHQjnlhxOs29EWumFhA6+eG4e03w7m
 Wt5Ftpp6+yPOn+vWdtnpyGjPtjKsdVjCltcCinve6br55EQ7mdFYJ4DLixwbdDT/1z5F
 3HXFA0nSH8NHzzZ7meRW5CNkEcRoFZIeZGsxZx2qiLUbCvknfVk9xu5LrIvXtJeaOhvu
 y/Sp/5mEhxCOKV2eHBwMXu74HWlb4wuK4GN0Y5K6mcKv9aX8Leg+lY/Bw5IV/mcaCjCw
 71hBk7gUsMw8aOz42kvjyq+lfYe6cdcoOQbn+f2y8D0UKD2GlsGq4MDbq9WF3Bk0RQA8
 /Iiw==
X-Gm-Message-State: AC+VfDyTaN4aSJLCsN9XgpjjgptsUokXnxGnYCBwL28WFb0q3piXD5mj
 ObfGagNLThJU84lFuArLaBpqwVimEhSbpP1fVbc=
X-Google-Smtp-Source: ACHHUZ4Swfo7lJHYU8UGgmXXrp9UT8Vv0+TqrSkf2YR9MicmmVjGVh7uzAoR2yPbD5YuFHbEZVPeCQ==
X-Received: by 2002:a19:6d0c:0:b0:4f8:4245:ed57 with SMTP id
 i12-20020a196d0c000000b004f84245ed57mr10106450lfc.35.1687361599343; 
 Wed, 21 Jun 2023 08:33:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:33:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Date: Wed, 21 Jun 2023 18:33:11 +0300
Message-Id: <20230621153317.1025914-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
References: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RESEND PATCH 1/7] phy: qcom: qmp-combo: correct
 bias0_en programming
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It seems the commit a2e927b0e50d ("phy: qcom-qmp-combo: Add sc8280xp
USB/DP combo phys") contained a typo for selecting bias0_en values.
First, bias0_en and bias1_en are expected to be symmetrical, and then
the vendor driver also uses `flipped : 0x3E : 0x15` statement for
bias0_en. Correct bias0_en programming to follow this.

Fixes: 49742e9edab3 ("phy: qcom-qmp-combo: Add support for SM8550")
Fixes: a2e927b0e50d ("phy: qcom-qmp-combo: Add sc8280xp USB/DP combo phys")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index bebce8c591a3..9d03b7b8e00c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2322,7 +2322,7 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 		return ret;
 
 	if (dp_opts->lanes == 1) {
-		bias0_en = reverse ? 0x3e : 0x1a;
+		bias0_en = reverse ? 0x3e : 0x15;
 		drvr0_en = reverse ? 0x13 : 0x10;
 		bias1_en = reverse ? 0x15 : 0x3e;
 		drvr1_en = reverse ? 0x10 : 0x13;
@@ -2382,7 +2382,7 @@ static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 		return ret;
 
 	if (dp_opts->lanes == 1) {
-		bias0_en = reverse ? 0x3e : 0x1a;
+		bias0_en = reverse ? 0x3e : 0x15;
 		drvr0_en = reverse ? 0x13 : 0x10;
 		bias1_en = reverse ? 0x15 : 0x3e;
 		drvr1_en = reverse ? 0x10 : 0x13;
-- 
2.39.2

