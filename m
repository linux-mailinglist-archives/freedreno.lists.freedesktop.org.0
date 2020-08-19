Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C6C24A5DC
	for <lists+freedreno@lfdr.de>; Wed, 19 Aug 2020 20:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2487D6E5B0;
	Wed, 19 Aug 2020 18:21:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680E26E0FC
 for <freedreno@lists.freedesktop.org>; Wed, 19 Aug 2020 18:21:00 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id p8so12430942vsm.12
 for <freedreno@lists.freedesktop.org>; Wed, 19 Aug 2020 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AacBmJ1F+/EQU2Ta6hd78j336wiWeooUogfDqt5vhVU=;
 b=MJ511LjL0Gf8T+5otwSMIHAYNGoOTa7oOz3vFzBU6AZJ6dAX+nI9cC7118htwG/ORX
 eBs8xHYraAXfTg3+3J/RFpfkMga9Cj17oTb4p/TBhXJhoh4jgceQywdVOQqMSK/JOJ3l
 PwBzJDQ8H04HrV4VQtbb6ovc5H+eRX5T4ho3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AacBmJ1F+/EQU2Ta6hd78j336wiWeooUogfDqt5vhVU=;
 b=GmjBndU9MiIGkc/ZCZ5wk64mKkIU0+t0qkZXaG7eUanR0L9VNiT/uaD2yDrAPg4tay
 BS10+9QTZg9viZP7offQZY2UAbdHW7r6At4eGI1KEjrq4G1hVvfhp7KVY/Quhgn70zl5
 bS0nqTDmJ9zfEWLRL5IswDB+H2A0/TmSFegIUEvZ6OERWnQ6M3yhk7z2/xAx2NqHfWB8
 Cpnu4slxcHJS+hCu39KsrhtbZgmRCg75b+8ErqP8vUg7t9TZH5CekbkASyJHy+E5jHI+
 tE7jYGMqhKkIzae9444RYI0xkIstK6TCv9HepcnJGCp5NCMwEtqJ0AGIHlGKZnl3HGiR
 ZeDQ==
X-Gm-Message-State: AOAM532pzTsIddW2Bi4NbWIaR53X8NEmMmlDaFLS54pGEyVslUxr2I2w
 71EbEgAbldKri47KiXoc2clPQYMqZsWuNQ==
X-Google-Smtp-Source: ABdhPJzRKJyQuf8OWme0kHyNNoKTwSgFd8sext81qfLAtT9K/NfynTTzSzFcLNTJS/Ocedf7YZkl0Q==
X-Received: by 2002:a05:6102:232f:: with SMTP id
 b15mr15485405vsa.233.1597861259176; 
 Wed, 19 Aug 2020 11:20:59 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id y21sm4929152vkl.53.2020.08.19.11.20.57
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id i20so5341533vkk.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
X-Received: by 2002:a1f:2fc1:: with SMTP id v184mr15612583vkv.42.1597861257099; 
 Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com>
 <20200817220238.603465-11-robdclark@gmail.com>
 <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
 <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
In-Reply-To: <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2020 11:20:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxtA_1gp=gahjZiPkCJUy9ZgRoEnnE4apUQ1WVX_cs4A@mail.gmail.com>
Message-ID: <CAD=FV=XxtA_1gp=gahjZiPkCJUy9ZgRoEnnE4apUQ1WVX_cs4A@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 10/20] dt-bindings: arm-smmu: Add compatible
 string for Adreno GPU SMMU
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 19, 2020 at 10:36 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Aug 19, 2020 at 10:03 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Aug 17, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Jordan Crouse <jcrouse@codeaurora.org>
> > >
> > > Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> > > devices depend on unique features such as split pagetables,
> > > different stall/halt requirements and other settings. Identify them
> > > with a compatible string so that they can be identified in the
> > > arm-smmu implementation specific code.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 503160a7b9a0..5ec5d0d691f6 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -40,6 +40,10 @@ properties:
> > >                - qcom,sm8150-smmu-500
> > >                - qcom,sm8250-smmu-500
> > >            - const: arm,mmu-500
> > > +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> > > +        items:
> > > +          - const: qcom,adreno-smmu
> > > +          - const: qcom,smmu-v2
> >
> > I know I'm kinda late to the game, but this seems weird to me,
> > especially given the later patches in the series like:
> >
> > https://lore.kernel.org/r/20200817220238.603465-19-robdclark@gmail.com
> >
> > Specifically in that patch you can see that this IOMMU already had a
> > compatible string and we're changing it and throwing away the
> > model-specific string?  I'm guessing that you're just trying to make
> > it easier for code to identify the adreno iommu, but it seems like a
> > better way would have been to just add the adreno compatible in the
> > middle, like:
> >
> >       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> >         items:
> >           - enum:
> >               - qcom,msm8996-smmu-v2
> >               - qcom,msm8998-smmu-v2
> >               - qcom,sc7180-smmu-v2
> >               - qcom,sdm845-smmu-v2
> >         - const: qcom,adreno-smmu
> >         - const: qcom,smmu-v2
> >
> > Then we still have the SoC-specific compatible string in case we need
> > it but we also have the generic one?  It also means that we're not
> > deleting the old compatible string...
>
> I did bring up the thing about removing the compat string in an
> earlier revision of the series.. but then we realized that
> qcom,sc7180-smmu-v2 was never actually used anywhere.

Right, so at least there's not going to be weird issues where landing
the dts before the code change will break anything.


> But I guess we could:  compatible = "qcom,sc7180-smmu-v2",
> "qcom,adreno-smmu", "qcom,smmu-v2";

Yeah, that was what I was suggesting.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
