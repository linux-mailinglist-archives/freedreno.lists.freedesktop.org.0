Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 969374BA321
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 15:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116E010E33F;
	Thu, 17 Feb 2022 14:39:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D1310EB8F
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 14:39:00 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9E53C3F804;
 Thu, 17 Feb 2022 15:38:57 +0100 (CET)
Date: Thu, 17 Feb 2022 15:38:56 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20220217143856.dwdqlb2v5q6nnbin@SoMainline.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-14-vkoul@kernel.org>
 <20220217092707.2bfzga74xyicl4kb@SoMainline.org>
 <Yg4otzVk3HlA8rlE@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg4otzVk3HlA8rlE@matsya>
Subject: Re: [Freedreno] [REPOST PATCH v4 13/13] drm/msm/dsi: Add support
 for DSC configuration
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Vinod,

On 2022-02-17 16:21:35, Vinod Koul wrote:
> Hi Marijn,
> 
> On 17-02-22, 10:27, Marijn Suijten wrote:
> > Vinod,
> > 
> > On 2022-02-10 16:04:23, Vinod Koul wrote:
> > > When DSC is enabled, we need to configure DSI registers accordingly and
> > > configure the respective stream compression registers.
> > > 
> > > Add support to calculate the register setting based on DSC params and
> > > timing information and configure these registers.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > 
> > I supplied a rather extensive - yet merely scratching the surface -
> > review of this patch in:
> > 
> >     https://lore.kernel.org/linux-arm-msm/20211211000315.pavmcc7cc73ilb6l@SoMainline.org/
> 
> Sorry somehow I seem to have overlooked this one.

Glad to hear it was only just missed, hope it helps making these patches
truly a step-up from the downstream driver it was based on :)

> > 
> > It seems none of those points have been addressed, bar creating a mesa
> > MR to update dsi.xml with a subpar description of the registers (offsets
> > only).
> 
> Mesa MR was planned as we get more closer to having reviews.

I would have submitted them in parallel straight away and link them
together, so that review can commence immediately on both.  Perhaps then
the XML could be merged up-front so that these patches don't need to
block on a stable commit-hash to regenerate the headers from?
In this case I/we would have immediately requested to move all the
register constants and offsets (even those that currently have an
unknown meaning) into the XML, and we can later fill in the details.

> > For every point that is intentionally ignored, please at least supply a
> > justification of why you think this is the right thing to do.
> 
> Ofcourse, i will reply to these now and address as required.

Thanks, I'll try to clarify some points ASAP before you respin this.

- Marijn
