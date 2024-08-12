Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF2194F69E
	for <lists+freedreno@lfdr.de>; Mon, 12 Aug 2024 20:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C5388647;
	Mon, 12 Aug 2024 18:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jtXWWW88";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF60510E275
 for <freedreno@lists.freedesktop.org>; Mon, 12 Aug 2024 18:25:26 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2cdadce1a57so3610951a91.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Aug 2024 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723487126; x=1724091926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6K6+MsUfHhq7fCbiw1ymIFvBEijlhEhujgaNDGKpLw0=;
 b=jtXWWW88nIE+EaBvSjP8hRvQK/Phl2SycDc7HamK+4EkPqAfmkdiNxOzB7GQ2T8p4w
 xkQApSzFY1BDgYge4Uz2ObdRwEE3jw0Kytbet4wXAtvg6PaYSPkHB0hWyQHA8X1+YmXe
 spgQy2qQgg6omOIQYPv3p61Us/Guk0YubgwPrU026pRtMlqSclbi6SaYnrSPYp8bWIE9
 WiiF77Gl+S8gtdV7+fJ0ZYJdbEgnlYWlu+JqZ9vM/1qa5A9fB3zkROk2VG0w4Z9HUmAk
 JA5GlXFWOdkxqdtFzk6coYuWonZmIbCca2jYjfSw5FJCBmnNGeJN6oIuzZkEvSL3I/oe
 sB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723487126; x=1724091926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6K6+MsUfHhq7fCbiw1ymIFvBEijlhEhujgaNDGKpLw0=;
 b=RCuO8WZqZoe/P2GCZT2wLAcSTPDp7W9SrMqsmosJiUPEWqBtb+35jwuW7YnsBdaF71
 Vo4av0dYui04i5AYEgou3mLD9Fluh4CbL9JP9Negtb4EkKQVcUva9p9qTbJ5yId7Q7K6
 QBpGdqIkoW/AmraukJxlj1lsN0N7ZCo+wbFBTMlGaFHdOHOwrj5hZIJgOjFS81Sw6hd6
 p787sERAeuaXHjSZ7/CcDy+60S1DawahyLzBMrOg34vXzRQlAmMqs29rO5TqZSnhxdLk
 ah9dSil9TYFZFvU5IWV/93GVaNfy7Xr51MsFDFgVHvX8Z4eY15JMdA+hEKD66cx9AqL5
 Ayiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNLCD45LkU9gn1UekbcsCs5kA++67uxPa7cT+OI+ZUvESZlCDz0q9wxW34X5iK1b5SEl4q+ZAN2nh6tcbXrMKPE1/ixp5uHcpoYyisELrF
X-Gm-Message-State: AOJu0YwINMZ+zOAyzcQelMQSjnPJQEbQcAg1jUjEXt8oJhZcTRUk5PDb
 cn6SW/lSOGzpVdggvTFvoLDaIZGW9KLd8HLU/7JmgmWDQqUqCtQMBcudAV49arFYhVyzCouWMoz
 zG8CbjGk/BlfSM+R05cAKXqFhiV0=
X-Google-Smtp-Source: AGHT+IEeSalSbcpGWm9tThoBPxi6Si8c+QzvdCOKudz58aXADFw07SWrfMU882mZcoEYhOkzX5SOEGuQCtpno0uuJjQ=
X-Received: by 2002:a17:90b:350d:b0:2c9:90f5:cfca with SMTP id
 98e67ed59e1d1-2d39269af13mr1140704a91.42.1723487126188; Mon, 12 Aug 2024
 11:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
 <20240807-a750-devcoredump-fixes-v2-1-d7483736d26d@gmail.com>
 <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 12 Aug 2024 19:25:14 +0100
Message-ID: <CACu1E7EoVw0JGqjk9j7m8uT2R+MPzAuwGn7jB9hAJ7uvPu7ZfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm: Use a7xx family directly in gpu_state
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
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

On Mon, Aug 12, 2024 at 7:09=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Wed, Aug 07, 2024 at 01:34:27PM +0100, Connor Abbott wrote:
> > With a7xx, we need to import a new header for each new generation and
> > switch to a different list of registers, instead of making
> > backwards-compatible changes. Using the helpers inadvertently made a750
> > use the a740 list of registers, instead use the family directly to fix
> > this.
>
> This won't scale. What about other gpus in the same generation but has a
> different register list? You don't see that issue currently because
> there are no support for lower tier a7x GPUs yet.

GPUs in the same generation always have the same register list. e.g.
gen7_4_0 has the same register list as gen7_0_0. kgsl has already
moved onto gen8 which redoes everything again and will require a
separate codepath, they only have one more gen7 register list compared
to us, and I doubt they'll add many more. So the kgsl approach would
be pointless over-engineering.

Connor

>
> I think we should move to a "snapshot block list" like in the downstream
> driver if you want to simplify the whole logic. Otherwise, we should
> leave the chipid check as it is and just fix up a750 configurations.
>
> -Akhil
>
> >
> > Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 ++++++++++++++-------=
--------
> >  1 file changed, 20 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu_state.c
> > index 77146d30bcaa..c641ee7dec78 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -390,18 +390,18 @@ static void a7xx_get_debugbus_blocks(struct msm_g=
pu *gpu,
> >       const u32 *debugbus_blocks, *gbif_debugbus_blocks;
> >       int i;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               debugbus_blocks =3D gen7_0_0_debugbus_blocks;
> >               debugbus_blocks_count =3D ARRAY_SIZE(gen7_0_0_debugbus_bl=
ocks);
> >               gbif_debugbus_blocks =3D a7xx_gbif_debugbus_blocks;
> >               gbif_debugbus_blocks_count =3D ARRAY_SIZE(a7xx_gbif_debug=
bus_blocks);
> > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > +     } else if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN2) {
> >               debugbus_blocks =3D gen7_2_0_debugbus_blocks;
> >               debugbus_blocks_count =3D ARRAY_SIZE(gen7_2_0_debugbus_bl=
ocks);
> >               gbif_debugbus_blocks =3D a7xx_gbif_debugbus_blocks;
> >               gbif_debugbus_blocks_count =3D ARRAY_SIZE(a7xx_gbif_debug=
bus_blocks);
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               debugbus_blocks =3D gen7_9_0_debugbus_blocks;
> >               debugbus_blocks_count =3D ARRAY_SIZE(gen7_9_0_debugbus_bl=
ocks);
> >               gbif_debugbus_blocks =3D gen7_9_0_gbif_debugbus_blocks;
> > @@ -511,7 +511,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
> >               const struct a6xx_debugbus_block *cx_debugbus_blocks;
> >
> >               if (adreno_is_a7xx(adreno_gpu)) {
> > -                     BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_=
a740_family(adreno_gpu)));
> > +                     BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3=
);
> >                       cx_debugbus_blocks =3D a7xx_cx_debugbus_blocks;
> >                       nr_cx_debugbus_blocks =3D ARRAY_SIZE(a7xx_cx_debu=
gbus_blocks);
> >               } else {
> > @@ -662,11 +662,11 @@ static void a7xx_get_dbgahb_clusters(struct msm_g=
pu *gpu,
> >       const struct gen7_sptp_cluster_registers *dbgahb_clusters;
> >       unsigned dbgahb_clusters_size;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               dbgahb_clusters =3D gen7_0_0_sptp_clusters;
> >               dbgahb_clusters_size =3D ARRAY_SIZE(gen7_0_0_sptp_cluster=
s);
> >       } else {
> > -             BUG_ON(!adreno_is_a740_family(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
> >               dbgahb_clusters =3D gen7_2_0_sptp_clusters;
> >               dbgahb_clusters_size =3D ARRAY_SIZE(gen7_2_0_sptp_cluster=
s);
> >       }
> > @@ -820,14 +820,14 @@ static void a7xx_get_clusters(struct msm_gpu *gpu=
,
> >       const struct gen7_cluster_registers *clusters;
> >       unsigned clusters_size;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               clusters =3D gen7_0_0_clusters;
> >               clusters_size =3D ARRAY_SIZE(gen7_0_0_clusters);
> > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > +     } else if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN2) {
> >               clusters =3D gen7_2_0_clusters;
> >               clusters_size =3D ARRAY_SIZE(gen7_2_0_clusters);
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               clusters =3D gen7_9_0_clusters;
> >               clusters_size =3D ARRAY_SIZE(gen7_9_0_clusters);
> >       }
> > @@ -895,7 +895,7 @@ static void a7xx_get_shader_block(struct msm_gpu *g=
pu,
> >       if (WARN_ON(datasize > A6XX_CD_DATA_SIZE))
> >               return;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 3);
> >       }
> >
> > @@ -925,7 +925,7 @@ static void a7xx_get_shader_block(struct msm_gpu *g=
pu,
> >               datasize);
> >
> >  out:
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 0);
> >       }
> >  }
> > @@ -958,14 +958,14 @@ static void a7xx_get_shaders(struct msm_gpu *gpu,
> >       unsigned num_shader_blocks;
> >       int i;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               shader_blocks =3D gen7_0_0_shader_blocks;
> >               num_shader_blocks =3D ARRAY_SIZE(gen7_0_0_shader_blocks);
> > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > +     } else if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN2) {
> >               shader_blocks =3D gen7_2_0_shader_blocks;
> >               num_shader_blocks =3D ARRAY_SIZE(gen7_2_0_shader_blocks);
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               shader_blocks =3D gen7_9_0_shader_blocks;
> >               num_shader_blocks =3D ARRAY_SIZE(gen7_9_0_shader_blocks);
> >       }
> > @@ -1350,14 +1350,14 @@ static void a7xx_get_registers(struct msm_gpu *=
gpu,
> >       const u32 *pre_crashdumper_regs;
> >       const struct gen7_reg_list *reglist;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               reglist =3D gen7_0_0_reg_list;
> >               pre_crashdumper_regs =3D gen7_0_0_pre_crashdumper_gpu_reg=
isters;
> > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > +     } else if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN2) {
> >               reglist =3D gen7_2_0_reg_list;
> >               pre_crashdumper_regs =3D gen7_0_0_pre_crashdumper_gpu_reg=
isters;
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               reglist =3D gen7_9_0_reg_list;
> >               pre_crashdumper_regs =3D gen7_9_0_pre_crashdumper_gpu_reg=
isters;
> >       }
> > @@ -1407,8 +1407,7 @@ static void a7xx_get_post_crashdumper_registers(s=
truct msm_gpu *gpu,
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       const u32 *regs;
> >
> > -     BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adre=
no_gpu) ||
> > -              adreno_is_a750(adreno_gpu)));
> > +     BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
> >       regs =3D gen7_0_0_post_crashdumper_registers;
> >
> >       a7xx_get_ahb_gpu_registers(gpu,
> > @@ -1514,11 +1513,11 @@ static void a7xx_get_indexed_registers(struct m=
sm_gpu *gpu,
> >       const struct a6xx_indexed_registers *indexed_regs;
> >       int i, indexed_count, mempool_count;
> >
> > -     if (adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gp=
u)) {
> > +     if (adreno_gpu->info->family <=3D ADRENO_7XX_GEN2) {
> >               indexed_regs =3D a7xx_indexed_reglist;
> >               indexed_count =3D ARRAY_SIZE(a7xx_indexed_reglist);
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               indexed_regs =3D gen7_9_0_cp_indexed_reg_list;
> >               indexed_count =3D ARRAY_SIZE(gen7_9_0_cp_indexed_reg_list=
);
> >       }
> >
> > --
> > 2.31.1
> >
