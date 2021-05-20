Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72192389A75
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 02:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E406E57E;
	Thu, 20 May 2021 00:25:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760F06E4BA
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 00:25:22 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id s20so7996133plr.13
 for <freedreno@lists.freedesktop.org>; Wed, 19 May 2021 17:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aRquPtKESR1fixPzXGluszKZZ1e3a9BRsbbdMoeuLvY=;
 b=Ds0tK1t4lVQ8KE/sGvf2nUVymAK21Pt8pKPu3fln6VW9CNikaOaUrGjV4DPHFPbQ+s
 CrE9qPxuFx80GzKOsWy/tx7t0AC57nz/Ictcrbg4xp864prwxIt69Hb9v/dSkuTPZD61
 7pIUUGfmzYO93Wp+YVhARCpxNoVBGUjPBTDng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aRquPtKESR1fixPzXGluszKZZ1e3a9BRsbbdMoeuLvY=;
 b=on8pTjw4pvFovdhF5QusnXRFlMCUZBl9KzYMuStbXHtcBNJSVVZpYxnkQR4Gb8n4Wg
 kgu39bHu/cMleyvUdw35VL4c0cfNtcM/j9IZNDRC6ci+rg0D0Kb3Dumr2JFrjbqUaFHu
 1h4ztUJX3JYToqBdiw6NBhb+CwSwQVC3FB0yFvyWNMlgk8r32mtTMczXtbYCor1ZaeHE
 nGkmQh2SBvN91KBaUIfjngLFv4puPt6hK9wk+NS2tlJ9jLK0AQCLf3BIM13jeE3xFd/s
 7tvzq4gW5Tu2OgG/qvjxsIU3PosySxRW3RVds88qaJghBuMC/iW6k3xiYvHVlQbtmgbX
 ZxRA==
X-Gm-Message-State: AOAM5333W7H7LoeogfRZi0gwMoOuux68x+PhB8pASK9ukdsaG2/VBbKc
 WQcbSAOaZhHLjhr4mpN8ZRerww==
X-Google-Smtp-Source: ABdhPJzQ4U2lTNUnLgnTbBfp6T56SKS85QwT+rKLMXH6K8ql9c3cbNItvfoNOn06y8J7swXPzEuKMg==
X-Received: by 2002:a17:90a:7e03:: with SMTP id
 i3mr155918pjl.197.1621470322127; 
 Wed, 19 May 2021 17:25:22 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
 by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:25:21 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 19 May 2021 17:25:13 -0700
Message-Id: <20210520002519.3538432-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
References: <20210520002519.3538432-1-swboyd@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/7] component: Drop 'dev' argument to
 component_match_realloc()
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This argument isn't used. Drop it.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 272ba42392f0..bbe1757dfa89 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -307,8 +307,7 @@ static void devm_component_match_release(struct device *dev, void *res)
 	component_match_release(dev, res);
 }
 
-static int component_match_realloc(struct device *dev,
-	struct component_match *match, size_t num)
+static int component_match_realloc(struct component_match *match, size_t num)
 {
 	struct component_match_array *new;
 
@@ -359,7 +358,7 @@ static void __component_match_add(struct device *master,
 		size_t new_size = match->alloc + 16;
 		int ret;
 
-		ret = component_match_realloc(master, match, new_size);
+		ret = component_match_realloc(match, new_size);
 		if (ret) {
 			*matchptr = ERR_PTR(ret);
 			return;
@@ -469,7 +468,7 @@ int component_master_add_with_match(struct device *dev,
 	int ret;
 
 	/* Reallocate the match array for its true size */
-	ret = component_match_realloc(dev, match, match->num);
+	ret = component_match_realloc(match, match->num);
 	if (ret)
 		return ret;
 
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
