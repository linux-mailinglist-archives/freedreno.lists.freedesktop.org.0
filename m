Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D0429D069
	for <lists+freedreno@lfdr.de>; Wed, 28 Oct 2020 15:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A98D6E544;
	Wed, 28 Oct 2020 14:46:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4176E544
 for <freedreno@lists.freedesktop.org>; Wed, 28 Oct 2020 14:46:32 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s22so2900681pga.9
 for <freedreno@lists.freedesktop.org>; Wed, 28 Oct 2020 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ywjXoX2kkK2KmqL6ZyGoB6Pybvnry+Rvqj9uaI5d5iE=;
 b=X5W234U1YTYXSeJeyK2Vk+eLiUVBUfulNxLgtgDTC7Y2iq0ShIDFDyJL/pdwnwYUa+
 OEYlEzLQjjCTHnrkgNNR7g00BW8ESFAEEQT1XcoJj6ZFN54o+wKgCxjD+O60PhuDQ7vD
 84AXSoKF6QrULCiwA8LXd2DmMUV2GG7NtSjIJ6BviQWr4LdyVlTkrWrzwGw1XwH04BXw
 wUann1odVUWJfSTWmw+2UN7YWM3rbwimRI5KzkuOeG5fKlaBIz9oc3Vs4E2lZJFK3gLq
 v5fMgJHzOEzcx8IjzPNRfwrnMS/3QWCVvcyZ6Acqu806VBeEArIYp+nxMc7wfmvp6hZI
 ASUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ywjXoX2kkK2KmqL6ZyGoB6Pybvnry+Rvqj9uaI5d5iE=;
 b=p/vVEykBmdON1kMWHu01ooK8QiQuO3/bjR1Cuouv/IxhPzLRS6Bcn10Kl8kJ8bBNfN
 OV15QAxPvCbx34ysPnLIFCQfXqKr0/wTMghU6JkIGPxgfWkZ6WUG/F9YdLEPjM4gCpUV
 fFIpcNBB6PQ5exPEP5BMe4jLsFzydiNX35SFwbl/vOEXpVRSsXKPjaP+qg/PNcT3fxWM
 oNamd0mDd+q4IWtIr3kcm0LyfQ+sOvz7QP5M/8EaOAWbyUIRT8hz9sLbDLheWlRLeEot
 VMku4hiR5R83snRI67gyYl+2M0JQOJLnzAepqg/Trp2AuwLuk2WKy/OMqQgvNINILTJE
 jPdg==
X-Gm-Message-State: AOAM5307Aa2j77gf8X+C1VWBAkvSOY2iF+/L0IAojLY+0+4v/aq3XZrF
 r9aK3k/B7ATPSfu8XXH0PPSYKg==
X-Google-Smtp-Source: ABdhPJxGfGHUfZR5/hgoqBA9Cp4UZZF2zoq2xSX/vVSEcnm+GlrQO4gwem8tQVD3yMYhu0Zz27HGPQ==
X-Received: by 2002:a63:e444:: with SMTP id i4mr6715119pgk.304.1603896392305; 
 Wed, 28 Oct 2020 07:46:32 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id y5sm3087840pfq.79.2020.10.28.07.46.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2020 07:46:31 -0700 (PDT)
Date: Wed, 28 Oct 2020 20:16:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <tiny.windzz@gmail.com>
Message-ID: <20201028144628.qm2t2hbzmouqkciy@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
 <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
 <CAEExFWvNgK2wbvmxZjsJR4g-VBq=ggsBLew77rzmNdkpqTRuDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEExFWvNgK2wbvmxZjsJR4g-VBq=ggsBLew77rzmNdkpqTRuDA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH 2/3] opp: Add devres wrapper for
 dev_pm_opp_set_prop_name
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 Frank Lee <frank@allwinnertech.com>, eric@anholt.net, airlied@linux.ie,
 Viresh Kumar <vireshk@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, jcrouse@codeaurora.org,
 dri-devel@lists.freedesktop.org, gustavoars@kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, kholk11@gmail.com,
 Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28-10-20, 19:02, Frank Lee wrote:
> On Wed, Oct 28, 2020 at 6:29 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 12-10-20, 21:55, Frank Lee wrote:
> > > From: Yangtao Li <tiny.windzz@gmail.com>
> > >
> > > Add devres wrapper for dev_pm_opp_set_prop_name() to simplify driver
> > > code.
> > >
> > > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > > Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> > > ---
> > >  drivers/opp/core.c     | 39 +++++++++++++++++++++++++++++++++++++++
> > >  include/linux/pm_opp.h |  6 ++++++
> > >  2 files changed, 45 insertions(+)
> >
> > On a second thought I am looking at dropping this one as you haven't
> > added any users yet and I am afraid it will stay unused.
> 
> Now it looks like that dev_pm_opp_set_prop_name() is used relatively less.
> Maybe we can wait until a caller, and then pick up the patch.

I am even wondering if we should be adding any of the devm_* helpers
for now to be honest. Even for the other one we have only one user.
Them major user of the OPP core is the CPU subsystem and it is never
going to use these devm_* helpers as the CPU device doesn't get bound
to a driver, it is rather a fake platform device which gets the
cpufreq drivers probed. So the only users of these devm_* helpers is
going to be non-CPU devices. Considering that we have only one user
right now, it may be better to just fix it instead of adding any of
the devm_* helpers.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
