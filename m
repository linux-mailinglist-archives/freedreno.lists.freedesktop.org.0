Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F97338A50
	for <lists+freedreno@lfdr.de>; Fri, 12 Mar 2021 11:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6796F554;
	Fri, 12 Mar 2021 10:37:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87136E59D
 for <freedreno@lists.freedesktop.org>; Fri, 12 Mar 2021 10:37:23 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id z65so12247709vsz.12
 for <freedreno@lists.freedesktop.org>; Fri, 12 Mar 2021 02:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3/Vc1Ah6eKHyLWI1pgidt8/nWh+3HJqZHQUqW0QsJY=;
 b=e/OV4wNhRA/Hs5pdnjxqlm48AcxIBgreDOOJNjy58xe/C+lYYaCP1LvYHtxw5nNMDd
 ALc5X7QtHJfqYjQJtkk29KbBS+sCEO+r861cukBYcKfIkwG7Ou4nlCW1n/UmnxXDl8UZ
 Z/fv7WEl9eLwGeyto13VUunS/sfPRI2c3QsnbpFtyEdc7Gfom8B6Uyb0CQaIhkyCgJpI
 Vsh00DPD7rj87XdaxRSYPfBsBAN7FvwewFG9kAbAybHO8w6BrDs7Q/oHkpYaTspxVr8g
 hG55hBJ9e6DnKN6cjQsuVlY7/n4MxMQTtSF3SukeI2+Zdfpe9OF7WCVtCu8zUxSY8ajX
 hHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3/Vc1Ah6eKHyLWI1pgidt8/nWh+3HJqZHQUqW0QsJY=;
 b=rqOll0dBWFa9+LsP8n6hKVNlCYAQMvUgNe131z7S0qhEt5l12/mAfdtbIyvFyjvNco
 QkTQwJaMKGHpFTbKLMR6oc3tZxEAyVMRrWVl/s3aVwzCnOU/sSPzng14K5+gH+twv5zp
 loONFkqWaTteUKUT6otEeJg5hPBf9SDYQqgGyV9NOzGY67fBX/noSdqRNejPEYJ0DrQz
 f7xQ2Axa5wh7WxAc70Z/yMotsWJ7LRDUFelpkSc5wqaQ7XE7Lehiu3WXwCQwqi8WBF+T
 2ZU3ndWWipihfkh2KzrLv4BEzJW+c6TspPIeytu3ghlgpqaRU0mslfVMPwkZDy8acSPR
 gCuA==
X-Gm-Message-State: AOAM533dDB0kmcQDpmtEmaEPwsP1GmBizFhWw5p0XfLAOdv9lJoLKvv3
 hHxrjNKsekUu5Wb3c5bCxqyGs7spzN1CgY3qLHbTFQ==
X-Google-Smtp-Source: ABdhPJyLTgXQd1zTmLlKpEGuucdoDu6MxM1Ifem4y53cs/Xb9ONexPA+wPxOnpJgqOBWr4/fpZSZO+YOQXGKhLX6tmk=
X-Received: by 2002:a67:6942:: with SMTP id e63mr8188302vsc.48.1615545442849; 
 Fri, 12 Mar 2021 02:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-2-digetx@gmail.com>
 <20210312053312.zgke2mzjkqmwn67i@vireshk-i7>
In-Reply-To: <20210312053312.zgke2mzjkqmwn67i@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 12 Mar 2021 11:36:46 +0100
Message-ID: <CAPDyKFqrUCjTfrNqZ4gFfQS6LpoQCevGc-tv4WVOwuGhx5iiBg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [Freedreno] [PATCH v2 01/14] opp: Add devres wrapper for
 dev_pm_opp_set_clkname
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
Cc: Nishanth Menon <nm@ti.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 lima@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>, Steven Price <steven.price@arm.com>,
 Andy Gross <agross@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-serial@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 12 Mar 2021 at 06:33, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 11-03-21, 22:20, Dmitry Osipenko wrote:
> > +struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name)
> > +{
> > +     struct opp_table *opp_table;
> > +     int err;
> > +
> > +     opp_table = dev_pm_opp_set_clkname(dev, name);
> > +     if (IS_ERR(opp_table))
> > +             return opp_table;
> > +
> > +     err = devm_add_action_or_reset(dev, devm_pm_opp_clkname_release, opp_table);
> > +     if (err)
> > +             opp_table = ERR_PTR(err);
> > +
> > +     return opp_table;
> > +}
>
> I wonder if we still need to return opp_table from here, or a simple
> integer is fine.. The callers shouldn't be required to use the OPP
> table directly anymore I believe and so better simplify the return
> part of this and all other routines you are adding here..

Yes, please. I was thinking along the same lines, when I reviewed the
mmc patch (patch9).

>
> If there is a user which needs the opp_table, let it use the regular
> non-devm variant.

Kind regards
Uffe
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
