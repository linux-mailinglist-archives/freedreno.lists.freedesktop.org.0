Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB0B2068F
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7A010E441;
	Mon, 11 Aug 2025 10:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jISHvdsY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A28A10E446
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
 b=jISHvdsYD6jcN7/wvI7KnETLgeVyEt8rq00LMA7opD7JpD2RNXUei2xFUrah4/AXn3PIje
 4Z0tMauhQi5rYOvvK/NJ4HFUmbijTJGASrzoMMYJtMnOy2xOJ7ZSVDfFdznWiJoB6PqGOs
 nDuX7zhdhWOU9VJoz+gIpKRtfCnCIRw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-V3uw7G8kM1SDKFd-ejzqOA-1; Mon, 11 Aug 2025 06:56:49 -0400
X-MC-Unique: V3uw7G8kM1SDKFd-ejzqOA-1
X-Mimecast-MFC-AGG-ID: V3uw7G8kM1SDKFd-ejzqOA_1754909808
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e665a0cddcso990524085a.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909808; x=1755514608;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
 b=VH+b8H2wtwemWMdyKovc6szbQx/PWBTkdWEg9SHRvlfRuNhlQ0SqTHhiCXYqRMw9aD
 a+mwNFBhyXc0xF30tXCqKG0UyJsgrqXXULA6tjH/CKfvYPlDOapa3OUJueEiavgKS0tw
 hoLt2c5UZ9b1Wc09NdlcXFGLeV3WCjOK2bXat5x3awXinehBgw+wKspGvA6XuBNK64dJ
 63yFe92/N5GiZa2YpR5+O+LvTakPMTOoAPpPtfwinLn/9aGcnNMfH0MvVgvA8fANY4K2
 NkTVgCLlfHjgKQHr70t55aA8ckpgWVQdUBVkwqcA2QFMZemRdQHyQECkTQGm9vl3S0Ym
 O57w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqwqdNDY6eVQ7i/AOxDhwn5zIL5u+TTP6SrUzocCckdtitPpt4WJB8+sO7bL8DqMTKDYIuXr87jOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnLJIG504g71xYLWSQPDUDlm9VUmO29jJj1cmwMe+gJzenZLah
 w/mddowndlgdBtZ/Knctvvzu1ScHsLWM/RJVAP+ShGEcWHJYzW87ccJGzXXS7tV3pOq5TM8Mxwp
 LuKRYyIJ494hvz0R4JnUS51T7r8zOwFKq2/VZIdhXYWyWiznwkHkQIPjar7pz95foE4DDPQ==
X-Gm-Gg: ASbGncslKWi6caszN9tOnPW8N5lSWzzrwtG/EDomGgVryKaTaw1GH0VjqKrQcR7vWD1
 dZvhbe4Htxmx2hzDNSVae5+JXtadAlTKxacA6DIC/a3vJUK0c19zKoe3/aR61apwbb5+SUuNk4K
 5UZSZ1Ni2FU79B2fHZGH0h4Fupt8fraVk47A5fq3ywNx+XkJ8AeWws9zuxNEn3gARLcmc8wAcjt
 y2+yGptnZsRIKdOHeigtKeCYU/InsH9b5ChfSthj2UTx5DjeNKJFiIOnaqRUZttK8xetHA2Vb4i
 icysyHyG8NRc9Q/r7rSDuvZ7wCOaPhj/8gPaDV2O3+/v4uhx58xw9AVaYrpXAJLEAtUG6n1tpDl
 LBMQ=
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id
 af79cd13be357-7e82c75b89cmr1125687185a.34.1754909808557; 
 Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnLELhezGJADLmdApayEoevKdtEKOKSDSvgPhqkzq4hJSUIbUnZL0k2iE8nto9nf3DAncrQ==
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id
 af79cd13be357-7e82c75b89cmr1125683685a.34.1754909808062; 
 Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:11 -0400
Subject: [PATCH v2 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2162;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
 b=srQL2Syf3qoqHVxtrhYtzT2hxKDJiG2H0/4WtgjDA8OLuly+icCFFE04ANS8bywbgRo5Semzj
 RZvKazBg3coDcnWyiIki4FOxz5OPAdab1K8jRW40iEHpLbopisMgRC3
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MZVbStBMgrEmWyU9dvj60nGz3uU_McCyUgWAvSM6kWY_1754909808
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

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)lvds->pixel_clock_rate;
 }
 
-static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
 	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
@@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	mode = list_first_entry(&connector->modes,
 				struct drm_display_mode, head);
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	if (lvds_is_dual_link(lvds->link_type))
 		multiplier = 2;
@@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
 					 * 1000 * multiplier / 7;
 
-	return lvds->pixel_clock_rate;
+	req->rate = lvds->pixel_clock_rate;
+
+	return 0;
 }
 
 static const struct clk_ops lvds_pixel_clk_ops = {
 	.enable = lvds_pixel_clk_enable,
 	.disable = lvds_pixel_clk_disable,
 	.recalc_rate = lvds_pixel_clk_recalc_rate,
-	.round_rate = lvds_pixel_clk_round_rate,
+	.determine_rate = lvds_pixel_clk_determine_rate,
 };
 
 static const struct clk_init_data clk_data = {

-- 
2.50.1

