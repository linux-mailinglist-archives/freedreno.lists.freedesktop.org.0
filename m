Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E21AC207C
	for <lists+freedreno@lfdr.de>; Fri, 23 May 2025 12:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0353A10E28F;
	Fri, 23 May 2025 10:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l20p0Bls";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3208210E28F
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 10:03:53 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-70ccb7effb0so41311917b3.0
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747994632; x=1748599432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSyy6F6LK0lnXl6EFJ91Tp2akvoleZ9nkVxTo4FlKQE=;
 b=l20p0BlsE7inzz9gDmJmtXKCCugKQ6psdxu5u+SZBlb8XTqgjLZMaiRxCU0CmxYN7N
 A8wMjPwGQA0ApZ/wFAlx4fGazb0Pu47hiGtQa/Ff7yHrZOvX0MdeaCURNS7zoBIeOp7J
 bIqCcCqo+QghOQ1UX8pyHE1ZXHUCV8yMBXu4qlJBrZkk2QncGYQc6TTvs0g+mV0hNR8I
 2mm82ac8CrqeT9caJiIWItchLZ2x9kCt34w3rVcS8vFcBYvovbeD6yQGw9zNmujodc26
 UIzNV9Yd5BrjutWYQHgpevcQt4YT+dX5h0gXJdV5fJVCz+c0BsVe+CIuUPTSQZbdgdPs
 IW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747994632; x=1748599432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSyy6F6LK0lnXl6EFJ91Tp2akvoleZ9nkVxTo4FlKQE=;
 b=A77LXfUi9Pd/tTlkuGk0WPfkW9ndgQZBgRwwD9CNrhGJ2EIrJGTOOa59VGrGoTCedR
 U4UiMvrE3gn/kD7Zx9mAnuDaKdZ07wBGH8sPHDlfPGT2ozoe9jPofCvQ09Ju4FCj5rSn
 Yxmagz0H0YyGU6llkPX+P4+rFAAbgLO7myUakSJMhWd4zom8cF/K79Am/7BwXKbW36bE
 cSTf7uK1ICXAEjQU4SCSHHkyqbwKLFN8irD0rTYGwNE4pn7uzcpIRzxV9k7jon12GWmd
 f+MULZUOzKThWvk8G2hLmToM9y7ALMw8o0OKeeAo0IL77XyafDouXG7I8IxHqGoxSPaR
 iH3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU375C8Q6u10qqUQrFyXKc9mkCSGTIE/GPWj+7xeCDK1KYJTlhP04KtS0eN71J63fibgXMjMrQzPic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5JlmuBI34Gud1leoNKa7/TzLeVqBr6C8puMqJHsIt8o/gr/Od
 Cbg67mZpsoZNHWO4X50QEmv4dc09R1pf/5rCa7iMXChzjc30DD5e/fE1SRpMXhJ6VFn9UMBljj9
 vsHLjGYiel7k0UxDroucXgHVx2tWnkI5ATfV/dvs2Nw==
X-Gm-Gg: ASbGncv45YiWxBjR6M70eSAv3pkwgFX9XpDRweuHh6qDSHtfmA4uN8XX06fltfofWgS
 gSA7XebkAnM2/TYZdKHkvT8C1TeXPwSs13G3JV8hnd3bnqhKQkXRn+xywKSyt9jrhVy2+GmAGvO
 4wy+zpC9RZ046Myk0oQURth3yw5ob7c/MmySj7RF6ytqyrlBtIDYKgwUiA89tHou1dSZc=
X-Google-Smtp-Source: AGHT+IHMOhW87yFnNkOzjQbF5lt7pbwsLfpvr6K8p94xBG86k8PuM3wB1MN6LYFWzC8LZIK5hH5M2DO7rvHYJxhdvTg=
X-Received: by 2002:a05:690c:6704:b0:70e:142d:9c56 with SMTP id
 00721157ae682-70e198da98bmr30145427b3.26.1747994632204; Fri, 23 May 2025
 03:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-9-f7b273a8cc80@linaro.org>
 <0dace5ee-8c81-4181-ae0d-7f317b7f5ac9@quicinc.com>
 <0fcad5ac-e1b3-41ef-9d29-0c801aa4fc51@quicinc.com>
In-Reply-To: <0fcad5ac-e1b3-41ef-9d29-0c801aa4fc51@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 23 May 2025 18:03:41 +0800
X-Gm-Features: AX0GCFt8U5tJbB_Frbkc2UDuQKbexsfWNiEDvHL2UT7JPw5PMyVZFKL3Z9TN9lk
Message-ID: <CABymUCMYSj=3LaA8Hw4se57_4xV+G33DLrYkGRR5z6DjDeypCA@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B45=E6=9C=889=
=E6=97=A5=E5=91=A8=E4=BA=94 04:55=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 5/8/2025 1:42 PM, Jessica Zhang wrote:
> >
> >
> > On 5/6/2025 8:47 AM, Jun Nie wrote:
> >> The stage contains configuration for a mixer pair. Currently the plane
> >> supports just one stage and 2 pipes. Quad-pipe support will require
> >> handling 2 stages and 4 pipes at the same time. In preparation for tha=
t
> >> add a separate define, PIPES_PER_PLANE, to denote number of pipes that
> >> can be used by the plane.
> >>
> >> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Hi Jun,
> >
> > I think the comment from v7 about propogating the PIPES_PER_PLANE chang=
e
> > to _dpu_plane_color_fill() got dropped in this version [1].
>
> s/propogating/propagating/
>
> >
> > Also, any reason PIPES_PER_STAGE was kept for
> > dpu_plane_danger_signal_ctrl()?
>
> I have the same question for _dpu_debugfs_status_show(). It seems to me
> both helpers should be using PIPES_PER_PLANE.
>
> Thanks,
>
> Jessica Zhang
>
Thanks for pointing this out! They both should be changed to PIPES_PER_PLAN=
E.
Will fix it in next version.

Jun
