Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F313E457A1B
	for <lists+freedreno@lfdr.de>; Sat, 20 Nov 2021 01:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6F06E821;
	Sat, 20 Nov 2021 00:22:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F9D6E5C8
 for <freedreno@lists.freedesktop.org>; Sat, 20 Nov 2021 00:21:58 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id z18so14947466iof.5
 for <freedreno@lists.freedesktop.org>; Fri, 19 Nov 2021 16:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zLquZzs24iQjQC4Eaf2dLTzvdVr5K8bViakf/mMOaI=;
 b=kv1u5ZYg776ndeEU+ERi/P4xWfao/xyifsnXNd6vd0PjjQj6YfGBG054WD5AXigBWg
 GofqDX1eF4snfQCNUDkT9oY1Il66VX9FHDiH1xQHNoQXF4s3kaveMXx+i1Kb6crl5kOB
 /EaOXTPzgjEUns83ux1D0Dt9A3I00EvK6vg30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zLquZzs24iQjQC4Eaf2dLTzvdVr5K8bViakf/mMOaI=;
 b=w69afalNl3FDfjj7ToRHbLIDAFyJ4UqB9Dlvj9swxq1urYdgBO+jiSVux0mQnU07KX
 cVilDf0uS+mR2Ulx+IMjop5evFkXgzvISYqJuGO2eepv3sxLuezYfdXT5bqL7hiDqgHk
 B1eEmNUuiIAsBcsgCCyNeNsdyt7JY2TYwMqZnml3hoFROrppQqtchOERPt8VPocXT61B
 PYA+5VrQI9fJ2uCZeYsAlrtGzaWMRLeNOTtwCIntFnn6mS3WNdLBAYgKPBc36KQzCfB/
 gNF2nIgL8a1cwdmwy5OITZk4mEO4A4iX5wT2NPP5sd5w/5kHh1Zd+Px6lgL/JbD1asMC
 74hg==
X-Gm-Message-State: AOAM532Si/xFyxrSThIN7yrUq2HvFzExR4fKaEUSQM16aXe+kzzAwfz9
 fQVxag2EaIJquOpJ2jEA4LKCKjW25HDUTA==
X-Google-Smtp-Source: ABdhPJwg8FriYwNQExmXyyM6eIBvEUr8ib19Pew6iArQCksFPVhdijuEdoKuHTRK93P3M4royO+2pg==
X-Received: by 2002:a05:6602:140d:: with SMTP id
 t13mr8607443iov.176.1637367717160; 
 Fri, 19 Nov 2021 16:21:57 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id g7sm855092ild.87.2021.11.19.16.21.56
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 16:21:56 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id s14so11841702ilv.10
 for <freedreno@lists.freedesktop.org>; Fri, 19 Nov 2021 16:21:56 -0800 (PST)
X-Received: by 2002:a05:6e02:18ce:: with SMTP id
 s14mr7289654ilu.142.1637367715969; 
 Fri, 19 Nov 2021 16:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com>
 <20211119225157.984706-2-robdclark@gmail.com>
In-Reply-To: <20211119225157.984706-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Nov 2021 16:21:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UraStftJyUDHp5=iKoh4tnCQiTgBZJBNF3-q=HDZUPZw@mail.gmail.com>
Message-ID: <CAD=FV=UraStftJyUDHp5=iKoh4tnCQiTgBZJBNF3-q=HDZUPZw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
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
> +void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
> +{
> +       struct msm_gpu_devfreq *df = &gpu->devfreq;
> +       unsigned long freq;
> +
> +       freq = get_freq(gpu);
> +       freq *= factor;
> +       freq /= HZ_PER_KHZ;

Should it do the divide first? I don't know for sure, but it feels
like GPU frequency could conceivably be near-ish the u32 overflow? (~4
GHz). Better to be safe and do the / 1000 first?


> @@ -201,26 +217,14 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
>         struct msm_gpu_devfreq *df = container_of(work,
>                         struct msm_gpu_devfreq, idle_work.work);
>         struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
> -       unsigned long idle_freq, target_freq = 0;
>
>         if (!df->devfreq)
>                 return;

Why does the msm_devfreq_idle_work() need a check for "!df->devfreq"
but the boost work doesn't? Maybe you don't need it anymore now that
you're not reaching into the mutex? ...or maybe the boost work does
need it?

...and if "df->devfreq" is NULL then doesn't it mean that
msm_hrtimer_work_init() was never called? That seems bad...


-Doug
