Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898676D0011
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 11:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD14710ED7C;
	Thu, 30 Mar 2023 09:46:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FE810ED7B
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 09:46:19 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id m16so2363038ybk.0
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 02:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680169578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xmf4KluG7S4v5uDGa2+BLs6ltj4TZB+1o0aJASQSOQw=;
 b=vVb5l1v4m4wjbO8U7AUqqFUk1Gu/g0kfn9LLEJKhee21SD8fNp5cFCodGYSDNFcCqf
 gpoh1hYchAtQb9hq+7kNFWLuPhTkb0U5ga9SjY6XVjSCIBA7Fe61TNa6cTCZVRHKq6pz
 TWLBudl5ztNNAYyg5w/Yzj3k4ZLG5FrEB2NggP187wWW+ewZszJ6X821CTlEKaiERCR+
 DKYBCjfSKArSwUlRS/0zxryZc1G0i83F+vbZLv9MH2jeHNZC1RtR/LxR4mdQBQhiSI0A
 SFAK6V9MBXNBvf2Th3XA7+U9/8FkOdQTWtWURDBKk+xn/Zb62kSHHQogy/Zgg1UTD+j2
 Kcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680169578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xmf4KluG7S4v5uDGa2+BLs6ltj4TZB+1o0aJASQSOQw=;
 b=46Bwl50QT2ZwT353dlt2Cgc/ymU7CjWJYZ9Wxm1HvNGtXvU0xle8Hv0Ao97B4f5/Ms
 BNlrKIqzybhmbeYg5q6bpeSBqlpsKgIFRS+hiF2icaE42QdD2ZC73gBJAfnqVU4Q6Y4m
 4ayRVjP/OpZ4JNXDKFfnZIgz616aL9agsYkAFjMJ8y52OAWd2mvZ+utL0jqgp+PFtpLJ
 XrN1+IoVIZzOxOo2Ou375GOtUG9kwk+xrBiJHq/7O2/qYx/S889H9Ak5YJeTZ8gXSsfy
 tpj2YSNJdcsR+8YmQLZ15oR6v1Sv4b6L0X7H4iFhOIwuS/9uqEJT+6nOHCuT0kLKGIap
 94Hw==
X-Gm-Message-State: AAQBX9fR8F8OM2eACcAr3tQWHKILMedO/LCVUDYVAR489F75oplNf+Qo
 rLg14womwIrdV+E0ngCAlwDBy/ONaI4uTm1EXdJghQ==
X-Google-Smtp-Source: AKy350b25TKNX7LWY6kffjMjteju8c3Wk+7BpFOOlJ9BIgRcXEmR4R10+7PyamjASoryl8edb19Ysr4/N8lgH/tLRUQ=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr15558336ybu.9.1680169578520; Thu, 30 Mar
 2023 02:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-1-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 12:46:07 +0300
Message-ID: <CAA8EJppVCKojseqV8CSpMh2Drqsk0jtH9Mza2PQq9LtN-2Ue1w@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 0/6] drm/msm: Convert fbdev to DRM client
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, robdclark@gmail.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Convert msm' fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in msm is now just
> another DRM client that runs after the DRM device has been registered.
>
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
>
> I did the conversion from similar experience with other drivers. But I
> don't have the hardware to test this. Any testing is welcome.

Thank you for your patches! It was on my to do list for quite a while,
but nobody had time to work on it.

>
> Thomas Zimmermann (6):
>   drm/msm: Clear aperture ownership outside of fbdev code
>   drm/msm: Remove fb from struct msm_fbdev
>   drm/msm: Remove struct msm_fbdev
>   drm/msm: Remove fbdev from struct msm_drm_private
>   drm/msm: Initialize fbdev DRM client
>   drm/msm: Implement fbdev emulation as in-kernel client
>
>  drivers/gpu/drm/msm/msm_debugfs.c |   6 +-
>  drivers/gpu/drm/msm/msm_drv.c     |  21 ++--
>  drivers/gpu/drm/msm/msm_drv.h     |  12 ++-
>  drivers/gpu/drm/msm/msm_fbdev.c   | 168 ++++++++++++++++++------------
>  4 files changed, 118 insertions(+), 89 deletions(-)
>
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
