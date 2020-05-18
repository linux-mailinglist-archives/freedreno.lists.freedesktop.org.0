Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47C21D89B5
	for <lists+freedreno@lfdr.de>; Mon, 18 May 2020 23:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E91A6E491;
	Mon, 18 May 2020 21:00:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0486E286
 for <freedreno@lists.freedesktop.org>; Mon, 18 May 2020 21:00:03 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id z12so1906935uap.6
 for <freedreno@lists.freedesktop.org>; Mon, 18 May 2020 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vQAvXs8YebqJQNpvsgx+YOpDZkNHLr4/g7pen09M+Y=;
 b=UzmCAWI3Et1k/ZetXQXo8P7q5FAsHXBwwnFSCGgtDVWBYyDfVAPaFJFOP+/jbBxQPZ
 x63KZMFIM/dDJIh3QlTuH2yECcrZwYZCpiYH9MFtMCDOG8n18NeS6lZ7oPGMpcTGWu85
 xnn+GfXK8uB79yIF6irfWr1brh/7UoNiSPDHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vQAvXs8YebqJQNpvsgx+YOpDZkNHLr4/g7pen09M+Y=;
 b=dE+Yss7Xs9frwi1RkSk6oFqmX59QYnlTdkNOb61Ex0WFJAUT7Hbvr/2dQsItSo4S2Q
 bQG+IDIXpwDa4sxGR1O/5pNF1eK5H6sg6hxGF1on8GUO2mcUE8Yj96ee986QShx1r3Vd
 HWESy3mvHlQQ8XN88noW/Devz2APL3frFco2mRJkQ26hzWKS6vvyysemjl8llWHQMbqJ
 HNRnxh9k0GijJWwBSCXgJz6+CuXj8LjFRPZbOer9NrSl5Xt+uc2VO2Aeum0LgMoZEHl7
 6+18Zp0Y+t2MFfFTN47RJldxC4TDBdrQvEvzs7jtslserorml1LxVvuHKEFKWRytq+f2
 /huA==
X-Gm-Message-State: AOAM5305oWa2FIglsZUGzkDEUEovxtSpVNZ24eD0ElgS9iKx3M1/03Mg
 yiO3mc2OlhoMN8vMVXGoBFPjAv6ZSGg=
X-Google-Smtp-Source: ABdhPJz56W8lEuknNEhKkQmByd2HBR+X3kjMXI2tUrzMidPZ5FOw+jWpZl5H8gI7ypSSXTwkZ+u7mw==
X-Received: by 2002:ab0:1a1:: with SMTP id 30mr3051220ual.4.1589835602313;
 Mon, 18 May 2020 14:00:02 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id d2sm3126098vsp.4.2020.05.18.14.00.00
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 14:00:01 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id g7so3992889uap.7
 for <freedreno@lists.freedesktop.org>; Mon, 18 May 2020 14:00:00 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr12713480uak.91.1589835600274; 
 Mon, 18 May 2020 14:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
 <20200518143920.GJ32394@willie-the-truck>
In-Reply-To: <20200518143920.GJ32394@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 May 2020 13:59:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=We2+5QHimzr+ukit9qkDKQaaTHYEZGkVbOwsNuy11k9A@mail.gmail.com>
Message-ID: <CAD=FV=We2+5QHimzr+ukit9qkDKQaaTHYEZGkVbOwsNuy11k9A@mail.gmail.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [Freedreno] [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180
 compatible string
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
 Sharat Masetty <smasetty@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, May 18, 2020 at 7:39 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, May 15, 2020 at 12:05:39PM -0700, Doug Anderson wrote:
> > On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> > >
> > > This patch simply adds a new compatible string for SC7180 platform.
> > >
> > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > ---
> > >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 6515dbe..986098b 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -28,6 +28,7 @@ properties:
> > >            - enum:
> > >                - qcom,msm8996-smmu-v2
> > >                - qcom,msm8998-smmu-v2
> > > +              - qcom,sc7180-smmu-v2
> > >                - qcom,sdm845-smmu-v2
> > >            - const: qcom,smmu-v2
> >
> > Is anything blocking this patch from landing now?
>
> I thought updates to the bindings usually went via Rob and the device-tree
> tree, but neither of those are on cc.
>
> Perhaps resend with that fixed?

Ah, I guess I wasn't familiar with how things worked for this file, or
maybe things have changed recently?  I'm used to most bindings going
through the same tree as the drivers that use them.  Usually if things
are at all complicated maintainers wait for an Ack from Rob (so he
should have been CCed for sure) and then land.

In this case it actually looks like Bjorn landed it in the Qualcomm
and I just didn't realize it.  That seems like it should be fine since
it's in the middle of a clause that's all Qualcomm and the change
shouldn't be controversial in any way.  :-)

Thanks!

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
