Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2514F3A3
	for <lists+freedreno@lfdr.de>; Fri, 31 Jan 2020 22:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2029B6FBE8;
	Fri, 31 Jan 2020 21:18:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1B76FBE8
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 21:18:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580505504; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=c5POQGsK03IMyYhyXfqfpslU7IQ1EXdg2hdGsgrQr9c=;
 b=N18fVbf/0nbPQ30ArkWoXHlW2NEKJeY9Bt7ZXJOINjDsUgdvsYNUgfO2M/qnYLUPVGgZgBPe
 iWAwQy/TRpbViJUqqwjFYLXMLeyxojNThShqV9Qh8DJrl/sOev4EA6auXIkembNBqNd/qmOk
 TvRUFlSPO1s3ls4TEyE0XzmKhI0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e349999.7fb1f2802618-smtp-out-n03;
 Fri, 31 Jan 2020 21:18:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 33CC7C447A9; Fri, 31 Jan 2020 21:18:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 94395C447A4;
 Fri, 31 Jan 2020 21:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94395C447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 31 Jan 2020 14:18:13 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200131211813.GA16531@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Rob Clark <robdclark@chromium.org>,
 linux-arm-msm-owner@vger.kernel.org
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
 <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
 <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu
 dt blob
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jan 31, 2020 at 08:08:09AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 31, 2020 at 4:16 AM <smasetty@codeaurora.org> wrote:
> >
> > >> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000
> > >> 0 0x10000>,
> > >> +                               <0 0x0b490000 0 0x10000>;
> > >> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> > >> +                       interrupts = <GIC_SPI 304
> > >> IRQ_TYPE_LEVEL_HIGH>,
> > >> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> > >> +                       interrupt-names = "hfi", "gmu";
> > >> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > >> +                              <&gpucc GPU_CC_CXO_CLK>,
> > >> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > >> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> > >> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> > >> +                       power-domains = <&gpucc CX_GDSC>;
> > >
> > > Bindings claim that you need both CX and GC.  Is sc7180 somehow
> > > different?  Bindings also claim that you should be providing
> > > power-domain-names.
> > No this is still needed, We need the GX power domain for GPU recovery
> > use cases where the shutdown was not successful.
> 
> This almost sounds as if the bindings should mark the GX power domain
> as optional?  The driver can function without it but doesn't get all
> the features?  As the binding is written right now I think it is
> "invalid" to not specify a a GX power domain and once the yaml
> conversion is done then it will even be flagged as an error.  That's
> going to make it harder to land the your patch...

For GMU attached targets the GX power domain is mandatory assuming you want to
recover successfully from a hard GMU hang, that is.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
