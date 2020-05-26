Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877CF1E19D9
	for <lists+freedreno@lfdr.de>; Tue, 26 May 2020 05:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8589C05;
	Tue, 26 May 2020 03:23:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3643B89C05
 for <freedreno@lists.freedesktop.org>; Tue, 26 May 2020 03:23:03 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id z9so8815966qvi.12
 for <freedreno@lists.freedesktop.org>; Mon, 25 May 2020 20:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AWAnzxFlBG6fffzFUdxDOCWUGLZUTqYmdG/nfLxRIYw=;
 b=GTWzOqvEA7APlKZrtWytxI3UiIPa9Y6MaUsjnygPQbcUyaVx4c8XiCqiNr7Cff/a9G
 KgjjDLdUPGOfF7m9HbgzYwegRZ28LwBDg8+/wHxjDDe2zYW/RU5qqo50EXMqB5rfxOB7
 Fhmi6xUUmFAA6ClbRVu/6DWDq/MJWeN/LcpMRH89Vt1qVWcMNTtNRo+rYJE80hL6au+5
 BvNQuPooPe8liULVPK/iZkNHC++tBaF4M0at4yOAAPYbVW86K4Dqh+ITCYl+ipj7ufOF
 Q/ayVJCWCKD9JqufTNPlTcwRadXX/x/k4NoHaJPkyPyCto0vOwXgTGv+1Eqd1ACMJZsx
 idtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AWAnzxFlBG6fffzFUdxDOCWUGLZUTqYmdG/nfLxRIYw=;
 b=fw6n7caBll1faCwzwCz4LOHwrsEVRxQPcLRYH4TFYnR6b+NBtIynmxwsUco2vWmBSd
 90HWGBHOTk4nivAxwsYOpZhkjG20RozJAmvNjZPZfS5g8ucsgqeeaddKcOivOZRw2zx1
 fkl6IvmT4wVkdc1sH2AiefND9dXLgmcM5oX1X1vlfVNuKaDYETMKwHwGwUzPUOL6zJUQ
 /vENoGywabsGq5G5sBxT+mQ3v3RzmW3Q6Fu7LcL4UBI3lpH9+KhBxYiZhnzCbXzY0sgG
 YDhdmWSr6ZjPmOXfkikwkJXOGqc7+LKgJuSlZ2sUM7t8HCJ1bNbp7pMXhAqNnyOllfUu
 HAHA==
X-Gm-Message-State: AOAM532x7sGKmWXIE6NA3QYLISYVLMJ0LNjZC7gQQhClpdREcOA+Z1IW
 F3LgUpTP+draOnbYxPcOqGaEO1sdY/qxhQ==
X-Google-Smtp-Source: ABdhPJwQ99YZM55+rNFn66oLsnyuqhfzXbeGT/sUdIanmJgqga8K7kurbsvipAlWTxcAKJBZ3WarOA==
X-Received: by 2002:ad4:5684:: with SMTP id bc4mr18783129qvb.85.1590463382263; 
 Mon, 25 May 2020 20:23:02 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 20:23:01 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 25 May 2020 23:22:12 -0400
Message-Id: <20200526032235.21930-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 5/8] drm/msm/dpu: set missing flush bits for
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>
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
index 831e5f7a9b7f..996666afdd66 100644
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
