Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02273803E8B
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 20:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904AD10E052;
	Mon,  4 Dec 2023 19:39:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8759610E01F
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 19:39:07 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5cece20f006so56902027b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 11:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701718746; x=1702323546; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YTaRrGnNYWJXMSaCAkRjN5SkjpY2VkDKl0lQohgIOR8=;
 b=x3gllkSU+cj8zFYnCab7oQzil+Y34XjZk8FvsNEYpxEqq1VtgLZ0VaHhPns9OBuNhV
 +8235lflkwDPQ+ppzBBaDkriVBjUio5kNkrp/OIY3Jx1v74zXGDii1RwZQHx7PIV9xws
 1Cm+BFwpIG8tysCir7EIIUy4zt10qxnPFqadOkSJ4CvR1Pmqx/olds0IEEBnrOsPiujh
 qecIGo1CHw2W32un56Pjo37uIaxPTOluYF2aZx3tgbSVFmGfSu+bJn6C5oZYHOsv3AWp
 hLAX8i562qnVWlf4EngW/owUkrC+k4LIx6/95aBtSkglPOHz00RRxfds2qW+iIdWmdUm
 +rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701718746; x=1702323546;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YTaRrGnNYWJXMSaCAkRjN5SkjpY2VkDKl0lQohgIOR8=;
 b=ThGRvxcEYEJJ35dyUVvBQryhroBotIS46ceamcgZe6GC6dm+K6D1F75VDGf4ivasEk
 f3cIvYlEZ2rhU6R0eSZW3Salni5sPdBqY+/UPijlH6eQyeH7WU2q8MwAFSlCrwu38t2i
 JatLcH8zWndb0WIMyLI+LZlD1IJpfCb3rczF/LqFVR1ouEkys/GLohNxUIDTQ51sHQwJ
 5S/8KBp9vdJ1yXkjUzzdQxLX69JHQq3xnEYXLreN48USNM1UcIYmMFkgiNUC6Vl+TrS3
 W/MwoJsuG7TjjT5IS23qMvYA3YNhx7Aiai0wkASh35JdUiHJhihraA8TDiPdSPrt+luW
 aJcg==
X-Gm-Message-State: AOJu0YzCETMhbt8hYp1GxoZOO9FTPEurJr7v355IQhJYFmSNaru8H5py
 yDPFNfKNObpvUj2dGgGEHH72M5F0+Yw/Kzdsxskyew==
X-Google-Smtp-Source: AGHT+IHnf+wIvLq0T+FY2Q4ycS6tDbC03pIpYzm4f+CmPYNLG73XmpwNsbHDjLnCXb2W1bDF/n+0HHpOQ1t0sBPlJMI=
X-Received: by 2002:a25:2cd:0:b0:db5:4e94:67cd with SMTP id
 196-20020a2502cd000000b00db54e9467cdmr3836892ybc.58.1701718746667; Mon, 04
 Dec 2023 11:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 21:38:55 +0200
Message-ID: <CAA8EJpqdJFxM=Ervg6Gx3umV=K7HaprAa2RrtSjxtv_qv1VO7w@mail.gmail.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH next] drm/msm/dp: add a missing unlock in
 dp_hpd_plug_handle()
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>, error27@gmail.com,
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, dan.carpenter@linaro.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 at 19:13, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> When pm_runtime_resume_and_get() fails, unlock before returning.
>
> Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with Smatch. Only compile tested.
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
