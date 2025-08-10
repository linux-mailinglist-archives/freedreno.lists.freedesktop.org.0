Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CDB1FCF3
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 00:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B1F10E374;
	Sun, 10 Aug 2025 22:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D2kM4GYt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D84110E375
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbrTb5TIWzNpxLExdP2beMCh0zMQGTK+0dHd5wdG15k=;
 b=D2kM4GYtpy3MRtgGqEIc73oaruJOEH5xA+MD5zSi2oR3aKMcCc9+MdOSLk12qiBL8v5MuB
 NeMIMe4KNmxCPrAGR3TjljxLmpM5GmAmMhj8DTCFuc+TMxy2IUgeTpRCyYzUvKVyx8vBG4
 HNclJAcJUJtyp7KcEl/1RqDeocrY4+s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-zTbCfYg4PdWsXbA5Tuhbiw-1; Sun, 10 Aug 2025 18:58:11 -0400
X-MC-Unique: zTbCfYg4PdWsXbA5Tuhbiw-1
X-Mimecast-MFC-AGG-ID: zTbCfYg4PdWsXbA5Tuhbiw_1754866690
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e809830338so1315959185a.1
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 15:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866690; x=1755471490;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbrTb5TIWzNpxLExdP2beMCh0zMQGTK+0dHd5wdG15k=;
 b=QoV9Kuu7JsmfJMacq8yXFim7PBWDpWZbU6UMYOEdxKhG1Zbr7KpusBG1kE7zBcuvhu
 taMWm8bWyAi0ZguWN0TRUxlKvifDdr9Ve0vpW54M962DVrlYn6Mui+/yE6m1NR52F7Vx
 1CDxlxVS6r40Ck5Nntm8Q/rYsgDFIK5pQ66Yw/4xrHnc1HqCon8UFxJ8AdZYT8ZkNOwS
 eaZH4SbaVS/Pp0GHibT5L4CgYkMRbLGSeOZYiaUJpSw6m5UMkzWOIyDlEudNayJq/KnJ
 /85IyxQmXwEdAGeX7SpUzWnn59QL65C/nhOCfnyduspVJH1pgH0qlpwNmbXY0srV2gX8
 Xmqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8FzIT2m27/fOOQ/OoNBVvEdeubIEqOkTfd+8stK8G3+jEIbA5S8qjQqfzkFUYA0OxjjkCi6OT/AU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/6UuMbu6T2c8FfHt2aVWq+8uDGGeP8TqWv0dW/cRxrZroIKc4
 sOe7Bb45AdTzoPEjF10xKZH3vVtRDjfJ/DIXU6ZJnzKhArW6kFcjEAy2Vd9QUCGzxvI5hFJSdXf
 UFViyxy13U5HxQXB276wNIblT3R+LADncguqHUplflgP8UXopCWeK1mFY5DplF0LggQJfpg==
X-Gm-Gg: ASbGncuyOHh2aHkjN1kJLveWZ+df3CjV8ZhfwtD14+uwuZLmRa2e+EHqyYTqfn2ARXQ
 omVyXjD4t5I1fEPM7gc/YEEJI8Zskvbr6ms4ibDV30JISax9KukV+bRzF0SmX1BiZHrsjrSrBlo
 5KLNNHIOE8KlZ2jvs2guWTAHUmq0Pbr2nCkKQCrWVzKyq6/duR0t0TOnVH5DLqSbueagzCdYWCn
 tFgFLqf16SfI9joJJ9wvxJ0ILhJdjEzcyOQk9JBk0ZCZW5uKg2Ep9CPJ2KsdNOrqARpDMuOugmt
 yETbA3o2zVRNJjfJ4j8YkFSuIbXpTM4XURj/XJqWA3cV9jE8l863noET8QYOeFOKUJ597eRgo+R
 nZzESdw==
X-Received: by 2002:a05:6214:2469:b0:707:48b6:bcd4 with SMTP id
 6a1803df08f44-7099a51356fmr150862556d6.48.1754866690661; 
 Sun, 10 Aug 2025 15:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGUGt1AwSBne/o9+rNR3LtSm/WoA2RbHO8v9LNVgg4wnAMJx+OP+IR27C+Pk0SSrEVzMCAAA==
X-Received: by 2002:a05:6214:2469:b0:707:48b6:bcd4 with SMTP id
 6a1803df08f44-7099a51356fmr150862326d6.48.1754866690271; 
 Sun, 10 Aug 2025 15:58:10 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:58:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:31 -0400
Subject: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
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
 bh=b3lpeRdsfILZNbKt0s4jDvsKWYmd9ZM6thqzD9ovEpA=;
 b=bPI+bgndtQjl8U/B8CPlCWIm4ICh/KSI/9pQqEc+JGzlNlWdm7ffMObXa6FktebNdwMw2IQ7l
 yRXvUD2K69rChwg8WTjpcfmYgZ91P/5xMLfzNQFm4R78kNC3NkqT/fj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cDyLXUHYOYLWFn_CauIrUoofUfRriLF5ApmpB5sVXQQ_1754866690
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..a86ff370636972168124da19e114f0acab2249d2 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -646,16 +646,12 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+
+	return 0;
 }
 
 static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
@@ -688,7 +684,7 @@ static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8998_pll_ops = {
 	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
+	.determine_rate = hdmi_8998_pll_determine_rate,
 	.recalc_rate = hdmi_8998_pll_recalc_rate,
 	.prepare = hdmi_8998_pll_prepare,
 	.unprepare = hdmi_8998_pll_unprepare,

-- 
2.50.1

