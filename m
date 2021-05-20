Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE2F38B43F
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 18:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54646F4AF;
	Thu, 20 May 2021 16:29:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5C66F4A3
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 16:29:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x8so18295666wrq.9
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gQAHjRkLz/zMdR9mZ20XGXZokHUiVVILLkWbVKY8vk=;
 b=cfxPfL5fE4np3aef6bq9mbEbsf+V7xoFH7lEgZwO4Pdk/oIevk19Q3UyCSV9vCBR57
 oqDSJZrYGS54dgw1cyxBLzrZ9nUvG4J7evXugn3/Hrkt2MbKDwd4terqRk3pzf997Vak
 U6KAj9L1Il+SoamKwZJ4AlfDNCbUAwVjuKR+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=7gQAHjRkLz/zMdR9mZ20XGXZokHUiVVILLkWbVKY8vk=;
 b=VN1xMON42KxtxEksREdcZ9lwu8KqZd/A+38aCc3lKnfrHFGHPdzYaUGpR9N8mJTa5e
 QLeR7bKOXZSWXkPnLB19Hg1U65RcHdLuhB71h8T3pQ6PSO39dz9GBwFn/3cv+Fpgi2HC
 1oZUwkxeFqxEW/3EMCWO80YciJuhPtbKjEX9XZBETm+fAbO1Fvo7OEUgD7qln18RFFCl
 XFBoEUtaoWDER5E5RWelJrYqCRDHVs5KguFTT4TQs5h+yy3FQ+5ahi6TbzMXvreL/V0Z
 MYsRLcaTkNLdiqeRQPxD4ALU/hIKVTXhBEBh6qOGVG2q+bLXHUdetO/Oe0+w5v5dNhwO
 pvdQ==
X-Gm-Message-State: AOAM532e3ULnSo2Vqts4CgcrF8+8x7YvpMtAtYL8cJLLXL5u0HZ7wHp8
 3ZLnbLqXhBztS0gQiV+ymueZIQ==
X-Google-Smtp-Source: ABdhPJx7W+fNXWLlfVnpy0Ca20BF42f6arhZCvq55cuTsYgbnk9UslMHeFLkM6bUwg6sp/BGFgOCqQ==
X-Received: by 2002:a5d:6683:: with SMTP id l3mr5097252wru.398.1621528165809; 
 Thu, 20 May 2021 09:29:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g4sm3156003wmk.45.2021.05.20.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 09:29:25 -0700 (PDT)
Date: Thu, 20 May 2021 18:29:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YKaOY3AWgHh5kplS@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519183855.1523927-3-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Subject: Re: [Freedreno] [RFC 2/3] drm/atomic: Call dma_fence_boost() when
 we've missed a vblank
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 11:38:53AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 560aaecba31b..fe10fc2e7f86 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>  	int i, ret;
>  
>  	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> +		u64 vblank_count;
> +
>  		if (!new_plane_state->fence)
>  			continue;
>  
>  		WARN_ON(!new_plane_state->fb);
>  
> +		vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
> +
>  		/*
>  		 * If waiting for fences pre-swap (ie: nonblock), userspace can
>  		 * still interrupt the operation. Instead of blocking until the
> @@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>  		if (ret)
>  			return ret;
>  
> +		/*
> +		 * Check if we've missed a vblank while waiting, and if we have
> +		 * signal the fence that it's signaler should be boosted
> +		 */
> +		if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
> +			dma_fence_boost(new_plane_state->fence);

I think we should do a lot better here:
- maybe only bother doing this for single-crtc updates, and only if
  modeset isn't set. No one else cares about latency.

- We should boost _right_ when we've missed the frame, so I think we
  should have a _timeout wait here that guesstimates when the vblank is
  over (might need to throw in a vblank wait if we missed) and then boost
  immediately. Not wait a bunch of frames (worst case) until we finally
  decide to boost.

Otherwise I really like this, I think it's about the only real reason i915
isn't using atomic helpers.

Also adding Matt B for this topic.
-Daniel

> +
>  		dma_fence_put(new_plane_state->fence);
>  		new_plane_state->fence = NULL;
>  	}
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
