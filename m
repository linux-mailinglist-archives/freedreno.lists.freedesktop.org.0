Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95067107D
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729BF10E62C;
	Wed, 18 Jan 2023 02:01:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7447D10E62C
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:01:55 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id kt14so20916552ejc.3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4A8XjFSBiG9DDmb505MwykT6kj7KkKgJJSYX4RpM/tM=;
 b=eg9CmIMczOQdupZM7Ru+4O0qKgNWuQW69nOHojrGKjTEfDZAkXXHcvs7rS+ghNPYaV
 1LK4nfQ5nTAoeJS+dohA6NSxtdi2gvoqtGlQT7iyawkHzuj9lCG4KR9sDltOzJn6qiTG
 aUpxYaqY13xay1ykAg16GQTIvVrRJmwa0sWJaJSa0nAXtQNbfY8F2NDvQZ5OSoT6uZM4
 x1+p3tDKNAvE613sD/Dc5T3kjk8SObbzWdITuD9yg/6ULkhjDSC0H0EdVEJdXE5dIkvz
 Y4h3XaUcOA0Adz8a6/dSED5y4PPJb2texjAdq9MdS1aLRT+o2U2btVcGdEavVBzEvaMz
 HkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4A8XjFSBiG9DDmb505MwykT6kj7KkKgJJSYX4RpM/tM=;
 b=j3VlDAay14I0onInT1VwfuIfSL0ZpOfWE3+SQzcQgc7qc/q1XVr1Ee9/8IUI1nWG0D
 THMbKDaHy6WIRh7XBCAgjXpzGXt165f6IeIkOu71aiRzN521hwu2jqDGS/Rz2+7boMbE
 BF1VN6G7gespiAVy4nro9fwhe0cDzYWHvsUiRn5CxbESeJFQSU/PbldZ8Tve+w2QjY6g
 Aj+A8YQJ5aGdGXPEzFrYB6rftF/OytNolsWziZh+EhtOETEZVsH4RWM3gi+f+/ZUUPxd
 QLEMVYmS08oq6stt/1AFf/YHloptJgjxguBnLwxWkwz3iJzkcCFu6JzS0vUmPWEEXQq/
 liPg==
X-Gm-Message-State: AFqh2kr+tBOyPhYzv33hwbc7+IihBsR6CPkfU6NQRXOVpzC6Il7OFUUi
 Q3vFcLchjgIBBE4iFS1vtH+8egpVKBRAuapp
X-Google-Smtp-Source: AMrXdXsZqDlcOR0AjGNu6PjyGUcISQgMCSD1WWbyH8r9Q8hBYto1Vh5HRGp/AWSFWYV1w4tfmXylJQ==
X-Received: by 2002:a17:907:c494:b0:871:b9c3:2fcd with SMTP id
 tp20-20020a170907c49400b00871b9c32fcdmr4689374ejc.26.1674007313997; 
 Tue, 17 Jan 2023 18:01:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm5290563ejc.225.2023.01.17.18.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:01:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 18 Jan 2023 04:01:52 +0200
Message-Id: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: use strscpy instead of strncpy
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Using strncpy can result in non-NULL-terminated destination string. Use
strscpy instead. This fixes following warning:

drivers/gpu/drm/msm/msm_fence.c: In function ‘msm_fence_context_alloc’:
drivers/gpu/drm/msm/msm_fence.c:25:9: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
   25 |         strncpy(fctx->name, name, sizeof(fctx->name));
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index a47e5837c528..56641408ea74 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -22,7 +22,7 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
 		return ERR_PTR(-ENOMEM);
 
 	fctx->dev = dev;
-	strncpy(fctx->name, name, sizeof(fctx->name));
+	strscpy(fctx->name, name, sizeof(fctx->name));
 	fctx->context = dma_fence_context_alloc(1);
 	fctx->index = index++;
 	fctx->fenceptr = fenceptr;
-- 
2.39.0

