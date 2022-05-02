Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B931517876
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 22:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C424E10E5BE;
	Mon,  2 May 2022 20:45:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E4F10E3BD
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 20:45:45 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso15419787fac.3
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fihLXW+NVco1n2KLk1cRhGyHTF2MpnicbRd7YNgBCc8=;
 b=VMqO4vknzSGkmO3JauysvgHiitb0nyAUU/z8Wt91FgV//JFURVbUInKN2wizFBanSY
 R62egkUXbtY8Bs6HuC46H6MfGihxj/LzqhBbAVQ9IytYiWC1dwXb2O9AFEgxl7Hg5GFG
 3MJM7O/6PT9VIsAbfxD6cHZiiLZTWZ1MwgNgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fihLXW+NVco1n2KLk1cRhGyHTF2MpnicbRd7YNgBCc8=;
 b=ZX2QehVjkTAo29P3LI/TtWq4p/XnbjUP6u3hJLuTgGhub1e8u/MwmZqVBJbOPH8Rl8
 bMBRJnYIlP21wMgjl5Rf5Nps3eVEuOfOSf/Maf33SZNlJIPW5k1p/To/3mU/cWnKCgzB
 US83t/ICIcmtmjZZUC/eRD3qlFjnWIRCV0LQGoPQ4H1h0r6ehjfQHLhBe2LyElsMbmgs
 fhcoAiSQW0/eNo7DmBQpt/H5MAEsdC8UxWdop5vInuwhd17QzJYG8P27/xe4pVyxao7i
 DOIT/Ybzcg1moGAedtZgflzggnvNp2OJB2MLAQPoAmkjvZUojP9thWcCSES23nmYHRsp
 bp9g==
X-Gm-Message-State: AOAM531TcQgUzaCvQUMySTx9n8dJVCNMHiHfv2ZZ20bn06cH4r6QHAUL
 F9updbnYsRR+mdXLFElU4ULhID3qVgjVVoeRHfNJ2w==
X-Google-Smtp-Source: ABdhPJxCyZCBCI5TnWaYizB9SAj5o5xcSvfY9MCiWwXyKXV8wXqH7q+yt2TaurGnrXPzWY32EJ/pmKS7xPLcEdoM73I=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr406707oal.193.1651524345048; Mon, 02 May
 2022 13:45:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:45:44 -0700
MIME-Version: 1.0
In-Reply-To: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 13:45:44 -0700
Message-ID: <CAE-0n526pBHnVZYYksDiRtYr7E=BtMB1VectX-ew8msLNWXh1w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add missing break statement
 for update_pending_flush_wb()
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
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-05-01 22:39:41)
> Add missing break statement for dpu_hw_ctl_update_pending_flush_wb().
> Otherwise this leads to below build warning.
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
> warning: unannotated fall-through between switch labels
>            default:
>            ^
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
> note: insert 'break;' to avoid fall-through
>            default:
>            ^
>            break;
> 1 warning generated.
>
> Fixes: 2e0086d8c61d ("drm/msm/dpu: add changes to support writeback in hw_ctl")

What commit is this?

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Patch contents look sane

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
