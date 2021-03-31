Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE59350AD9
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 01:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19546EBA5;
	Wed, 31 Mar 2021 23:33:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651276EBA1
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 23:33:49 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 7so533268qka.7
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ryw7Sly4csIxLLkV0t8RVlRi+I4oygJP2r682A3Ebsg=;
 b=XSlzP164vpMabm8VK7gOUDGLcC28VMJkHMTe3WUhvTPmB2LjegZ4XUUKpBnAI+VfX/
 VRJtqvfUH0LXbIQVHPaQmE2CVoSwf73vC7/C2yAl6xriPwSE1pIYCMVoqb6ADYKZtt1H
 ma9YyWtCHNW6GLqQqFMelk3JxyalMU266gNcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ryw7Sly4csIxLLkV0t8RVlRi+I4oygJP2r682A3Ebsg=;
 b=gv+HbmZaVriVjtCcOjKu/S3d+T5FhrLPJFDevnCXev4hkcOf93buiVO8SlHTHdVXAZ
 y4o8YASnlfA2cmOU6AXph9St8bMqUL5QH6inE1zTpCJUCPEMloOc9QfLTxApH09MBh+q
 MBkeUzlqUvMscNJRtMlavPi7zpc5w8PFhvzDyaTfAahiBdlDOE2zMYGYeyEtHUIP8GeV
 vsM+p6W+I3MEXAQxeP/1clSZ22bCEV+uRaV+lz0JSHsNgLv6WLK+cMkaraaxnryARhxu
 LG2ceDjjSa00IsgxJp3VV5Wca0ksF24dtBmqG2EmITb4glETsrDqhEezWSFwdegRfutD
 vrRw==
X-Gm-Message-State: AOAM533oUPSqWKyW244/hOBSbdGHr//X/rFiA3RbSSOlKFLcolDW6dF+
 CVSlR4owvRACVLi7N4eHn25tshSCNs3G4w==
X-Google-Smtp-Source: ABdhPJyAUvn3ZyqS8NgxVcrJYygLK2q4fvSeM4tKtvXFcoyGyySQ3+1q2MEpSx5vUhnpnNphhZHfsw==
X-Received: by 2002:ae9:c115:: with SMTP id z21mr5662531qki.305.1617233628514; 
 Wed, 31 Mar 2021 16:33:48 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id 4sm2553711qkj.119.2021.03.31.16.33.47
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 16:33:47 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id j198so22942785ybj.11
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:33:47 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr8190661ybp.476.1617233627357; 
 Wed, 31 Mar 2021 16:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210331221630.488498-5-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-5-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 16:33:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXoE-UsbfS1zOoKyaiVXPUBAnOr7T2ON4m6-i_43Dm6A@mail.gmail.com>
Message-ID: <CAD=FV=UXoE-UsbfS1zOoKyaiVXPUBAnOr7T2ON4m6-i_43Dm6A@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 4/4] drm/msm: Improved debugfs gem stats
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The last patch lost the breakdown of active vs inactive GEM objects in
> $debugfs/gem.  But we can add some better stats to summarize not just
> active vs inactive, but also purgable/purged to make up for that.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_fb.c  |  3 ++-
>  drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/msm/msm_gem.h | 11 ++++++++++-
>  3 files changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index d42f0665359a..887172a10c9a 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -33,6 +33,7 @@ static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
>  #ifdef CONFIG_DEBUG_FS
>  void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
>  {
> +       struct msm_gem_stats stats = {{0}};

nit: instead of "{{0}}", can't you just do:

struct msm_gem_stats stats = {};

...both here and for the other usage.

Other than that this seems good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
