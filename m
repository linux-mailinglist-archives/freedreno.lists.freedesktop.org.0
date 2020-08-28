Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862102957AB
	for <lists+freedreno@lfdr.de>; Thu, 22 Oct 2020 07:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3A16F3A2;
	Thu, 22 Oct 2020 05:10:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391E76F3A2
 for <freedreno@lists.freedesktop.org>; Thu, 22 Oct 2020 05:10:48 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id l18so261825pgg.0
 for <freedreno@lists.freedesktop.org>; Wed, 21 Oct 2020 22:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=resent-from:resent-date:resent-message-id:resent-to:from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lRIVhEzHo1XPH6PloaXFLB5fbBAOJPEuMdhJUY10d78=;
 b=eWXUIxDu4+rDypc6fx1pvF9tVdMuzSdXP/gIyhs26Qf7ZceCmdu0CKoxAMSsjs8J4q
 uIU1k88VHAMmprRu2TU1KIEcl1PicfEdGx/tPKl/g3kdHcvOYUYxOkTopg0WZcMVMzmG
 n7hgamQB3MnBu29z3eRGmzUE/rnHc1adTGeiKZDCGXI0DvYgdHn5n08eQbh+gU1YiKMf
 52J8k0QtRn5UmYYNN1czXgo3GvRYUhnEO0CRxENxdLLcrjvOOq0P5+r2hwYbCxn7kXUg
 JK773RyOOpfhBxH2nltdyZlJRC+lWjRCkiOgM30fpEWp+WqMA1HHmNPEB5fu1/lPynUs
 ZhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRIVhEzHo1XPH6PloaXFLB5fbBAOJPEuMdhJUY10d78=;
 b=dbnw1UP1AeHDEsQ/9nwktw2q43AM30IwyH9cKPbBeUD4q5bma+D57XpHrZj7Sn3++I
 LWXJDnI6LForNx/nRWqbHgzOIeHdwOc6nq3NPSIq5AQUV/yf+iJ1Pe7SeYI7e4yPrErX
 IuDkBVk8amXPOotJrBwJ/TNrmSL1nxIDyd5860jbBp9MJ/Lssoj5pX1uvhaQ4kpCJ1+m
 pXvxiscJVsA9hdpg+R2UQXV63HHoyaLd76SMzED797VzxgH17EF/u2rXUXuDWtagtkV+
 ED8EqzlEhhsl1RMsn+ZXW7B+DY5Llz+gVfW9M1M7eLf2OfK7VoO+MrV013wiKb0k+ATK
 Jykg==
X-Gm-Message-State: AOAM530ia8aAYRmDYkSB5g1LsEgTGo21VfmX14/2Cz+5uP1KUNpWSKYF
 AOw2mo+KaZzOWEiFKuwcRXpZNPxszosNYw==
X-Google-Smtp-Source: ABdhPJzV/LXDU4UGSnmttTeuwQfU5XuldLn432Pam68XntXB7X6qN8xltSV7ERTKS2+9k53cCiysHg==
X-Received: by 2002:a63:2d05:: with SMTP id t5mr863626pgt.178.1603343447562;
 Wed, 21 Oct 2020 22:10:47 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id g14sm476081pfo.17.2020.10.21.22.10.46
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 22:10:47 -0700 (PDT)
Resent-From: Viresh Kumar <viresh.kumar@linaro.org>
Resent-Date: Thu, 22 Oct 2020 10:40:45 +0530
Resent-Message-ID: <20201022051045.ve4gxrmqxsimd2hd@vireshk-i7>
Resent-To: freedreno@lists.freedesktop.org
Received: from pop.gmail.com [74.125.68.109]
 by vireshk-i7 with POP3 (fetchmail-6.3.26)
 for <vireshk@localhost> (single-drop); Fri, 28 Aug 2020 11:38:26 +0530 (IST)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id a10sm109294pfn.219.2020.08.27.23.08.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Aug 2020 23:08:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 28 Aug 2020 11:37:47 +0530
Message-Id: <62d944bdac75ec696828daad49fc1ddb6c637bcf.1598594714.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1598594714.git.viresh.kumar@linaro.org>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH V2 2/8] drm/lima: Unconditionally call
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
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
