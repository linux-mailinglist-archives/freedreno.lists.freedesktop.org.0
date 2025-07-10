Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7287B00A25
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 19:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB18D10E933;
	Thu, 10 Jul 2025 17:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="THsnD/UA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE4A10E946
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
 b=THsnD/UA0hn3cdsOaaayeVsUI/I7PyBZoNLeexfE7Ix1/Ezhzc2P7lFc2zjkmxESmSf6tu
 AsYRJ30KYZKxYjzg/AcTYqrt/nvtIup50+S2gdA6i68A9hw6YAZSwK6BWEdMax69xuNkB8
 bTkykjp5jRN+RTZdyTAWSyQeZ2XzY68=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-nQdbv2vIPIq2csgEVLVrVg-1; Thu, 10 Jul 2025 13:43:30 -0400
X-MC-Unique: nQdbv2vIPIq2csgEVLVrVg-1
X-Mimecast-MFC-AGG-ID: nQdbv2vIPIq2csgEVLVrVg_1752169410
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d460764849so405836985a.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169410; x=1752774210;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
 b=acyaxXsiDftLtdP0tivHwwGwWPRRTyppvrCaaxUjy5O146AimnBG9c4TL7U/RopdYI
 8Kg0RGzg9calkJPmjLHxDuFc/zXh0kWI5Cb1CBc4F2/HPwuADGwOC2nL8gZ9p7h9M928
 bvz3uKCxZYHd9IyAVpPs4Z5YfKWIw9uIVZv0LBlpb5aH50ObTWSXCsArT3h2mibhWsYA
 1O8CUBz91BOswQwMgJhZciD94kW7Ou13spZtRb5785N+GX6IkXkxnB4fOO25oupiHu1u
 4mcb+qJ7x8iCG2M43y6wSD6XGxVy5+e5fx/0+2+pb9m7pVrkIu4KT0TlOlCFsS/+8YPT
 C1BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW55siG8uNpX2PFK667ImzZGAmdnlanXS3JhVQbDP0NB3j8uVA60FOKKMpmyyqo5QXlrsqACHDh7OA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY3aDc80Vd+dIlO1lDIfFsClWtiFWcueRW7R8/YbM0DbvFWTar
 0JsebG1qvejbrBQWW0Qpb5z5PARBpRYHzKPlFaD8WF8LQwezkX2EOWtw0hab/VyRkq/B0vtguWS
 1hinxIc1QkpCYRo56JPv22vMeBh8syKf58va9TopJrB0obgHHRzwbJDCt7TpwTOUraCZaIQ==
X-Gm-Gg: ASbGncv3x1/5ZW4kaAwbv1IN1OpSlcaIjR91Uw2katHRQM2yYQvRZI48tHTS1Jl+pyJ
 hKBGuE29l8XKMHvea5ZIxxly9akHc6oLjDR3NfYIZZximEVsDIzwppEkZauRPRiMjqTByQcYDnC
 4QBUTD6f+GE7zf9ZksLirO5wlYD5plzbag9fh8H02SgpX2OhLa5DGWLU/JZgRtGcOL0AEUKgUBR
 YYaxEbqtABiPOf1np+Fz2XNRQN3p3Y0Dy80PA6t3JFf1qU+tSb597z5XdjOW8JQ6O0pzv0n2xMr
 QQdgX/09aRKsCdUwSnWQGdD4WimxWHztBfHnMYtLf9d/PprSEXiTYEJPs+99
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id
 af79cd13be357-7dc97da02f2mr646711985a.9.1752169409741; 
 Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtGRA59X5211+zA6+bTuLexmbhranU9s00ouhgxHCHsr1K/Q7uZzJEn/YRVuxvQ5eKEuxqlg==
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id
 af79cd13be357-7dc97da02f2mr646704785a.9.1752169409169; 
 Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:05 -0400
Subject: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1532;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
 b=xNXPieWXOwE6YijWTJ3taaQPCPf8/+I1K7+s2EiMedGqecECqqLSQTFSwjhrnG/onGaKSV32p
 isG7Au5aNEyCqmbZJtcC9vC7jvxXBrzxoAluzBC1poKDa0ziZwvE41x
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pPMX3cqvaxwb_xjf9GbwxQMXhcW0lDoE6KhVRiIFW0E_1752169410
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
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index 83c8781fcc3f6e1db99cfec64055ee5f359e49e5..6ba6bbdb7e05304f0a4be269384b7b9a5d6c668a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -373,12 +373,14 @@ static unsigned long hdmi_pll_recalc_rate(struct clk_hw *hw,
 	return pll->pixclk;
 }
 
-static long hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int hdmi_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
 
-	return pll_rate->rate;
+	return 0;
 }
 
 static int hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -402,7 +404,7 @@ static const struct clk_ops hdmi_pll_ops = {
 	.enable = hdmi_pll_enable,
 	.disable = hdmi_pll_disable,
 	.recalc_rate = hdmi_pll_recalc_rate,
-	.round_rate = hdmi_pll_round_rate,
+	.determine_rate = hdmi_pll_determine_rate,
 	.set_rate = hdmi_pll_set_rate,
 };
 

-- 
2.50.0

