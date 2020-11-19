Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F72B8B3C
	for <lists+freedreno@lfdr.de>; Thu, 19 Nov 2020 07:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5EF89FE8;
	Thu, 19 Nov 2020 06:05:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6709F89FFD
 for <freedreno@lists.freedesktop.org>; Thu, 19 Nov 2020 06:05:32 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id m9so3270478pgb.4
 for <freedreno@lists.freedesktop.org>; Wed, 18 Nov 2020 22:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hun/OAngGrWt5xNF4OKuvgNV5Y4rbLzPI9hScBNeOTs=;
 b=RfttMH+BDrq0ZOzuKzT8m3LU5ozqFyTek4vlGN5y/SzqlwoW8ABlyQKU8euWi6QirQ
 ojF4E2v4T/UHxzq+35AYZM9AYYOGTlzYG/4AeOyp6+kt1kFhpMEeOWj69d3kDHp/AiLG
 JMtJKZdVnRqVB1vhi5WTQEgOKR8cHfnsysDBEa3lIGackwp72rn9G01cPkqGHPyXfdHE
 iWB/tbGp1ORyTFJy4l/prxTY1gG4MeFy9e61+DN8zXkeYFyfqaoq3JYcn7hRXskpo0ep
 CG5E6sJgEcglR5LsX3EgWQDb+UQoS6ASCODmq8KfO8d8wkt2iyHRzl5H3PD9SmdVlRxq
 MASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hun/OAngGrWt5xNF4OKuvgNV5Y4rbLzPI9hScBNeOTs=;
 b=Li/4cBFzqOqK4OC72qh78IF/b4jsovrincsmXdxzh3SOLCaPNFLDm2ocUBdPXmxH1N
 utj9pNBrs8qpW96yIjJYhaHwnHMl8Zz18Vndb9C8b1ALSEnN5A0XaPyESjqQFjnuV0ZY
 Teq59LSry7+iI1VLJQQtPafgQVqrza18+nxo4H6Uq4ruucb5qFE7xEAlMAj5aceZvqAL
 yzbp6HS2IUD7Mn1a/fG5uso2U5lpXi7OTuUuSLKnOZZkg94zWRYdWr3WUpoZX2a8zEbQ
 +FNIou0adJHc1LQKF18ejYLrNUH2+/9BK0yAlxN6aSon/ez+v1CoC2IYVlegIiCTTpMo
 tDww==
X-Gm-Message-State: AOAM531fVXhNfZQKGpeA9DgEmRmr4C4crjWRiQ/Snf6P7B54fCqrEcg2
 AYAxhGFOHgONftNrLmygEf93nw==
X-Google-Smtp-Source: ABdhPJyejtWFpUyfLUKh7nIyXJ6zqb7Sr9dcwlU9SrQ2KUFQB8jEuQ5+YlLVHrabHjX3RZR8MlQKhw==
X-Received: by 2002:aa7:96f9:0:b029:18a:aaea:20f6 with SMTP id
 i25-20020aa796f90000b029018aaaea20f6mr7959532pfq.41.1605765931808; 
 Wed, 18 Nov 2020 22:05:31 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id x4sm10506860pgg.94.2020.11.18.22.05.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 22:05:30 -0800 (PST)
Date: Thu, 19 Nov 2020 11:35:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201119060528.qscedvc4jlmxakqo@vireshk-i7>
References: <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
 <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
 <CAF6AEGv=-h7GFj5LR97FkeBBn+gk6TNS5hZkwBwufpE4yO7GyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGv=-h7GFj5LR97FkeBBn+gk6TNS5hZkwBwufpE4yO7GyA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH v2 07/22] drm/msm: Do rpm get sooner in the
 submit path
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18-11-20, 08:53, Rob Clark wrote:
> On Tue, Nov 17, 2020 at 9:28 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 17-11-20, 09:02, Rob Clark wrote:
> > > With that on top of the previous patch,
> >
> > Don't you still have this ? Which fixed the lockdep in the remove path.
> >
> > https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/
> >
> > To make it clear you need these patches to fix the OPP stuff:
> >
> > //From 5.10-rc3 (the one from the above link).
> > commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")

This fixes debugfs stuff while the OPP table is removed.

> > //Below two from linux-next
> > commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
> > commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")

This fixes debugfs stuff while the OPP table is added.

> > This matches the diff I gave you earlier.
> >
> 
> no, I did not have all three, only "opp: Allocate the OPP table
> outside of opp_table_lock" plus the fixup.  But with all three:

And looking at the lockdep you gave now, it looks like we have a
problem with OPP table's internal lock (opp_table->lock) as well apart
from the global opp_table_lock.

I wish there was a way for me to reproduce the lockdep :(

I know this is exhausting for both of us and I really want to be over
with it as soon as possible, this really should be the last patch
here, please try this along with other two. This fixes the debugfs
thing while the OPPs in the OPP table are removed (they are already
added without a lock around debugfs stuff).

AFAIU, there is no further debugfs stuff that happens from within the
locks and so this really should be the last patch unless I missed
something.

-- 
viresh

-------------------------8<-------------------------
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 19 Nov 2020 11:24:32 +0530
Subject: [PATCH] opp: Reduce the size of critical section in
 _opp_kref_release()

There is a lot of stuff here which can be done outside of the
opp_table->lock, do that. This helps avoiding a circular dependency
lockdeps around debugfs.

Reported-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/opp/core.c | 94 +++++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 9d145bb99a59..4268eb359915 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1251,9 +1251,14 @@ void _opp_free(struct dev_pm_opp *opp)
 	kfree(opp);
 }
 
-static void _opp_kref_release(struct dev_pm_opp *opp,
-			      struct opp_table *opp_table)
+static void _opp_kref_release(struct kref *kref)
 {
+	struct dev_pm_opp *opp = container_of(kref, struct dev_pm_opp, kref);
+	struct opp_table *opp_table = opp->opp_table;
+
+	list_del(&opp->node);
+	mutex_unlock(&opp_table->lock);
+
 	/*
 	 * Notify the changes in the availability of the operable
 	 * frequency/voltage list.
@@ -1261,27 +1266,9 @@ static void _opp_kref_release(struct dev_pm_opp *opp,
 	blocking_notifier_call_chain(&opp_table->head, OPP_EVENT_REMOVE, opp);
 	_of_opp_free_required_opps(opp_table, opp);
 	opp_debug_remove_one(opp);
-	list_del(&opp->node);
 	kfree(opp);
 }
 
-static void _opp_kref_release_unlocked(struct kref *kref)
-{
-	struct dev_pm_opp *opp = container_of(kref, struct dev_pm_opp, kref);
-	struct opp_table *opp_table = opp->opp_table;
-
-	_opp_kref_release(opp, opp_table);
-}
-
-static void _opp_kref_release_locked(struct kref *kref)
-{
-	struct dev_pm_opp *opp = container_of(kref, struct dev_pm_opp, kref);
-	struct opp_table *opp_table = opp->opp_table;
-
-	_opp_kref_release(opp, opp_table);
-	mutex_unlock(&opp_table->lock);
-}
-
 void dev_pm_opp_get(struct dev_pm_opp *opp)
 {
 	kref_get(&opp->kref);
@@ -1289,16 +1276,10 @@ void dev_pm_opp_get(struct dev_pm_opp *opp)
 
 void dev_pm_opp_put(struct dev_pm_opp *opp)
 {
-	kref_put_mutex(&opp->kref, _opp_kref_release_locked,
-		       &opp->opp_table->lock);
+	kref_put_mutex(&opp->kref, _opp_kref_release, &opp->opp_table->lock);
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_put);
 
-static void dev_pm_opp_put_unlocked(struct dev_pm_opp *opp)
-{
-	kref_put(&opp->kref, _opp_kref_release_unlocked);
-}
-
 /**
  * dev_pm_opp_remove()  - Remove an OPP from OPP table
  * @dev:	device for which we do this operation
@@ -1342,30 +1323,49 @@ void dev_pm_opp_remove(struct device *dev, unsigned long freq)
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_remove);
 
+static struct dev_pm_opp *_opp_get_next(struct opp_table *opp_table,
+					bool dynamic)
+{
+	struct dev_pm_opp *opp = NULL, *temp;
+
+	mutex_lock(&opp_table->lock);
+	list_for_each_entry(temp, &opp_table->opp_list, node) {
+		if (dynamic == temp->dynamic) {
+			opp = temp;
+			break;
+		}
+	}
+
+	mutex_unlock(&opp_table->lock);
+	return opp;
+}
+
 bool _opp_remove_all_static(struct opp_table *opp_table)
 {
-	struct dev_pm_opp *opp, *tmp;
-	bool ret = true;
+	struct dev_pm_opp *opp;
 
 	mutex_lock(&opp_table->lock);
 
 	if (!opp_table->parsed_static_opps) {
-		ret = false;
-		goto unlock;
+		mutex_unlock(&opp_table->lock);
+		return false;
 	}
 
-	if (--opp_table->parsed_static_opps)
-		goto unlock;
-
-	list_for_each_entry_safe(opp, tmp, &opp_table->opp_list, node) {
-		if (!opp->dynamic)
-			dev_pm_opp_put_unlocked(opp);
+	if (--opp_table->parsed_static_opps) {
+		mutex_unlock(&opp_table->lock);
+		return true;
 	}
 
-unlock:
 	mutex_unlock(&opp_table->lock);
 
-	return ret;
+	/*
+	 * Can't remove the OPP from under the lock, debugfs removal needs to
+	 * happen lock less to avoid circular dependency issues.
+	 */
+	while ((opp = _opp_get_next(opp_table, false)))
+		dev_pm_opp_put(opp);
+
+	return true;
 }
 
 /**
@@ -1377,21 +1377,21 @@ bool _opp_remove_all_static(struct opp_table *opp_table)
 void dev_pm_opp_remove_all_dynamic(struct device *dev)
 {
 	struct opp_table *opp_table;
-	struct dev_pm_opp *opp, *temp;
+	struct dev_pm_opp *opp;
 	int count = 0;
 
 	opp_table = _find_opp_table(dev);
 	if (IS_ERR(opp_table))
 		return;
 
-	mutex_lock(&opp_table->lock);
-	list_for_each_entry_safe(opp, temp, &opp_table->opp_list, node) {
-		if (opp->dynamic) {
-			dev_pm_opp_put_unlocked(opp);
-			count++;
-		}
+	/*
+	 * Can't remove the OPP from under the lock, debugfs removal needs to
+	 * happen lock less to avoid circular dependency issues.
+	 */
+	while ((opp = _opp_get_next(opp_table, true))) {
+		dev_pm_opp_put(opp);
+		count++;
 	}
-	mutex_unlock(&opp_table->lock);
 
 	/* Drop the references taken by dev_pm_opp_add() */
 	while (count--)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
