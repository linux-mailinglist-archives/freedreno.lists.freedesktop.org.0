Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7394BF1FF
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 07:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C629610EF0D;
	Tue, 22 Feb 2022 06:22:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1636710EF38
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 06:22:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u20so22763292lff.2
 for <freedreno@lists.freedesktop.org>; Mon, 21 Feb 2022 22:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DcGm7ltYqskU4cKmyhujRtdVm6Wd95PkL411GLVzEg0=;
 b=ZOeIhdUl8aEQPWT0Lk9FhpAJNeRoEsOodBzDBZaHbHToDTJmeN5zGVJgRaaIuoTeP1
 hW2jr0//5VYifyiU0rPvnZWxkHVaBwP/WvgoPxMrdKPr7OZkr2LPDFvQbQne0XiDjzkH
 F7gT2Ex3L5oo79xqxF0ZY3LWXRMJqAkT5Bkmt3nsesc5PuSjDGRwucZjBH/SseFximdy
 Ttx8Yo+2TdyBoTqzRcQfAF3s01M/21IwMZR1OrFZ8u51915StsSAxT0T7bNpAqEHGUot
 RRol0OqhsCsVM4Wj9jfB3xZ6LgB1hRaCaS/J9yn6WkWETMuUI2iT1O/HNpcr4Vjz2zKH
 xP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DcGm7ltYqskU4cKmyhujRtdVm6Wd95PkL411GLVzEg0=;
 b=Kh2gGacQDW+7LykT9VOdYaJ8OrBe/KtfJP9EnjfMUAyF1nBrcv8hB8BH7463w6YLpC
 Q26039fRUf8CApFNuOxkguqebDqqyWkqNbYOb4dnILlKEOLWp+Lx+xE+rvf8iM4sDFnF
 ElhHGWMRZpxvqhICrNVLtbNp0kuyLZZms5//9WNcfBxoI5DfMKfpUcjTtjx3YX0UZNdD
 +SRy868j9M5Fri96RpFEa2GGTHDBdE0E+7PadnJWiYYh4nrxvXJ2hb9W/fnePmCCD2XG
 7opeB+HwJe2NpefBAc8625kqmZenKpbUWFlC5Pwheq99xOkqakVAePyQuO5JVHlPYw4/
 jR9A==
X-Gm-Message-State: AOAM5318GxMkBi9X+5gnVQ8zkePZw+26vhvAnZqUosYY44jiS1YVJr6W
 W321zpCHZrAwJtrd6f53MoAAlg==
X-Google-Smtp-Source: ABdhPJxTYyeAI3bxfHUqpTJltww19s0ePSzjABjzhBFX/t8IlsbAws1ZEMsucgUuFV1yeXo8ppEmgg==
X-Received: by 2002:ac2:4a65:0:b0:443:7f84:5e08 with SMTP id
 q5-20020ac24a65000000b004437f845e08mr16481610lfp.336.1645510969232; 
 Mon, 21 Feb 2022 22:22:49 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
 by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:22:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 22 Feb 2022 09:22:43 +0300
Message-Id: <20220222062246.242577-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/4] drm/msm/dpu: document INTF_EDP/INTF_DP
 difference
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Based on the discussions on the mailing list, document enum
dpu_intf_type and it's controversial fields: INTF_DP and INTF_EDP.

INTF_EDP is used for older eDP interface found on msm8x74/msm8x84
INTF_DP is used for both eDP and DP interfaces handled by the msm/dp
driver. The DPU driver does not make a difference between them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index bb9ceadeb0bb..4f8336cc7911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -205,12 +205,20 @@ enum dpu_intf {
 	INTF_MAX
 };
 
+/*
+ * Historically these values correspond to the values written to the
+ * DISP_INTF_SEL register, which had to programmed manually. On newer MDP
+ * generations this register is NOP, but we keep the values for historical
+ * reasons.
+ */
 enum dpu_intf_type {
 	INTF_NONE = 0x0,
 	INTF_DSI = 0x1,
 	INTF_HDMI = 0x3,
 	INTF_LCDC = 0x5,
+	/* old eDP found on 8x74 and 8x84 */
 	INTF_EDP = 0x9,
+	/* both DP and eDP,  handled by the new DP driver */
 	INTF_DP = 0xa,
 	INTF_TYPE_MAX,
 
-- 
2.34.1

