Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5C021C13B
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 02:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AED6ED93;
	Sat, 11 Jul 2020 00:50:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37316ED92
 for <freedreno@lists.freedesktop.org>; Sat, 11 Jul 2020 00:50:20 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id 80so7086338qko.7
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SH81ocgF+oAHcpIFHcVCEtbEA/eMMo0Rk5aeuJez85E=;
 b=dk7x85B9jBSqI7kMWwQmPep7Pkq3sdXPexpRQmUWMhTwZ52iwjKKuxKtcbipHk7IYI
 8YG31wZnH0cwTX1hmClJ1RDV9ymQi2jZ9H5gb0U16msjGovfyDw9K/xkgi32Nvez02PC
 PDPvBFV8pR7VIk9walAh8IXIDpl7OxYqPUAuCW/ZQW/r4n7TWtgmRnfZxNBAoHrqFPwS
 GT/bgOtQo2ipBNLbsmXkQPf2QdUui4c3EX1H61CGOrmoOy51bNfysCVYlTTBhuKRfaF5
 soiQv8PL9EZRvHsUgqNFnlTrNEG755A52YMwu9R8M5K5ME5KlAhbLvIblN1Sk7yxN0dT
 Y38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SH81ocgF+oAHcpIFHcVCEtbEA/eMMo0Rk5aeuJez85E=;
 b=Tf4FTdWSCbwRip3u4CVnwR4opiJnFi4NxK5cknjB5GT9C3nXg+nf7XFXu1H8GRK0NX
 n4tHJdw9jlEItkIOGGtD79RQHGzUYNlAfReCkwU4ZVt+7WIXSIykyma9GqUGNpqcoRd+
 jT3CuHAOS6Z46TNwZc/cgTnyJj0GvZbCVfBs9hJf9acfjDfaQVAq49MjwruLfG2o3uxC
 dsklGW62jZcr2HY2ETbWxLaM9OKDz6c7hWSA6WaSY7jbo9RBMCMx3N7E8YGXHS9PysEF
 ltUjNzBiOrcOa72nK/EMG0Rq6SpW/fN6KmpIEPTnevhqERY94UdY5IJe0lyshRlwA0Qs
 Cwqg==
X-Gm-Message-State: AOAM530yMnVQ7Y4ncJ7AH4I2HMbTOjEEevtfn9AGyNwTGHoLEOQOuMX+
 r+UKVyQbykHUpJuY+Bci1q9xSnHiTISWjA==
X-Google-Smtp-Source: ABdhPJwKzjLiuX94fBfKmcTzf4I0K3ACIWPkWPoQt+kid5Kr+J3Euh9ydp8oQ5K7CTfbe49c39DuXQ==
X-Received: by 2002:a37:6758:: with SMTP id b85mr59916869qkc.238.1594428620058; 
 Fri, 10 Jul 2020 17:50:20 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 17:50:19 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 10 Jul 2020 20:47:28 -0400
Message-Id: <20200711004752.30760-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 5/8] drm/msm/dpu: set missing flush bits for
 INTF_2 and INTF_3
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This fixes flushing of INTF_2 and INTF_3 on SM8150 and SM8250 hardware.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 613ae8f0cfcd..758c355b4fd8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -245,30 +245,14 @@ static int dpu_hw_ctl_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 static int dpu_hw_ctl_get_bitmask_intf_v1(struct dpu_hw_ctl *ctx,
 		u32 *flushbits, enum dpu_intf intf)
 {
-	switch (intf) {
-	case INTF_0:
-	case INTF_1:
-		*flushbits |= BIT(31);
-		break;
-	default:
-		return 0;
-	}
+	*flushbits |= BIT(31);
 	return 0;
 }
 
 static int dpu_hw_ctl_active_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 		u32 *flushbits, enum dpu_intf intf)
 {
-	switch (intf) {
-	case INTF_0:
-		*flushbits |= BIT(0);
-		break;
-	case INTF_1:
-		*flushbits |= BIT(1);
-		break;
-	default:
-		return 0;
-	}
+	*flushbits |= BIT(intf - INTF_0);
 	return 0;
 }
 
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
