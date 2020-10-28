Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A911529CE64
	for <lists+freedreno@lfdr.de>; Wed, 28 Oct 2020 07:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647C86E484;
	Wed, 28 Oct 2020 06:44:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A0A6E484
 for <freedreno@lists.freedesktop.org>; Wed, 28 Oct 2020 06:44:27 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id t24so337642pji.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Oct 2020 23:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRIVhEzHo1XPH6PloaXFLB5fbBAOJPEuMdhJUY10d78=;
 b=iYOIaz1lxvCXYXcNu+M4bI10tLNyS4M9A6CZD5JmtScTgP2CA5ampy0XyQktbCzrM4
 ceakwVehkdY/LSqm0tglgrQrFLMxrSzd5TaJyZKvXoxWuCkMqFjxHRfXCvUmBxOEeBC4
 57vXFD6qCgSo0XOh4N70icprcdVJJu/U6FPp6uXalYDeubBNbKCFyhWyXlWYOhTrXmN9
 111vfz9NNBLBF7Gvxfc/9K/YkdW9/DtxWCkRM4yC8iaExAzHBgoBCqSQKPVxk1WH76am
 qq8qlPNy71RraDWoum8l5+HopRZsSa/Bw0h5Sj+YvUecZ8GJsT/tllUFSCBCz7Jp1CjQ
 mmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRIVhEzHo1XPH6PloaXFLB5fbBAOJPEuMdhJUY10d78=;
 b=M6dNa/Sv2b6ylK8HAES6EC8Wkybue1uaXdmhWbMvUqv4dAOG+YWOlUv/sLnIJbk4nX
 WhdSHongnWPm7WSxsOfwSPwKeQJQoTSbg3Lm7nJ8DHfK/cZO4reCj8jBSKI5/KSPdBMF
 5llWQEJXxAozYa64by0CZcEQvcgTajXobFfd7gJNuej4HMH/iz613/6QnYJKQXVfpRCy
 9vRj2mc4zCOXqJnsesrzcuA0MvE0CztMOhGz5FNSvQN22BlEvRQ+vdqqqx3TP3VJu5LV
 1rMffq2nSyNCRmTTbWpDaRar8Z+f4yNcOuWfQtTGoYgLGCSioAIG9T/yna5qhyG8RpMF
 Sy4w==
X-Gm-Message-State: AOAM531l5MwpDxlb1k40Xis7c7UyDWXtZX5RPMgvml81qiwJ2zwoPlZ5
 /J06gDb6Wgxi0pyZ4uVdUE+luw==
X-Google-Smtp-Source: ABdhPJxsjXO4BzH/gTE1g7vUyycm0va7CGlKvoKvhDoyNRMPGXbtCie5OuI0yJ2/DOj01voeRbrUHg==
X-Received: by 2002:a17:90a:f3d4:: with SMTP id
 ha20mr5577064pjb.28.1603867467388; 
 Tue, 27 Oct 2020 23:44:27 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id t10sm3948706pjr.37.2020.10.27.23.44.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 23:44:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: robdclark@gmail.com, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 28 Oct 2020 12:14:21 +0530
Message-Id: <c995335d16d8b4b4ff47b1273869c33e14782b32.1603867405.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Subject: [Freedreno] [PATCH V2 Resend 1/2] drm/lima: Unconditionally call
 dev_pm_opp_of_remove_table()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
find the OPP table with error -ENODEV (i.e. OPP table not present for
the device). And we can call dev_pm_opp_of_remove_table()
unconditionally here.

Reviewed-by: Qiang Yu <yuq825@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

---
V2: Applied Reviewed by tag.
---
 drivers/gpu/drm/lima/lima_devfreq.c | 6 +-----
 drivers/gpu/drm/lima/lima_devfreq.h | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index bbe02817721b..cd290d866a04 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -105,10 +105,7 @@ void lima_devfreq_fini(struct lima_device *ldev)
 		devfreq->devfreq = NULL;
 	}
 
-	if (devfreq->opp_of_table_added) {
-		dev_pm_opp_of_remove_table(ldev->dev);
-		devfreq->opp_of_table_added = false;
-	}
+	dev_pm_opp_of_remove_table(ldev->dev);
 
 	if (devfreq->regulators_opp_table) {
 		dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
@@ -162,7 +159,6 @@ int lima_devfreq_init(struct lima_device *ldev)
 	ret = dev_pm_opp_of_add_table(dev);
 	if (ret)
 		goto err_fini;
-	ldevfreq->opp_of_table_added = true;
 
 	lima_devfreq_reset(ldevfreq);
 
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index 5eed2975a375..2d9b3008ce77 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -18,7 +18,6 @@ struct lima_devfreq {
 	struct opp_table *clkname_opp_table;
 	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
-	bool opp_of_table_added;
 
 	ktime_t busy_time;
 	ktime_t idle_time;
-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
