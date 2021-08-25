Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4B3F7F18
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 01:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D907A6E44D;
	Wed, 25 Aug 2021 23:41:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798EE6E442
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 23:41:26 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id v2so1799890oie.6
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 16:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zmkhJZgxUoBYEWfmUUPtlawWDiOOQTnvHmBTREcB0I8=;
 b=JyWNsF0Fao+n3iA7RF4tPiWMJ8n2MZ2mYJoFDYpVaqi9ikZqme6UoCEL5AL6XWV8+b
 7j87fGb8hvJLvdo6yIJZGnmE8E4AXI+nFHBd1vgw/ziftZGciRFPiNm6JyxoKk4XqR8R
 WZf76jy/wYt9SI4BubN6PAu11atHjFJc6O5BLQ/wS52aA2uWAtwaI3YInYvWOgACsamN
 lerEgJOmm6aVh2+Wsj1TQGiWtR6jEXRCBgn32lvkpTeYUci5pjr1cWJmIX6WHVJjzKoz
 j9cQiPlS9DuiiKiFzshN54SQEfYOJxDMmAKpOJLwvJXhgE/NrZVmiItvzv6iUdhqFKc8
 RcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zmkhJZgxUoBYEWfmUUPtlawWDiOOQTnvHmBTREcB0I8=;
 b=pM1UnnrRgsvHPnI8UBi4kd14QGgDKLwSnybRMq8K7Q+k9g3yu8mYcg40oP2oFwVS4v
 xitgHE2HhohVl4LDiTVV5WN0ebj9EHBIqTAXxsQN1nomXU9Cxqwg7SyG34UO9mvm60F1
 WVmT3wlG0THjvuTPAU7lgd7ru/ZFOqeAW5Fh/whK9+AlSzGofWM7Mgo065Mjj6LL4cXM
 ZcNwZPL2+QZ5td0Flefql+O+hh9XAx99G1i9v7eUGGgXOWH2eCBIQij2qMmsZ9c/hvnT
 o7LkZubKuF92fLgVVWiDgzNDJyoy2nypilnaJfVyRYSBlKfR+3AoqhmJaMsiuA9NbVlk
 kEeA==
X-Gm-Message-State: AOAM532x3FZpkl5/29GO7DVKtrsRkihoCpPZ/BBNeAR1RRkq+BRL8foj
 JAYQYJdhUICF1sry6kqRXWTaxQ==
X-Google-Smtp-Source: ABdhPJz6tjCEJEeOJPotO0Zqa9gAx16HRWTqIQ4PQRuPnenQfro7aG6soUq54MIbZLfLl+BS50n8vA==
X-Received: by 2002:a05:6808:95:: with SMTP id s21mr418519oic.80.1629934885805; 
 Wed, 25 Aug 2021 16:41:25 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g10sm267136oof.37.2021.08.25.16.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:41:25 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:42:33 -0700
Message-Id: <20210825234233.1721068-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/5] drm/msm/dp: Add sc8180x DP controllers
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

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Squashed DP and eDP data, as there's no reason to keep them separate today

 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4a6132c18e57..c1307230dc47 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -128,8 +128,15 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_dp = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0xae9a000 },
+	.num_dp = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
 	{}
 };
 
-- 
2.29.2

