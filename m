Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AF744BEE
	for <lists+freedreno@lfdr.de>; Sun,  2 Jul 2023 02:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFA110E151;
	Sun,  2 Jul 2023 00:24:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4810E12B
 for <freedreno@lists.freedesktop.org>; Sun,  2 Jul 2023 00:24:37 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-bb15165ba06so2905273276.2
 for <freedreno@lists.freedesktop.org>; Sat, 01 Jul 2023 17:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688257476; x=1690849476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urzXsrUWGcl4UyBILDjOiaiWQROp3RKTi/U4MGrtkrM=;
 b=iZOAttD7VYAawco0QIHpxIFtGOHtWeU2LK7KpRl3l8lETQjIYGQrHH/nupFtERCd8S
 zkd5lbE+ICbk5XImA8eLJh7042KfwpiuS0jJY5lYUyyzenvvwpeMO/eyaySb1SYiDAuX
 fS0Wjm8+2BNzXIA7y82Gq6/1uNnAVlLECP6Wzr1JJnEB2IpKwb+ySKCiEYoMuNdz6tDU
 Zee4eH/NRcxjCnQRLQcjz8qzaGjtT76GGz4vuSDOiXcwX9I9yMXD51vx52yephJw64Wn
 hiPxanafedXHM9UMODNhgfwMwD9pF0CZ1oVe063Jq8PvRQmsh+wrAgwNhVKTeGTpiLU/
 aVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688257476; x=1690849476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urzXsrUWGcl4UyBILDjOiaiWQROp3RKTi/U4MGrtkrM=;
 b=Z7rZ2Hw7f/RU/Ki6Ns3WG7+4QNjcPUGn+jdIRT4IrhWLYuY8KYCkmgIqVGJSRhbI/h
 d3lply9ldF2IYnHn/FmwsdKgv+mGzT7RZTSli+b7/f2bkpuGycmbyg5MtQ5xOLSz6TGh
 fiWPooD6/YbLTB7zGGbP0M/7zPKV90Ai8WVGCgglNigO14AoyPffA1XBmfw5Tkt99Goa
 ZY2BvsMjxTKXyjDeCNHkNGYEXo9ISZ91jqJiGkmQx8n8KIg9i2UFcdygftqWRBx1h0RT
 l+y3NlYWDTcs/x9u2D4w4XyxZy4+edMiFSq0EV/PxA/13pUNTe47gqiM0mXaH0cA1dHA
 /ybQ==
X-Gm-Message-State: ABy/qLb2Vx4Jh7Mg0En2RP56hfS1uC3i8ZHbYhOBC4dzP4yppvppXUdj
 0zTSv6nnSsWydDgvp3ud59khvYnBfC3F1N2jQVx3rA==
X-Google-Smtp-Source: APBJJlGs2pz64z1/S2iPbXPMC9ztG90XJQHlFFYOdiHoEDy/FwFGZpceDr9gy6ZybwdrV2YU3rBeED0TUj4duHCPyd8=
X-Received: by 2002:a25:842:0:b0:c1d:4fce:464 with SMTP id
 63-20020a250842000000b00c1d4fce0464mr5385642ybi.9.1688257475814; 
 Sat, 01 Jul 2023 17:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
 <CAF6AEGsH0BZd_yyn7UtJ3cLbbw2A5qdg8gQ6SORzQKjsMsnvHA@mail.gmail.com>
In-Reply-To: <CAF6AEGsH0BZd_yyn7UtJ3cLbbw2A5qdg8gQ6SORzQKjsMsnvHA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 2 Jul 2023 03:24:24 +0300
Message-ID: <CAA8EJpripp+Hf=GvCit75naGQqK8owHzPb+VuYHin393HcFPwA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v2] drm/msm/adreno: Assign revn to A635
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
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 1 Jul 2023 at 18:50, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Jun 30, 2023 at 4:12=E2=80=AFPM Konrad Dybcio <konrad.dybcio@lina=
ro.org> wrote:
> >
> > Recently, a WARN_ON() was introduced to ensure that revn is filled befo=
re
> > adreno_is_aXYZ is called. This however doesn't work very well when revn=
 is
> > 0 by design (such as for A635). Fill it in as a stopgap solution for
> > -fixes.
> >
> > Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified bef=
ore being set")
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> > Changes in v2:
> > - add fixes
> > - Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-5056e0=
9c08fb@linaro.org
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index cb94cfd137a8..8ea7eae9fc52 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] =3D {
> >                 .address_space_size =3D SZ_16G,
> >         }, {
> >                 .rev =3D ADRENO_REV(6, 3, 5, ANY_ID),
> > +               .revn =3D 635,
> >                 .fw =3D {
> >                         [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> >                         [ADRENO_FW_GMU] =3D "a660_gmu.bin",
> >
>
> hmm, I realized a problem with this, it would change what
> MSM_PARAM_GPU_ID and more importantly MSM_PARAM_CHIP_ID return..  The
> former should be "harmless", although it isn't a good idea for uabi
> changes to be a side effect of a fix.  The latter is more problematic.

I'd say MSM_PARAM_GPU_ID is broken for 635 anyway (won't it return 0
in this case)?
So the new value should be correct.

But more importantly, why are we exporting speedbin in
MSM_PARAM_CHIP_ID only if there is no revn? And why are we exporting
the speedbin at all as a part of CHIP_ID?

>
> I think I'm leaning more towards reverting commit cc943f43ece7
> ("drm/msm/adreno: warn if chip revn is verified before being set") for
> -fixes.  I'm still thinking about options for a longer term fix.
>
> BR,
> -R
>
>
> > ---
> > base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> > change-id: 20230628-topic-a635-1b3c2c987417
> >
> > Best regards,
> > --
> > Konrad Dybcio <konrad.dybcio@linaro.org>
> >



--=20
With best wishes
Dmitry
