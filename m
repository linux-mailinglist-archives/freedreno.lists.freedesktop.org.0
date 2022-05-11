Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E48523D40
	for <lists+freedreno@lfdr.de>; Wed, 11 May 2022 21:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C58A112B37;
	Wed, 11 May 2022 19:15:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A17112B37
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 19:15:28 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gh6so6055527ejb.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmamqcS6UVefjf9ZEAc++snoGPnFlkAJ7A2gr6Hybu0=;
 b=dBuK2lymrrDPdlannsOQHXnUcfuHTrBkOPfEbu7qkW0E5kYO5Z+bFsewwOP9kO18lS
 Ebs/5hwuDtsE7odsW2FMFSxqELyAfsWmglvZotYHMj+VC+iTD8HgUjirJo2F71hfTMdW
 r33xYQIIdwMLG8WV5P6snakQvBwy2w3VlziQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmamqcS6UVefjf9ZEAc++snoGPnFlkAJ7A2gr6Hybu0=;
 b=kXwhDZooK/aHfBFnWjYdV2Xawhff04zB4FmUtvoqX4Yzm1C6DAz+LKdMPQgNPcx6z8
 D5dA0j23iHUtLnvFhvPs7P6pxRh3YT0YJS+NROkElav1mDzsrKe6qthIyG1VB7mVcwsj
 zXS2eOZgztM4t+PwZdw8Z1wEW7hEkt6szVpYcwvVJnPvUwQ0IkX1ZsvdikSSNKXxMwhy
 s8ZzXgGWHyKvYyq4QqUrCFjaorsKd6sOnH715t3UB6HNOTuO45pnpumPkclhlJj0TBdw
 fUlEJFEammLNi9D4kYkXkvhOLEpHbDGx4a5/B77UBdPhD2FhpgK8OiOPhqO2bnmI3y4T
 F/dQ==
X-Gm-Message-State: AOAM533MqU2iC85/HXkQcWoxicCq40S8j/buPm3HGES8avU29J8T9sgQ
 F9tvkWa51UcGSU1gRUq+BuoJ43Byiacn6xa8Qzk=
X-Google-Smtp-Source: ABdhPJxuzyATVXCqieK73V3Hd3raM3P3LO2+C9CZi5NdAc0dPqI7oqLsWet76jf7ekP87Uk4T+5rNQ==
X-Received: by 2002:a17:907:6d82:b0:6f4:d62e:8168 with SMTP id
 sb2-20020a1709076d8200b006f4d62e8168mr26413872ejc.374.1652296527022; 
 Wed, 11 May 2022 12:15:27 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 i11-20020a50870b000000b0042617ba63a6sm1673896edb.48.2022.05.11.12.15.26
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 12:15:26 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id k126so1781375wme.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 12:15:26 -0700 (PDT)
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id
 l6-20020a05600c4f0600b00394836b1552mr6316930wmq.145.1652296099201; Wed, 11
 May 2022 12:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
 <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
In-Reply-To: <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 May 2022 12:08:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
Message-ID: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC
 v2] drm/msm: Add initial ci/ subdirectory
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Dave Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 11:40 AM Rob Clark <robdclark@gmail.com> wrote:
>
> It is missing in this revision of the RFC, but the intention is to
> have the gitlab-ci.yml point to a specific commit SHA in the
> gfx-ci/drm-ci[1] tree, to solve the problem of keeping the results in
> sync with the expectations.  Ie. a kernel commit would control moving
> to a new version of i-g-t (and eventually deqp and/or piglit), and at
> the same time make any necessary updates in the expectations files.

Wouldn't it then be better to just have the expectation files in the
ci tree too?

The kernel tree might have just the expected *failures* listed, if
there are any. Presumably the ci tree has to have the expected results
anyway, so what's the advantage of listing non-failures?

                  Linus
