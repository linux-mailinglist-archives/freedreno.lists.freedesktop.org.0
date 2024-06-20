Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C79110C5
	for <lists+freedreno@lfdr.de>; Thu, 20 Jun 2024 20:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2E310E033;
	Thu, 20 Jun 2024 18:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u0/qR1/9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CF010E0D7
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 18:24:12 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-632750bf73bso10452507b3.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718907852; x=1719512652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLXE8J+NTsLyBECHCrJAgVS17SAByDOT+Kx7JyJFgyw=;
 b=u0/qR1/9MczBFEgWv3iIbzbrFfcQfxne1w71UgXld1kqqkDhuelXX3Yt3cyFUqVGHW
 adlEYyh8ZgZnl7L7eFeWZiZ9IyYE6/90qDBf2xK97l2KQNMCh77AfXQlm/Y9j9oa4pAv
 W3MTPAEyGSIImlSG1fjlStjOeEn3eIc4Yzn20SqO9KJkUm5IEkhhy+PorkZOJG2Atpbz
 0mA83tbfeNBYVSLgYz7LymRBwD6XyIb+NEPaE9UWFi5olA6ZIhXaY06KOzCdUySXGjFS
 TW8NrhTe+JCHKh0JFdxIlgHLBvO03TRvAvfTfD+QhdA7uAcWp+hDuj8s6NiA8DnYfZ8l
 kO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718907852; x=1719512652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLXE8J+NTsLyBECHCrJAgVS17SAByDOT+Kx7JyJFgyw=;
 b=ejhBOGoHx+3CJANTKZPm7Vx7rlIZJfmczZmFkw8Dnd8ZsEPFODF6LLruiC0IxRbXRH
 QmpKv/BsxA/wOol67WaMtz4Yu2Adqdq1o+WsdKu3zUmbvsFW6DYbq6DXSmgtgJPQGTjK
 9HqnHRxm/OauBo8rdOTJ7Mw2OgtvUu4kffp7iu0rHTtXRQZXFX1H4IrChAZZ/jvaqn93
 AeZAwmhsS2v/L5mDwfZgjbl3IzmX5Kbd+2kn58JXRtX1NHGCjw+WsRoOKcjXDiF26OnJ
 b9eFsRuFdMy2YcdkwaUiyqv+trLK0OQWbDLRskAhxXCTX2X2N5AhCo7H5NNpCaHxtNJ1
 FFtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVAaXVbx8V3XOwoWs6uJIdNHdTr66dM2fcYFCuf4mv5gLj4M/dqtaLNjRqpmff/nclAhZy9+KwjaszHw1DC6X7GFO/kqBukrnZnmJcCG1q
X-Gm-Message-State: AOJu0YwgDjEXIVfGtmc4vPHpyZreDtYdd40ZlZxQ2/GRiIn/9cN53G8S
 ul79RVu5OY4mzLQoqqva4hzzc+hvkKE/gefdhveHIsrU9eZlL4dj2XFY/FpX3PBqpIgtsb0mGzY
 afv9izWAMMYjdSenp7lbpb9Am227D6ZJiiHP7oQ==
X-Google-Smtp-Source: AGHT+IGxZxE4jiQmLPcc9xGdx4Tub95V70nV8FZmgGqTvXqYLyCBLK33Pgqp319QX+0uSThE9zzO7MdMgj6QQB/WPuA=
X-Received: by 2002:a05:690c:987:b0:63b:bd20:8e1b with SMTP id
 00721157ae682-63d932aa027mr19723827b3.19.1718907851789; Thu, 20 Jun 2024
 11:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 21:24:01 +0300
Message-ID: <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Rob Clark <robdclark@gmail.com>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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

On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@freebox.=
fr> wrote:
> >
> > On 16/05/2024 10:43, Marijn Suijten wrote:
> >
> > > On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> > >
> > >> When create_address_space() fails (e.g. when smmu node is disabled)
>
> Note that smmu support is going to become a hard dependency with the
> drm_gpuvm/VM_BIND conversion.. which I think means we should never get
> far enough to hit this error path..

Does that mean that we will lose GPU support on  MSM8974?

>
> BR,
> -R
>
> > >> msm_gpu_init() silently fails:
> > >>
> > >> msm_dpu c901000.display-controller: failed to load adreno gpu
> > >> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops =
a3xx_ops): -19
> > >>
> > >> Log create_address_space() failure.
> > >>
> > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > >
> > > Thanks!
> > >
> > > Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >
> > > And, after checking the below:
> > >
> > > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >



--=20
With best wishes
Dmitry
