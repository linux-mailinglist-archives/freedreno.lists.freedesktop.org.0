Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBE8B6FAE
	for <lists+freedreno@lfdr.de>; Tue, 30 Apr 2024 12:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31C010E16F;
	Tue, 30 Apr 2024 10:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B3o8xeLi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE04F10E16F
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 10:31:29 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6ecf05fd12fso4898225b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 03:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714473089; x=1715077889; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVBoXY2/NPG7+wTGyF7C7GoYFHMyHmYdFMeZrUt8JbY=;
 b=B3o8xeLiXm7RI1j9ZAE1Wdr/i6WvEqiMPOqK9t3T1dF+WO/+SjQnhZqmWG+q+f/igk
 5W7ye2ge+xCjckh2I9jNMXMEVMSV7iq7IDfMbOQz2UMOuJiR+8nsu0ZryGxs6QNQ8nAn
 9M+bXUfes5TXSazqFLb0CCNSwkXlr0E7qpUoyMOrEjhyz7cSiwXDh+nDVH2rUOopL8WC
 Yy+yJzwI+TIFNP+QQcsj8ZnfiqRJ7JTSIJzZC7zRr7cQR+QKV+xuaGtaKMtxsR/nCPCw
 TECZimr2YdfRmHZ8qcVjunySHoOLv2WgwSRdiZfm7c3GinZC5xjJ17s8IkR7jNVeWyh7
 9Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714473089; x=1715077889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVBoXY2/NPG7+wTGyF7C7GoYFHMyHmYdFMeZrUt8JbY=;
 b=gPU4It6McqsLNNKv7FWrzhsJJ0zB8cjcuiBoGhVOlzDylDroLLmwrPZu0Px8djFBCt
 KXCHfNoBnoZSIFf1sPPWAKmEBmkoz8+Slgr16+Ad0zwPkOdckgVI8itnWa01hYZ/EhLC
 /oIXBePsZcR7yVjtxPtlRAE6D6kNDMvRqsOBqzqEk3NbQu4S4xw2CkPZ7x+lb8rVmWFg
 keoQkcVBN4sJsfqDy+l2t2umI+LKnbqSHws0+llICAzbbWMb5H9nUvq7I0Gt524txG+/
 LMKZOwl59gs4vowblVX8Fnbh88R9OP6mlfNeJg8xjKJRRixAe0SS6L+H/J3OrQMoBbbJ
 4SzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUr6F/kGEjgtUNMfznVpKSjHKuWa/1I0DIaAgVE1EiXSgpPpKDg186nwf8rYGV0Nq13DL4ftmQR9IFa+kU7kGjquV5e0jSFZ5Yqwfbeqw+
X-Gm-Message-State: AOJu0YyMwUQFCDzPNyiUAnEyxNdoK+TAcPpVR1hYcApGYFE06t5tHP8T
 HzCivh0pLg6OKHQj2Zfe9VKVATqcr5wakvVmi8AuHychU/RHjlmbLR78beTJ9OLc5nXGt6clpOH
 fm7CEtvIUtks3iTsIDo8OfENDBGI=
X-Google-Smtp-Source: AGHT+IEUfP4I+J+PclmF0fk4nYt8dfXjCvRwv9b6ONxIEQjTkj3ayJq9CUlR4q1dy9MAyS2VyDg2sXO9m02NAQhnmek=
X-Received: by 2002:a05:6a21:1a9:b0:1af:41d1:7334 with SMTP id
 le41-20020a056a2101a900b001af41d17334mr2835730pzb.27.1714473089048; Tue, 30
 Apr 2024 03:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com>
 <12db74c2-87ec-45e3-9ca0-c5f2328c5f8b@linaro.org>
In-Reply-To: <12db74c2-87ec-45e3-9ca0-c5f2328c5f8b@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:31:17 +0100
Message-ID: <CACu1E7H0jpQkkfSCcOhdgZM0kntc-wTiRK_rM83STfAxtZ6fkw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Sat, Apr 27, 2024 at 1:19=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 26.04.2024 8:34 PM, Connor Abbott wrote:
> > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> > initialize cx_mem. Copy this from downstream (minus BCL which we
> > currently don't support). On a750, this includes a new "fuse" register
> > which can be used by qcom_scm to fuse off certain features like
> > raytracing in software. The fuse is default off, and is initialized by
> > calling the method. Afterwards we have to read it to find out which
> > features were enabled.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
>
> [...]
>
> > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > +{
> > +     u32 status;
> > +
> > +     status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> > +     gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > +
> > +     dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=3D=
%8.8x\n", status);
> > +
> > +     /* Ignore FASTBLEND violations, because the HW will silently fall=
 back
> > +      * to legacy blending.
>
> /*
>  * foo
>
>
>
> > +      */
> > +     if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                   A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > +             del_timer(&gpu->hangcheck_timer);
> > +
> > +             kthread_queue_work(gpu->worker, &gpu->recover_work);
> > +     }
> > +}
> > +
> >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >  {
> >       struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >       if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> >               dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bound=
s access\n");
> >
> > +     if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
>
> Does this field actualy exist on a6 too?

No, it doesn't. It's correctly marked as an a7xx-only field in the
XML, and we only enable the mask on a7xx so we will never call
a7xx_sw_fuse_violation_irq() on a6xx, but the XML parser still puts
the A6XX_ prefix here.

>
> > +             a7xx_sw_fuse_violation_irq(gpu);
> > +
> >       if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> >               msm_gpu_retire(gpu);
> >
> > @@ -2525,6 +2550,59 @@ static void a6xx_llc_slices_init(struct platform=
_device *pdev,
> >               a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> >  }
> >
> > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > +     struct msm_gpu *gpu =3D &adreno_gpu->base;
> > +     u32 fuse_val;
> > +     int ret =3D 0;
> > +
> > +     if (adreno_is_a750(adreno_gpu)) {
> > +             /* Assume that if qcom scm isn't available, that whatever
> > +              * replacement allows writing the fuse register ourselves=
.
> > +              * Users of alternative firmware need to make sure this
> > +              * register is writeable or indicate that it's not someho=
w.
> > +              * Print a warning because if you mess this up you're abo=
ut to
> > +              * crash horribly.
> > +              */
> > +             if (!qcom_scm_is_available()) {
> > +                     dev_warn_once(gpu->dev->dev,
> > +                             "SCM is not available, poking fuse regist=
er\n");
> > +                     a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE=
_VALUE,
> > +                             A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                             A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> > +                             A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > +                     adreno_gpu->has_ray_tracing =3D true;
>
> I'm not 100% sure. I'm afraid there may be SKUs with RT cores fused
> off (as in, cut off from the rest, not "indicated unavailable") or
> otherwise dysfunctional..
>
> My guess would be that TZ probably has some sort of a LUT/match table
> based on other SoC identifiers

I don't think so. The entire point of this register AFAIK is to make
it possible for the firmware to block access to features, not to
describe the HW. If they want to fuse something off in the HW, as they
have done before, then they will typically give the GPU a different
chip_id. If they do happen to use this register in that way, which I
think is unlikely, and someone ships this on a platform like
Chromebooks without qcom_scm and with the RTU fused off, then it's on
them to come up with an alternative way to describe it. There's
nothing more we can do here without further information.

>
> > +                     return 0;
> > +             }
> > +
> > +             ret =3D qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ=
 |
> > +                                          QCOM_SCM_GPU_TSENSE_EN_REQ);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* On a750 raytracing may be disabled by the firmware, fi=
nd out whether
> > +              * that's the case. The scm call above sets the fuse regi=
ster.
> > +              */
> > +             fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_SW_=
FUSE_VALUE);
> > +             adreno_gpu->has_ray_tracing =3D
> > +                     !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACI=
NG);
> > +     } else {
> > +             if (adreno_is_a740(adreno_gpu)) {
> > +                     /* Raytracing is always enabled on a740 */
> > +                     adreno_gpu->has_ray_tracing =3D true;
> > +             }
> > +
> > +             if (!qcom_scm_is_available())
> > +                     return 0;
> > +
> > +             ret =3D qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ=
);
> > +     }
> > +
> > +     return ret;
>
>         if (qcom_scm_is_available())
>                 return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ)=
;

Ok.

> }
>
> return 0;
>
> ?
>
> Konrad
