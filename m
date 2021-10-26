Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424AE43A8FC
	for <lists+freedreno@lfdr.de>; Tue, 26 Oct 2021 02:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DEC6E249;
	Tue, 26 Oct 2021 00:01:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195886E20B
 for <freedreno@lists.freedesktop.org>; Tue, 26 Oct 2021 00:01:14 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so756451pje.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Oct 2021 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jRHJbzxJCo8C1IXTJW3KiTq5EwC3cp5SncHLYDZJzc=;
 b=bunBYlNm4MBSSwDY9FFTh2Q7n01hTP2TxTgpRDzaG7jxxi7NaxxZDlwJQoGZBhO7DC
 YUqQu/W9/Ey/QCwO0Wo3XlipBwg6MDQol3xm5XqBOMm3FJgcGPy9HyC6Rrmj+DRi8WZ8
 ZAfRuZrG+lygeImvhmGTyPRMjkCN1OZVZNRdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jRHJbzxJCo8C1IXTJW3KiTq5EwC3cp5SncHLYDZJzc=;
 b=49CbzA//W1C+JaQLxgddFQqW3i4fqdU+R+yvOmFfkx1Kn8EJz0XZ37jSGRsEOyaAhL
 +LYAfnEVcCrJudwwcTZpF7Ziv70opC6AqafQTwMziEjGHd+a8EW7Ss/vxPNwUgsWuYLt
 hsGvi6ENCP2T02zZaJw/Yw99wwJIkWD5S+YdNp39gSOjVLbhNLNS7deY+hR+lM6R4+zU
 PaA67In6O64pz2bYcTF2vfelpPXR2d5oXUFhjBESCToUOLGbRzF1FN8dC9EJQLTlhOsh
 iT/YMD5IIPorW1slapw2DIQaHzi7yMEVCkYetA51mSH4zq7uLCAlbM2vbv9Lssjd1XMK
 7wOA==
X-Gm-Message-State: AOAM530SM11BCfADiwmXs1NVIMikGqL/vfCF891I1YJXPQf6RDA9Ayye
 gt/2IYuEl9+VH4axBlqMPwq2hJlzUhg=
X-Google-Smtp-Source: ABdhPJytiLcibWlQitWE/5QqSaMJS8eNHYwmRE1R0ILsLrIBh9wK5/gLXbFkVz+lkKJyAXnhTsj8pQ==
X-Received: by 2002:a17:902:f687:b0:140:4098:1e12 with SMTP id
 l7-20020a170902f68700b0014040981e12mr13194756plg.81.1635206473428; 
 Mon, 25 Oct 2021 17:01:13 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:01:12 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Mon, 25 Oct 2021 17:00:41 -0700
Message-Id: <20211026000044.885195-32-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 31/34] sound: hdac: Migrate to aggregate
 driver
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

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/hda/hdac_component.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index bb37e7e0bd79..9e4dab97f485 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -181,8 +181,9 @@ int snd_hdac_acomp_get_eld(struct hdac_device *codec, hda_nid_t nid, int dev_id,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_acomp_get_eld);
 
-static int hdac_component_master_bind(struct device *dev)
+static int hdac_component_master_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_audio_component *acomp = hdac_get_acomp(dev);
 	int ret;
 
@@ -222,8 +223,9 @@ static int hdac_component_master_bind(struct device *dev)
 	return ret;
 }
 
-static void hdac_component_master_unbind(struct device *dev)
+static void hdac_component_master_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_audio_component *acomp = hdac_get_acomp(dev);
 
 	if (acomp->audio_ops && acomp->audio_ops->master_unbind)
@@ -233,9 +235,13 @@ static void hdac_component_master_unbind(struct device *dev)
 	WARN_ON(acomp->ops || acomp->dev);
 }
 
-static const struct component_master_ops hdac_component_master_ops = {
-	.bind = hdac_component_master_bind,
-	.unbind = hdac_component_master_unbind,
+static struct aggregate_driver hdac_aggregate_driver = {
+	.probe = hdac_component_master_bind,
+	.remove = hdac_component_master_unbind,
+	.driver = {
+		.name = "hdac_agg",
+		.owner = THIS_MODULE,
+	},
 };
 
 /**
@@ -303,8 +309,7 @@ int snd_hdac_acomp_init(struct hdac_bus *bus,
 	devres_add(dev, acomp);
 
 	component_match_add_typed(dev, &match, match_master, bus);
-	ret = component_master_add_with_match(dev, &hdac_component_master_ops,
-					      match);
+	ret = component_aggregate_register(dev, &hdac_aggregate_driver, match);
 	if (ret < 0)
 		goto out_err;
 
@@ -344,7 +349,7 @@ int snd_hdac_acomp_exit(struct hdac_bus *bus)
 	bus->display_power_active = 0;
 	bus->display_power_status = 0;
 
-	component_master_del(dev, &hdac_component_master_ops);
+	component_aggregate_unregister(dev, &hdac_aggregate_driver);
 
 	bus->audio_component = NULL;
 	devres_destroy(dev, hdac_acomp_release, NULL, NULL);
-- 
https://chromeos.dev

