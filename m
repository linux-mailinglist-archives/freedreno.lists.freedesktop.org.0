Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E1C55A546
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 02:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9057C10F4BA;
	Sat, 25 Jun 2022 00:12:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7043B10E958
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 00:12:48 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id c1so6831386qvi.11
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 17:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mB243O2vDZbtklHZe05Xzr0fp3GBiFubevpzgOWKzOU=;
 b=GtEibzDijC4BeVChXPiU/2H4lz4ffgbfvTFu6q18HRJhvIHF5zpBoNQ8NPZr0o1A/M
 oiq4fK/AaGi1CWJ4UXU+ukNcj8/3v6IUcOBV1fGgIJamg10q86KmF+s3fth+XvGVFXKG
 tKxgecGUfAPi/gQXQ8sClI9DJW5S1TADlDQlbwe4PQnJX5PQewGdRFpQsLSwfMXRYhGq
 urM7p8gp+eslHqSnl1R9/pEFTdYHfPOgKsT4Ck5pYmdSFpZb9fYBU6U1ZyNde8cgiV9f
 EFePB6CwBRIjvAPsYqU6jLO02i0mRY80kzzHv509055iUvjkprkTpdnOI3hkfO54lLel
 Dkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mB243O2vDZbtklHZe05Xzr0fp3GBiFubevpzgOWKzOU=;
 b=NuXUDYTtuy2hPSTqDuEtIsShOnxXOQsgiXR5Sr9W8sBL/vBTUgTxQojJhm3ptrtu72
 mXj/0XipYE3f1QoRP805LvMb+vIeHaR2E6tOvKqKfdBFZMXsv2qynaZ/h88vo6XkFlFY
 FvCHoTV3EDDoryEKxrdKQJwE0to/7betXE0/bldkWnvVYp+dMWJ3JDhUDyxUF0p3Cx/9
 VpI9Dpdzgm/zF7sUFB4yjBOaNvDJbpuK9von2b5ECt7GTaNa/l5GMhGg/F7Kh4Y3yeNR
 Izs0nzyRNFMpGkvhBHA02WEfWpO0z2JDDTs6eEZBpOGYQoAF0uM51jlIYJ7WYvr93UAk
 Uo0A==
X-Gm-Message-State: AJIora+xQJqBF+5YBF1YHc/zhP5FHJ4LCGGWYkcctqqqTg50U3664Y3O
 A1kIvJ//7qX+l/8zZrN1TPwoxB39Ulu/I8iXW+T5AA==
X-Google-Smtp-Source: AGRyM1ulqLC3UhHGmkjCmq1ZXZo6/6GUqiNwLS35/4vL9h/wWZBzRC4/Bqvi6XyEgTCXEO/7EbD2SvRu66ZMiSV7vAA=
X-Received: by 2002:a05:6214:2a83:b0:470:a898:e467 with SMTP id
 jr3-20020a0562142a8300b00470a898e467mr1174976qvb.122.1656115967606; Fri, 24
 Jun 2022 17:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220624184528.4036837-1-robdclark@gmail.com>
In-Reply-To: <20220624184528.4036837-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:12:36 +0300
Message-ID: <CAA8EJpot4qN68Edq9SZdE76DJof+2i05SUD1yJ1uBHu49jBM_w@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/gem: Fix error return on fence id
 alloc fail
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 24 Jun 2022 at 21:45, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was a typo, we didn't actually want to return zero.
>
> Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
