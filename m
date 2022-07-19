Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF9D57A6CE
	for <lists+freedreno@lfdr.de>; Tue, 19 Jul 2022 20:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA0D10E902;
	Tue, 19 Jul 2022 18:56:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78D710E72B;
 Tue, 19 Jul 2022 18:56:14 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A48B366019F4;
 Tue, 19 Jul 2022 19:56:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658256973;
 bh=Pmpn1KNodZGi3VW2Y2bnZCKePhymp3labejgNlq3r8I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GO9pxN3Fbw/c0pt1D/zMDFY2ys9X+ZsZ0CV7fMCGE2ELu0ZugrwevglWrR2cuqpD/
 KHFz3HwRE/SWP1cpet3PAZtDcLUCm6i3LxZzLcZmxiFKMAfcrPoIfeE1+e5jJSISjS
 CEF/aaKp4x3JW81fnP2axbdi+/ZWrHpfYew+JQnslN4gtTTg/PFNAj+4Rue33vdeXJ
 Zvg+v+zIS+7AIui/PCX7L7LL834VxjxAIYeFDGzZNZ9mQ1K6SMTLhWY4qncaPCPoxe
 qo/r1Rbr+DMS0JuPSH2zRguKXNC7T4zbhMnOCInL9GV93rseG6GOv+MbAWfQVTZJb9
 FqOi+Saf0NNAA==
Message-ID: <c5beb186-96d3-59d7-fad8-987bb8125de1@collabora.com>
Date: Tue, 19 Jul 2022 21:56:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220719171900.289265-1-robdclark@gmail.com>
 <20220719171900.289265-10-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220719171900.289265-10-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 09/13] drm/gem: Add LRU/shrinker helper
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 7/19/22 20:18, Rob Clark wrote:
> +void
> +drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
> +{
> +	WARN_ON(!mutex_is_locked(lru->lock));

Nit: What about lockdep_assert_held_once(&lru->lock->base)) ?

Otherwise, looks good! I'll use it for the DRM-SHMEM shrinker after
completing the work on the dma-buf locks.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
