Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202D36C3213
	for <lists+freedreno@lfdr.de>; Tue, 21 Mar 2023 13:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16C910E0E3;
	Tue, 21 Mar 2023 12:55:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AC210E181;
 Tue, 21 Mar 2023 12:55:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08EBECE18C1;
 Tue, 21 Mar 2023 12:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFF7C433D2;
 Tue, 21 Mar 2023 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679403321;
 bh=ZnXocfbauUx27rTMEEdy0hmwDjF0EF1+mrismXf3kiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tkw3jE14tuIpxUec0cs3nE3qxp8ZBfKbxRKUg55YFfOnzbL/8/S3KrPpUoKdJHU2i
 4mUJI6g/rQbbAFz2jxUneGOR8wqUvPmT0NvbyId6LHEIDQCsOdf1Df0BdCCglgOgMT
 DqVH7MxiyAQUxqQG6pZNF17CeuX3jRPfQrCdyWqH8pxM+7whiwd8ja1TeyQf5FiJGc
 eG4rXCakQOZv6YV3wu9roXASPomgovdLHsrSDhoG/7lNPHZKyzcjSupONRbDQfO3y4
 o5MtyhWOX0uEMBPomTuXKiaLgVkUjzNAeMN3Wsp+/O3i/FotomcFIFKPq91tZCqPYT
 Rg+BG/birDn5A==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pebXg-0005uQ-Tw; Tue, 21 Mar 2023 13:56:44 +0100
Date: Tue, 21 Mar 2023 13:56:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ZBmpjF6DKMGDiOhT@hovoldconsulting.com>
References: <20230303164807.13124-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303164807.13124-1-johan+linaro@kernel.org>
Subject: Re: [Freedreno] [PATCH v2 0/4] drm/msm/adreno: fix runtime PM
 imbalance at unbind
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
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 05:48:03PM +0100, Johan Hovold wrote:
> As reported by Bjorn, we can end up with an unbalanced runtime PM
> disable count if unbind() is called before the DRM device is opened
> (e.g. if component bind fails due to the panel driver not having been
> loaded yet).
> 
> As runtime PM must currently stay disabled until the firmware has been
> loaded, fix this by making the runtime PM disable call at unbind()
> conditional.
> 
> The rest of the series fixes further imbalances in the load_gpu() error
> paths and removes a bogus pm_runtime_set_active() call. Included is also
> a related indentation cleanup.

I noticed that Rob picked up the first patch below from v1 of this
series. Any comments to the remaining three?

Johan

> Changes in v2
>  - fix the runtime PM imbalance in the gpu load error paths (new)
> 
>  - drop the patch removing the pm_runtime_disable() from
>    adreno_gpu_cleanup() as this function can currently still be called
>    with runtime PM enabled if suspending the scheduler in
>    adreno_system_suspend() at unbind fails
> 
> 
> Johan Hovold (4):
>   drm/msm/adreno: fix runtime PM imbalance at unbind
>   drm/msm/adreno: fix runtime PM imbalance at gpu load
>   drm/msm/adreno: drop bogus pm_runtime_set_active()
>   drm/msm/adreno: clean up component ops indentation
> 
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 26 +++++++++++++---------
>  1 file changed, 16 insertions(+), 10 deletions(-)
