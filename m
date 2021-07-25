Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD333D4BAC
	for <lists+freedreno@lfdr.de>; Sun, 25 Jul 2021 06:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0979737F7;
	Sun, 25 Jul 2021 04:26:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633E8737FD
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:30 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 x15-20020a05683000cfb02904d1f8b9db81so6394714oto.12
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
 b=T4ZvBinIYvzQj0wWKnaURygYFC2E8hXmRZ1ZtD4KlsPvtaZ0cFoZfK0iRpA8KWTzLF
 CIbCxifoBvbYOZVB97EkjwgnLgzyC+SwnJKlzG0JDrqag/Ri8ZAO1YgIe0MInyV0rBBQ
 AgO5NCpTP1bTaBjQUienFQi8F9Tdqt9Zqoup4M7jy/4tNtdQ4x6dZw2ZGjcmVGdm2gzU
 ZAEx8G3ft3CUzTeoUHLzsJZEcqxrcD2Fa5M4Ia8Pz2QS8D3I1Bwm3U6M1t/TrbtLEMZ9
 2V2i+KpfabqUX5eh9vinXE8LjV//GvsaLvmISWVyFnpalEri1aC4/JXOD5nAVQQRr3Q8
 JqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
 b=coJxb12ULiX96mN5NIcIAXRVKxycyuWWXieHwxtRbWyHwuzYOBfjwP7f4UQSgPUFfV
 QTuiJSDZIKXuUd1b6YcCibgvnA/b0CuP7E9lKceRZ3y4C+0IjTwfKyMHZtE6aDh7lfmw
 1zE+8nWe/Mm5H5r3r6B3eG06BjxOT/s0mI54r5eQyWltWf1PgWXy+V6YdsyPC7YkG/x1
 VFiRxt8K6pTY5B8FRQbT4nPK+bsLHS9htUAy4G+sGUhHgKROwwLOvtqUAjORA85qCHIW
 5aiTM4/zek5gaMBqN2+4l0olbsTZQbTB1aKRsR8j8NPVGMgaRigSrhnLdZsv01NB5Wd2
 5B9A==
X-Gm-Message-State: AOAM5331rSM5w+pd98yRBGX7pvBYn6pC4/3PXM7QNRe59GlxyZsstrWk
 DEYqwECR2279xMSaj6cXm0pGFg==
X-Google-Smtp-Source: ABdhPJwzlSIVW2aW5cAHty03J7MuoqU0oXzGi7uz1brYzycm4HpPSCcTzEv7utPTS/ArSjZlgLegPw==
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr8032327otb.281.1627187189689; 
 Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Date: Sat, 24 Jul 2021 21:24:36 -0700
Message-Id: <20210725042436.3967173-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 5/5] drm/msm/dp: Add sc8180x DP controllers
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Link: https://lore.kernel.org/linux-arm-msm/20210511042043.592802-5-bjorn.andersson@linaro.org/
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 92b7646a1bb7..c26805cfcdd1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -129,8 +129,20 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_dp = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0 },
+	.num_dp = 3,
+};
+
+static const struct msm_dp_config sc8180x_edp_cfg = {
+	.io_start = { 0, 0, 0xae9a000 },
+	.num_dp = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
 	{}
 };
 
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
