Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DE274DEA5
	for <lists+freedreno@lfdr.de>; Mon, 10 Jul 2023 21:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086D210E2D2;
	Mon, 10 Jul 2023 19:57:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7607B10E2D0;
 Mon, 10 Jul 2023 19:57:00 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5634d8d1db0so3559095eaf.0; 
 Mon, 10 Jul 2023 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689019019; x=1691611019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iikfxmrPyK8zYECgHI5xlrIBNbvbHcMxTIQLKu2GxTU=;
 b=fBTTDWmSgPG6fMHg0I64Y8r8B2c5fs/SHuPs0GMeS6eMhAS3I/glekfoFQOKsZBEJk
 0Yyw2voO7p7sr0fAvvK/1HYYy7/NAVyMXClUKMiLqJQkokR1R4oVXtik/31Fep2ly8zF
 NVnoY/P3r/PT8QCkjQfiQHR+E8BNOCNU6uAsq65V61W0dQfVRjMNv+hnF5Ht+KU4K5w6
 qEOn7LkJhWSeyriQdoN4MXFoMt5j8z4NISZy8ZwCe5lGvjOv3sz79jUrfYqh/PNVdcvz
 g51Fy3QaWaQinKGCk+vgG6LSVipfqIyAPgQ0FONKdo4JYzPrRHUxVo5vzOLUWS1roMgR
 mzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689019019; x=1691611019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iikfxmrPyK8zYECgHI5xlrIBNbvbHcMxTIQLKu2GxTU=;
 b=DTsod6rEHOR4xR040C9E6MKnA6PuGSPMDMy23yl5VPHzMibwhvP1vyHHElxT3dTo2i
 symE+e328GTl5kj6SHpIfiNPRJuBajV9qIifUxgNGU77Jdf+8IF5krlXKvfTFTgoW/OM
 9PAvrVQ9cULJpScByjbw3K039BuV7fSH1ef6XRnMH5A1wGhddDfoP5sYQNvnI+77kGmN
 JKgP2dPgzd2/EXxbeYcQhvg6FKxdHPDELjeBfr31jSbKNfUPZ4mvN3MDG+zk97RQtpDs
 2SPFzaSiYdalIm0AK1B6cdW8khWCj2AnA2BnNbo/vpfUEf5bmNPLh1yAFxgOSKKUpdyh
 9uXA==
X-Gm-Message-State: ABy/qLajtRvWpjuBvdn0OFcJN9zNlmYhRPjBepk2Cp7RMMSkSouisUlj
 SIYVg1o/zwVZiBJZ1GtMpQIol6mWPymnbtWqg7c=
X-Google-Smtp-Source: APBJJlFHWEUeJy/zzH64FDJVPzVde6cIE42n90d9VETmo+st2no9IWC5WKJLn4n6IYo/sJwbOVRaUnUrgcTyTqHBnxk=
X-Received: by 2002:a4a:4915:0:b0:566:66bb:940a with SMTP id
 z21-20020a4a4915000000b0056666bb940amr9649254ooa.9.1689019019573; Mon, 10 Jul
 2023 12:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-8-robdclark@gmail.com>
 <fa8f72dd-8d74-e941-1b4e-2464a9034424@linaro.org>
In-Reply-To: <fa8f72dd-8d74-e941-1b4e-2464a9034424@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 10 Jul 2023 12:56:48 -0700
Message-ID: <CAF6AEGv2K9Ar8=96H2_=BJc=hqFNnh2M5fvbG5p5gjoAEfR=-A@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 07/12] drm/msm/adreno: Move speedbin mapping
 to device table
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 7:54=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 07/07/2023 00:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This simplifies the code.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++------------------=
-
> >   drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  25 +++
> >   3 files changed, 92 insertions(+), 155 deletions(-)
>
>
> Interesting hack, I'd say.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Minor nit below.
>
> >
>
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index d5335b99c64c..994ac26ce731 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -72,8 +72,33 @@ struct adreno_info {
> >       u32 inactive_period;
> >       const struct adreno_reglist *hwcg;
> >       u64 address_space_size;
> > +     /**
> > +      * @speedbins: Optional table of fuse to speedbin mappings
> > +      *
> > +      * Consists of pairs of fuse, index mappings, terminated with
> > +      * UINT_MAX sentinal.
> > +      */
> > +     uint32_t *speedbins;
>
> Would it be better to explicitly list this as pairs of uint32_t? And
> then use braces in ADRENO_SPEEDBIN initialisation.

It would mean the sentinel would take 8 bytes instead of 4.. maybe
that is over-thinking it, but it was the reason I just stuck with a
flat table

BR,
-R

> >   };
> >
> > +/*
> > + * Helper to build a speedbin table, ie. the table:
> > + *      fuse | speedbin
> > + *      -----+---------
> > + *        0  |   0
> > + *       169 |   1
> > + *       174 |   2
> > + *
> > + * would be declared as:
> > + *
> > + *     .speedbins =3D ADRENO_SPEEDBINS(
> > + *                      0,   0,
> > + *                      169, 1,
> > + *                      174, 2
> > + *                  ),
> > + */
> > +#define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
> > +
> >   const struct adreno_info *adreno_info(struct adreno_rev rev);
> >
> >   struct adreno_gpu {
>
> --
> With best wishes
> Dmitry
>
