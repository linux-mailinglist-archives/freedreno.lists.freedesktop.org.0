Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B40243D57
	for <lists+freedreno@lfdr.de>; Thu, 13 Aug 2020 18:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0086E9FE;
	Thu, 13 Aug 2020 16:27:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE416E9FE
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 16:27:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z18so5818338wrm.12
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8A41jTFfKzD80jObOhia7RlfQfORZCQM0sSroioat0=;
 b=ltF5tFROgFAZgA5ykWdfcsD7a6IqKI1lHnkqk0uW8c1mUO/qzVluK8J1t8jmVU4Job
 +Vtmoin3OAPiYr73l3JEOUZ2gUWG37ta+25nQ1mYsZAe1/7npia4seT0uQnwwQMEYozf
 HfIw62D1Rw2pf0hw8IK2fApNoBdewGrJ4hMkkeVIkyeLNEO+zqe9XwTT+LvaIITCC1xv
 1xyi8enK2pWVuiyvYNl+LV1Nbe+j4UkavqT8Slf48jxAMw7lbGS2y6k/TeSnT1m1qkQ8
 UbQwWVqGIXGph/HTTeOyWh4MAQje6Nxo0grB6X9N0p8EBYF4hrSCRZEs/R2Kdx8WoFc6
 EwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8A41jTFfKzD80jObOhia7RlfQfORZCQM0sSroioat0=;
 b=DzB1FbucHj8py827EcbHri0HuMbf5YQsKtgrR/lWI2RzFCFJM6uruCOtUFtYgDQlGv
 PCYdjmxFXm3ssxftf/IDzuPQDMBpJrKLnmUM8zYJO2X0JFtSjVqwWDAuQsVTbuHh572Z
 igEKRcbCfM/peftaDKzlLdSF9Pk6aLJS6aUAjKbvvDxgJW1sbRM04RzJQq8akvDWz4YJ
 dQpsZx0S1TETUjP5bvgkZCOWIXvU54wQAMKwXz3tiemngbx5WCqAM44QwFJnC1vUgOBD
 lvy8IbvAdF+CmDQmibOCSDy244Qsqg0h/xv9VGl5TEzuGNTDed9db/ep1UTPoPEc6Nit
 i3EA==
X-Gm-Message-State: AOAM530VgW2jaUulxuwTXVA2369XW8GxUkjoLccG+1Wxd2yPNxcesiKL
 McX8wJla1aaZp/k3dup5xNX3WRTXbgUb7J/R3rw=
X-Google-Smtp-Source: ABdhPJzH/J7FP/7qCdkL8eeSCxCr1qpeQTRxwqPrMBjocRjU8savD+CGNSock5FfU9Bf2OHfq/Jig6M1BNJ0N1f/Sso=
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr4512119wrq.327.1597336036448; 
 Thu, 13 Aug 2020 09:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-5-jcrouse@codeaurora.org>
 <20200813131412.GB10256@willie-the-truck>
 <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com>
 <20200813151934.GA10534@willie-the-truck>
In-Reply-To: <20200813151934.GA10534@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Aug 2020 09:28:02 -0700
Message-ID: <CAF6AEGsfP14bJzdJP70YonM6J00+PAZVk2neURT3rb2+PcRNDg@mail.gmail.com>
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

On Thu, Aug 13, 2020 at 8:19 AM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Aug 13, 2020 at 08:11:02AM -0700, Rob Clark wrote:
> > On Thu, Aug 13, 2020 at 6:14 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Mon, Aug 10, 2020 at 04:26:48PM -0600, Jordan Crouse wrote:
> > > > Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
> > > > arm-smmu to share the current pagetable configuration with the
> > > > leaf driver and to allow the leaf driver to set up a new pagetable
> > > > configuration under certain circumstances.
> > > >
> > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > > ---
> > > >
> > > >  include/linux/iommu.h | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > > index fee209efb756..995ab8c47ef2 100644
> > > > --- a/include/linux/iommu.h
> > > > +++ b/include/linux/iommu.h
> > > > @@ -118,6 +118,7 @@ enum iommu_attr {
> > > >       DOMAIN_ATTR_FSL_PAMUV1,
> > > >       DOMAIN_ATTR_NESTING,    /* two stages of translation */
> > > >       DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> > > > +     DOMAIN_ATTR_PGTABLE_CFG,
> > > >       DOMAIN_ATTR_MAX,
> > > >  };
> > >
> > > Nobody other than the adreno gpu uses this, so can we avoid exposing it
> > > in the IOMMU API, please? Given that you have a reference to the adreno
> > > GPU device in the SMMU implementation code thanks to .alloc_context_bank(),
> > > can you squirrel some function pointers away in the driver data (i.e. with
> > > dev_set_drvdata()) instead?
> > >
> >
> > Hmm, we are already using drvdata on the gpu side, and it looks like
> > arm-smmu is also using it.  Could we get away with stashing an extra
> > 'void *' in iommu_domain itself?
>
> What I meant was, expose the type of whatever you put in there on the GPU
> side so that the SMMU impl can install its function pointers into a field of
> that structure. As far as I'm concerned, the SMMU impl code and the GPU
> driver are the same entity and we should keep their communication private,
> rather than expose it up the stack. After all, the GPU writes to the SMMU
> registers!
>
> If you really don't want to expose all of your gubbins, I suppose you
> could have a structure just for the SMMU view and container_of() out of
> that on the GPU side.

yeah, msm_gpu has a lot of internal state.. but I suppose we could
define a 'struct adreno_smmu_priv' and embed that in msm_gpu, and
throw in a get_gpu_drvdata() type wrapper for get_drvdata() to make
this not totally horrible in the various cases places that use
get_drvdata() currently.

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
