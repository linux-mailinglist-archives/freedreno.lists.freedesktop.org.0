Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D441F429
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 19:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865036EEBB;
	Fri,  1 Oct 2021 17:59:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F326EEB4
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 17:59:17 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u22so12445234oie.5
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JI+sywciYnZbmZEgEJHRDL/J7+jew9UCDT1hip8NvrU=;
 b=FyoEbdW2FqsPcEhkuzRiqeAZHw3KxbHbOcE66Ei50UA+S5jXlr/d7sRdoPXj0zrPM/
 76r6rt7i+ccdj+mTerjrunN45spBenJDBib2hBvA6rhfnWpjHqmkNK5z5wJgO+jXn4p0
 h8raVVABtgEso+pTjYoll7GzjNoJgFGPIE/Q/rcwKVRadh1jHI48y9214q0FbwcNp5WJ
 M0pg+/b8khuqIFspFtwtwhAfa+JcRwQ+TBmb6BrtuIUOUSEYZ1bb5ZiQFC4p5TnMblcg
 zSxLtACQTor8eVznN8PPWSFJWfAADp52R487S2riQYeeqU7BpyvBkm9YvYD7Txy3HbMS
 Q8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JI+sywciYnZbmZEgEJHRDL/J7+jew9UCDT1hip8NvrU=;
 b=b7GxaQuJ5RPzhgI1KIW0wv9AU0DXcG7FLC8dGTBgxZzcaEn2gdEz9xoFH2ECwiA9Fy
 Io0JRFx7oiv+UC4T8Nf13N/BVsN2ZvZY+mxXwQKqqfG1z+V1nLmbSpAaDBVL+ibEsVX9
 mJ2H3TjmJGNjZjASYXmcvjrLf4PB1NUOQtSYw9D2hXuSHoja5l3g6E8ucOm0+qiBcK08
 hBowAAfhnXubnYOKWLvSMxjofwdptihVysOpz7A62Jz4cAkaPwKfEaZ69V0nLvhF+4Xg
 OT/NtWgRF9GY7WBf+LucfHWxdk8xSIGT5A5ALF0Ad2UxPWjHApQCVfaosDOR8CHzc5cb
 2X1A==
X-Gm-Message-State: AOAM530aKtyG/vFx9bMIxcYMDs3+hTCByl2HBSqgwA2AByh9El3yz78q
 b1PjKhWjtf3zHKN7jG7Rwho+Gg==
X-Google-Smtp-Source: ABdhPJy4WkvL2DtpKyrAXS99LAVSyxpiYi/tK7s8P4u/fX707mFCaQdncul2tax8VCgac4O/k7y/dQ==
X-Received: by 2002:aca:f189:: with SMTP id p131mr4906839oih.128.1633111156385; 
 Fri, 01 Oct 2021 10:59:16 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w2sm1284798oof.23.2021.10.01.10.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:59:16 -0700 (PDT)
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
Date: Fri,  1 Oct 2021 11:00:58 -0700
Message-Id: <20211001180058.1021913-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/5] drm/msm/dp: Add sc8180x DP controllers
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ff3477474c5d..56a79aeffed4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -127,8 +127,15 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_descs = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0xae9a000 },
+	.num_descs = 3,
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

