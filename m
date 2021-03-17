Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A8D33F97E
	for <lists+freedreno@lfdr.de>; Wed, 17 Mar 2021 20:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6626E843;
	Wed, 17 Mar 2021 19:43:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFE46E842
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 19:43:25 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id 73so2317194qtg.13
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5M2o/5txOfVVkT2R7LQazFbw4Qc4fveGxpdbp198xYU=;
 b=RKgCDWdDwNcrvndpEPh2z1A5LONc8q/kcoUvZhZMJbRafeyUDCMPQ9APb5VdSlrvO0
 M/apv7bxCnuXge+S6JbVEtTH/JvPNl2yiQQep2q7mXRp8oEs7rTo4fjJbDAvv3Ior9C9
 MoY4YdsqiJ0l8rOupxYVQbv4QcMBsxNfXvG20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5M2o/5txOfVVkT2R7LQazFbw4Qc4fveGxpdbp198xYU=;
 b=jmv17YigbHKaK2a+1fpTylaJXa4At8uBIeyWAHX/syAk0UcRi+6JEi+58+dAnQ6M2y
 J44uMqpVYYXWprAZZmsHCG2MCoXDsjw4ZY0b6ysO2Mu+TYApMjXZ4h2Pz0tFdNWs8DJe
 xAatfbZpGrrslcddcAc02rsEO4E1GN/yI34zyL3DmuqA2Vp+RT2yGWTRid6FRdGajdvA
 AwE13p5J3xVLWypdULe12aPP8CoD0v7IPZZGzC5UO1w2KRcwpLzDTxQOvMyD7dJ0dgOI
 U0hjFGR5aJdcNlLnRwHwjML1I8KyLr7UXzaY601GAXyZ4TZgGB3f2oU+J4+q8kE3ZYC1
 wE/w==
X-Gm-Message-State: AOAM530eQsGoTLeMCE9rn0WK2YB1GgYu2Cw40hnzdlQljvtWrwuJ4RUH
 90eSR1QePEKnP4dshXKFoK51zuK6XY9CnQ==
X-Google-Smtp-Source: ABdhPJzm274+Onzp9rZvKdjTBgUvS7dSCafb4FwcQgEs+OQWlxZNE4QAhftC4FNLIs8vqlPh+7aR4Q==
X-Received: by 2002:ac8:7b3a:: with SMTP id l26mr686963qtu.150.1616010204832; 
 Wed, 17 Mar 2021 12:43:24 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id 66sm18248419qkk.18.2021.03.17.12.43.23
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 12:43:23 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id p186so168991ybg.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 12:43:23 -0700 (PDT)
X-Received: by 2002:a25:2654:: with SMTP id m81mr6485146ybm.405.1616010202994; 
 Wed, 17 Mar 2021 12:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210317164239.1007776-1-robdclark@gmail.com>
In-Reply-To: <20210317164239.1007776-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Mar 2021 12:43:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRXqtYNeqXZfSnhSRJcOS5QGauM=vg=XVQ6=EbWkdkDw@mail.gmail.com>
Message-ID: <CAD=FV=WRXqtYNeqXZfSnhSRJcOS5QGauM=vg=XVQ6=EbWkdkDw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Ratelimit invalid-fence message
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

On Wed, Mar 17, 2021 at 9:40 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We have seen a couple cases where low memory situations cause something
> bad to happen, followed by a flood of these messages obscuring the root
> cause.  Lets ratelimit the dmesg spam so that next time it happens we
> don't loose the kernel traces leading up to this.

s/loose/lose


> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
