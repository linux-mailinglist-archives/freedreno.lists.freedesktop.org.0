Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69EC3D966C
	for <lists+freedreno@lfdr.de>; Wed, 28 Jul 2021 22:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EB86E1AA;
	Wed, 28 Jul 2021 20:11:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC2B6E0C1
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jul 2021 20:11:45 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 11b79c7f-efe0-11eb-8d1a-0050568cd888;
 Wed, 28 Jul 2021 20:12:01 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 82FBC194B23;
 Wed, 28 Jul 2021 22:12:02 +0200 (CEST)
Date: Wed, 28 Jul 2021 22:11:39 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Dan.Sneddon@microchip.com
Message-ID: <YQG5+/9lPexU3Dn3@ravnborg.org>
References: <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
Subject: Re: [Freedreno] [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ
 interfaces
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, stefan@agner.ch,
 amd-gfx@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 patrik.r.jakobsson@gmail.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, tzimmermann@suse.de, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com,
 christian.koenig@amd.com, robdclark@gmail.com, kernel@pengutronix.de,
 alexander.deucher@amd.com, shawnguo@kernel.org, brian.starkey@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dan,

> > 
> > I think I got it - we need to set irq_enabled to true.
> > The documentation says so:
> > "
> >           * @irq_enabled:
> >           *
> >           * Indicates that interrupt handling is enabled, specifically vblank
> >           * handling. Drivers which don't use drm_irq_install() need to set this
> >           * to true manually.
> > "
> > 
> > Can you try to add the following line:
> > 
> > 
> > +static int atmel_hlcdc_dc_irq_install(struct drm_device *dev, unsigned int irq)
> > +{
> > +       int ret;
> > +
> > +       if (irq == IRQ_NOTCONNECTED)
> > +               return -ENOTCONN;
> > +
> > 
> >          dev->irq_enabled = true;                <= THIS LINE
> > 
> > 
> > +       atmel_hlcdc_dc_irq_disable(dev);
> > +
> > +       ret = request_irq(irq, atmel_hlcdc_dc_irq_handler, 0, dev->driver->name, dev);
> > +       if (ret)
> > +               return ret;
> > 
> > I hope this fixes it.
> 
> It does!  With the irq_enabled line added everything is looking good.

Great, thanks for testing.

Thomas - I assume you will do a re-spin and there is likely some fixes
for the applied IRQ conversions too.

Note - irq_enabled must be cleared if request_irq fails. I did not
include this in the testing here.

	Sam
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
