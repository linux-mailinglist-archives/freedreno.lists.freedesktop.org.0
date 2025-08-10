Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12BEB1FCEF
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 00:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1E710E370;
	Sun, 10 Aug 2025 22:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zqz+NHMQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E73B10E373
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 22:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fp8kcGzYjp0wtOJJXm9d94iWK2Lu7bI5800+AHFvd0g=;
 b=Zqz+NHMQMlAMLdtcFzqxnidA6dCBb/wXSZS25bH+/2m+EM8oiUY2kvPWvs6KyB7U5mjoYJ
 71prUimDXUxFaNSz6ShgTzVsSCnkhG53R1eYOXVMijYolCUv2yKG+nczJn5QOgBn99wzsz
 IriGlQadQUToPNq9QeNKoLUlWvuQ+UM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-RFD_fCs6OjiVbkGqbB1xrQ-1; Sun, 10 Aug 2025 18:58:07 -0400
X-MC-Unique: RFD_fCs6OjiVbkGqbB1xrQ-1
X-Mimecast-MFC-AGG-ID: RFD_fCs6OjiVbkGqbB1xrQ_1754866687
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70771983a52so83237076d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 15:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866687; x=1755471487;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fp8kcGzYjp0wtOJJXm9d94iWK2Lu7bI5800+AHFvd0g=;
 b=phOgL3kgIRRNvsQ4uwKkCppn0tt/ygmZugvK4Sk6+QZsUdqM9PHddDXPtYCoI6ADYq
 WGqK4sVWX/CpAdbtGxTCQntDQY+a7imgoyhP2xxpqCzatwg+UwI37u/eNr9GA97KxfHi
 CRn2rv3U1Ph3xCPwOeabdq3egTToY0c5OzKqlN1JstdYB5x2/jGRrDamAgii9xoxo4HZ
 XB5/J236Yjh1q7SVmi/kTvpyqC8tdkGjBpWO10ijqY2Y7zp5lOTeQxgrAXkJyEQlVl1M
 VR/vk/Kip2YpQx1Zpy+xwHOSown7DeXScAKa29C2iG6LkJM4gPIZ6GkonSLMSdSb8XH6
 ZCtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvNMe/cZVBLyXOrb2Yg+JFgvmPof6BgLee4tCPQDFFAbGzQ0G8tKSzB7SbYAeNGY7Z5bpoWVvLoGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTe5SVuzFoIl/qKEJJM5JySRTLsepcFQEicwfkmEQmCT13WPUr
 OPplTOaDt41n+f1AWH9m8V+k3rj2Z1GPjpWCWkCIBSSZ3fM9oagMbDdvh/P/mhyYoby8HG/7XlC
 lOQWCbsSxIpdWZ7I9Q0EKa9mqBCjO6Sjze1KjGDuqWRwXeZP60FUEsAwkV1k4xsYLGfPhdQ==
X-Gm-Gg: ASbGnct39nnJNN3aWjC/wpaMy0RdipnMbLkas/1h0teDkok00PCPFnfPwmE/qL3x94m
 HKZFGhkJVg2gNGktTjZuPLiKfzgz7tHvLxuljdmRsCjybAZGqBy2P0WaFGyv4lJ9WTBTZo8JxGO
 XyyuFzsrmGBigG+3friKC3XsHc6jV5RtCXQLhRMaQwANluUzfFowOfRw4yYaztsbNbebCp7m+kh
 yRN33RH53Y9iNu29SqQIwxKKOmN2zlaY2zBKFjS9u5H/K9zad2F/h7SrXKC3kHlm4x0rKggmuJX
 VlvB61z9tU3OwVCtEhVlqqdIYBHnP2VACg8P9jcbzNHILhgRDngsiyn2eoGGOALI54d+rmKfGSG
 IXxGz5g==
X-Received: by 2002:ad4:5ced:0:b0:702:d6e2:3894 with SMTP id
 6a1803df08f44-7099a283fc6mr144909856d6.9.1754866686897; 
 Sun, 10 Aug 2025 15:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+GPlWVCW9ekKhJg+4g3e28+6oQCiHZCjU/hLom4Wlvy0t+z7ug+DcZyM9qyvldH93bCaBnw==
X-Received: by 2002:ad4:5ced:0:b0:702:d6e2:3894 with SMTP id
 6a1803df08f44-7099a283fc6mr144909686d6.9.1754866686533; 
 Sun, 10 Aug 2025 15:58:06 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:58:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:30 -0400
Subject: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=1762;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=09r1lPX7B14MLSuVQJ4dsJkrsJaORU9d2LSd/fRzU/Y=;
 b=Ltcr7gblllRTjthopo3qUDdfH31xXqXg3Eunr1kVSjwIRzMGT80F8gmAILsYimdJaEURAIIXT
 DQUfMhrW4ldDGWChbsCXStaOBBf3jn9wUuWO/HCkvaN+TS3qKQngYao
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xOS9u2xuJNhMAFkYqZUDsYl8YItgKMB6tZKzYSOv-y4_1754866687
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 8c8d80b59573a37a4008752b16e094a218802508..36e928b0fd5a319b6a12b9be52705c067d51c20b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -629,16 +629,12 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8996_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8996_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+
+	return 0;
 }
 
 static unsigned long hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
@@ -684,7 +680,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
-	.round_rate = hdmi_8996_pll_round_rate,
+	.determine_rate = hdmi_8996_pll_determine_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
 	.prepare = hdmi_8996_pll_prepare,
 	.unprepare = hdmi_8996_pll_unprepare,

-- 
2.50.1

