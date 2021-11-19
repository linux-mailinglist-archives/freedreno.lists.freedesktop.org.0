Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FCD4579A3
	for <lists+freedreno@lfdr.de>; Sat, 20 Nov 2021 00:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9B56E873;
	Fri, 19 Nov 2021 23:38:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B01D6E409
 for <freedreno@lists.freedesktop.org>; Fri, 19 Nov 2021 23:38:28 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id m5so3391755ilh.11
 for <freedreno@lists.freedesktop.org>; Fri, 19 Nov 2021 15:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wxVf84QwnEj8Uc7joyd4EzO/U0Oo8kpz6vj1F+hcMLk=;
 b=JoaU0znIPwQg4L/KYolJbJCVzydlY40vwNvIaoWmJqcQcJ8eG1h8jr3q4as59wc+1i
 sKIlfZ78zXnJFtr3OoqfN1viwrus/BmPq/Y6dYdUzqH6wclOo+fktpZoRnWrKKMylQ97
 8D4ReJ3enlh7d4svPfS8hp3F0IZsEnpSYjVFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxVf84QwnEj8Uc7joyd4EzO/U0Oo8kpz6vj1F+hcMLk=;
 b=0oiAXefc/iSYEkdUXmC1WPy+eUUfL0Poy8yhNGSrvkemwhYKE7tlvEr3/tAq1PISOM
 GexX86LMk7I7lc33QtWe7ku9f2EQ4a6WftPcKblu7+lUkwEZpBwkpV2OP/0svBnY7JFz
 RWWXySwM8sC1d87SaO5Pw1KMVoSqosMjUjrrFh68WVznirxB3FkJkHgjrt9D9o/b/beF
 vfiJy1hHCAfyh62JDN6xT2exkKeDnjb31FgX1IrUna4K93Qq2+0sOAXOTrolZATAB8Vu
 UabwUaMCIEJQhkvMPwMFfjJgFj2/IM7/cQsE4WAh3kyeUlK9F6wiSikOqjqyjwNiDmnA
 P6sw==
X-Gm-Message-State: AOAM533yxtuP1FHqONM6z31WzOwTYhC/goG3S3fHo/OmAArQ7GL5FRsl
 3TdOoN/QKHlgBbkemmTxTbopw3kjVKcSfA==
X-Google-Smtp-Source: ABdhPJw6bMGSSIrJYWgnu0yLi8TnbE63MqiJM3wNmXseT8QFXByfBPykPlB9NQ+QwbSJ7ykekM8YWA==
X-Received: by 2002:a92:d74a:: with SMTP id e10mr7512039ilq.315.1637365106989; 
 Fri, 19 Nov 2021 15:38:26 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id f15sm706267ila.68.2021.11.19.15.38.26
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 15:38:26 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id z26so14840044iod.10
 for <freedreno@lists.freedesktop.org>; Fri, 19 Nov 2021 15:38:26 -0800 (PST)
X-Received: by 2002:a05:6638:190f:: with SMTP id
 p15mr31409196jal.82.1637365106040; 
 Fri, 19 Nov 2021 15:38:26 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com>
In-Reply-To: <20211119225157.984706-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Nov 2021 15:38:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XiaMAeTj24zg0bPfSK5hGCjuap0ZDa6ixAKrSUQgJtVQ@mail.gmail.com>
Message-ID: <CAD=FV=XiaMAeTj24zg0bPfSK5hGCjuap0ZDa6ixAKrSUQgJtVQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/gpu: Fix idle_work time
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 19, 2021 at 2:47 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was supposed to be a relative timer, not absolute.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
