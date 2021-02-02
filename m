Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C3530C446
	for <lists+freedreno@lfdr.de>; Tue,  2 Feb 2021 16:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6601789F5F;
	Tue,  2 Feb 2021 15:47:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F9089F5F
 for <freedreno@lists.freedesktop.org>; Tue,  2 Feb 2021 15:47:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l12so1852211wmq.2
 for <freedreno@lists.freedesktop.org>; Tue, 02 Feb 2021 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=f8qxGPcRh9HAR8Xi8fDP2DL2jLjx52coGhpEuMS0fJI=;
 b=FNqLZbndjzFWU2NyGwDReOjQfkL1OUgvOv5ZeR1Nb/JpNeBwq8aNlfRhy0PWJBTmi+
 ZRKNKC0kcTKRZB4/2Ud02HFebrv+Qpy5JJvxbDm7YMeOqXj52HqymPxpjQ+hJP6KGhk8
 SOJOuY99UyXKHU8ar69nSb0bdBJZr9O15C6X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=f8qxGPcRh9HAR8Xi8fDP2DL2jLjx52coGhpEuMS0fJI=;
 b=dafvQZVNKKD6nRRopvHK//jksECuDRD6FWfDIBKv2oeA1WjefSe48g/Qbcc2va4R1k
 XT4QLQ6Okv4rWHUAlptlMOQsS6om1gI7vk5ERa8tGPVclyTpdcypo3QAGSjuXUgLh21Z
 NTiSfv5bJHP3yDP4l/eNYj48G+lJxYqiupidxXX+4RxYElXVD9y8I9AlBPESH5rN4iEe
 Q0Pa8opWIKpv/xi6flaofXLPgP9h9RM52/fY1G2pUE+i5Az5NEqDXhZdq4TGGowIe5Oy
 uAWEkJ+fR46Pp7bCm0smdPKXIOLlwnud0z0KMNuktT6lsuxWfv1bUaYJQTj1IXTU0GQH
 4k8w==
X-Gm-Message-State: AOAM53157Ujpt0ymSoodCulMFJYn3I00lRkCV995iOowLCHoQWPogs7C
 FjJKhY1r4Ef95E8c+24NcE+fFw==
X-Google-Smtp-Source: ABdhPJzGDcfEbXLu5zWgOTaJHCrtUgCi8vnt5G/ag2pejaSfAJI0aWalNdwwTM/uYA2FjMPfL/MkHQ==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr4175635wmp.156.1612280819590; 
 Tue, 02 Feb 2021 07:46:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b13sm31067041wrt.31.2021.02.02.07.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:46:58 -0800 (PST)
Date: Tue, 2 Feb 2021 16:46:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <YBlz8Go2DseRWuOa@phenom.ffwll.local>
Mail-Followup-To: Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krishna Manikandan <mkrishn@codeaurora.org>
References: <20210125234901.2730699-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125234901.2730699-1-swboyd@chromium.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Freedreno] [PATCH] drm/msm/kms: Make a lock_class_key for each
 crtc mutex
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> Lockdep complains about an AA deadlock when rebooting the device.
> 
> ============================================
> WARNING: possible recursive locking detected
> 5.4.91 #1 Not tainted
> --------------------------------------------
> reboot/5213 is trying to acquire lock:
> ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> 
> but task is already holding lock:
> ffffff80d1339110 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> 
> other info that might help us debug this:
> Possible unsafe locking scenario:
> 
> CPU0
> ----
> lock(&kms->commit_lock[i]);
> lock(&kms->commit_lock[i]);
> 
> *** DEADLOCK ***
> 
> May be due to missing lock nesting notation
> 
> 6 locks held by reboot/5213:
> __arm64_sys_reboot+0x148/0x2a0
> device_shutdown+0x10c/0x2c4
> drm_atomic_helper_shutdown+0x48/0xfc
> modeset_lock+0x120/0x24c
> lock_crtcs+0x60/0xa4
> 
> stack backtrace:
> CPU: 4 PID: 5213 Comm: reboot Not tainted 5.4.91 #1
> Hardware name: Google Pompom (rev1) with LTE (DT)
> Call trace:
> dump_backtrace+0x0/0x1dc
> show_stack+0x24/0x30
> dump_stack+0xfc/0x1a8
> __lock_acquire+0xcd0/0x22b8
> lock_acquire+0x1ec/0x240
> __mutex_lock_common+0xe0/0xc84
> mutex_lock_nested+0x48/0x58
> lock_crtcs+0x60/0xa4
> msm_atomic_commit_tail+0x348/0x570
> commit_tail+0xdc/0x178
> drm_atomic_helper_commit+0x160/0x168
> drm_atomic_commit+0x68/0x80
> 
> This is because lockdep thinks all the locks taken in lock_crtcs() are
> the same lock, when they actually aren't. That's because we call
> mutex_init() in msm_kms_init() and that assigns on static key for every
> lock initialized in this loop. Let's allocate a dynamic number of
> lock_class_keys and assign them to each lock so that lockdep can figure
> out an AA deadlock isn't possible here.
> 
> Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

This smells like throwing more bad after initial bad code ...

First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives.html

Yes I know the locking you're doing here is correct, but that goes to the
second issue: Why is this needed? atomic_async_update helpers are supposed
to take care of ordering fun like this, if they're not, we need to address
things there. The problem that

commit b3d91800d9ac35014e0349292273a6fa7938d402
Author: Krishna Manikandan <mkrishn@codeaurora.org>
Date:   Fri Oct 16 19:40:43 2020 +0530

    drm/msm: Fix race condition in msm driver with async layer updates

is _the_ reason we have drm_crtc_commit to track stuff, and Maxime has
recently rolled out a pile of changes to vc4 to use these things
correctly. Hacking some glorious hand-rolled locking for synchronization
of updates really should be the exception for kms drivers, not the rule.
And this one here doesn't look like an exception by far (the one legit I
know of is the locking issues amdgpu has between atomic_commit_tail and
gpu reset, and that one is really nasty, so not going to get fixed in
helpers, ever).

Cheers, Daniel

> ---
>  drivers/gpu/drm/msm/msm_kms.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index d8151a89e163..4735251a394d 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -157,6 +157,7 @@ struct msm_kms {
>  	 * from the crtc's pending_timer close to end of the frame:
>  	 */
>  	struct mutex commit_lock[MAX_CRTCS];
> +	struct lock_class_key commit_lock_keys[MAX_CRTCS];
>  	unsigned pending_crtc_mask;
>  	struct msm_pending_timer pending_timers[MAX_CRTCS];
>  };
> @@ -166,8 +167,11 @@ static inline int msm_kms_init(struct msm_kms *kms,
>  {
>  	unsigned i, ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
> -		mutex_init(&kms->commit_lock[i]);
> +	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
> +		lockdep_register_key(&kms->commit_lock_keys[i]);
> +		__mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
> +			     &kms->commit_lock_keys[i]);
> +	}
>  
>  	kms->funcs = funcs;
>  
> 
> base-commit: 19c329f6808995b142b3966301f217c831e7cf31
> -- 
> https://chromeos.dev
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
