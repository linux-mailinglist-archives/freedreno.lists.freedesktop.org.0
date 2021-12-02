Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06F5466C7F
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AE16FBE3;
	Thu,  2 Dec 2021 22:28:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA686FC3C
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:28:02 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so890040pjb.5
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N66rEkaY3Hcvo9L0yTqqS+dEsFgKt6MiGsAE0j7XsvA=;
 b=XcKcYyUhIYivc39EjxDzgKxoJpVCSIl6YOFb+f4hLmxGUjyRbTHwoCyL2NtdhV/YdU
 r7DiT3WhsvI602knCn6FAvxGshi/IAwUHHzhfuGXwXnaW72X5cJFnC7R1yQpr0ZkdD2u
 kbux2NC5nCXoF6JESch1VN1TvCo5854Z4hPGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N66rEkaY3Hcvo9L0yTqqS+dEsFgKt6MiGsAE0j7XsvA=;
 b=jHQU43+YILYUzVMzMzh346yZtiMEq1dpfnSLCIElGRCFhvowWV+Uz4WAyljsUmkXPK
 HP22Cmu8i5qMYfess+BiQ+xtXKQcx+MO/W9us02vlG/P5YkwRsBH30C20FkbLVEF+lvO
 yvTsWa2RmOg62wrBoT3tNXrgJsFqrctJMNOH1Rlzjizk+p339SmXOXUXdZSyesQlpuai
 uQcCvUD+0byPqsz9Gym3fPaTMR96cexT9G96vDcNn9w1qByHitPB7cqEYTYV3A7vVcrC
 uHJmDgusC3rzbCbvqRGlOlpC7kB+ZSuvDa14lrfE1j20HGAF/ShrpOodd6gTMj22/a+X
 rtHA==
X-Gm-Message-State: AOAM530KgJsIRSQvx/sN82vHSGtxD0rJIVoErBtr2o4wBF97KgAxDgxo
 bpABO5uFI1sxPJUntxM/j3FN8A==
X-Google-Smtp-Source: ABdhPJyJAIEeNwFvHrDCG6a6EWCpmwbCAkuRuLpBUFvL5M7qySrlj3aUKw6GslG1dEiODlX+Vq+KTQ==
X-Received: by 2002:a17:90b:33cf:: with SMTP id
 lk15mr9121711pjb.85.1638484081818; 
 Thu, 02 Dec 2021 14:28:01 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:28:01 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  2 Dec 2021 14:27:29 -0800
Message-Id: <20211202222732.2453851-32-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 31/34] ASoC: codecs: wcd938x: Migrate to
 aggregate driver
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
 Jaroslav Kysela <perex@perex.cz>, Rob Clark <robdclark@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Acked-by: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/codecs/wcd938x.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 52de7d14b139..f44f5d41bfdb 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4316,8 +4316,9 @@ static struct snd_soc_dai_driver wcd938x_dais[] = {
 	},
 };
 
-static int wcd938x_bind(struct device *dev)
+static int wcd938x_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
 	int ret;
 
@@ -4400,8 +4401,9 @@ static int wcd938x_bind(struct device *dev)
 
 }
 
-static void wcd938x_unbind(struct device *dev)
+static void wcd938x_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
 
 	device_link_remove(dev, wcd938x->txdev);
@@ -4411,9 +4413,13 @@ static void wcd938x_unbind(struct device *dev)
 	component_unbind_all(dev, wcd938x);
 }
 
-static const struct component_master_ops wcd938x_comp_ops = {
-	.bind   = wcd938x_bind,
-	.unbind = wcd938x_unbind,
+static struct aggregate_driver wcd938x_aggregate_driver = {
+	.probe	= wcd938x_bind,
+	.remove	= wcd938x_unbind,
+	.driver	= {
+		.name = "wcd938x_snd",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int wcd938x_compare_of(struct device *dev, void *data)
@@ -4482,7 +4488,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 	wcd938x_reset(wcd938x);
 
-	ret = component_master_add_with_match(dev, &wcd938x_comp_ops, match);
+	ret = component_aggregate_register(dev, &wcd938x_aggregate_driver, match);
 	if (ret)
 		return ret;
 
@@ -4498,7 +4504,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 static int wcd938x_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &wcd938x_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &wcd938x_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

