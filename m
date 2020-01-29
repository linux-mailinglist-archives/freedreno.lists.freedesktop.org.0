Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC114D1C2
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2020 21:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CEB6E431;
	Wed, 29 Jan 2020 20:12:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4360D6E431
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2020 20:12:57 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id b22so369861pls.12
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2020 12:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1QswzSwNt0nlyMcQUYRWMFVYAypouu+MHGAuWWfmqtk=;
 b=MSOBMFCy5z0AIk4r4x2LexiNYBLUyY17LlY2VaTcGY9fRU4R4MY7JGNCNsZxBQtecM
 o+YprV/1np+j6I4TM4iRLm0Ef7rpjUqhyVDKvPrTYGBJpnSoHdykLXRLlQkKHieL567w
 /KKJwwgb1So2O9S3ti8aIKcv7G8H9VjpKoBG0gwpxYL/+IyDtDvqYqrpYeqRYOdCQGyF
 MiTy/auwSgZMlmGf0WWU9PLqm4WLs29fM7krmQcn/o6/48gDbVx2OxB10T3UjhcfxbvT
 Ts7mJSisq/ALk24BNhJJyOdWxKm1vjJ0XcVOXFgm6F3uOEFQ/1oUy5b9g+CfL15Va7Lp
 NMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1QswzSwNt0nlyMcQUYRWMFVYAypouu+MHGAuWWfmqtk=;
 b=Lm71XR9TslCz4nNflem7b49vRwWe/GkqSVDFJZB4KmlY+VGkcw9gEsDc5QyafUMSSL
 pLqnb5WPwg4OHqL1A7QDEg/0TGnOuS2CP2Fi/e8+eRKJ0/dXPK+w+hWy72HDFiP0AFPS
 XBAIFtZLMTlz7tMYssHTqDxmsk23TdWMfE1QR0Sg6nhuQu5kKnkEZCyMI+YEzsSNlv1l
 aTCLKQmfqFaoaytPan5n4+dlMT5ya0fNxGjtP3LNnjsJxG2tSXbw8TDnbrjAPuPrwUM0
 0Pm653CyThWHEK9P7kSi66y+ifDXxlXtBvBhhqOU6kbasUAw1GTWgcovWM0jnZ29azF4
 QP2A==
X-Gm-Message-State: APjAAAU0+RqhpUwUYrGH5AaqU3afiu3GfPucC3/VSjBzF/m4YVx7HeYy
 U+7U/m/LuRlI+Q1EjD731E/hvg==
X-Google-Smtp-Source: APXvYqzDagHxMneZm7dwEMu6DvKBueB5ddpfamAzb0TZ1FKo76qqnLtLzsJ+83Uu7ouIws4qJCdIlg==
X-Received: by 2002:a17:90a:9285:: with SMTP id
 n5mr1629941pjo.58.1580328776641; 
 Wed, 29 Jan 2020 12:12:56 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 i11sm3579727pjg.0.2020.01.29.12.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:12:51 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Date: Wed, 29 Jan 2020 20:12:44 +0000
Message-Id: <20200129201244.65261-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [Freedreno] [PATCH] drm: msm: Fix return type of
 dsi_mgr_connector_mode_valid for kCFI
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
Cc: Alistair Delva <adelva@google.com>, Amit Pundir <amit.pundir@linaro.org>,
 freedreno@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Rob Clark <robdclark@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Sami Tolvanen <samitolvanen@google.com>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>, Todd Kjos <tkjos@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

I was hitting kCFI crashes when building with clang, and after
some digging finally narrowed it down to the
dsi_mgr_connector_mode_valid() function being implemented as
returning an int, instead of an enum drm_mode_status.

This patch fixes it, and appeases the opaque word of the kCFI
gods (seriously, clang inlining everything makes the kCFI
backtraces only really rough estimates of where things went
wrong).

Thanks as always to Sami for his help narrowing this down.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Alistair Delva <adelva@google.com>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: freedreno@lists.freedesktop.org
Cc: clang-built-linux@googlegroups.com
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 271aa7bbca925..355a60b4a536f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -336,7 +336,7 @@ static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
 	return num;
 }
 
-static int dsi_mgr_connector_mode_valid(struct drm_connector *connector,
+static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *connector,
 				struct drm_display_mode *mode)
 {
 	int id = dsi_mgr_connector_get_id(connector);
-- 
2.17.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
