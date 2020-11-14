Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE82B2E6C
	for <lists+freedreno@lfdr.de>; Sat, 14 Nov 2020 17:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89F26E929;
	Sat, 14 Nov 2020 16:24:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F3E6E929;
 Sat, 14 Nov 2020 16:24:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 673BA67373; Sat, 14 Nov 2020 17:24:06 +0100 (CET)
Date: Sat, 14 Nov 2020 17:24:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20201114162406.GC24411@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114151717.5369-5-jonathan@marek.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Freedreno] [RESEND PATCH v2 4/5] drm/msm: add
 DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> +		size_t range_start, size_t range_end)
> +{
> +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +	struct device *dev = msm_obj->base.dev->dev;
> +
> +	/* exit early if get_pages() hasn't been called yet */
> +	if (!msm_obj->pages)
> +		return;
> +
> +	/* TODO: sync only the specified range */
> +
> +	if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> +		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> +				msm_obj->sgt->nents, DMA_TO_DEVICE);
> +	}
> +
> +	if (flags & MSM_GEM_SYNC_FOR_CPU) {
> +		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> +				msm_obj->sgt->nents, DMA_FROM_DEVICE);
> +	}

Splitting this helper from the only caller is rather strange, epecially
with the two unused arguments.  And I think the way this is specified
to take a range, but ignoring it is actively dangerous.  User space will
rely on it syncing everything sooner or later and then you are stuck.
So just define a sync all primitive for now, and if you really need a
range sync and have actually implemented it add a new ioctl for that.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
