Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDCB772C35
	for <lists+freedreno@lfdr.de>; Mon,  7 Aug 2023 19:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0538010E328;
	Mon,  7 Aug 2023 17:12:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2512810E326;
 Mon,  7 Aug 2023 17:12:02 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26854159c05so2592838a91.2; 
 Mon, 07 Aug 2023 10:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428321; x=1692033121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHzqSThmy913fuGKpn4uXf/XGbug/XgU3SVaHteOTFw=;
 b=d0/zb0EMxnUoF6U/8B+j/A8Klh0Grls+5POua5XjQontyDcF1Dptj+5fXjtQM453i3
 HOY05M8kH4CRzEqgoa9tQzaj4dwJ/WbIxdv97Pjcwd/5O0iFRva/arN2hmER7moWz/fr
 GozUW3ArYRsA4Irz0KpxglSulV+I9A+Q9abW/aiGGNCbsc/Gqi/Sf2NQp82zlxs1aoQy
 LeBt6YnWg8j2g7d3Jy6yoKwl4c8JFdKqslhbEJG52jq8j716NLsuLEJBHHzpLuqCecDf
 lt44aruIwNYfOs05lbntXlCyKWR6f4eqO/HoQyXfYUWzhLqvDGmZflVEacALtyKZDnZh
 IXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428321; x=1692033121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHzqSThmy913fuGKpn4uXf/XGbug/XgU3SVaHteOTFw=;
 b=JY3XYgMcdUAGGOmnLIfD15m5wZtE6u0UZFA7magnlvv4ualctvLH/bDwQVZYpK5wzt
 m9qiXcg+6IBEe9ExsFTbFX0wUB9vcfTuItIuuAv2GMHqZtg6HaiLQWVLmS4UBYDd8y6X
 GVgCdDjNeX7P/NHo4W4mPM1170X4ouK8W24UVb4Z37JKyJFQsXNwpWAKNkUhz4ObSzKL
 mlOHN3jEQXEi1hQ2HpZjQvDFfeEQTX3SkKgoDE4F3GqI6PqNk8wcwEWd6YMGN5idoL09
 GaoEm3fWUhFvm2mePY99fbStfnBqzfU8MdPF3iR6aWY67xvFFk4Apo7brQLhIzlZJBjX
 66gA==
X-Gm-Message-State: AOJu0Yzfjn6WZAmtBLci1XeNyVWvIY5De/YSdDqSNdhiIt+87qoYoLYS
 PinV73wPROsK/n/9qr8uP5PNP/a2170=
X-Google-Smtp-Source: AGHT+IFxwbUQp6XTeg6maDVr4DwNqKkMmfCxg5D737RQsrcQ3dqe7O5HJxm0ZcPAwQVWquo/p75Law==
X-Received: by 2002:a17:90a:ca0d:b0:262:d7db:2520 with SMTP id
 x13-20020a17090aca0d00b00262d7db2520mr7831152pjt.26.1691428321159; 
 Mon, 07 Aug 2023 10:12:01 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a17090ac40500b00265c742a262sm6224878pjt.4.2023.08.07.10.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 10:12:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Mon,  7 Aug 2023 10:11:36 -0700
Message-ID: <20230807171148.210181-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807171148.210181-1-robdclark@gmail.com>
References: <20230807171148.210181-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 2/9] PM / devfreq: Teach lockdep about
 locking order
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DEVICE FREQUENCY DEVFREQ" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will make it easier to catch places doing allocations that can
trigger reclaim under devfreq->lock.

Because devfreq->lock is held over various devfreq_dev_profile
callbacks, there might be some fallout if those callbacks do allocations
that can trigger reclaim, but I've looked through the various callback
implementations and don't see anything obvious.  If it does trigger any
lockdep splats, those should be fixed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/devfreq/devfreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index e5558ec68ce8..81add6064406 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -817,6 +817,12 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	}
 
 	mutex_init(&devfreq->lock);
+
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&devfreq->lock);
+	fs_reclaim_release(GFP_KERNEL);
+
 	devfreq->dev.parent = dev;
 	devfreq->dev.class = devfreq_class;
 	devfreq->dev.release = devfreq_dev_release;
-- 
2.41.0

