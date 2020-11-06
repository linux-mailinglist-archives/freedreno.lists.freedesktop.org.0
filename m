Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6682A9021
	for <lists+freedreno@lfdr.de>; Fri,  6 Nov 2020 08:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402F96E075;
	Fri,  6 Nov 2020 07:16:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D281D6E075
 for <freedreno@lists.freedesktop.org>; Fri,  6 Nov 2020 07:16:24 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t14so268108pgg.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Nov 2020 23:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JK18Rhy91HwT2txRvUrbyN9C7BXKAqk0ab4AsbXgEMM=;
 b=OMswEcKlZ6u7lVSY5ZjSSjpAAlU8mNOo9Eab9GBjF7Pgt3q5emL/wrqJkccjhl5+NJ
 K5bUWEbteB646OruN6awgDclp8Lzv5xqRT+JScSZ5SJAVlaTlxFksMNjS/m1cXSqW022
 LOudcHy9smFLD8XB2TORYPNdms6hsEuAYfpjorA8jIXUolnD49bLaUTj3tk6yMcnIuP1
 mPKyjeauP4jYBIY1oc23BsZ4xGY1a270f+xshybPS05i03DPE2i6b2dH9KGme/JPtxNk
 fm5RjSsuPG4IctFnTMrugDND7eZAEL26f+jIHd7KzpLqTOoH34VEe+OZma5PpEOMy9vw
 Ou+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JK18Rhy91HwT2txRvUrbyN9C7BXKAqk0ab4AsbXgEMM=;
 b=U+wU6drwR+5ZNtg1RfvD1Y0wnito3QAO/CCsxDJ5OC5PgjEGL3ZDit8tlgaS2KjwoQ
 Nl4la3Q6Kk6f5/h07Hd71ag7obPh2orEkM2dKwMJWOZSE9K87vL6Wh3DR92jObIgfvO5
 cZzdSkivvaty7KErVyI75yyDGYcVEEl2icZ92nP3UhffC42VLB14W+Gy/s0o9lVRHwSB
 ADQ/k1wFntxzoBaDuqdBIuh16HSpFAxAaA1wbpwR5PClOjKqqBj13B4Degq012Ao8n0c
 OkP9eubsGFyAt68v7qOBjDj0AMcVSZ88i5Ivwj3jH7xfIWsKtx9OGtIiHrBS0xPNe0yH
 O5tA==
X-Gm-Message-State: AOAM532yIQbCJc/+LGdLZsIyrzXV4Jj+cEeIvC0xXqqgG2ATAQYFBDey
 B45v4GgXJ5BSx2bLtYiG4vcruw==
X-Google-Smtp-Source: ABdhPJz+ePL3+cF7buh0lCKBX22R8mn3p0gqXYRUxKc69GWG/jhsr0wV1j83B8aR9Cp3xNgjLldqkQ==
X-Received: by 2002:a17:90a:a394:: with SMTP id
 x20mr978947pjp.213.1604646984348; 
 Thu, 05 Nov 2020 23:16:24 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id t26sm863991pfl.72.2020.11.05.23.16.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 23:16:23 -0800 (PST)
Date: Fri, 6 Nov 2020 12:46:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201106071621.j732gt4nqifjrccd@vireshk-i7>
References: <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
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

On 05-11-20, 11:24, Rob Clark wrote:
> On Tue, Nov 3, 2020 at 7:04 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 03-11-20, 08:50, Rob Clark wrote:
> > > sorry, it didn't apply cleanly (which I guess is due to some other
> > > dependencies that need to be picked back to v5.4 product kernel), and
> > > due to some other things I'm in middle of debugging I didn't have time
> > > yet to switch to v5.10-rc or look at what else needs to
> > > cherry-picked..
> > >
> > > If you could, pushing a branch with this patch somewhere would be a
> > > bit easier to work with (ie. fetch && cherry-pick is easier to deal
> > > with than picking things from list)
> >
> > It has been in linux-next for a few days. Here is the HEAD to pick
> > from. There are few patches there since rc1.
> >
> > commit 203e29749cc0 ("opp: Allocate the OPP table outside of opp_table_lock")
> >
> 
> sorry for the delay, with that cherry-picked, I'm getting a whole lot of:

Ahh, sorry about that and thanks for reporting it. Here is the fix:

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index c718092757d9..6b7f0066942d 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -112,8 +112,6 @@ static struct opp_table *_find_table_of_opp_np(struct device_node *opp_np)
        struct opp_table *opp_table;
        struct device_node *opp_table_np;
 
-       lockdep_assert_held(&opp_table_lock);
-
        opp_table_np = of_get_parent(opp_np);
        if (!opp_table_np)
                goto err;
@@ -121,12 +119,15 @@ static struct opp_table *_find_table_of_opp_np(struct device_node *opp_np)
        /* It is safe to put the node now as all we need now is its address */
        of_node_put(opp_table_np);
 
+       mutex_lock(&opp_table_lock);
        list_for_each_entry(opp_table, &opp_tables, node) {
                if (opp_table_np == opp_table->np) {
                        _get_opp_table_kref(opp_table);
+                       mutex_unlock(&opp_table_lock);
                        return opp_table;
                }
        }
+       mutex_unlock(&opp_table_lock);
 
 err:
        return ERR_PTR(-ENODEV);

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
