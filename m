Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF7B00A2F
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 19:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5AC10E93D;
	Thu, 10 Jul 2025 17:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bf04nEx0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5404B10E942
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
 b=bf04nEx0dTsFnBz0FnsfMherIlVredqc/boFKqEO0tTDsCBTGhn21zJiohRKQ+2Bb6sTjK
 pNgM4Tq44s9XZWPy2Wu9qiZKPNybRffm745KxOGzzngWaYN0dRXssXwcfIfggZsgxd6gpX
 S5WG3c2SpW57I+tgx2GDmoCiB2ULDuA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-MGymeeyfOvGk_q58BQoBUg-1; Thu, 10 Jul 2025 13:43:35 -0400
X-MC-Unique: MGymeeyfOvGk_q58BQoBUg-1
X-Mimecast-MFC-AGG-ID: MGymeeyfOvGk_q58BQoBUg_1752169413
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fb50d92061so18250306d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169413; x=1752774213;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
 b=mFnrN54XbvwQJQxfpN/mSbA44/V3FhLELUwasEpHPKRWov/w7fxUJ/a6RM7SHV//Qk
 3fseswm33cMooF08z+7eFt5MkvK/pwC8acz7Xij+EN4leeCDTrCDixs3irG0Vec+pDHX
 WgfgqFerHu/bKF5IN/r5/nQSUzOOBaVNj3K0OvrwAmLcq4DoJJtUsVDlwelQwSjA6qJ8
 rcPdWobjH58AruPy6qw0PuNTyzwbkUaU4HhrtykViOl2W3hXvrxFAJ5Zp9iHT8ZW7/tH
 wRnFVeP+kfxEjWuE7BoyCvH4dDL9kMXtV9zM8kl4QalmEKUUJFMkZKhiVCG68okuqf0m
 q9IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVShQng4F+P7yhwcgrgj2T/E6X+vX5jGuyoKSQhbNuX1H1Pc4uK0feZhkicbOyjJS0SOSxuICbncIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg5s6+QwpBGukboqOOPwc7C0t38o703z76GrnbcIyF5vHihg3R
 luueObYX8pbeYvcv2q/rOtgv0V8NftwGMQOTCpISK9C7J4iodQ3GiY6oWgWYt8BlauiqwXoRyT3
 9jqB13Jr9FKg7d3GRz6vrHnwCfkGacoKAbXuAo10S85l6S+/Oa/f2ya/GidzU5VqJ+vuTYA==
X-Gm-Gg: ASbGnct7L/522YDU9vlbh95c9YRohMYTKRWcl5AukoSKojBRIS8ozsLGF6m2Btej0Mm
 ZP+xzsglF2SSQWQoPuQu4XM/A3C4Pdswqyazi4gX6uoeeiauSLvxC9A1IeRBunOJz0i2xRx69ki
 BY9pWZ3xiOuMcOOtFlHB0bZ8XRh/mL3oOG61ABZ9VHGB9GXzKZHwTj4lGpYmz0xgHpehZxxwGi3
 AY1dT/xUbsccVaEwzp+t1/UfYkHlWZq5Mn4ehwNIAN6E+n23zOnuL35LRheYV4wNlT9AGsxpxuP
 IQu/9w0JcWrhHZvypynGLIACRdPObpMRFrhdXUW5pfNkif1JfyeAq2ILsdPQ
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id
 6a1803df08f44-704a3a4449cmr3580936d6.38.1752169412790; 
 Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpu8L3YGRW12uiQDpOxMNgeR30Y84ZsZlrx/wXIc8LbcnhH9LwZm0nYnuoy1dfBl7P78vOQw==
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id
 6a1803df08f44-704a3a4449cmr3580236d6.38.1752169412340; 
 Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:06 -0400
Subject: [PATCH 5/9] drm/pl111: convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1663;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Uzde4F/sfQBVHQNcjDIBT9HB34JjyGuqbe7jNdblqLw=;
 b=0pYUMWvjxgx4WfuoWRCVGEVL5ZYYPMN0neD5N8OcfZKIHag1vghAK3SLtnfFRHjfYafmDTVi+
 fTHFTPespiOCXPSLsOLNifbUMGk0HbP0Ww4Oh/+lSRoq6wnUOICkRwy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IvMo-TMhB2WqIz1MfH21Wy6OWVjIGRMssrCw8BSNNm8_1752169413
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
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.0

