Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C947BFC2
	for <lists+freedreno@lfdr.de>; Tue, 21 Dec 2021 13:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E10112C27;
	Tue, 21 Dec 2021 12:33:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59C1112C27
 for <freedreno@lists.freedesktop.org>; Tue, 21 Dec 2021 12:33:55 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id 8so12664867qtx.5
 for <freedreno@lists.freedesktop.org>; Tue, 21 Dec 2021 04:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PRb2+biYRz+tifj2jXTfIb0511qliwqkvCVc/e674+s=;
 b=KAGNb75gWranBedQ0OOHTCdA/GRp7awXZJzsYnyHq+2z7I4KNYm4wt++TwpqQ4jTSo
 We/B9kqRFzFS2z0MSdEcbKdpeAjP6nEw3tDrBgNU0FcU2G9hcVc6YVelgnACex7YYL3C
 9yvqSH8M8Ssmn8PUarOQOddKq4T6OKTge/Oct38IfILq4P11FY/iUY3z6UnFzEq8gYY+
 KisrK8/SGAGU+MV060KX4+qXn/cZ1SRKv1162/q/gfQHEaarGpizYeD8Vej98QFwidp7
 mQCL34GO0K+Jm8zJSAam8u7RLi49uWX9m1LcR2taObR3AIo5AoZV6T1RG19605cPwb9g
 vIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PRb2+biYRz+tifj2jXTfIb0511qliwqkvCVc/e674+s=;
 b=Ymsu+g2NEiFWBh6S2zlhRprn0MpQYL9kl2DujkABCpelf89jyQS4la8G62oPfxn0v4
 fCtiEn0hMS2nzr63yujo/tFirOKbUVa090odcUcdntZWESXeW4YfA3Uoc1Ogg1uuzBwf
 GKriMLRNOjitsRKRiRNal8CAEuL+p2MFwGKyeznCJhExuxn2OOzYMDzriM4WZfT+RyqJ
 1cGNnlJkF/mBYVMmwXcnRDiy0MyoyvEcVQdayIObvWgIcqSetuxYUB8dcoE6cJUae2jd
 sNDyHSvO6vLQA/Vu6BG6RM6c433zbp9+xmjlEf4P2m/bDh1eOOj2uZgbcwWFCALpSwZj
 Q3zg==
X-Gm-Message-State: AOAM533YJ9WpM5QQPGPQPJDJHFMlhGmDpw0LEkKlYoSA18jD3QJbspkT
 BiTPiKGfr6WyUIHOWzKrbX4Im4tvpVmnw1Nefjz3PQ==
X-Google-Smtp-Source: ABdhPJxcLyr8ljv9Q9dBtqLQefPD1HkvmcH0HRVsbIk1HMQukTuHmA8fLRpIsiljsrgoSRt6UIyDzbICxEAlCA0czQY=
X-Received: by 2002:ac8:4e8c:: with SMTP id 12mr1876205qtp.45.1640090034796;
 Tue, 21 Dec 2021 04:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
 <20211221101319.7980-2-jose.exposito89@gmail.com>
 <CAA8EJppMsqot1isnMYeSWVJm4tC-PoqUDL9jwd5HJ72tca0HQQ@mail.gmail.com>
 <9_OAfk8h0URTETEHMPKLX0zP7-pirLOCmv0iAiOCuRRcuuVRBjYBXk2YWAAogEANzumyffgjeRZD0nGtKTk5AeGdTLsN5Q7gVnQzr_x45WA=@emersion.fr>
In-Reply-To: <9_OAfk8h0URTETEHMPKLX0zP7-pirLOCmv0iAiOCuRRcuuVRBjYBXk2YWAAogEANzumyffgjeRZD0nGtKTk5AeGdTLsN5Q7gVnQzr_x45WA=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Dec 2021 15:33:43 +0300
Message-ID: <CAA8EJpphECjTnr=EPaToxeqoQshSt-aF_41mEjO41GukZqbvTA@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/3] drm/plane: Mention format_mod_supported
 in IN_FORMATS docs
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 jernej.skrabec@gmail.com, tzimmermann@suse.de,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 freedreno@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maxime@cerno.tech
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 21 Dec 2021 at 13:50, Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, December 21st, 2021 at 11:48, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > I think the fix should be applied to the generic code.
>
> Related:
> https://lore.kernel.org/dri-devel/t1g_xNE6hgj1nTQfx2UWob1wbsCAxElBvWRwNSY_EzmlEe_9WWpq8-vQKyJPK6wZY8q8BqHl-KoGwS5V91VgN8lGIl3PJt7s2fkdsRd3y70=@emersion.fr/T/#u

I'd still suggest to fix create_in_format_blob()

-- 
With best wishes
Dmitry
