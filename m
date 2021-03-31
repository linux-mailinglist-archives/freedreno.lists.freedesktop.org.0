Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FA6350AFA
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 01:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59A66EBAA;
	Wed, 31 Mar 2021 23:46:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF626EBAA
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 23:46:35 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id y5so544709qkl.9
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LYa+AG9JR1t6qbABdQ1iCGfLaLvkJp9ZS13fKinSSac=;
 b=ctaBO5zR13LihBuEeHxc8Iu/QFRibysNpeKgX+kU2t+ibrAopqUh/O3Z5zJhzEYOLi
 WkpMisFcmDpdNyg8MIyTPoesZeAvkb7fNH+pnt2wcMh/PTFD+96gEIOvrHu7FMUWUjlK
 341Ow9vIocW+ba+vnYCmMKd3WL/8koWnxkGLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LYa+AG9JR1t6qbABdQ1iCGfLaLvkJp9ZS13fKinSSac=;
 b=er92R0rik2EMoTYAXD8/hxBotzrekBQFlK1y5VHNeWrt+XjhtpXCtubTvNKBTFSA0H
 6FlJRKhCPrW+19HdH4kdnZh7b7s5FhVFUpsTjhgu2crSO7emng7zLzdc1nPG6c4/qFyo
 gz/wb1ybUUpoEGjFD12nQHmqC8ldCl+8U6L+sqNTrcwMJES5HQfTjb89hSCswuGsexK8
 Rmq4rFRr+fm81lbI7JJ583RE4XnKGfnF2UVvQI/gKc3nn12iSDXe1o67kYVob5120Jl5
 YwQkpMb+A18nld1Dm6W7mNysduoFEgRH0GfjuZFT/ij6zen8MxXv4uFg/MUZtVDHtSc9
 8EOg==
X-Gm-Message-State: AOAM533F/EaO/xbTzuBSp+Q44Gv6edxt5Xx7hNkz8r5XOfll48w32GpS
 6ulJAsdvbVE1kktoW4S/zmptL3dbLOView==
X-Google-Smtp-Source: ABdhPJzzQc4LKdp0TYwJ2Z8+r+2qjP1eyCnaobLqfLzT0Akf5PT1nN6GIx1kNvVaMMdgn5Eg8U2uPg==
X-Received: by 2002:a37:3c3:: with SMTP id 186mr5751547qkd.262.1617234394425; 
 Wed, 31 Mar 2021 16:46:34 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id c7sm2421456qtv.48.2021.03.31.16.46.33
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 16:46:34 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id j198so22966697ybj.11
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:46:33 -0700 (PDT)
X-Received: by 2002:a25:4092:: with SMTP id n140mr8176109yba.276.1617234393416; 
 Wed, 31 Mar 2021 16:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210331221630.488498-2-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 16:46:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLjCFXi4cffyGqbF05nCFJr+wA_3+g2tkCVey5MxARcA@mail.gmail.com>
Message-ID: <CAD=FV=WLjCFXi4cffyGqbF05nCFJr+wA_3+g2tkCVey5MxARcA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm: Remove unused freed llist node
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
> Unused since c951a9b284b907604759628d273901064c60d09f

Not terribly important, but checkpatch always yells at me when I don't
reference commits by saying:

commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")


> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
