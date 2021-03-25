Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D90348C37
	for <lists+freedreno@lfdr.de>; Thu, 25 Mar 2021 10:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E296ECD4;
	Thu, 25 Mar 2021 09:09:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149E86ECD3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 09:09:12 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id j25so1398560pfe.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VWsn6esj8imf1uae7i0PYfEIqahCeH1CMSkS7p/mVYk=;
 b=HIBYhMJ3tP1aKPSwg0gUFOAmtXGabKSCvtt0vxq0cKr4wnvUWwGpH5l0/daMM0gb/q
 eIwN1cktfuMgY07XYtnR4aTFv6SgzyJlgqyBDscikKf+wOHVSMQVAuIXcbyikkFclA/K
 MuGM/06m6QL2fjldeVmJVaoJ/1ivyC1rsOIPx9oWGRx1XrxxHELz9ghFbUAAZcItYjAX
 62xPTBRZVJzPGGYRrt1LTVxDKe/NVKOQ3EyxKwXzDRmp9/8Q35XveLxwWjLE3b4jWTiY
 TguamkqvVDR4TQ+2YgOyTpHcp1WGhmTN0kndzst7ijFQqpPPyH+K2OR8r/0QkVhkChQD
 PfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VWsn6esj8imf1uae7i0PYfEIqahCeH1CMSkS7p/mVYk=;
 b=GeeWkjafXKaJFt1nNmpNL+oVKX3n+X+f4rwlEQ3BCqCkamk4kmgE75lc8jkcsK7n0p
 d3Dl7T6PzID8hAbIC8cN/SAAtzrx3QT+PyDlSnKiKW5bXvLWOb4DyFlGJeSrYsSvWIgR
 9lVvxod9siyMhIzgEEdzdBJfML60cr2akTFU5pNpbNX0gEn6PsErEiFg+aJq2Efjt+Wq
 +oAfWXPlUbvJDK+on7Mdozs21NV2L7agRw0zOOhC2ATo7wad6DybyWyFFhzyNkyUmGJr
 ToQRNQvq0zdDygq7gdh2wz5bbgSE2afaaWWT30iUn2qhn3f/k7dIugk37dLcD9BnjL+d
 +gRA==
X-Gm-Message-State: AOAM530rAV36DQrVoAwkOIJhNhmAMGwfoTWpf03Th7jFhlvN/52ROfre
 EIM/ar6qKyuwPukWsGat7spK2w==
X-Google-Smtp-Source: ABdhPJx75YaqoIXZKRzV6JNv+rXXkBOJ5fO88bVSyJdWvRiD9Mrig/3TUZdgxk+pZ1DK2jZHu6G8NA==
X-Received: by 2002:a63:e44a:: with SMTP id i10mr6546829pgk.404.1616663351651; 
 Thu, 25 Mar 2021 02:09:11 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id s184sm5341831pgb.63.2021.03.25.02.09.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Mar 2021 02:09:10 -0700 (PDT)
Date: Thu, 25 Mar 2021 14:39:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <20210325090909.pyzyt3xds2ajvm7i@vireshk-i7>
References: <20210314163408.22292-1-digetx@gmail.com>
 <20210314163408.22292-15-digetx@gmail.com>
 <b780c19f-7f5d-5453-dec1-062fa7c1dc07@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b780c19f-7f5d-5453-dec1-062fa7c1dc07@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH v3 14/15] media: venus: Convert to use
 resource-managed OPP API
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>, Steven Price <steven.price@arm.com>,
 Andy Gross <agross@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25-03-21, 10:13, Stanimir Varbanov wrote:
> Hi,
> 
> On 3/14/21 6:34 PM, Dmitry Osipenko wrote:
> > From: Yangtao Li <tiny.windzz@gmail.com>
> > 
> > Use resource-managed OPP API to simplify code.
> > 
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.h      |  1 -
> >  .../media/platform/qcom/venus/pm_helpers.c    | 35 +++++--------------
> >  2 files changed, 8 insertions(+), 28 deletions(-)
> 
> 
> I'll take this through media-tree once OPP API changes are merged.

Okay, dropped from my tree.

Thanks.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
