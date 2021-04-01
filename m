Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739EB35163D
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 17:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C5E6ECD1;
	Thu,  1 Apr 2021 15:35:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD346ECD1
 for <freedreno@lists.freedesktop.org>; Thu,  1 Apr 2021 15:35:03 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id g15so2590094qkl.4
 for <freedreno@lists.freedesktop.org>; Thu, 01 Apr 2021 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SPcX6QtS7Ve6UUCNbDaDbB4vAvudpBUFG69ugXPs6T8=;
 b=AHguOOTFAO2NQe8XmSdmlyagtr/wB7GhsgTQRCF/4VWbWuMjMbDGipaw0RxlA0M6yR
 men4W9o7Z3lOPEhONt01til0PnMg/us3/Y7ioK47S+E3qh5tEsfAwsau3lssAXnET16Z
 y4UgVblAdat0wp63BW2m5H52N9VLE+J5QNlQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SPcX6QtS7Ve6UUCNbDaDbB4vAvudpBUFG69ugXPs6T8=;
 b=IjVMZ2aB+cLc793+xTOfhf+RrxA/ttUUzOS+LnVCYVjxvSQORCZXXY0xFJALTq58DS
 fve5ookp8pc/P80EkfE2MLYtDDIwTpAZMDw2jIrXAlmEBKHw7SroTln2AekZoBXLWvr+
 bsKBlnS077R3MY3gy9eTShcpWWDAoL3N34HgrSggYjXGsCvAPXcs2COxmEzy9pjwG1n1
 4Ltf2EruYPSvZ8J3jOeLA42KZu5epoBxlv4zSn2fQmXdG8kZ5b1+eF64jP+B3fY+zDLu
 3hInw+EYl7ZVSHNImIhFdUFhHWTCxLp3Ws6MnZZhg1sZhQXP9dNZGPlHaQWwxoLJgD9E
 dbpw==
X-Gm-Message-State: AOAM533IiVuXarTIrJRDU4wDRwZXrhu5Wd1DuEc+KinJNN8vqAzfwbnl
 9FzYEZXJKGs7fRzPFf+S9VhI1j/1JDEurQ==
X-Google-Smtp-Source: ABdhPJyGUbJEKBLF7pKjsXGQXJSwEWYnpvw5qPM8XhsBxXZKcBi9MBQfYeLEGioCrRDEup1SPdW1wA==
X-Received: by 2002:a37:a8cc:: with SMTP id r195mr8746576qke.86.1617291302404; 
 Thu, 01 Apr 2021 08:35:02 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id 84sm4287663qkg.8.2021.04.01.08.35.01
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:35:02 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id w8so2218512ybt.3
 for <freedreno@lists.freedesktop.org>; Thu, 01 Apr 2021 08:35:01 -0700 (PDT)
X-Received: by 2002:a25:74ca:: with SMTP id
 p193mr12383521ybc.405.1617291301361; 
 Thu, 01 Apr 2021 08:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-4-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-4-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Apr 2021 08:34:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQoauA5kzmmj5ask_sK19mJycYLJfAOeriXsr2pvxaFw@mail.gmail.com>
Message-ID: <CAD=FV=XQoauA5kzmmj5ask_sK19mJycYLJfAOeriXsr2pvxaFw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm: Fix debugfs deadlock
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 6:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> In normal cases the gem obj lock is acquired first before mm_lock.  The
> exception is iterating the various object lists.  In the shrinker path,
> deadlock is avoided by using msm_gem_trylock() and skipping over objects
> that cannot be locked.  But for debugfs the straightforward thing is to
> split things out into a separate list of all objects protected by it's
> own lock.
>
> Fixes: d984457b31c4 ("drm/msm: Add priv->mm_lock to protect active/inactive lists")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
