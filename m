Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2543151E59
	for <lists+freedreno@lfdr.de>; Tue,  4 Feb 2020 17:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBE06E87B;
	Tue,  4 Feb 2020 16:35:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492F26E87B
 for <freedreno@lists.freedesktop.org>; Tue,  4 Feb 2020 16:34:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580834099; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=7F4mpaGJXV854XleOqax1nGTOQoZmnCONXLBD4S1uf4=;
 b=juamryasnWGmhUvwSeNML1UHZngot6AnRCZ3HBh6GW20qhNKnmWaIB5dBkH6jAq/pZ+jt34i
 NHFPmFpq/cHyWwx+luJvgT0+bh7dgtxvvjM9H8Lo6bOKTzFtQ/Ez5hHOVxs/BEtfNPPdZc8r
 uKgDjpkP3bjHYtC/9Red/EoX/xw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e399d2f.7f5080a98618-smtp-out-n03;
 Tue, 04 Feb 2020 16:34:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4A9B2C447A0; Tue,  4 Feb 2020 16:34:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A7310C433CB;
 Tue,  4 Feb 2020 16:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7310C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 4 Feb 2020 09:34:51 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200204163451.GA14568@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>,
 Amit Pundir <amit.pundir@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org>
 <1579763945-10478-2-git-send-email-smasetty@codeaurora.org>
 <CALAqxLU9-4YEF8mTjuPF+LBJH8fFw_OfrdT7JtTqib127RRaEA@mail.gmail.com>
 <CAF6AEGtxtJU5dJxd4idQgPL2HYgiLm2vJejjK-gzDXqtoaTr9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtxtJU5dJxd4idQgPL2HYgiLm2vJejjK-gzDXqtoaTr9w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH v2 2/3] drm: msm: a6xx: Add support for A618
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 John Stultz <john.stultz@linaro.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Feb 03, 2020 at 04:40:40PM -0800, Rob Clark wrote:
> On Mon, Feb 3, 2020 at 4:21 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, Jan 22, 2020 at 11:19 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
> > >
> > > This patch adds support for enabling Graphics Bus Interface(GBIF)
> > > used in multiple A6xx series chipets. Also makes changes to the
> > > PDC/RSC sequencing specifically required for A618. This is needed
> > > for proper interfacing with RPMH.
> > >
> > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > ---
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index dc8ec2c..2ac9a51 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -378,6 +378,18 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
> > >         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > >         int ret;
> > >
> > > +       /*
> > > +        * During a previous slumber, GBIF halt is asserted to ensure
> > > +        * no further transaction can go through GPU before GPU
> > > +        * headswitch is turned off.
> > > +        *
> > > +        * This halt is deasserted once headswitch goes off but
> > > +        * incase headswitch doesn't goes off clear GBIF halt
> > > +        * here to ensure GPU wake-up doesn't fail because of
> > > +        * halted GPU transactions.
> > > +        */
> > > +       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> > > +
> > >         /* Make sure the GMU keeps the GPU on while we set it up */
> > >         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> > >
> >
> > So I already brought this up on #freedreno but figured I'd follow up
> > on the list.
> >
> > With linus/master, I'm seeing hard crashes (into usb crash mode) with
> > the db845c, which I isolated down to this patch, and then to the chunk
> > above.
> 
> (repeating my speculation from #freedreno for benefit of those not on IRC)
> 
> I'm suspecting, that like the registers to take the GPU out of secure
> mode, this register is being blocked on LA devices (like db845c),
> which is why we didn't see this on cheza.
> 
> Maybe we can make this write conditional on whether we have a zap shader?

Sorry, I was WFH yesterday and didn't have IRC on.

The 845 doesn't have GBIF (it still uses VBIF) and on a AC enabled target large
chunks of unused register space would be blocked by default so Rob's hypothesis
is correct. Since the 845 is the only a6xx target that still has a VBIF a
!adreno_is_a630() check would do here, but I'm not 100% convinced we need this
code at all. We explicitly clear the GBIF halt in the stop function before the
headswitch is turned off so I think this is mostly unneeded paranoia.

I need to get a tree with the 618 code in it and I'll try to get a fix out
shortly.

Jordan

> > Dropping the gpu_write line above gets things booting again for me.
> >
> > Let me know if there are any follow on patches I can help validate.
> >
> > thanks
> > -john
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
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
