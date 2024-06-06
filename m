Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4948FE1A6
	for <lists+freedreno@lfdr.de>; Thu,  6 Jun 2024 10:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E0410E22A;
	Thu,  6 Jun 2024 08:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SOa7lG/4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE44C10E22A
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jun 2024 08:54:20 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dfa72c9d426so848278276.3
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jun 2024 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717664059; x=1718268859; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+iELr/WPzJm0A7EM6v/U4tRKEa6mtrRIhxMOyb3jnnc=;
 b=SOa7lG/4ShXyUH0/ln0HdXsw231cwla1DM+i+iL1tg1Pg2SJzjg5LAWJM4dhfhLs1A
 M1NABJS27oJdE5zYLDA9HTSQlA3T41nawEESKab92di53shiq+WFmLbS0/oeWlHfroe5
 Go0cu2SXHhdhrYEwNvTDEuI1DftXYhh7n7j/acHdFT6BfzIbYLYnNtXdZjZsY7Q4gG34
 xJxDl4k8rgLmrvVNVwU/MA/wb/+tVHaLtn55FFgNqVkJ3NlW2yiuLA36xOYCNmHnxlVx
 Ko9CMDAlXavC2BAiP7RZPQY50840/96PBvoXMw+qIBLEHS0kifGnXtikIwHwCZVrQr9X
 sBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717664059; x=1718268859;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+iELr/WPzJm0A7EM6v/U4tRKEa6mtrRIhxMOyb3jnnc=;
 b=pHNhvs9R5ePgLbb5G/ykhI36nzUF4UwyTbb55MfbSZerT3ZFn9CozFMlvuIe2n0Qhw
 d5E8atcp3+wtMNoERdhGfGx6iQrVAA+mewP/+1kOtaWXREBNsqwvnj6/9n/84QW++rdE
 GPt5VmrMrNJyO5DYT9upKjWPuRXxwCFX/Dow52K6/TtnES2qyV81xOzoSWAER72IYyGs
 IBjQGZZc/59k4jWYgmrg8EysXb5N0F5xPbm5NLYJX95BGt4gXaFhVlqXdbysu/Ji80b0
 CS5yRu/PinW4XbXyXCOJOPxbv/28igmpR37FnEkRn2Cl5stTifyrHewmIHw28ofy46kx
 XCoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeCb+dlH03/uy3IXKdhpJ6dePNH2StK+6ARVVH5qmU4uspD+iCknbLsyjrb36CVBcR9B+JyNFtEwnldtH71dq4hGf9PhpzBkF5Vf5GMSwv
X-Gm-Message-State: AOJu0YxQXjf42S0sgHy5ah2uoZ9mKSzBmoPq3a8hnntdtKj/dKAkdMwJ
 bWYWbXhk5SVgnazjtKwbGePdeFXLvZ3Kz/Upiv0ppwVsqg7GpxRMSYtrXkMBrqqIoVl1j+e43pl
 LDH4HjrfC9yzk/L/8ooM+0DiONlOcoD2pddif2Q==
X-Google-Smtp-Source: AGHT+IFVHYy2qIeOQs9q5V92xKkDYTynf4PQxhlNASe/iGH0WwNFzITXGL0WNI9PXXLo8Ls225McpXU6BeaKzqXO3hE=
X-Received: by 2002:a25:2d19:0:b0:de5:5084:715d with SMTP id
 3f1490d57ef6-dfacad2443fmr5080848276.53.1717664059531; Thu, 06 Jun 2024
 01:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-7-dmitry.baryshkov@linaro.org>
 <627dd526-2b56-2ecb-9011-4ec08bab454f@quicinc.com>
 <CAA8EJpp+NvoTMZdVNivqe0_nQd3PChSND7ojqa+Ee3nMdWcQGQ@mail.gmail.com>
 <1c107933-2180-fcd2-06f2-61eb7108b6b0@quicinc.com>
 <CAA8EJpp7DL+hpTUgmzsKciXg8ZEZ5BFy8ALiH0CbFmWb058HCw@mail.gmail.com>
In-Reply-To: <CAA8EJpp7DL+hpTUgmzsKciXg8ZEZ5BFy8ALiH0CbFmWb058HCw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jun 2024 11:54:08 +0300
Message-ID: <CAA8EJpqBSiCadAKXSXSB58cPV7Fb31_92vJJDMDsnxHz1TnuOA@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] drm/msm/dpu: split dpu_plane_atomic_check()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 6 Jun 2024 at 11:53, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 6 Jun 2024 at 02:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 6/5/2024 4:32 PM, Dmitry Baryshkov wrote:
> > > On Thu, 6 Jun 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >>
> > >>
> > >>
> > >> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > >>> Split dpu_plane_atomic_check() function into two pieces:
> > >>>
> > >>> dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
> > >>> without touching the associated pipe,
> > >>>
> > >>> and
> > >>>
> > >>> dpu_plane_atomic_check_pipes(), which takes into account used pipes.
> > >>>
> > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>> ---
> > >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 184 ++++++++++++++--------
> > >>>    1 file changed, 117 insertions(+), 67 deletions(-)
> > >>>

> > >>> +     if (new_plane_state->crtc)
> > >>> +             crtc_state = drm_atomic_get_new_crtc_state(state,
> > >>> +                                                        new_plane_state->crtc);
> > >>> +
> > >>> +     if (pdpu->pipe != SSPP_NONE) {
> > >>
> > >> This check was not present iirc, why did you have to add this?
> > >> RM will return the same SSPP unless freed. So why this additional check?
> > >
> > > If pdpu->pipe is not SSPP_NONE, then virtual planes are disabled and
> > > there is a fixed 1:1 relationship between planes and SSPP blocks.
> > >
> >
> > True, pdpu->pipe is currently assigned in dpu_plane_init(), so we will
> > always be hitting this condition.
> >
> > Perhaps the patches later on are changing that, so shouldnt this part
> > come along with those?
>
> Ack, I'll move it to patch 5.

Patch 8, of course.

-- 
With best wishes
Dmitry
