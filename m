Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E753624D76F
	for <lists+freedreno@lfdr.de>; Fri, 21 Aug 2020 16:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2246E5A0;
	Fri, 21 Aug 2020 14:40:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4942C6E5A0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Aug 2020 14:39:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598020801; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=f4QpQDB+MbSkZZvbfEWSvvZ3/lzOjyR6dXGT/NcXAIQ=;
 b=JEK8puis6ogysy9vKqoVXQBEv7i0YpoL/6nedOpK/45yO+2S6HOhHxpzk0VtHmos13JbNK47
 8cEXO5o2vNoDBa60FGnymCFVK1p9H1feS21nv8htGFSvFedct/MU9AHj7p05hQHPgKLF+c4y
 kYbaoNu6fOJE5Igpk6Cuj6N5DHA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f3fdcb5b09c62898fb5126b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 Aug 2020 14:39:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 78859C4339C; Fri, 21 Aug 2020 14:39:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AC05CC433C6;
 Fri, 21 Aug 2020 14:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC05CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 21 Aug 2020 08:39:38 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200821143938.GA27918@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200817220238.603465-1-robdclark@gmail.com>
 <20200817220238.603465-11-robdclark@gmail.com>
 <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
 <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Will Deacon <will@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 10:36:38AM -0700, Rob Clark wrote:
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
> 
> But I guess we could:  compatible = "qcom,sc7180-smmu-v2",
> "qcom,adreno-smmu", "qcom,smmu-v2";

I think the SoC specific string is intended for the "other" SMMU that everybody
else uses. Rarely would a workaround for that SMMU affect the GPU and vice
versa. Since these are the bindings it doesn't hurt to allow for the possibility
but I would be surprised if the occasion presented itself.

Jordan

> BR,
> -R
> 
> 
> 
> 
> >
> > -Doug
> >
> >
> > >        - description: Marvell SoCs implementing "arm,mmu-500"
> > >          items:
> > >            - const: marvell,ap806-smmu-500
> > > --
> > > 2.26.2
> > >

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
