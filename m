Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368B84649DF
	for <lists+freedreno@lfdr.de>; Wed,  1 Dec 2021 09:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC98F6F5AF;
	Wed,  1 Dec 2021 08:39:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F126F5AF;
 Wed,  1 Dec 2021 08:39:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="260388658"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="260388658"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 00:39:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="596159000"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 00:39:26 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1msL8N-0003rL-Gt; Wed, 01 Dec 2021 10:38:35 +0200
Date: Wed, 1 Dec 2021 10:38:35 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <Yac0i2wEZbH32lbL@platvala-desk.ger.corp.intel.com>
References: <20211130004324.337399-1-robdclark@gmail.com>
 <20211130004324.337399-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130004324.337399-2-robdclark@gmail.com>
X-Patchwork-Hint: comment
Subject: Re: [Freedreno] [igt-dev] [PATCH igt 1/2] igt: Split out I/O helpers
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 04:43:23PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split the readN()/writeN() helpers out into an igt_io module, so they
> can be re-used by tests.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_io.c    | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_io.h    | 33 +++++++++++++++++
>  lib/igt_sysfs.c | 45 +++--------------------
>  lib/meson.build |  1 +
>  4 files changed, 135 insertions(+), 40 deletions(-)
>  create mode 100644 lib/igt_io.c
>  create mode 100644 lib/igt_io.h
> 
> diff --git a/lib/igt_io.c b/lib/igt_io.c
> new file mode 100644
> index 00000000..ad54cbe5
> --- /dev/null
> +++ b/lib/igt_io.c
> @@ -0,0 +1,96 @@
> +/*
> + * Copyright © 2016 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <errno.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +#include "igt_io.h"
> +
> +/**
> + * SECTION:igt_io
> + * @short_description: Helpers for file I/O
> + * @title: io
> + * @include: igt_io.h
> + *
> + * This library provides helpers for file I/O
> + */
> +

This new section needs to be explicitly included in the docs. Squash this in:

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index 189597c6..0dc5a0b7 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -30,6 +30,7 @@
     <xi:include href="xml/igt_fb.xml"/>
     <xi:include href="xml/igt_frame.xml"/>
     <xi:include href="xml/igt_gt.xml"/>
+    <xi:include href="xml/igt_io.xml"/>
     <xi:include href="xml/igt_kmod.xml"/>
     <xi:include href="xml/igt_kms.xml"/>
     <xi:include href="xml/igt_list.xml"/>



-- 
Petri Latvala
