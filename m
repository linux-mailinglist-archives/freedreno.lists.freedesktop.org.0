Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96ED1EEDC7
	for <lists+freedreno@lfdr.de>; Fri,  5 Jun 2020 00:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5E56E5D3;
	Thu,  4 Jun 2020 22:38:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1D36E5D3
 for <freedreno@lists.freedesktop.org>; Thu,  4 Jun 2020 22:38:05 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id a25so7831536ejg.5
 for <freedreno@lists.freedesktop.org>; Thu, 04 Jun 2020 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=J2WkUUsQWWdvfrqknuQ/1gKN6QCcS4GghlCaLSIsdOo=;
 b=RuyxW+laDxCnFYdR1DSXhWFe9hmsy8MmUSdRx7gfOV6BZ+PMG5eQgBYvvoBr0o1jP/
 CO6j6LmHfPfV+jhXz1DA4YWO6fcyXlNkdlDftOWUlHsR3EcW0Wh2XztTXzS1brB5I4gg
 9kqC0/qyII4ZCAECfmMt/etXcLCLHNHoEwIDP/+LeL2CDITbKaO+iHjyZ8vWUNXxeuqU
 fCP8+DEIM1lgadkYtB+ZzJGAZIBpVBzfIItCjBQlqAqDlsfb+ccx4dOpRjICJUq0n0Zo
 D5UO4Bjioy72L8N2YlHdnoShFWrJckHERD867Y15pK90KDu2HTUPl8J2x04GQMZxqEnx
 4VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=J2WkUUsQWWdvfrqknuQ/1gKN6QCcS4GghlCaLSIsdOo=;
 b=B7PjOqhgzXMxMIBrzSdfFpje5kO60EeVTNXxJwQ+ChoUKl9OWliDy4OdKaaQ55TMSx
 4OO7tTuP8P33X5PIaO6I9PlLz7SOYo/I75m4FxLwwn39xg8k8DbYroktz/YOVI3zWEhw
 KbAOoh6DbjySVSiZc44gVHt/YbXAnVujYKMDpaPDljNkKIxpnWv20zl0niSGQ/kXDr4v
 3ADjNomoS+70x36aOpT5TEjmm2Dzy5ZPtKlc7Qc5XCEZwFWTQpfIYl7CGvQ3V4h0FAT7
 xrVOSOEQ6uASb21IBHA4WlTrGU9lTsfzD6is6hYIQ8TDVi7Wi4FxmJu3zlki9UQVg7R9
 xDYQ==
X-Gm-Message-State: AOAM531eVZd4v7aG/8b4IiWiJZvv1qiNhyiDh/86IvrwFn9kxgnvdoMs
 Q7tSKjas5n5R00PCRIhxRv+uKieCe917z3SaCHU=
X-Google-Smtp-Source: ABdhPJy8WeQEeGlX2fHb6Mjbksvzlj+mlQnkk4tVXm4iXU9l4tIyCo0wa1lKiM2g3B0MnY9NvJLP/hcUOZzCFijeBIE=
X-Received: by 2002:a17:906:7696:: with SMTP id
 o22mr5604826ejm.245.1591310284494; 
 Thu, 04 Jun 2020 15:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200604205710.3167-1-jcrouse@codeaurora.org>
 <20200604205710.3167-7-jcrouse@codeaurora.org>
 <CAF6AEGt4N5+0h0fkrO7m6KD3VMXkdoFyhN5Nz72DcMjoHX6XWA@mail.gmail.com>
 <20200604220216.GA12322@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200604220216.GA12322@jcrouse1-lnx.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Jun 2020 15:38:28 -0700
Message-ID: <CAF6AEGssC5ZJKh3oMR6fFRJwZvWLy4YjE2anvq5sDmPB_ikv0Q@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, 
 freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH v7 6/6] arm6: dts: qcom: sm845: Set the
 compatible string for the GPU SMMU
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 3:02 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Thu, Jun 04, 2020 at 02:27:21PM -0700, Rob Clark wrote:
> > On Thu, Jun 4, 2020 at 1:57 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> > > split pagetables.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 8eb5a31346d2..8b15cd74e9ba 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -3556,7 +3556,7 @@
> > >                 };
> > >
> > >                 adreno_smmu: iommu@5040000 {
> > > -                       compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> > > +                       compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
> >
> > Should this be something like:
> >
> >    compatible = "qcom,adreno-smmu", "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> >
> > so that new dtb still works with old kernel?
>
> As far as I know qcom,sdm845-smmu-v2 never was actually used unless we were
> doing the parsing trick somewhere.

I *think* it has a use queued up for v5.8 for the
select-direct-mapping stuff?  I'm not 100% sure of the status of that
off the top of my head.

BR,
-R

> Jordan
>
> > >                         reg = <0 0x5040000 0 0x10000>;
> > >                         #iommu-cells = <1>;
> > >                         #global-interrupts = <2>;
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > Freedreno mailing list
> > > Freedreno@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/freedreno
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
