Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912878B3870
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 15:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6757C1123D1;
	Fri, 26 Apr 2024 13:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JmmWLpvN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2200A1123D2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 13:29:05 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-de54b28c41eso2407975276.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714138144; x=1714742944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0CMZ7aXE460m+kKz/vg4ifubFL7ylhjlQ8n5GX0OcQ=;
 b=JmmWLpvN1EELvO0Y3rh+jo1/2n6dNPtjiJzeTwH2Q6vU/PtSFR1TbV8KAI8dMgjDSr
 0DEGBsenYjka/uZCFlVRXlvuUTxih1vRbIhKEgwptAu61HJKwhcmu0Zp8S4IDIZTbnF7
 lKYBLoQ3KovrHYfjIwdLUxbeF0qbLSd5r+5w7bb5uis/PwuO+skeKaZ3UuVi8qraezAE
 gto7AzOO1p+9xF62uY5S94tLjpFavv/1cxvo++WoHwKuyYN9j9fR801WRLGxMT0veQhr
 gTRszXGaC0urTEqTAIdyVgaoSmRueYyw77C+JxPNmV5+2GGjORhuX8DtLb8qzx3AeUN2
 oQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714138144; x=1714742944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N0CMZ7aXE460m+kKz/vg4ifubFL7ylhjlQ8n5GX0OcQ=;
 b=wo2swwPx9+K1Bt7/6ypzp2i+HkU3n8GBthIQGO6XtZH9gvQmEC9zymmp3dF2f946SB
 N/41pTKboRPfl1MGd3xtXaElT+RaUci7frCK+B2Avcr27Y38GpU5tlSL9gYDkFm735bL
 MOyHeGmykkudT8v+raQMimeF019YEE44dYgy+KyrdGQ/j+Mw+jSvPUgJ7RY288pLzCVi
 /CYGqlBdBdMzhGieRd8Q/izE91g3LnXQq4HM+V0PovbH9FtjXKgShQ6tPkMUazteIDJJ
 qvOrLPBLzd2B9NXAwWv1Os/Psk8r9o3g+IexsR8XeGb2Ibd4C2PyjU7AbNkFh9BS2PMr
 rK0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV71y4zUoVbyq1mCHYuqi/86O76tDt+/K4zXdQaYB9du1Zx5LLt/U/uOY5ng1UkPTczbqNBwoZ5kq7wtJpqnHZVDXjTIlYOoPcwutCqJQcP
X-Gm-Message-State: AOJu0YxavVs2m0TFvx6MvOK94Ut9GFGER3udSnJ7z2vk51mOZnb+7ror
 tRmpBWc/lVyiiF+Xgxf+iRlZ0igpD0F9H4+hRMySsJebq9WdrzklTNJO1+1O55sCbXFpZBwFK2C
 sszQoCYWsD/HGRh9cZdFLZiAZgL73TbBipUjG6g==
X-Google-Smtp-Source: AGHT+IGW/Gvy4yOANGsynKrpwA7LLg/Jq9vYRjYyTxAX6TkntO1ankWq4yVEswu+Tsv7O0Fks+gbkMDSCT0Ha3QBREU=
X-Received: by 2002:a25:8591:0:b0:de5:416a:f9ab with SMTP id
 x17-20020a258591000000b00de5416af9abmr2481798ybk.25.1714138143967; Fri, 26
 Apr 2024 06:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CAF6AEGu-sXnz1A_abzTByQHJMEZOJtLAn7iH=VaVwqJ21DZqWg@mail.gmail.com>
In-Reply-To: <CAF6AEGu-sXnz1A_abzTByQHJMEZOJtLAn7iH=VaVwqJ21DZqWg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 16:28:52 +0300
Message-ID: <CAA8EJposs8yC45oFR9gHrue8yq=d8HTqYb=8G96Nhj_12EjQLQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Fri, 26 Apr 2024 at 15:46, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Apr 25, 2024 at 4:02=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote=
:
> > >
> > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method =
to
> > > initialize cx_mem. Copy this from downstream (minus BCL which we
> > > currently don't support). On a750, this includes a new "fuse" registe=
r
> > > which can be used by qcom_scm to fuse off certain features like
> > > raytracing in software. The fuse is default off, and is initialized b=
y
> > > calling the method. Afterwards we have to read it to find out which
> > > features were enabled.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > >

[...]

> > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > +
> > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       /* On a750 raytracing may be disabled by the firmware, find o=
ut whether
> > > +        * that's the case. The scm call above sets the fuse register=
.
> > > +        */
> > > +       if (adreno_is_a750(adreno_gpu)) {
> > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC=
_SW_FUSE_VALUE);
> >
> > This register isn't accessible with the current sm8650.dtsi. Since DT
> > and driver are going through different trees, please add safety guards
> > here, so that the driver doesn't crash if used with older dtsi
> > (not to mention that dts is considered to be an ABI and newer kernels
> > are supposed not to break with older DT files).
>
> I'd be happy if older kernels consistently worked with newer dtb, the
> other direction is too much to ask.

Well, we guarantee that newer kernels work with older dts.

>  If necessary we can ask for ack
> to land the dts fix thru msm-next somehow, but since the gpu is newly
> enabled device landing in the same merge window I think that is not
> necessary.

This might work too.

--=20
With best wishes
Dmitry
