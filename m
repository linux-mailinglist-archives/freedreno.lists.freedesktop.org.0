Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9151E87D653
	for <lists+freedreno@lfdr.de>; Fri, 15 Mar 2024 22:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F3E1125A9;
	Fri, 15 Mar 2024 21:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LV8PEtKg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB75B1125A8
 for <freedreno@lists.freedesktop.org>; Fri, 15 Mar 2024 21:41:10 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc25e12cc63so3411781276.0
 for <freedreno@lists.freedesktop.org>; Fri, 15 Mar 2024 14:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710538870; x=1711143670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lQIyog+V+hDOz6P/17DYQkVpq9nNe+yutAMO1vEHDgE=;
 b=LV8PEtKg3CaRQjoTBEfzWQxWRcrA2mY2Ci2rpUVLq29ZDTDfM37aIPDSZdck6hJdL5
 BQwn7zbUDKcfX2kLdk0hV/4HSl+IJsT8aRA5APYIR/WLeJhjyPUu8emOlXkLEwnyskHF
 GYBPtxZypLURwqQ76NvP+w4cs3lGWteRrOyEeA8oAe67icTll/b3GYysT0O9qJ0/8x39
 l7T4hx14QOsE2l8s6FRL9FUNM9UeCyg1hRU68EdGzXrd/NwBNnx8S9Pk55TSqRzqSM1g
 fsKPoRXOYLX7ZxvC7oEWLna8nsJdwPnSf/CPRyYl9GjPelI3eEATVAjT0ip/alFNP4Ih
 JwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710538870; x=1711143670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQIyog+V+hDOz6P/17DYQkVpq9nNe+yutAMO1vEHDgE=;
 b=INwuRowcnzgjagj6WkxqJud/NhXSxCrekG1I78giscvDwKrMncar2oSGk/aHf8lpWD
 ALfWNG5ISpfOT5E7dPPCejPQa+pEOfDXcrfpH2v+EeVqJBZs4IAKSg/QZ8in9sHcfJO4
 QWDy4CeeWi6PG+dH+gOLFUKiLuwG4XnXVBIok6kyQn4fNiHvyLflPKrNOGKRSp6SOdcc
 I60PFBGGrQglpXQu0pPvLIwDMFIk838GEridysBTZ/Sn4r/eJLTj/a2i/fV8eY0iUha4
 ig4s3VMlhHkYCnmab13nT1+j8hFkfDah4+M2sME2WCJkul4fy8teVUkht9mK1LebF9P/
 vn6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKmRziSjtRcploEBbiyn51cMONJ3R7/lcDseQmqxnfzbls/vMo9tg/1ECzWNRGAtZ/AwAn5uTNSNT9tL7tsyeUtrDu2eJlnCym/K0cMAD9
X-Gm-Message-State: AOJu0Yxh6XpcnAELSvEiAM1WUavo1t+eEQFcgn3U4/x/KJNYfle8tuV2
 0ojA3f89xXu6onLWDSnk80JEHahQwjatQpqYhD+bZUnyWVZr0u+XdqyeuMkd19rp+KMcQTt1c3U
 JjhJBMMaQRpW3eGsaA/5wQaFmthih3cVwMT7tuQ==
X-Google-Smtp-Source: AGHT+IGkFWhHBndUjNRvX85twH2BG12l/RgBN92Ky0LJE7Oaz6Ep8+Pl/wLqIh6+hAWEvDmLKEyjzMjOZ3OYh6EKHUQ=
X-Received: by 2002:a25:ad64:0:b0:dcc:5b7e:ddfe with SMTP id
 l36-20020a25ad64000000b00dcc5b7eddfemr4607628ybe.4.1710538869766; Fri, 15 Mar
 2024 14:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
 <CAF6AEGuc-xu_Ji5fOXCFFudos1Ah4tgFxjRs0neHVujtNdXB+A@mail.gmail.com>
In-Reply-To: <CAF6AEGuc-xu_Ji5fOXCFFudos1Ah4tgFxjRs0neHVujtNdXB+A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 23:40:58 +0200
Message-ID: <CAA8EJppek+zDUxE9q9NivE7T1KHigP80NOfy0oLYJd8z_DdoXA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 00/12] drm/msm: generate register header files
To: Rob Clark <robdclark@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Fri, 15 Mar 2024 at 22:02, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Mar 15, 2024 at 4:46=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Currently display-related register headers are generated from XML files
> > shipped withing Mesa source tree. This is not fully optimal: it require=
s
> > multi-stage process of the changes first being landed to Mesa and only
> > then synced to the kernel tree.
>
> I think we'd more or less need to continue following this process for
> the gpu .xml so that the kernel and mesa are not diverging.  I guess
> we could drop the display related .xml from mesa.  (But it would be
> nice to have a decoder tool for display devcoredumps, like we do for
> gpu..)

Yes.  But syncing XMLs is much easier compared to syncing the generated hea=
ders.

For display-relaed headers, that's a good question, whether we want to
drop them from mesa or not. I think it might be easier (and more
logical) to get such a tool into the kernel. Note, that it will also
require us to describe DPU registers in the XML format. And also maybe
to sort out the DSI registers finally.

>
> BR,
> -R
>
> > Move original XML files to the kernel tree and generate header files
> > when required.
> >
> > NOTE: the gen_header.py script is based on the non-merged Mesa MR [1].
> > Once that MR lands, I will update the script and commit messages and
> > send the next iteration.
> >
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28193
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v3:
> > - Split XML and git rm patches in hope to pass ML limitations
> > - Link to v2: https://lore.kernel.org/r/20240315-fd-xml-shipped-v2-0-7c=
d68ecc4320@linaro.org
> >
> > Changes in v2:
> > - Removed the _shipped files, always generating the headers (Masahiro
> >   Yamada)
> > - Replaced headergen2 with gen_headers.py
> > - Simplify Makefile rules, making all Adreno objects depend on Adreno
> >   headers and all displau objects depend on all display headers
> > - Also handle Adreno registers
> > - Link to v1: https://lore.kernel.org/r/20240226-fd-xml-shipped-v1-0-86=
bb6c3346d2@linaro.org
> >
> > ---
> > Dmitry Baryshkov (12):
> >       drm/msm/mdp5: add writeback block bases
> >       drm/msm/hdmi: drop qfprom.xml.h
> >       drm/msm/dsi: drop mmss_cc.xml.h
> >       drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
> >       drm/msm: import XML display registers database
> >       drm/msm: import A2xx-A4xx XML display registers database
> >       drm/msm: import A5xx-A7xx XML display registers database
> >       drm/msm: import gen_header.py script from Mesa
> >       drm/msm: generate headers on the fly
> >       drm/msm: drop display-related headers
> >       drm/msm: drop A5xx, A6xx headers
> >       drm/msm: drop A2xx-A4xx headers
> >
> >  drivers/gpu/drm/msm/.gitignore                     |     6 +
> >  drivers/gpu/drm/msm/Makefile                       |    97 +-
> >  drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
> >  .../drm/msm/{msm_gpummu.c =3D> adreno/a2xx_gpummu.c} |    45 +-
> >  drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
> >  drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
> >  drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
> >  drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -----------=
--------
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
> >  drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
> >  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
> >  drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
> >  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
> >  drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
> >  drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
> >  drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
> >  drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
> >  drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
> >  drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
> >  drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
> >  drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
> >  drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
> >  drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
> >  drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
> >  drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
> >  drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4969 ++++++++
> >  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
> >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |   399 +
> >  .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2267 ++++
> >  drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
> >  .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
> >  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
> >  drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
> >  drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
> >  drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
> >  drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
> >  .../gpu/drm/msm/registers/display/mdp_common.xml   |    89 +
> >  drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
> >  drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
> >  .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
> >  drivers/gpu/drm/msm/registers/gen_header.py        |   958 ++
> >  drivers/gpu/drm/msm/registers/rules-ng.xsd         |   457 +
> >  56 files changed, 22480 insertions(+), 39792 deletions(-)
> > ---
> > base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> > change-id: 20240225-fd-xml-shipped-ba9a321cdedf
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >



--=20
With best wishes
Dmitry
