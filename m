Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314BB1FCE8
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 00:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115810E371;
	Sun, 10 Aug 2025 22:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YGvPqkJT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10610E373
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 22:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBLZ3cfmxr+kqQkwT3NrM5Of/dkFLZw54pOqr7tKcVM=;
 b=YGvPqkJTqPF18WrxSjlm2zaooXZGPHxoUAYSyqJHo33ZuHpLuBG1QlEQGV9+nZ0PIjS4K6
 pddYqkr/uNMUjWfUP+gIjn9z4sI9HWecPFRMb+bZCoVSmyo9bzH7vevdtjpbcXfI0BGsA7
 szZ7cN2Y64oK9Ry2GnJECugw7HQ1/S0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-mos9k8A2PJGEyC4vFGwF0Q-1; Sun, 10 Aug 2025 18:57:57 -0400
X-MC-Unique: mos9k8A2PJGEyC4vFGwF0Q-1
X-Mimecast-MFC-AGG-ID: mos9k8A2PJGEyC4vFGwF0Q_1754866676
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70771983a52so83235816d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 15:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866676; x=1755471476;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBLZ3cfmxr+kqQkwT3NrM5Of/dkFLZw54pOqr7tKcVM=;
 b=QuvIKPgjkQo8DGWW4O8m6mPfR8axY+dypUO59hnJ+yJacbcrSZoGT+bOHmXXtaWoSh
 cUB8He+O5k0XS1wrl7P0rb6iyM6im9hG4/0c8mHfrCqlsu3hGlatpd1W4GiJ4rfqssAS
 upXGUzc4dq/EcG2MXD8x+P0iO5e+0pFG2Dr3Pc/B8fikUc0x1N9BUaZaP+m0qZQp+zP8
 eH4+wunnqrXqgySYNzO//K10OsSEIe1B30i4wXcX0xE1O6aeKaHreWu8BechhooThLVX
 /lvd7EBQq6I+hD9UA1elF55h4rlcvuiYoJcIO8K1rhWPrgtqd8S/yusU7pE/cXNfPEDT
 hT0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQVKyOlyPwvTeCzmsWG/b7nVC8ip+aqeIfQJ2sV+YW+reGc8xnO//bj/3kHK67OW1aK+YLybxFYYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysUr7nyAeZvqT2Q0nmdM4tSmB+680VUqfM5niw8Hrh9DoYiKck
 y/ufEsAB9ZIMJ4pLlax5JNuM65uLUuUZKheFnUMNu1S6G503HSoSBOiX4R2hoT4tdnQ00Xx+Umb
 UTCZ5SnAoHz6UJL0lsYrwgaul4D8chxUX1rkV+6WD7BF+3nXoVlCt7omdSzR9fpM2HbZICg==
X-Gm-Gg: ASbGnctIn56iJd9EHTEJiW1eZxcQI8KHE8iCn6dDyiDM4vu0wbBvC+kQTfbh4zppawl
 uOodzL/COof70DPiTQau0BbFNzKKICSHcfZ/DNcST47s5zQlz8g5rAaGt3B+/lEyH6r3kTmkdXl
 IncWEghf4pbRlMjTPwxndsM8C7u+rjWs/vARqGyALimAOP7hQbi1iFOYvNgA9aUrXZaRQhkhxBF
 h/tzaNC9bw48p8TWQYD5Swcakcj44BbgCebKKFwFdpNE1YIMjLMxpL2CtkK2DddkuMeZgCCh+GW
 UY1ixcvuXCjM3eARxmN3qekyhONPl83q7HHemzmHgJ1rwmDrp9Pct+cvdnBPJ5BZiL+xMXzX7Us
 cwJw9UQ==
X-Received: by 2002:a05:6214:4585:b0:709:b911:5f9a with SMTP id
 6a1803df08f44-709b9116168mr79859836d6.15.1754866676469; 
 Sun, 10 Aug 2025 15:57:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd1TtWL5ynfgJb6QbL2wAAD9tHrHovMXdTygkPUrPT2VeRi/mGn+68aKi3/k5cra2LUregkg==
X-Received: by 2002:a05:6214:4585:b0:709:b911:5f9a with SMTP id
 6a1803df08f44-709b9116168mr79859716d6.15.1754866676119; 
 Sun, 10 Aug 2025 15:57:56 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:57:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:28 -0400
Subject: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=2571;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=p3ik0LUSdZ7pAUi9CZauKm9YuXyhxLdYH6tXOMz9RD8=;
 b=R7LKKqyn/rze/YXErkV3FfpM8ZZMu5HZaOQr/tvP8aTxcbbN5RaDR0RWZNNF6WqbyaV3q+ft9
 fhWV9Cc8U6ZAQX8LrMGjTqjByHpN1lvRTa0Cj7+2O1r3z78hDY0dUWJ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JZdD0rIf-SRGHPJxTZv20qz8EbpQCr7_A4ws1IYOsuQ_1754866676
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 90348a2af3e9dac72924561b23b169a268abc3b0..d00e415b9a991cd515e01d78a48ac6fe3e830b04 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -533,21 +533,20 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	pll_28nm->phy->pll_on = false;
 }
 
-static long dsi_pll_28nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_28nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	if      (rate < pll_28nm->phy->cfg->min_pll_rate)
-		return  pll_28nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_28nm->phy->cfg->max_pll_rate)
-		return  pll_28nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_28nm->phy->cfg->min_pll_rate,
+			    pll_28nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_hpm,
@@ -556,7 +555,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_lp,
@@ -565,7 +564,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_8226 = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_8226,

-- 
2.50.1

