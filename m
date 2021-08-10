Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A6C3D7E04
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 20:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8084E6E2ED;
	Tue, 27 Jul 2021 18:52:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94746E2ED
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 18:52:01 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id c39853f0-ef0b-11eb-8d1a-0050568cd888;
 Tue, 27 Jul 2021 18:52:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 4E468194BB3;
 Tue, 27 Jul 2021 20:52:17 +0200 (CEST)
Date: Tue, 27 Jul 2021 20:51:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YQBVyuPuf9InsY7g@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727182721.17981-1-tzimmermann@suse.de>
Subject: Re: [Freedreno] [PATCH 00/14] drm: Make DRM's IRQ helpers legacy
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
 freedreno@lists.freedesktop.org, daniel@ffwll.ch, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tomba@kernel.org, bbrezillon@kernel.org,
 jyri.sarha@iki.fi, nicolas.ferre@microchip.com, christian.koenig@amd.com,
 robdclark@gmail.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org, brian.starkey@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jul 27, 2021 at 08:27:07PM +0200, Thomas Zimmermann wrote:
> DRM's IRQ helpers are only helpful for old, non-KMS drivers. Move
> the code behind CONFIG_DRM_LEGACY. Convert KMS drivers to Linux
> IRQ interfaces.
> 
> DRM provides IRQ helpers for setting up, receiving and removing IRQ
> handlers. It's an abstraction over plain Linux functions. The code
> is mid-layerish with several callbacks to hook into the rsp drivers.
> Old UMS driver have their interrupts enabled via ioctl, so these
> abstractions makes some sense. Modern KMS manage all their interrupts
> internally. Using the DRM helpers adds indirection without benefits.
> 
> Most KMs drivers already use Linux IRQ functions instead of DRM's
> abstraction layer. Patches 1 to 12 convert the remaining ones.
> The patches also resolve a bug for devices without assigned interrupt
> number. DRM helpers don't test for IRQ_NOTCONNECTED, so drivers do
> not detect if the device has no interrupt assigned.

Before diving into a review of these..
Any specific reason devm_request_irq is not used?

	Sam
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
