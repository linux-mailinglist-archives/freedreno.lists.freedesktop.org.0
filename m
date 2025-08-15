Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B091FB281AB
	for <lists+freedreno@lfdr.de>; Fri, 15 Aug 2025 16:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C827410E0B8;
	Fri, 15 Aug 2025 14:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X6xKV0yk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC7F10E0B8
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:29:39 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-88432e29adcso53099239f.2
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755268178; x=1755872978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KeD2SkkkoXeNVte5WjDY6hxjENR3w/Ox4rOBNfYD0b8=;
 b=X6xKV0yk2f8wJs1zOBjK+g5ZtBbWmrmdI3OM6JOrFyiXma8jvdxieoU31b7Ab86CXS
 UbFMMP9IChS0qn6Pp1kvOK9bQEU+FsQmb4Aokiuw+F4+sAwR4O7yySt11lM3z0zxdt2j
 1SrqIHTLKxaagUdbmU4chdJWbwtYzE1BJH6s1PTXeHDw+ZW+Fjn027JTaYRKJ5x8Vi54
 GjHGJHMOiZyP/5elDKcc0NJmBEAi/TzBmwIgpIbKCoxuLGyPeRlzdFdC+xaDk2BU4PnJ
 SZ3SuDrw88VudjEOYtiUZbg5M12Vcn5BM2ke7Nr8pdq84qtwIRM5FgtTrZV86ChHOfJE
 nPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268178; x=1755872978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KeD2SkkkoXeNVte5WjDY6hxjENR3w/Ox4rOBNfYD0b8=;
 b=JD3UWnwe+6blva24WRhtWZc8v7AotFhEUcEbEQZUtAhbVx0zuMvxsrq1t46+Xrt/zU
 eFskqNRjPU9YDvaSjVEAVFrs8ONA5UfXNmQu3YYxJyPrTLOrlXyND6W0ON4ZL/UKS6w3
 H4wPRGHj3X/WgD3wq7kIgsUy4qqOq59NACJv9J2iQT3TtJsT0jURqo/3Mx4G0eaOaH3d
 1vloL5f8OGH7WMWVnoUhWtXLEFYlEZJxd8UCTQ+KxK0F04s0KAuu+tITtid1FPFbN4Ae
 vbL7qCgjnxOC6j8b/rr4ZOEbaMdt2ziyiMh6/YUyNJUlJbQTlsPTPypQ3lCqL0cWMK+L
 X++w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzUIe9sEW3tmkL/hk21fIKfUDNAIHqSQjS4lB859/40zvEjq4F7u35b2IYC7AjG3cA9RhgDaN4TsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLaS8EIL/e9Nt6LvRWFI9U2/qR9osLfrpNOpuUiGL7v07EFmLF
 MH/5ViDsOQrmcyteAiUjDK16Bg7yfNuSnU6qqg6O/a7APq0TcT8YAqCdJrRQxGQjwdhFYepK/Km
 roKRwWr94PLDsLzp8D81IXVHF+Ylvldg=
X-Gm-Gg: ASbGncvWdlLMKJRRHQ3WItr3fdy27f3CiaitUeNLzvLIjqqiE8cML3Z4D8njx9qg8x2
 5491HaG/i8aGuc+LlWLl9w9ZaqkIY7fG37yvStN4vTSLV7Ki2kn+gOPdS8bmPwF2owBopkVAXqv
 5oCM0+G2tV+vwxEMNnAZdnD2gZQQ8j2Xg9ok3nB2x/2MegmHHtH+/rQFCxHmm7nCvsdAsFJaMDs
 wcRNBimL6y9OdMG
X-Google-Smtp-Source: AGHT+IHjECsRde1QbNRWUW1tsj440T0wiPaVNTtmplvry4+6fDO/VuH2pT+7xer1Py/craVVgUUydQhwxZwKzeUCs4k=
X-Received: by 2002:a05:6e02:1808:b0:3e4:2ea:bbf5 with SMTP id
 e9e14a558f8ab-3e57e9c1bddmr44937735ab.21.1755268178037; Fri, 15 Aug 2025
 07:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <aJTL87hBAEtJb3VT@stanley.mountain>
 <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
 <aJwnNqfxZHfiVHZB@stanley.mountain>
 <cdd4757f-9433-4c80-b5b2-003d42038a87@oss.qualcomm.com>
 <aJ2K26ZBVZilC8jg@stanley.mountain>
 <CAF6AEGuO-8Y-dqsXZa5Oi4fTdzzWsOss5KEhyUkqiGCyuhVrdw@mail.gmail.com>
 <aJ7OJq4nwkAXp6SR@stanley.mountain>
In-Reply-To: <aJ7OJq4nwkAXp6SR@stanley.mountain>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Aug 2025 07:29:24 -0700
X-Gm-Features: Ac12FXzBXhUffONW0-62CHbWXDYBybA-CEPBggkpOkt8Eyp7FeE-aQ8x5xH3HDY
Message-ID: <CAF6AEGuySMUDOf3gWU3FdQXxwJkmfURK1mBOGyjrYtJdZ_U_Rw@mail.gmail.com>
Subject: Re: [bug report] drm/msm/adreno: Add support for ACD
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, freedreno@lists.freedesktop.org
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

On Thu, Aug 14, 2025 at 11:05=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Thu, Aug 14, 2025 at 06:57:35AM -0700, Rob Clark wrote:
> > On Thu, Aug 14, 2025 at 12:06=E2=80=AFAM Dan Carpenter <dan.carpenter@l=
inaro.org> wrote:
> > >
> > > On Thu, Aug 14, 2025 at 12:28:31AM +0530, Akhil P Oommen wrote:
> > > > On 8/13/2025 11:18 AM, Dan Carpenter wrote:
> > > > > On Fri, Aug 08, 2025 at 10:28:38PM +0530, Akhil P Oommen wrote:
> > > > >> On 8/7/2025 9:23 PM, Dan Carpenter wrote:
> > > > >>> Hello Akhil P Oommen,
> > > > >>>
> > > > >>> Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") fro=
m Apr
> > > > >>> 19, 2025 (linux-next), leads to the following Smatch static che=
cker
> > > > >>> warning:
> > > > >>>
> > > > >>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe=
()
> > > > >>>   error: 'opp' dereferencing possible ERR_PTR()
> > > > >>>
> > > > >>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > >>>     1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
> > > > >>>     1669 {
> > > > >>>     1670         struct a6xx_gpu *a6xx_gpu =3D container_of(gmu=
, struct a6xx_gpu, gmu);
> > > > >>>     1671         struct a6xx_hfi_acd_table *cmd =3D &gmu->acd_t=
able;
> > > > >>>     1672         struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->b=
ase;
> > > > >>>     1673         struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > >>>     1674         int ret, i, cmd_idx =3D 0;
> > > > >>>     1675         extern bool disable_acd;
> > > > >>>     1676
> > > > >>>     1677         /* Skip ACD probe if requested via module para=
m */
> > > > >>>     1678         if (disable_acd) {
> > > > >>>     1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU =
ACD probe\n");
> > > > >>>     1680                 return 0;
> > > > >>>     1681         }
> > > > >>>     1682
> > > > >>>     1683         cmd->version =3D 1;
> > > > >>>     1684         cmd->stride =3D 1;
> > > > >>>     1685         cmd->enable_by_level =3D 0;
> > > > >>>     1686
> > > > >>>     1687         /* Skip freq =3D 0 and parse acd-level for res=
t of the OPPs */
> > > > >>>     1688         for (i =3D 1; i < gmu->nr_gpu_freqs; i++) {
> > > > >>>     1689                 struct dev_pm_opp *opp;
> > > > >>>     1690                 struct device_node *np;
> > > > >>>     1691                 unsigned long freq;
> > > > >>>     1692                 u32 val;
> > > > >>>     1693
> > > > >>>     1694                 freq =3D gmu->gpu_freqs[i];
> > > > >>>     1695                 opp =3D dev_pm_opp_find_freq_exact(&gp=
u->pdev->dev, freq, true);
> > > > >>>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > >>> No error checking.
> > > > >>
> > > > >> We are passing back a freq which we pulled out from the opp_tabl=
e a few
> > > > >> lines before this. So it is unlikely that this call would fail.
> > > > >>
> > > > >> But it is okay to add a check here if that would make Smatch che=
cker happy.
> > > > >>
> > > > >
> > > > > No, no, just ignore it, if it can't fail.
> > > > >
> > > > > Or I can add dev_pm_opp_find_freq_exact() to the "no need to chec=
k" list.
> > > > > That's easy to do.
> > > >
> > > > Would that make Smatch ignore usage of "dev_pm_opp_find_freq_exact(=
)" in
> > > > other code/drivers? If yes, we may not want that.
> > >
> > > It just wouldn't print this warning if people left off the error hand=
ling.
> > >
> > > I'm going to ignore it anyway, right?  I recently had a case where I =
got
> > > mixed up which functions needed error handling and I ignored the wron=
g one.
> > > We still caught it in testing, but I'm also going through and marking=
 which ones
> > > to ignore or not.
> >
> > drive-by comment:  Would it be useful to have a comment that smatch
> > could look for in cases like this.. similar to how rust has a practice
> > of adding a comment describing unsafe blocks?  It could be a useful
> > way to document "safe because: this isn't expected to fail" cases,
> > both for humans and tools.
> >
>
> I don't want to litter the code with comments silencing Smatch warnings.
>
> Adding a comment for humans would be enough.  I hand review all these
> warnings so I'd see the comment.  Otherwise, generally, I try to only
> send warnings once.  We fix all the real bugs so all old warnings are
> false positives.

ok, well I think we should at least add a comment here for humans

BR,
-R

> regards,
> dan carpenter
