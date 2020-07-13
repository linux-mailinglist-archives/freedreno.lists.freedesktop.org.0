Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E390421E342
	for <lists+freedreno@lfdr.de>; Tue, 14 Jul 2020 00:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5036E82F;
	Mon, 13 Jul 2020 22:55:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C256E82E
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 22:55:16 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id a32so11427436qtb.5
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GsatskZeu6cROzCdokNou7WazNDARulkKT+Df6GvP/E=;
 b=he9usAeaaAWYBNYbwqBs57KtvsMI8J2WQf55xuXlU8oSJyWCF2IdPgt/yKkmTsfzjO
 yTCyDKME1sqmwOx7tmm+X629+8z+0VkZlU06Ltb1qrh+15GJcr+5EoBEpoW/9Qei6E/8
 I04ExgRm46UjR3xyYnaBur78tmPWJi+3sdNJx4jUWKfOiwsAP/+ffAxGR7VgD/GfhKlv
 OAaZ0Iz57cKe8j1NvKOfV6YF57tPi+UKa/wgrI391aASyfypLXF3TaPgXyny7k71dPcr
 LEHOC97z4rbnZCu67PQmeC5vLTIqgdWyBlAi0wsa9EN283JNABDYmimPPaQVRcZmqxlK
 XMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GsatskZeu6cROzCdokNou7WazNDARulkKT+Df6GvP/E=;
 b=cTfnouHiZVhYpJxnHygaAFSSvenc/vKMMphv2ncJF7QtcvELmUwLIYp4+gthMieK2i
 pTJoflRz/t6B3xEunDES4yAzUhoKxp2AWQJfGf/IOPusXLRJ+pfukObNWj6qhzqNUu12
 HsiAhGo9eTTLcEw0n1s+6wp1X4KdMqoWcqSrxFoX516Dq1IInbAcANAOSC9jf8doxB0B
 gILs0WPdV+jif7qN6Q4Jc4tUwSYPys9Kg/k4v+ssfTCSgqxvYh2RpG3pLBxVQXg83OUp
 4BJZS/l+ByGDsh9gCMBPsnt5Ef/mqbAt+AFxJqLWTMgN1fDgqRzdUWesJYepH+iquhwA
 14Og==
X-Gm-Message-State: AOAM5336JDz4jQw+N5ppBZGZ8Xw4PGtA4eE2Mt80ARmGHRea18ntCLAP
 T9JLGVpJL3tm0zJVm59AkH+fGu/dp/g=
X-Google-Smtp-Source: ABdhPJwEhNUhM0Sdref5tidyi4ZWkR4rO2FHbelarbgx64sfy4MEmxKm6XdqIsIIguOYsf0aC+fozQ==
X-Received: by 2002:ac8:311d:: with SMTP id g29mr1789673qtb.54.1594680915659; 
 Mon, 13 Jul 2020 15:55:15 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 15:55:15 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 13 Jul 2020 18:53:41 -0400
Message-Id: <20200713225345.20556-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200713225345.20556-1-jonathan@marek.ca>
References: <20200713225345.20556-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 2/3] drm/msm: reset devfreq
 freq_table/max_state before devfreq_add_device
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
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These never get set back to 0 when probing fails, so an attempt to probe
again results in broken behavior. Fix the problem by setting thse to zero
before they are used.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a22d30622306..aa9775ab52f0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -93,7 +93,11 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	/*
 	 * Don't set the freq_table or max_state and let devfreq build the table
 	 * from OPP
+	 * After a deferred probe, these may have be left to non-zero values,
+	 * so set them back to zero before creating the devfreq device
 	 */
+	msm_devfreq_profile.freq_table = NULL;
+	msm_devfreq_profile.max_state = 0;
 
 	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
 			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
