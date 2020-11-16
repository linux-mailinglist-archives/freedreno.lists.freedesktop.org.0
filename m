Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C02B4D0C
	for <lists+freedreno@lfdr.de>; Mon, 16 Nov 2020 18:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A7389FA6;
	Mon, 16 Nov 2020 17:33:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDDD6E02A;
 Mon, 16 Nov 2020 17:33:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8E38668BEB; Mon, 16 Nov 2020 18:33:48 +0100 (CET)
Date: Mon, 16 Nov 2020 18:33:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20201116173346.GA24173@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca> <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 03:07:20PM -0500, Jonathan Marek wrote:
> qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like 
> dma_sync_single_for_cpu() does deal in some way with the partial cache line 
> case, although I'm not sure that means we can have a nonCoherentAtomSize=1.

No, it doesn't.  You need to ensure ownership is managed at
dma_get_cache_alignment() granularity.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
