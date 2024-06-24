Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ADC915681
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 20:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3E810E22E;
	Mon, 24 Jun 2024 18:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iDEFJ5Hd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E7710E55A
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 18:29:41 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dff06b3f413so4338974276.3
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 11:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719253781; x=1719858581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhXqZUvyqszLAu7XlxiAnvME4lRodnY/xefXRaxr4MQ=;
 b=iDEFJ5Hdzd2DtEbGRzxGp959aUj/gY9PtCuO9q/njthz+ovpWLtYNXnakyuNqSZ8UD
 EdrHy9M+wwh6lMhbwkrsq4+NrqONOzWWP9NO2jAaBX0Z9yG1hBNyV4yDxrdYYPXNzO5O
 hmF+EbPGMEg7dqyfn3nxRL6IFsstFKXfAyDg9kMqDWcS9rCSKKIPm4Fv1ZsVgL0oH+N8
 LYosY6IOtFKkRRxcvvOx3KQdNwwFmxjLmPHGgJnnwxsH0hWHI3flu6xWcyyqjdx49o3u
 9JNJNTEv+G7IZtuZxhaUl3H+khmkl3C6GOG4VexhQ37a7hUsJpQTPCAuKLKwmgZrqBKz
 i4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719253781; x=1719858581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhXqZUvyqszLAu7XlxiAnvME4lRodnY/xefXRaxr4MQ=;
 b=dO/8ngVNPg/hLcMkNz1PLh8o8KZ3/nJ11nEyyY01U2llmVYuhM8UdhsFMyU+/bs+nd
 voVfW0Kd/f6KE0mtUjGSOsLdCwjR1DXdN0lRdRpO9W9NWLwvJz85AC48LUoSN+LJn4TJ
 r2I5HwoibyzVXbxAVO4eKaeFVFvz5prsUtm7uhluGmMYg53mOcAIImhrZslBlOg/cmSL
 K3APjbcbR7ojJ7cFfi6OG3tcXwl7Jh60DVYvhtlXgiFSq1wGadnqmv1FFW2ki3xW14tb
 JIXCUYT/WyfpBJ/819oGYADxM0xZxjHuatprKisLkU6UeeCbsAFVJL9bsdwlWwRbbAV0
 Imjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS9HhLQgjiQpJxRp3K2xdLvYHX7k9X3zFgSR2MnobjQ0C16nmPvmcltREsD6Zgq8R9lhEy/Oh1wkrxEUZhyZjjMPADrMgMJ6np3lkGX3QT
X-Gm-Message-State: AOJu0YzB2qpIPwDrc3oqirg9N6REP9yjtCRLnsDmfdSC2rJdZR/gdeVp
 y8Rj3LgUsOvN9xeHXy171surhVqDFpf//t2GZYguHzzAKLn5zZt7kO/aAY06mEuBz5906Zk/pfs
 ztXdFfFdXowgf9lu90BI/7JdWOzzeLjMt7D8tpA==
X-Google-Smtp-Source: AGHT+IGRR45bMY/Dfxg34mvEMoB8iP9e/vkOf8+sAlGSMAuUXK5p2yj3dI4Hui4b9KGao2e70E2PefnNyNhV2mnho0c=
X-Received: by 2002:a25:d805:0:b0:e02:c7c9:732d with SMTP id
 3f1490d57ef6-e0303fea29amr4282913276.60.1719253780908; Mon, 24 Jun 2024
 11:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
 <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
 <CAF6AEGvwCXj7=_A=f+A_G9k=1LSSjcrsHB0GN83Z2OKg0eWjMA@mail.gmail.com>
In-Reply-To: <CAF6AEGvwCXj7=_A=f+A_G9k=1LSSjcrsHB0GN83Z2OKg0eWjMA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 21:29:29 +0300
Message-ID: <CAA8EJpquKb0r=ZDABU0F+PGR1PKNTiKELbGe1-4Wd2pVEzVUNg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Rob Clark <robdclark@gmail.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Rob Clark <robdclark@chromium.org>
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

On Mon, 24 Jun 2024 at 20:59, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jun 20, 2024 at 11:48=E2=80=AFPM Luca Weiss <luca.weiss@fairphone=
.com> wrote:
> >
> > On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
> > >
> > >
> > > On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > > > On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote=
:
> > > >>
> > > >> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@f=
reebox.fr> wrote:
> > > >>>
> > > >>> On 16/05/2024 10:43, Marijn Suijten wrote:
> > > >>>
> > > >>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> > > >>>>
> > > >>>>> When create_address_space() fails (e.g. when smmu node is disab=
led)
> > > >>
> > > >> Note that smmu support is going to become a hard dependency with t=
he
> > > >> drm_gpuvm/VM_BIND conversion.. which I think means we should never=
 get
> > > >> far enough to hit this error path..
> > > >
> > > > Does that mean that we will lose GPU support on  MSM8974?
>
> And display support as well :-/
>
> Note that GPU should be disabled by default without smmu.. you can
> override with modparam, but please don't.  It is incredibly insecure,
> you might as well make /dev/mem world readable/writeable.
>
> Is simplefb an option on 8974 or 8226 to keep display support?

Not in a longer term, I still hope to push HDMI PHY/PLL support for
MSM8974, which means dynamic resolution support.

>
> BR,
> -R
>
> > >
> > > Yeah, that was brought up on #freedreno some time ago
> >
> > Also on MSM8226 which I also care about...
> >
> > Anyone at all knowledgable on IOMMU would be very welcome to help out
> > with IOMMU support on these two platforms (and anything else that
> > old?) in any case, since me and some other people have looked at this
> > (on and off) for years but haven't gotten to any stable or usable point
> > unfortunately.
> >
> > Regards
> > Luca
> >
> > >
> > > Konrad
> >



--=20
With best wishes
Dmitry
