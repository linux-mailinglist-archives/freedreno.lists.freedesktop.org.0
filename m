Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC8351639
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 17:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26636E03A;
	Thu,  1 Apr 2021 15:34:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23A26E03A
 for <freedreno@lists.freedesktop.org>; Thu,  1 Apr 2021 15:34:42 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id x11so2530681qkp.11
 for <freedreno@lists.freedesktop.org>; Thu, 01 Apr 2021 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgQ3XZ5ITKRGojF0eSgHx7BZvQ88/ghBhXwnDbKAV2I=;
 b=YhJ7jkjScY7JdQhF/7Tt22mZk21tl8MbMM81VDTVwMeS/bumy1w9WGLvBQENfwcpeB
 2ljIOmE/0b06jnmE6dkboTDAy94ze0X9i8gyWwaN4XMFw6NveMfupfnjzjWCFGiD4kIO
 Z5Pg/KYuMKdSJP55scpo50bf+0976bJPooquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgQ3XZ5ITKRGojF0eSgHx7BZvQ88/ghBhXwnDbKAV2I=;
 b=HFxHWCaXsgxGDgJqIBpsqqVD3EVw+Y3HO2bidJ2BCNnXiXpOFBqw2CEv1tDXEO3L8z
 EGuBMuRhZu69nynSdPEyq3FLLOnVYoA9sbW0IazG+d6y2v4Tl93QrssGXyV6focLkz9K
 cXMx2E8e3utvKETGtfMbSthMdrwKFEEorhC6MHXGUjF519sK1u+JWzj9caCdS4GA4Iw1
 npS+dlhfn/KbuvwUpidpj8tmJmtgIJ4DMDaTLi5K80D1QlR+/AQ3NauHwwJAwSFuv7Ip
 gx/8LmMFD17qUUr4F/cFkvIb1WGM1UprvwuJy5aO6pk51E1EpOC8RtsARCqatt9WnUm8
 EPLQ==
X-Gm-Message-State: AOAM530YmhVyJ9NqIwwFHEGSKoL7PJcbPjc+J5A3wyQlN0jTLLYjQsd/
 Ryblhmd8aYZpYKxlW0RIj94FKhSBz1A5jA==
X-Google-Smtp-Source: ABdhPJwh89YKhwwYcIEzBg7x7NuwajVon3tA63WQ5MMJc/7cwtkcNEYcH1QAjWxM5JTcRTUNEbbF1w==
X-Received: by 2002:a37:43cc:: with SMTP id q195mr9051808qka.455.1617291281334; 
 Thu, 01 Apr 2021 08:34:41 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id g7sm3740607qti.20.2021.04.01.08.34.40
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:34:41 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id m132so2225412ybf.2
 for <freedreno@lists.freedesktop.org>; Thu, 01 Apr 2021 08:34:40 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr12794123ybp.476.1617291280047; 
 Thu, 01 Apr 2021 08:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-2-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Apr 2021 08:34:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1QUHYw-QkZO-bn+sS_K=KYRe83DfSqVow2RGFXu6nqg@mail.gmail.com>
Message-ID: <CAD=FV=V1QUHYw-QkZO-bn+sS_K=KYRe83DfSqVow2RGFXu6nqg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v2 1/4] drm/msm: Remove unused freed llist
 node
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

On Wed, Mar 31, 2021 at 6:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Unused since commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
