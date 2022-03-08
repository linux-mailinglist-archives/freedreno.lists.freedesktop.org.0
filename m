Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8C4D22A1
	for <lists+freedreno@lfdr.de>; Tue,  8 Mar 2022 21:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABB110E3EE;
	Tue,  8 Mar 2022 20:32:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D3110E33D
 for <freedreno@lists.freedesktop.org>; Tue,  8 Mar 2022 20:32:34 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so363409ooa.10
 for <freedreno@lists.freedesktop.org>; Tue, 08 Mar 2022 12:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=y/JhkM56M2JPgnyR2Hqr1XU3GKAwilTDhiga8fqeuZ8=;
 b=CrXtvpEpPpVaSH37tOfQlBtmBWQklnqSlBW4Ya0lTsDrQFGosjDM1+l84MYiAly3IU
 KHFdEtMs3Qg2BCmq3wQTq2ANFguFhg8zWWzTqvJeiEEyP6+WDV2eMU/W+tt2/rJQeDEB
 2iVQslEqIfGDl0ImpEL0TG2dScVffAexa9rQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=y/JhkM56M2JPgnyR2Hqr1XU3GKAwilTDhiga8fqeuZ8=;
 b=Ay9MAUqhpgQH0J/8kPkywQr5NOhTTTz3AX03aHPXC7E15NGt4/1Bf1rLKZxj+FG5x1
 9g1Uj8oT84Fzw3fx6Sk20o9VqMDRXP53p9yqBQJWLmHX9Xc1C2eXkzO2/pd98kFciCHb
 1Ns/wK7UTCY46g7Fm3VRlzm43LncfLsExzxBmVpA6r5J1qz8105Pc/KCUP21jVb5iB37
 VMlEEnMhbn9bfgpnYTn5mFwlLg2Xp1fHs3i3JZAGlKIYyW/fBSbu+iYCabUpBZcHH+Jg
 TEMn887E/WIj70nBP7CsNkbJCwgjl2HQWbRwkTtZPofxPHlCipo8mXOQip2kcNbhLhdP
 VynQ==
X-Gm-Message-State: AOAM532wTTQFs5Fr0/RN95OyD7QBjyY+U/g0j0jNyqa4ApgAaNOIxwij
 YY+nk8sZ5Ij7Fs0WM5zu62ZRQnWSdnwzGFUGkPze+A==
X-Google-Smtp-Source: ABdhPJws5Lz0RSigzpFKPC4FJpUn+q62XZROHFGhRSq8AcCtEQPllOLq4N6c7U65crAuKCx4V2yAkcG5+T7kt3SHVBw=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr7717471oon.25.1646771553985; Tue, 08
 Mar 2022 12:32:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:32:33 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-5-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:32:33 -0800
Message-ID: <CAE-0n5179gihcXQDxMVgLXK5n-UApDeU6Oe6zttdPrG1zY6CPA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 4/5] drm/msm: stop using device's match
 data pointer
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-03 19:21:05)
> Let's make the match's data pointer a (sub-)driver's private data. The
> only user currently is the msm_drm_init() function, using this data to
> select kms_init callback. Pass this callback through the driver's
> private data instead.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
