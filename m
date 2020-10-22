Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D742959DA
	for <lists+freedreno@lfdr.de>; Thu, 22 Oct 2020 10:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0FE6F539;
	Thu, 22 Oct 2020 08:06:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6BB6F539
 for <freedreno@lists.freedesktop.org>; Thu, 22 Oct 2020 08:06:47 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id p21so598522pju.0
 for <freedreno@lists.freedesktop.org>; Thu, 22 Oct 2020 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TVfb7WnwNXKGUxz4iiR3sXsOPTJFuGFroopSW7eD6Gk=;
 b=VXy3s7QjvhLDl7KsBOg8MVmOhDTShSxGrDo6aWcBaOc02FD0F85qf0Ti+YtY62gqo0
 fQvsKNmMSTtfrleV5GPKxLU+JcUEc2NSUgl+bZqbTTJxWGVdAW4Ks+6O+WpMyT0UYZQU
 Rk77fNgDCNEX1rBFx3tEw9PNvK5zoEOTcw4Exzt4s4Kw7B/lg/rPlU9NFNmT5+fHkPsJ
 L6jVrWsH6VfFT6UlRDL93//CvMxZ+gekuFnxD58I6yOGqSKCXsq41PVDX1T/ttn8Zw46
 jyhR4qHH+pZ/cQmtByv3Eoc+7RyZzWcCjxuptfiSir3cOI6jaqjAtUWeYCqvGt5RwgoA
 0OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TVfb7WnwNXKGUxz4iiR3sXsOPTJFuGFroopSW7eD6Gk=;
 b=MOGBWtoQTJV4JziDLtpF5HszkF9sSc0UDQsojxZHBYeO1XFC+5xqjvSjNhjcPeyjJd
 lB1eUq7WU7YIWmTAIJg4kdJ7rqtiaBVuhVcb5MDBeBkZi/Ch9CCrBN9i7Xm9LC/Tt+h+
 V9YhbVgwXigkULyPX3z4dn06aKzRuQo9oxOlxsM9YEFxVTFan3UFg/CHqTMquY4iJ1Ft
 ic7DtzeOpy9893hUSNZ/cGWJfpE8gmwwx27FjtdhBrvCNB4o6GQXMhctUH4KwFgTLrJQ
 Wl+UkcYjZ7R22t0qXkDUL9WIR6+2FM1BnSxB2s6bM77PgZEUOfX60J07Jo28dLw+gNNW
 c2tA==
X-Gm-Message-State: AOAM530bvkx6L5VCJZyM1Y6jqlEdazuinhTkx0/fiYxlAJPptY1IqDNN
 /JL2CwHFSYLoEFikOiNhtYumEQ==
X-Google-Smtp-Source: ABdhPJwVqL7oVk5t6FqFadGaytgpFZzZfoLCZKLY/TTEFKuYJ70F6UW4MwiJzoxuD6cE1PnzwUK9mQ==
X-Received: by 2002:a17:902:7fcd:b029:d3:f037:d9dc with SMTP id
 t13-20020a1709027fcdb02900d3f037d9dcmr1305142plb.79.1603354007060; 
 Thu, 22 Oct 2020 01:06:47 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id v13sm1292150pgl.6.2020.10.22.01.06.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2020 01:06:46 -0700 (PDT)
Date: Thu, 22 Oct 2020 13:36:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
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

On 20-10-20, 07:13, Rob Clark wrote:
> On Tue, Oct 20, 2020 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 20-10-20, 12:56, Daniel Vetter wrote:
> > > Yeah that's bad practice. Generally you shouldn't need to hold locks
> > > in setup/teardown code, since there's no other thread which can
> > > possible hold a reference to anything your touching anymore. Ofc
> > > excluding quickly grabbing/dropping a lock to insert/remove objects
> > > into lists and stuff.
> > >
> > > The other reason is that especially with anything related to sysfs or
> > > debugfs, the locking dependencies you're pulling in are enormous: vfs
> > > locks pull in mm locks (due to mmap) and at that point there's pretty
> > > much nothing left you're allowed to hold while acquiring such a lock.
> > > For simple drivers this is no issue, but for fancy drivers (like gpu
> > > drivers) which need to interact with core mm) this means your
> > > subsystem is a major pain to use.
> > >
> > > Usually the correct fix is to only hold your subsystem locks in
> > > setup/teardown when absolutely required, and fix any data
> > > inconsistency issues by reordering your setup/teardown code: When you
> > > register as the last step and unregister as the first step, there's no
> > > need for any additional locking. And hence no need to call debugfs
> > > functions while holding your subsystem locks.
> > >
> > > The catch phrase I use for this is "don't solve object lifetime issues
> > > with locking". Instead use refcounting and careful ordering in
> > > setup/teardown code.
> >
> > This is exactly what I have done in the OPP core, the locks were taken
> > only when really necessary, though as we have seen now I have missed
> > that at a single place and that should be fixed as well. Will do that,
> > thanks.
> 
> I do have an easy enough way to repro the issue, so if you have a
> patch I can certainly test it.

Does this fix it for you ? There is one more place still left where we
are taking the opp_table_lock while adding stuff to debugfs and that's
not that straight forward to fix. But I didn't see that path in your
circular dependency trace, so who knows :)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 2483e765318a..4cc0fb716381 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1181,6 +1181,10 @@ static void _opp_table_kref_release(struct kref *kref)
        struct opp_device *opp_dev, *temp;
        int i;
 
+       /* Drop the lock as soon as we can */
+       list_del(&opp_table->node);
+       mutex_unlock(&opp_table_lock);
+
        _of_clear_opp_table(opp_table);
 
        /* Release clk */
@@ -1208,10 +1212,7 @@ static void _opp_table_kref_release(struct kref *kref)
 
        mutex_destroy(&opp_table->genpd_virt_dev_lock);
        mutex_destroy(&opp_table->lock);
-       list_del(&opp_table->node);
        kfree(opp_table);
-
-       mutex_unlock(&opp_table_lock);
 }
 
 void dev_pm_opp_put_opp_table(struct opp_table *opp_table)

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
