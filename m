Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD021B0088F
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 18:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F0C10E939;
	Thu, 10 Jul 2025 16:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ab7L4Azk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E27710E94E
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9mwZB2plhUHbudI2oPn9i55OvcjPNJuoUdisMW4qVI=;
 b=Ab7L4AzkvDYIUFcKvLiV+YCtWTe/1TjqoPiNWo3JWBhXWN49ndEkIC8DiJkGpAZqK8m9jR
 E/DUxf30POyf0quUeggBs+o7g/VHO9S++SP/o2+5epxBiKszrvvaTkaEohznYY2IzFpCd0
 AVrs5f21vWZreSmzoAPpE4cEv7ewAms=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120--azKjV2QM3u5BlhwiEHoDg-1; Thu, 10 Jul 2025 12:27:57 -0400
X-MC-Unique: -azKjV2QM3u5BlhwiEHoDg-1
X-Mimecast-MFC-AGG-ID: -azKjV2QM3u5BlhwiEHoDg_1752164877
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5bb68b386so299708685a.3
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164877; x=1752769677;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9mwZB2plhUHbudI2oPn9i55OvcjPNJuoUdisMW4qVI=;
 b=X8Up0diQ+le5Jih2y23i3ulAfE+XthH9sc3L/5CrkEsDRrsOWeEd8aqremEz6RoFH2
 un2ipU9MnctICeikbld2r+FVUh3Uirm5UKeqjKFI6PMvedkaODh1z//sP6obETnwDJV3
 0mcpZ7U2Y4WgzvSLGQsmdZOCHYJXJ+AQYenYptoe/XHtD/kVwxLDdEkn5LvpPv0iL1xP
 BDLGVs9AUcb4T5z2N2KajyrSYCiI8WtXg59S5bHrIolKaltPDfPH4yriow7ria9rty2b
 WCfh+lxMR60d6IDSlKNQdsv/dHwj/vwg3cQPa+ri0AxGmefnQKHqHX6k2tNQY5I3gtvI
 aRvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXalm13hu3nYUZ3XEVlJtpkGk+onqS/unYAxCTpT246Da0C9n/L5JwKAu2OuZ9YWaHyRNuRs4Vlbxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCB1tBSxE3mWG5vZvbjXL28c7+0wVOrZcJ+6oyofiCXNkvIaZp
 34TaiTmSLi5LaZMVOly/IkRwOq8ULwt/WRNOrqNRyGneXnizOHbhleeiPIKy7bu/eg6vj/AmA0v
 6GamWrddj/BWhS2+UnbXPVEj58zPNPAo+GwOkDH84qkwVLX/m8w0V3jWWZbp3DKiQd71x3Q==
X-Gm-Gg: ASbGnctt+B+wS6SiVp0jHG5APYSXisSh/1bNi4yH6W3CZLozBE1fx2tT8HNmQFrbd35
 U9SJmVn3SHgi+7KwlfBwG9v5PfTLm9ESI3xGLPf/1Shk/ycz3zlXM5DrNGEt5r+OxVDXkwqzLkQ
 ZGZX9s4/09bEofoZcVMh2/cEncMVwwsMikaS0z9VdpPcc9cwpmCaP8/ZblOTLFzYj163417zyfg
 qE4UJJsj/lq8vQRA0o/SGi2BVCYDuegO4oKDA5iO76dLDVuX6cl7Z9gX9NDaAXmQVQnRmND+g8S
 rd7TrRgotnRFeeJyRaCQIETAfRVJY5qWqC7Q21QOd8LjeTONwo9XCy8bvXJF
X-Received: by 2002:a05:620a:720d:b0:7ca:efed:8644 with SMTP id
 af79cd13be357-7dde9d4b40emr22153685a.5.1752164877029; 
 Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5Dc+meUY3eLJ1nyNqdTNqbIqZwCg2pxyiI+KO5nsXIe7JUd0ZvtudqCR2DM307gX30VZuYQ==
X-Received: by 2002:a05:620a:720d:b0:7ca:efed:8644 with SMTP id
 af79cd13be357-7dde9d4b40emr22149985a.5.1752164876637; 
 Thu, 10 Jul 2025 09:27:56 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:30 -0400
Subject: [PATCH 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-4-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=2599;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3ODFGmq25OpFxWiAcH0OIyfIX2aQaxGLNyYzCPsECGw=;
 b=6/oStFWVrSUL8wUy/Yr+UeM9R3GqucZAe/BmJ+rdDWThekiBeQJQsTbUFCiwYDPvTUlOQurv+
 kZVgof83EB5BMQUlmdA4vkC4n6yoCb7TJpusAuMVQfBfOhbDoFBQBI1
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QVo09vfHN9YCPehheQvl8l4MUGggLtwk6s5y-13DryU_1752164877
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
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 90348a2af3e9dac72924561b23b169a268abc3b0..6f500f6ac72813b542775e392680499f2eea6df5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -533,21 +533,21 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
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
+	if (req->rate < pll_28nm->phy->cfg->min_pll_rate)
+		req->rate = pll_28nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_28nm->phy->cfg->max_pll_rate)
+		req->rate = pll_28nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_hpm,
@@ -556,7 +556,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_lp,
@@ -565,7 +565,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_8226 = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_8226,

-- 
2.50.0

