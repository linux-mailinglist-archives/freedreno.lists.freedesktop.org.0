Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD311EEDE9
	for <lists+freedreno@lfdr.de>; Fri,  5 Jun 2020 00:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4429D6E7D0;
	Thu,  4 Jun 2020 22:47:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ABB6E7D0
 for <freedreno@lists.freedesktop.org>; Thu,  4 Jun 2020 22:47:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591310869; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=vYicqcQtLpsFLKWIXbvT0Lj5cAG7ilgk3go40nubi1w=;
 b=EaS962yqmwP3XeBfYqQHpnXq6zEqVpe3UMomk9Xpy20afWOAdJAPqTMM9RTSiwlLrqhTepxG
 TzzM+66OoxZDLb5lRNwrfPGfbAwaWnIsa9yBmkFAEp9Z2dEaF85tLot3n9SB/txUq9sBMIQw
 3+MWr1jE7l9R107uDRU7YU/FKjI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ed97a07ea0dfa490eabf4c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 22:47:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C7A03C43387; Thu,  4 Jun 2020 22:47:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D628C433C6;
 Thu,  4 Jun 2020 22:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D628C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 4 Jun 2020 16:47:29 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200604224729.GB12322@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
References: <20200604205710.3167-1-jcrouse@codeaurora.org>
 <20200604205710.3167-7-jcrouse@codeaurora.org>
 <CAF6AEGt4N5+0h0fkrO7m6KD3VMXkdoFyhN5Nz72DcMjoHX6XWA@mail.gmail.com>
 <20200604220216.GA12322@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGssC5ZJKh3oMR6fFRJwZvWLy4YjE2anvq5sDmPB_ikv0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGssC5ZJKh3oMR6fFRJwZvWLy4YjE2anvq5sDmPB_ikv0Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jun 04, 2020 at 03:38:28PM -0700, Rob Clark wrote:
> On Thu, Jun 4, 2020 at 3:02 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Thu, Jun 04, 2020 at 02:27:21PM -0700, Rob Clark wrote:
> > > On Thu, Jun 4, 2020 at 1:57 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > > >
> > > > Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> > > > split pagetables.
> > > >
> > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > > ---
> > > >
> > > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > index 8eb5a31346d2..8b15cd74e9ba 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > @@ -3556,7 +3556,7 @@
> > > >                 };
> > > >
> > > >                 adreno_smmu: iommu@5040000 {
> > > > -                       compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> > > > +                       compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
> > >
> > > Should this be something like:
> > >
> > >    compatible = "qcom,adreno-smmu", "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> > >
> > > so that new dtb still works with old kernel?
> >
> > As far as I know qcom,sdm845-smmu-v2 never was actually used unless we were
> > doing the parsing trick somewhere.
> 
> I *think* it has a use queued up for v5.8 for the
> select-direct-mapping stuff?  I'm not 100% sure of the status of that
> off the top of my head.

That uses the compatible string of the consumer device.  I can add
it back in but I didn't think we needed to complicate the bindings any more if
we didn't have to.

Jordan

> BR,
> -R
> 
> > Jordan
> >
> > > >                         reg = <0 0x5040000 0 0x10000>;
> > > >                         #iommu-cells = <1>;
> > > >                         #global-interrupts = <2>;
> > > > --
> > > > 2.17.1
> > > >
> > > > _______________________________________________
> > > > Freedreno mailing list
> > > > Freedreno@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/freedreno
> > > _______________________________________________
> > > Freedreno mailing list
> > > Freedreno@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/freedreno
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
