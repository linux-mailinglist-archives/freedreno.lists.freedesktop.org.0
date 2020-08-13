Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D0B243C37
	for <lists+freedreno@lfdr.de>; Thu, 13 Aug 2020 17:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C136D6E222;
	Thu, 13 Aug 2020 15:10:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1DE6E222
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 15:10:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g8so4987633wmk.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 08:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nuLP0ucN1jD0A5G/rbjKQ0IWTQZyFeBE7AA1MgUnySo=;
 b=uHdjMt59zx0NWygGT00vboekxP3muBYPVwS1Set3BcG6z8f9Lx3CEiTDhCKPM9Fj7d
 H7Zghzlo38jK3BNe6Q/V7mEVtBr96Qd6pWv5YN+FQsLmKLzb+BlOtjhpLdyO7zcNasUt
 Py62w87WtnJ8ls6D/5boqyKOaxS1li243OWJHj/gZv6ssIWfKoSLql/plqXYDPQEamXA
 kWGIOT1W3eFYxHLOeKNUv8Ys9xi9IEJYuFhvnN4Wt4dpfnAnzIzV6XdJXgAqHTT1liH2
 vG81U09rx74e6TuMs+pYpJhfXRlGxsHZasQ6K4UUntka++VMsPreF97mb6jnlEVEK+lk
 FnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nuLP0ucN1jD0A5G/rbjKQ0IWTQZyFeBE7AA1MgUnySo=;
 b=cmMKbJ+UlnkN8rUkfZmp88mZqoa0Q4Qg6R1bues8vRVvTEdIZYhHA9itbx29YmV4WG
 6HgGObzVL/gI/YzKFF3lC6g3AXxSi4UBEI2XjwDi1ehdAV7E09uUGKuyc+mFl6QQq1p2
 x0TL5CpFevxUWev82apUN46+S2Nfa4Ih94q2JYlyMSP0ZZvp2VBUald7OlapaoDqoypo
 +utGhB3ppNhvz8LB2rRKWT1ZhQYiZ/1JQHgv5pV6OqyE3hTBmHs7OO/uKPcN9z+MuLaf
 zSK6gLA37lHVfdj/jaTlRUS3gJZzAgR1RrXS4RD7H1cDrDyg/OC0tD3B1xpQWkzt7miU
 rwpQ==
X-Gm-Message-State: AOAM532gxwzt8riHfjJHyjOsurIuL4h5n0DLsTkXSZ6z/+4LCnGxHrDo
 VlRhuH/CEbcuBKgEhA0y2IHQqg+lOItjgl5TWHM=
X-Google-Smtp-Source: ABdhPJwyUB412yvyp91ddO2jHXQbWOlzquN4PZJB8fEibTvHbohj1VvNGz9vxVColKj4PFzWEixM2vzufgv+z0SGwwo=
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr5049269wmf.49.1597331416969; 
 Thu, 13 Aug 2020 08:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-5-jcrouse@codeaurora.org>
 <20200813131412.GB10256@willie-the-truck>
In-Reply-To: <20200813131412.GB10256@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Aug 2020 08:11:02 -0700
Message-ID: <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [Freedreno] [PATCH v12 04/13] iommu: Add a domain attribute to
 get/set a pagetable configuration
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 6:14 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 10, 2020 at 04:26:48PM -0600, Jordan Crouse wrote:
> > Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
> > arm-smmu to share the current pagetable configuration with the
> > leaf driver and to allow the leaf driver to set up a new pagetable
> > configuration under certain circumstances.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  include/linux/iommu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index fee209efb756..995ab8c47ef2 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -118,6 +118,7 @@ enum iommu_attr {
> >       DOMAIN_ATTR_FSL_PAMUV1,
> >       DOMAIN_ATTR_NESTING,    /* two stages of translation */
> >       DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> > +     DOMAIN_ATTR_PGTABLE_CFG,
> >       DOMAIN_ATTR_MAX,
> >  };
>
> Nobody other than the adreno gpu uses this, so can we avoid exposing it
> in the IOMMU API, please? Given that you have a reference to the adreno
> GPU device in the SMMU implementation code thanks to .alloc_context_bank(),
> can you squirrel some function pointers away in the driver data (i.e. with
> dev_set_drvdata()) instead?
>

Hmm, we are already using drvdata on the gpu side, and it looks like
arm-smmu is also using it.  Could we get away with stashing an extra
'void *' in iommu_domain itself?

Or alternatively, if we had a is_arm_smmu_domain(domain), then we
could just directly call some exported private fxns with the domain
ptr (which could then verify that the domain is actually an
arm_smmu_domain, and then from there that the smmu is indeed
qcom,adreno-smmu, to keep things sane)

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
