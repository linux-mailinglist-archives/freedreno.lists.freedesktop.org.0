Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD77B00898
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 18:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF61F10E93B;
	Thu, 10 Jul 2025 16:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h4paDYuS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D666710E938
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Xtq1jz6n71Dy+bt87oxFW7ajsd8mfrICRfv5Quboec=;
 b=h4paDYuSUGip6ZT8Rdb/DeLw5S5TpctczzxGAU+z7WmyIZGvAqVuGlZkPaOLIS3vbTgyr/
 E1aS1xGbuye4aIEsuxqFghENdtzNIvCnxE6tFC1w4mrsTUPlXZiKP2Eoxl+8JFVS4/5jdF
 XXJp7zkzYGn75gmGvhviUWn3ZTrGrg8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-HbTCF8OVN_-4PEJR2esisw-1; Thu, 10 Jul 2025 12:28:05 -0400
X-MC-Unique: HbTCF8OVN_-4PEJR2esisw-1
X-Mimecast-MFC-AGG-ID: HbTCF8OVN_-4PEJR2esisw_1752164885
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso191643785a.2
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 09:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164884; x=1752769684;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Xtq1jz6n71Dy+bt87oxFW7ajsd8mfrICRfv5Quboec=;
 b=Gg1/ndX4jDd34spdDKE+0zW2hT3IacWsOypSOgS2d/aFvPZojrDIh9wx+y8hdYzPZY
 MkzbMfoiOxFEQJdCTUEMuJ43WEGV/8NDpL+nlJnx9aBLf5VjOrIcQM10e2W98A/T1KF+
 1iplG8xbVezpEhzQfNF+NezpyEF7MrbEUlAb3eSTibVgAmxsGbJlM8aonEEQZMzlRtcp
 yXq70ZCJAyslnTam8N2xBMRTXAjAKe+Na1ovcXcYot2yrGjxtloFRAkmEkrde1vZdTm1
 nbTwKcRvaaNorQLEMv4ZpkjnE40CSQpZ8dl1sFZltVrfM1pyJ7XVoIrXcnXzwO4ch9SZ
 7ZsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXZMTAiwZtmpqZEE0CFKeiZOYLrSua5bvxAYUca/KBjRomWXon8QY36zeLPWqKOoYwuAHGvFuicuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFV6Aggurr+wi/VPq2whmKSqJ2GNs9Imw7MGsHux+rLGmYKtGE
 52fTk+ZaXgr6YQWxz8wkUJ8mqJDkGelaWlyutmmf/oXPgrNrplhnKc3ukaEheZ3OOfctDPSZEg4
 iH0meo+Ueok6wu6mTpu5zMm6RMB4/OHlW0ul+aUFBbnfux8HYHKUrKTyyGLEc1mqIR7LnaA==
X-Gm-Gg: ASbGncst7Plu7Wbab6lBa1q9D6a6ErfatT7LoRo8tdCW3Xi7sj86lwRofTuRSxwfKcl
 FMY11fywHmO0H4DKWY3oG/sqk5nroAdxPIyWz4hBFLy0DbPEbjKq1P6GVy6fGuJoSE2M12JuhHJ
 jNsS7EcnlO2de6O9b1LXcdZlaaA0s7C3mkBQp94bjYKuNudIVCsvDddOinXTJBQ+u83wkc/13sh
 6+mwlEDj7y1H9oWmvANZEAQSjxslbO0o7Tk6LVNgi8ZLnlMzP4er7kIbmCKha6GwFE/aIIKdS3v
 5QDPjpL2BuKbv4Ltk6RMir/AXkbFymxn8LaKkFFDGldaMNfNZkWBffHV7s6V
X-Received: by 2002:a05:620a:44cb:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7dde99531bcmr30407185a.8.1752164884663; 
 Thu, 10 Jul 2025 09:28:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELaboKc3+hjD+wF+4ZlA27Ur9xvHDNgGpesankgXOM9I1Jmb0Ok1BCSCTBE3suBwc7QsxRkg==
X-Received: by 2002:a05:620a:44cb:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7dde99531bcmr30403485a.8.1752164884325; 
 Thu, 10 Jul 2025 09:28:04 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:33 -0400
Subject: [PATCH 7/7] drm/msm/hdmi_phy_8998: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-7-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1782;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=BdI4rced+HRKEB2cmVryNQG/zmpG45m97LWG2DtYv+I=;
 b=TGLhjj+IbzrNkeyKAWH/BPgTzIXuHRUMwL4erGFA0ZAfeBxyeP21kE2dmaW8XV4SrlkFC/vcy
 qZPJbO/GVg3D/lDY67azp4PfWKp8qH7F1AEDRFbNeKNdzHsxXleu+Nf
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s5zZs9R6qppI-WoGLsSPIdQwoEXLL7C93Fzb1aEgag0_1752164885
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..7d6381553eb8cb5b18b898a734d928d34f98ebb0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -646,16 +646,15 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8998_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8998_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
+	if (req->rate < HDMI_PCLK_MIN_FREQ)
+		req->rate = HDMI_PCLK_MIN_FREQ;
+	else if (req->rate > HDMI_PCLK_MAX_FREQ)
+		req->rate = HDMI_PCLK_MAX_FREQ;
+
+	return 0;
 }
 
 static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
@@ -688,7 +687,7 @@ static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8998_pll_ops = {
 	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
+	.determine_rate = hdmi_8998_pll_determine_rate,
 	.recalc_rate = hdmi_8998_pll_recalc_rate,
 	.prepare = hdmi_8998_pll_prepare,
 	.unprepare = hdmi_8998_pll_unprepare,

-- 
2.50.0

