Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9440695670
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 03:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D627E10E7D7;
	Tue, 14 Feb 2023 02:10:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C0510E7C7
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 02:10:03 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a9so16816827ljr.13
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 18:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyPF4fV9UrkLbIUQYS5LuQlyTM5N3jsj/LVS9IPQGPw=;
 b=DI+eNqpXr1eexCl7cJErYSDof4APWXG6OZZhkuafeLv7vzUs+MFFhXM6QhMHaaMKa6
 dVfXbT2WUCU6UH4McFK3F2ZVV1g7knVlOZCwW2WqIf7XmtzhlFJrJ6UkMXxQMvWR72ZL
 3LJXk8dzLfKQ5gCffgohb5vLBLYKxQW7EFIxlH77fp/e8BxCdg18UY21GcdXZ6g4hPI6
 2zRbiVX9OM47qKhxuZAsmIGzsgd+kHp5BXydh3gctzPk9Br9I6xovOvepP1X8/IiA6X2
 /2jwNPRfHMB+/eh5o08X46nrhlUepPYl29K3YKHHzNd5vQ08Xqa8PYSQKFjULnPy98rR
 bdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LyPF4fV9UrkLbIUQYS5LuQlyTM5N3jsj/LVS9IPQGPw=;
 b=bKASnrDVKXznmEGpr5cO9kyuwy69CIja6eXX+NuvsjLVM95lk3pj4w64oVlEO8NN3/
 wE1POBW4yTS71Rd6YQYhC/QF6kNU5f7k2Egcq1F6WR8bN8dAgGrU2aB967pxAtzYcpoT
 v7PtIvQZT/h+eeDfZeKjlo99VP729QOPWxtu8eJanpeLxNg6HBla63ZNm9FTA3hUAxFn
 9/G6CZWMW/4NTs8iAm229I1W69xvQCIgSLq09Es4QH3poQmCkeZgiiAr4Dx3MwvoZAHM
 VOQ0G94XNLu9okz92W2NAPjJIM5EZLLGdSNvEd/a6LBxlW3V5bycZwLbasYoqRCYhVwA
 7ETA==
X-Gm-Message-State: AO0yUKXzF3O2/GWNsYBCikWVDoahqx37O3H+UW/GFU3jDFHeLIA4TwZE
 zikbAm1Iwvq1+0c7hJSRnsO+RQ==
X-Google-Smtp-Source: AK7set96hZdPwrH9Kqmpe1j4bCpHeOFennkKvrjYK1gwPSZW0KY5Uga7IGlnFOvzAwYbG8fX6OLxYg==
X-Received: by 2002:a2e:8612:0:b0:293:32a9:226f with SMTP id
 a18-20020a2e8612000000b0029332a9226fmr231253lji.7.1676340601630; 
 Mon, 13 Feb 2023 18:10:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 18:10:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Feb 2023 05:09:55 +0300
Message-Id: <20230214020956.164473-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/4] drm/msm/a5xx: fix the emptyness check in
 the preempt code
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Yassine: ring->memptrs->rptr is never updated and stays 0, so
the comparison always evaluates to false and get_next_ring always
returns ring 0 thinking it isn't empty.

Fix this by calling get_rptr() instead of reading rptr directly.

Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 7658e89844b4..7e0affd60993 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -63,7 +63,7 @@ static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
 		spin_lock_irqsave(&ring->preempt_lock, flags);
-		empty = (get_wptr(ring) == ring->memptrs->rptr);
+		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
 		spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 		if (!empty)
-- 
2.30.2

