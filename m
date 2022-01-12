Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFF48BBD2
	for <lists+freedreno@lfdr.de>; Wed, 12 Jan 2022 01:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168A610E195;
	Wed, 12 Jan 2022 00:27:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CDC10E1D1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jan 2022 00:27:29 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 o3-20020a9d4043000000b0058f31f4312fso768935oti.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jan 2022 16:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WqByNvxB5TcaW37Y3dlNFQ4WDapy73RgUbY3JV8R/nQ=;
 b=Pcoj/iXfbGJfWcIvlDjYxDGNtQ6l6QyPoulOtlEiTUr5+rwykzE32gle+eyWjLEf6V
 aDFqeAnq8m+llM+znbg/GvewwRMzWDJ9fZn1pun7dzKyqxWdaTlIDaXWKJWNQKSElAsL
 Rp0PxAx2y4y6/mfKf/CHzr6gVSbkSXFUA6qxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WqByNvxB5TcaW37Y3dlNFQ4WDapy73RgUbY3JV8R/nQ=;
 b=5Xz67E9XHeRNmCQz2adV6TlrsW58UD55JFqYHgqKQwKvHDu1NjGj3MBED7TLPTmwLV
 SCLyvdjzn/83GMbNZehLAJuR0MiLal5KN187+mEJM71cm2nBImXrgFosbJbwuRd8iMtC
 afJP6eY6eXs3KUfYdEIr3zgZ2QYXXYEwVZ1QlUt5E99hxXCQo0sVuu3dAA6Jb+ydEdub
 DyoIeESo7zDxQhHHGwZ/AABi5K1wN3MpjCErklnkWzDRLc3/QmfgPH3+GHYxd3FyS+aN
 Mrrkel/xNkbXakj3L4Xim0DRcVmxDnIfb7pUuKXTolS5U+dx9zY/jWmZuuOtO9fErTqK
 yOdQ==
X-Gm-Message-State: AOAM530Hulynieko4wr+R2PrKP5hmzfVBs1vATqbrH+YC4t7u+eA+NoN
 Jskm5kHU29C80WuLvjOtffkwLQUpSWNT4sJyEdc4Ew==
X-Google-Smtp-Source: ABdhPJxMczP+5jJCLefJZ3uSBIgyN09xnry//vRiu7iBKwt4wRbi9Gfl3WZkmpKPRfcVfBsVXDB2sCr3tXuwJ4WGhuA=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr5053528ota.126.1641947248080; 
 Tue, 11 Jan 2022 16:27:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Jan 2022 16:27:27 -0800
MIME-Version: 1.0
In-Reply-To: <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 11 Jan 2022 16:27:27 -0800
Message-ID: <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 25/32] iommu/mtk: Migrate to aggregate
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
Cc: Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Yong Wu (2022-01-11 04:22:23)
> Hi Stephen,
>
> Thanks for helping update here.
>
> On Thu, 2022-01-06 at 13:45 -0800, Stephen Boyd wrote:
> > Use an aggregate driver instead of component ops so that we can get
> > proper driver probe ordering of the aggregate device with respect to
> > all
> > the component devices that make up the aggregate device.
> >
> > Cc: Yong Wu <yong.wu@mediatek.com>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> When I test this on mt8195 which have two IOMMU HWs(calling
> component_aggregate_regsiter twice), it will abort like this. Then what
> should we do if we have two instances?
>

Thanks for testing it out. We can't register the struct driver more than
once but this driver is calling the component_aggregate_register()
function from the driver probe and there are two devices bound to the
mtk-iommu driver so we try to register it more than once. Sigh!

I see a couple options. One is to do a deep copy of the driver structure
and change the driver name. Then it's a one to one relationship between
device and driver. That's not very great because it leaves around junk
so it should probably be avoided.

Another option is to reference count the driver registration calls when
component_aggregate_register() is called multiple times. Then we would
only register the driver once and keep it pinned until the last
unregister call is made, but still remove devices that are created for
the match table.

Can you try the attached patch? It is based on the next version of this
patch series so the include part of the patch may not apply cleanly.

---8<---
diff --git a/drivers/base/component.c b/drivers/base/component.c
index 64ad7478c67a..97f253a41bdf 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -492,15 +492,30 @@ static struct aggregate_device
*__aggregate_find(struct device *parent)
 	return dev ? to_aggregate_device(dev) : NULL;
 }

+static DEFINE_MUTEX(aggregate_mutex);
+
 static int aggregate_driver_register(struct aggregate_driver *adrv)
 {
-	adrv->driver.bus = &aggregate_bus_type;
-	return driver_register(&adrv->driver);
+	int ret = 0;
+
+	mutex_lock(&aggregate_mutex);
+	if (!refcount_inc_not_zero(&adrv->count)) {
+		adrv->driver.bus = &aggregate_bus_type;
+		ret = driver_register(&adrv->driver);
+		if (!ret)
+			refcount_inc(&adrv->count);
+	}
+	mutex_unlock(&aggregate_mutex);
+
+	return ret;
 }

 static void aggregate_driver_unregister(struct aggregate_driver *adrv)
 {
-	driver_unregister(&adrv->driver);
+	if (refcount_dec_and_mutex_lock(&adrv->count, &aggregate_mutex)) {
+		driver_unregister(&adrv->driver);
+		mutex_unlock(&aggregate_mutex);
+	}
 }

 static struct aggregate_device *aggregate_device_add(struct device *parent,
diff --git a/include/linux/component.h b/include/linux/component.h
index 53d81203c095..b061341938aa 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -4,6 +4,7 @@

 #include <linux/stddef.h>
 #include <linux/device.h>
+#include <linux/refcount.h>

 struct aggregate_device;

@@ -66,6 +67,7 @@ struct device *aggregate_device_parent(const struct
aggregate_device *adev);

 /**
  * struct aggregate_driver - Aggregate driver (made up of other drivers)
+ * @count: driver registration refcount
  * @driver: device driver
  */
 struct aggregate_driver {
@@ -101,6 +103,7 @@ struct aggregate_driver {
 	 */
 	void (*shutdown)(struct aggregate_device *adev);

+	refcount_t		count;
 	struct device_driver	driver;
 };
