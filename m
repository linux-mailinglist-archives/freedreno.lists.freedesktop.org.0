Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFA418427
	for <lists+freedreno@lfdr.de>; Sat, 25 Sep 2021 21:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5236E45C;
	Sat, 25 Sep 2021 19:28:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B346E459
 for <freedreno@lists.freedesktop.org>; Sat, 25 Sep 2021 19:27:59 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i25so56445560lfg.6
 for <freedreno@lists.freedesktop.org>; Sat, 25 Sep 2021 12:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GNhncKhzYt179JtcdPH7NHcfH9wwnLbbbm0VxyfgFY=;
 b=Gj5pzAQvVgG2EffN+M+6NlFN8FcsHHq1Wn80RUxW4esA5eJjxuh+fNK0wva16U3AM7
 PYkL2thL37ugm+QR7NUPh01QXaYpyvkrBzRgN7aRvEzhGb6VgzrPe1940OR80e31IsV/
 L39vWXpE/d1l+vHZyGMXGbbrfofIbkt3pKaGWsN00zO3EpFlOpaTBIt5tOFid8W6fMdf
 /kjEKFNuJUyQufP2PRx5RuUC5W8NQXhzHw91v/P4Y6G8qJ0shZ26nQiyIRChLa/2zEAA
 URACDn0qAZgDmwsdQMlV36gR64lHB7e9XCq7SzYz00TC9Gzr0+O2Vu8k5JDJ1N//ZH+B
 4Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GNhncKhzYt179JtcdPH7NHcfH9wwnLbbbm0VxyfgFY=;
 b=IBzmGwBEKBEW1jXCATwsYjowFSW57X/dBOxYBuo7PzJ4Z4hDi9XPmnpwRsV/gREbRl
 e5APLb1zfapJRGwiRAeMKDKFaxPzMaxgxwnJWCcrbQ9L12sbK8bPiV8kRdh1sGPiciLQ
 SiIxofnWKVs2zhyR5f+/0NBUEor3eDs2vRx/sJwPN7gp67HA8N4tcrFgTCdUP6dnseDb
 oqvEfCe2VgCqRBS+JOBlUrJcsZZ3jaZYWi7niSRGNFumRW0LRPi2yec+Se32DT4gwFWP
 cij8245ao5eKgq2ylHUR/QjRKU8+2qU4VT/e+nGoczCvSv+6Ck8mMUMAmqRCd+MJVuen
 C7BQ==
X-Gm-Message-State: AOAM5311V5f+906eh+8uXXzqJe9MLbHOVdk1S5sgc/BIt+uQ1BBRsPVO
 l40xqKaEtZES9JOv60dVUrN8hA==
X-Google-Smtp-Source: ABdhPJy6LX179GHqGuBzASUeTK3hyXnohSWMwDszmleLcDgLGKerUG7Nt+weSiJSkUa7xW24kN4OJw==
X-Received: by 2002:a19:6a16:: with SMTP id u22mr16061203lfu.444.1632598078048; 
 Sat, 25 Sep 2021 12:27:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x9sm1100753lfn.303.2021.09.25.12.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 12:27:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Sat, 25 Sep 2021 22:27:54 +0300
Message-Id: <20210925192754.3416212-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: fix possible oops in msm_submitqueues
 code
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

Even without GPU, the ctx->submitqueues list should be properly
initialized. Otherwise msm_submitqueue_close() (which can still be
called even w/o the GPU) will ooops while trying to traverse the list.

Move ctx->submitqueues initialization earlier, before !GPU check.

Fixes: 86c2a0f000c1 ("drm/msm: Small submitqueue creation cleanup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 32a55d81b58b..a0303be05445 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -128,6 +128,8 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
 
+	INIT_LIST_HEAD(&ctx->submitqueues);
+
 	if (!priv->gpu)
 		return -ENODEV;
 
@@ -140,8 +142,6 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	 */
 	default_prio = DIV_ROUND_UP(max_priority, 2);
 
-	INIT_LIST_HEAD(&ctx->submitqueues);
-
 	rwlock_init(&ctx->queuelock);
 
 	return msm_submitqueue_create(drm, ctx, default_prio, 0, NULL);
-- 
2.33.0

