Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED926350AF8
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 01:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1789E6EBA7;
	Wed, 31 Mar 2021 23:46:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4976EBA7
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 23:46:23 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id l13so261844qtu.9
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QVJf2tl4IWyWeYZKzdmdiismF5Kwfs0DaiffQjbKvI0=;
 b=BftwgFsMkGP9DaHNw/lKk8TXRGWQNRqMweUE/JxfYD/LukTAV9f0zCZnvDePWoDTaK
 tL1WKtigi8C1pPAM83ka/lOXH90VqKkxd1zF+3nIyqhqrehUTO5lop7OcWJ72ZdECfG0
 qRVjROwVczkIp96dR5n8O3iJMgCKVXClY353M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QVJf2tl4IWyWeYZKzdmdiismF5Kwfs0DaiffQjbKvI0=;
 b=sucb7/BwZkglPyLQlCMJ37ZKcHnCu2sZwZyHQcBLxDyh/a0ffsF7r/WLHOw30pMfbz
 7Rhi/iLZXVLOQmHp2T+HTFpaKv2sY6vlDqwsc6pjUbH/ultKi6Lw8FFinmhkX5snD8JM
 9LVSdmRqn+4c4p2//kZv0aE6LKg6F02nX1Q0EFY+1aC2vvWzB3TK+fz4fFK436GOp+MW
 2wsyXMOtr16zqiDdVWpXGuxVCluZQaSQsV4qG4p5QzkpjqNKcSrJtvOaoYnXPY0b8hfJ
 iTqC66ayX28Re41Z37wrtMNl57O9HNz85Y4WPRHG879otBJ4tLDUiZ41vc+hIEiXkuA/
 AZyQ==
X-Gm-Message-State: AOAM5301PpT3bf/lTZ1sfmM8cD3qbrNM+kJo2/CVEYYp19ZyQJNMQVuS
 aNWGb7RaxZtbNHk4zzGtUoE7m7WNpKdncQ==
X-Google-Smtp-Source: ABdhPJy4VH6yraLSN6dWwWxsu44kgwtGSfcUi3fZX1VYctIRgmL26mDng+4H/NtxxFIBlTMEdmFLYw==
X-Received: by 2002:a05:622a:6:: with SMTP id x6mr4724625qtw.1.1617234382846; 
 Wed, 31 Mar 2021 16:46:22 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id d2sm2627672qkk.42.2021.03.31.16.46.22
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 16:46:22 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id j198so22966406ybj.11
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:46:22 -0700 (PDT)
X-Received: by 2002:a25:8712:: with SMTP id a18mr2298312ybl.79.1617234382025; 
 Wed, 31 Mar 2021 16:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 16:46:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJ_4ufZdCu0uh2J+WTgz2=naZNrjZDMnxjjOH-COfzJQ@mail.gmail.com>
Message-ID: <CAD=FV=VJ_4ufZdCu0uh2J+WTgz2=naZNrjZDMnxjjOH-COfzJQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 0/4] drm/msm: Shrinker (and related) fixes
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> I've been spending some time looking into how things behave under high
> memory pressure.  The first patch is a random cleanup I noticed along
> the way.  The second improves the situation significantly when we are
> getting shrinker called from many threads in parallel.  And the last
> two are $debugfs/gem fixes I needed so I could monitor the state of GEM
> objects (ie. how many are active/purgable/purged) while triggering high
> memory pressure.
>
> We could probably go a bit further with dropping the mm_lock in the
> shrinker->scan() loop, but this is already a pretty big improvement.
> The next step is probably actually to add support to unpin/evict
> inactive objects.  (We are part way there since we have already de-
> coupled the iova lifetime from the pages lifetime, but there are a
> few sharp corners to work through.)
>
> Rob Clark (4):
>   drm/msm: Remove unused freed llist node
>   drm/msm: Avoid mutex in shrinker_count()
>   drm/msm: Fix debugfs deadlock
>   drm/msm: Improved debugfs gem stats
>
>  drivers/gpu/drm/msm/msm_debugfs.c      | 14 ++----
>  drivers/gpu/drm/msm/msm_drv.c          |  4 ++
>  drivers/gpu/drm/msm/msm_drv.h          | 10 ++++-
>  drivers/gpu/drm/msm/msm_fb.c           |  3 +-
>  drivers/gpu/drm/msm/msm_gem.c          | 61 +++++++++++++++++++++-----
>  drivers/gpu/drm/msm/msm_gem.h          | 58 +++++++++++++++++++++---
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 17 +------
>  7 files changed, 122 insertions(+), 45 deletions(-)

This makes a pretty big reduction in jankiness when under memory
pressure and seems to work well for me.

Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
