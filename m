Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368627388F4
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 17:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227B10E4B2;
	Wed, 21 Jun 2023 15:27:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B1810E4AF
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 15:27:23 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b47bfd4e45so49209921fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361241; x=1689953241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cinDdKc7qcFMBG/ILqluH58R0lxOnWl8AXgWQvYj7y8=;
 b=L7XZYrLRMVdNrNT666kAmLVpx0UuAEJm1JszHztq+eVasTX4GMDmNddObn/0Ta9JgW
 gxQjSGO28UPlxUf3AeIRe8n/HouUdNa9U/72YAp920k7SzDNUz1OyPitDS4p2H7OPRj+
 9xDbjJqXa74BuLabUS38U64LlXcjYYkOrv191gUGPc4lF42W01mQx1gz7b1mggPH6Fpo
 uMwgf44GN64W3quBKjx61T+FxfM9QAaVOx2Lz3ZfDpWufjnB7D/uPAP19XIr0H3nmBcx
 +DSqZ3skJiq5baHf+ZFCwUocRs8rbd8NjBBx1gqEGHrIsmMPOYJXPEeZzt1OIQZsd2z0
 a4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361241; x=1689953241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cinDdKc7qcFMBG/ILqluH58R0lxOnWl8AXgWQvYj7y8=;
 b=QsLnkaMIMeD4l4v+PjGZdZeQC/TJQMwdyn1dxtHUU+SczOGLQ/F03twc2KL/nJFCf8
 tJnCpUD5dA4zgyPetg1fw4Y4YfXh1otfqKTQ93Fp5mDvIQ1uHVKRiRpHgdDPZGag143F
 8M9m6Pi9PRuaF3IEIXPu1GPC+fzZuiAaOnyGLSOZ6riiU4Bt0bO4XZlDOdBoeKVT2L92
 hiiA4SvHpe3lDVIWbnWzWFciJIRpnl2FlStUA2U2qkSOhvFEFsF/1z6YvqoL3qH8EJHM
 6d9a4mG4sB6kAFegY6TuKFRbKM2t597t/Jr2WPzBi2xlimkJ2bm5AIy2Bul51LdX4FQT
 ghzA==
X-Gm-Message-State: AC+VfDxi0X3cHMrPdpHsZMmEgSpU+aWOJJm3hTHiMQh933srkRtQZmR9
 lle130ra6Z/t/yiUg20uFcbAFg==
X-Google-Smtp-Source: ACHHUZ5DrUiscoavdt2iyHRYadcld7Szp4rZOkCpzgtMW1bpfECW3qcwqzyL93OSiZjSm09amAPr6w==
X-Received: by 2002:a2e:848a:0:b0:2b4:6c76:332f with SMTP id
 b10-20020a2e848a000000b002b46c76332fmr8882032ljh.9.1687361241467; 
 Wed, 21 Jun 2023 08:27:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:27:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 21 Jun 2023 18:27:13 +0300
Message-Id: <20230621152719.1025801-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
References: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/7] phy: qcom: qmp-combo: correct bias0_en
 programming
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
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

