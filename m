Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACDC94F3C2
	for <lists+freedreno@lfdr.de>; Mon, 12 Aug 2024 18:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3815810E259;
	Mon, 12 Aug 2024 16:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RiTUYO/J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155DC10E259
 for <freedreno@lists.freedesktop.org>; Mon, 12 Aug 2024 16:21:47 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a7ab63a388bso151989766b.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Aug 2024 09:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723479705; x=1724084505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vlneiZJQLXLqJDusxP+PQ5OxJj9g1fPFn2AHdkUar7w=;
 b=RiTUYO/JjiQyFP0Cb2nubXaRTR23AF4KMpP6VzgZF23oQkmPA8dRcBC9GA6pgziTyc
 AmAFU1P0sNEZ9lHxseZZvmFAtXVHVDUCR5O5wkFA9uRuaE3vFAhlRMwx3XvbXyMO+cX7
 c5HR+pEeFvuRpTedjTbsUSPYhCMJphLvUkDfnTfto/h7a/KUpACVR2/KAsWlfd7+1UJg
 UJeXUulTEM5Sia9RY9OhWNZbnaj0Dy6MH6w9gUhv+ywlbMRPgXsxYKLrf64q6SefDEYt
 76e5CKJ8S2tf0BZGT9dyU2Od6QWtUr2wiNTFLMRYBW06z0eiWG/zPUx+bKhWA/eI2B7r
 wGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723479705; x=1724084505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vlneiZJQLXLqJDusxP+PQ5OxJj9g1fPFn2AHdkUar7w=;
 b=UaAazXiCj2a2/wvRNn7qBaCL979U1a70Cx9FtKyJzlWHfoodF2QM/hiPdXReYarmJo
 0gZOe1hxJe1N0FtXoGSIEWMu/S8YAND2Mh5jHa6M/bHc4pOU77Y9H1aZatubyE3jHKtG
 b0eu4O/awaBjU7R7Ftkb3yW6aPeqEl3CwoZikgL814QEJV6fZVXYmiezDcAh9EANu8Pc
 8dAC4ZNHF03uwI7nIUapAapLsroBmk89spOi1paSwni7ya8T30ZPkge7PddxkROxCwm8
 rqdBT9EFbiubSy6HYWLWV2P70yowlPYnEwMulCgNYScfPXsFhKN+mJKuJhFlSUQdw4iQ
 H7Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEvtNQM9yTAwSLEq4dwCVTCox6NUUzl9UGjCnrQgvAU40r++5i5Kuot5JyInHg7elKWvb2h2eP9Te23c5Sc6OGr+FhB7opAlUfbUhT4nJ2
X-Gm-Message-State: AOJu0YzNnyxhxaYJHdJFNC5R5EvxvD2BvVuNIdTc2E22unyll6vC9POl
 j0BpxRgq8Ce2DypouE5Da3763c7U6igxFSBWYf60vpvtpKjSoyLxU0AY1JfuKkD8B9xCtYMSe+c
 Ur8148FrEgi/qcPpEoVjjmqjooy0=
X-Google-Smtp-Source: AGHT+IHISTHcYY16RxKbGRvV7EHWIgqlMCPcmLVjjnPto7VUvfwCYLwREm2AVVcuhCSV9LPb+Rnhh6ldMe2MQ/TwyE0=
X-Received: by 2002:a05:6402:35d5:b0:5a3:d140:1a57 with SMTP id
 4fb4d7f45d1cf-5bd44c0ced8mr813513a12.1.1723479704862; Mon, 12 Aug 2024
 09:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
 <20240807-a750-devcoredump-fixes-v2-1-d7483736d26d@gmail.com>
 <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Aug 2024 09:21:31 -0700
Message-ID: <CAF6AEGtOK5wD6X-oedZzN1quEAKyx1Xz5A-avuqma5rKpDTjUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm: Use a7xx family directly in gpu_state
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
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

On Sun, Aug 11, 2024 at 11:09=E2=80=AFPM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
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
>
> I think we should move to a "snapshot block list" like in the downstream
> driver if you want to simplify the whole logic. Otherwise, we should
> leave the chipid check as it is and just fix up a750 configurations.

Or maybe just move some of this to the device catalogue?

BR,
-R

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
