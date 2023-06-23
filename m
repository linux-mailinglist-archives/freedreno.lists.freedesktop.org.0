Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68373BF81
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 22:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DBD10E6B1;
	Fri, 23 Jun 2023 20:27:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C2210E6B0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 20:27:11 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5279B3F7A3;
 Fri, 23 Jun 2023 22:27:09 +0200 (CEST)
Date: Fri, 23 Jun 2023 22:27:08 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <7j4j243bpp7azi6zgpce23u3xnvjp3vo5flanzn4s7vsd24nrg@e5iadl6hcdlc>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
 <wbeyverizh4644grwtz4r62gb5rypsuufs4ixz4qx5jl4233hr@uexh36futuys>
 <6579ad4d-03ce-1320-3751-4b725fe3474e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6579ad4d-03ce-1320-3751-4b725fe3474e@quicinc.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-23 12:36:06, Abhinav Kumar wrote:
> 
> 
> On 6/22/2023 11:57 PM, Marijn Suijten wrote:
> > On 2023-06-23 08:54:39, Marijn Suijten wrote:
> >> On 2023-06-22 22:47:04, Abhinav Kumar wrote:
> >>> On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
> >>>> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
> >>>> This includes the common block itself, enc subblocks and some empty
> >>>> space around. Change that to pass 0x4 instead, the length of common
> >>>> register block itself.
> >>>>
> >>>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> There is no need of a fixes tag for this.
> >>>
> >>> This is not a bug but was intentional.
> >>>
> >>> Till we added sub-block parsing support we had to dump the whole block.
> >>>
> >>> And hence I would suggest this change should be merged after the
> >>> sub-block parsing change otherwise we wont have full register dumps for DSC.
> >>
> >> This was indeed intentional, we discussed it in [1].
> >>
> >> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
> >> the CTL registers, but that change didn't make it through.  0x29c is an
> >> arbitrary number that I have no clue what it was based on.
> > 
> > Ah, as expected Dmitry's second commit clarifies that the last register
> > in the enc block is at 0x98, and the base of the enc + length of the enc
> > then is 0x200 + 0x9c.
> > 
> > That still excludes the ctl sblk.
> 
> 0x29c is not an arbitrary number. The last encoder offset is 0x298 so we 
> add 4 more to that.

That is literally what I said in this correction followup ;)

> Yes it will still exclude ctl blk as that space is not contiguous and we 
> dont want to increase len all the way to 0xf00.

Sure, it's quite a lot of "dead space" to have in-between.  Looking
forward to having better dumpers.

- Marijn
