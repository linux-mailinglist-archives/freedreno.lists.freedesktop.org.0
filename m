Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEBB2683B
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 15:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F49910E1C0;
	Thu, 14 Aug 2025 13:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MlHULCrn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E125F10E1C0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 13:57:48 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-88432ccadeaso73740739f.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755179868; x=1755784668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lx6GiGCWcv29uwWUzTtNLQ4E7xpMKt+G9arurIsmu+M=;
 b=MlHULCrn4WOKAsZnXJP0IIB+6i4pt3TJpQgu5NzK6mJaGY7UulZCJDRN9L/WtF+RW5
 xqKNcsvmUaPYTpOZBaEIT0wuR00ZjQogb7fJp66U0kb3dj6VhKAf94c4KTKZLIi9QIq6
 GqP9tHIXg1QiV+0AJvpMfgM5A7T1jzJ84hL4tBjDpv+ZAJodme2pIJJcGePg1pRllORw
 V3FNWLXWJJqtr66t860kAMSBcfJBkJqFW6apve4lG5ftbMo4sHWBFRCQeWSvsTBbpg0i
 vfxPawZLRcVaeRRDs2ygj8fVnISf0t0+rMCuK4bXV5AJiAaltPn1SJZMlDa4GxtsjkI1
 c74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755179868; x=1755784668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lx6GiGCWcv29uwWUzTtNLQ4E7xpMKt+G9arurIsmu+M=;
 b=GvnjMYyEqMwKZc5rz1zVpFipXQWn0fqe4n7dgJIwHjhAb1Ji6j8LeMSRzcAvgxtfjN
 TzdkRBxFldxm9uaApv1fagzMMU7SDsBWGqc1x67lyWXrgh4BOJCR6F5tPQq5IVFPeO+/
 lRfj5hLGvKAmA04eY0LRmKKoCz7Yzh7NqLjZxEoKiLf8oj4skFZ7d5weBdj5ec3ORAQU
 hjM2BgNQAaJxgSaatTlvVvIBlUYZ4T9Nzp82bC3G4HB0xejq9xyvs4pCHBPviOBEsBI2
 LFNDFb7I5aBaeu4SIOZk98phbshS7sRZ7aa14BXKRnRfFBtKeR8HA2oH3BmtQ4JWocl9
 6TCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrgSN85x4f0FsElsK62G5mG4+JRUtC0AHPFrF4hxhr5GAEsv9NuARFDKaVeVMkws8Q6jOtZhuFqEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJUfnoo4E/ejiTHMmx+pwQHuUxLb+BQ9EzuvpKe4699AJsqHPn
 YBiQuBCB4PIYYSK0WR0+NsjjB0k5Nar+RpNInaWJ8sdBKtHavG+hCQIlUjYVxGPhYTMUesyibkP
 L1YqWoD6gwsZts0Tj/Moh/qs5Oy7SijU=
X-Gm-Gg: ASbGncurvscK0T9p9vu3Y/fXJC3bliO5aahfF4RVvJe41G/15gQOjrIZG+WrfjUcoOV
 MpWQbzc+/zRNRQbroy1qJ15iidP7CUcfsr4fxvInDnmWlniC2LGs7tD+N0Z7hYughncWcvOTXsn
 bKCpWMincXQhbBsCDlKPZpSobrhz0mvpXZLKOJrtUYLLfCFF04GLGu/XsncsPbh7udi7SYWc95P
 QlRIQ==
X-Google-Smtp-Source: AGHT+IGs16U205aOtZ4HBD0b6pJYPBy2opepBtywhB0G+Lk9q5kbkx9S+mMTExEzA966qWKdVXQEjluAfFVjwam4dlQ=
X-Received: by 2002:a05:6602:15cf:b0:881:8d1f:1a7c with SMTP id
 ca18e2360f4ac-884339cc3famr582895939f.12.1755179867920; Thu, 14 Aug 2025
 06:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <aJTL87hBAEtJb3VT@stanley.mountain>
 <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
 <aJwnNqfxZHfiVHZB@stanley.mountain>
 <cdd4757f-9433-4c80-b5b2-003d42038a87@oss.qualcomm.com>
 <aJ2K26ZBVZilC8jg@stanley.mountain>
In-Reply-To: <aJ2K26ZBVZilC8jg@stanley.mountain>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 14 Aug 2025 06:57:35 -0700
X-Gm-Features: Ac12FXxHK41NLgF0xoi0AjL5btc7nK8oxwwJ1zZEcnlEHXprFfu1HPsbAd42SH0
Message-ID: <CAF6AEGuO-8Y-dqsXZa5Oi4fTdzzWsOss5KEhyUkqiGCyuhVrdw@mail.gmail.com>
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

On Thu, Aug 14, 2025 at 12:06=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Thu, Aug 14, 2025 at 12:28:31AM +0530, Akhil P Oommen wrote:
> > On 8/13/2025 11:18 AM, Dan Carpenter wrote:
> > > On Fri, Aug 08, 2025 at 10:28:38PM +0530, Akhil P Oommen wrote:
> > >> On 8/7/2025 9:23 PM, Dan Carpenter wrote:
> > >>> Hello Akhil P Oommen,
> > >>>
> > >>> Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") from Ap=
r
> > >>> 19, 2025 (linux-next), leads to the following Smatch static checker
> > >>> warning:
> > >>>
> > >>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe()
> > >>>   error: 'opp' dereferencing possible ERR_PTR()
> > >>>
> > >>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > >>>     1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
> > >>>     1669 {
> > >>>     1670         struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, st=
ruct a6xx_gpu, gmu);
> > >>>     1671         struct a6xx_hfi_acd_table *cmd =3D &gmu->acd_table=
;
> > >>>     1672         struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > >>>     1673         struct msm_gpu *gpu =3D &adreno_gpu->base;
> > >>>     1674         int ret, i, cmd_idx =3D 0;
> > >>>     1675         extern bool disable_acd;
> > >>>     1676
> > >>>     1677         /* Skip ACD probe if requested via module param */
> > >>>     1678         if (disable_acd) {
> > >>>     1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD =
probe\n");
> > >>>     1680                 return 0;
> > >>>     1681         }
> > >>>     1682
> > >>>     1683         cmd->version =3D 1;
> > >>>     1684         cmd->stride =3D 1;
> > >>>     1685         cmd->enable_by_level =3D 0;
> > >>>     1686
> > >>>     1687         /* Skip freq =3D 0 and parse acd-level for rest of=
 the OPPs */
> > >>>     1688         for (i =3D 1; i < gmu->nr_gpu_freqs; i++) {
> > >>>     1689                 struct dev_pm_opp *opp;
> > >>>     1690                 struct device_node *np;
> > >>>     1691                 unsigned long freq;
> > >>>     1692                 u32 val;
> > >>>     1693
> > >>>     1694                 freq =3D gmu->gpu_freqs[i];
> > >>>     1695                 opp =3D dev_pm_opp_find_freq_exact(&gpu->p=
dev->dev, freq, true);
> > >>>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >>> No error checking.
> > >>
> > >> We are passing back a freq which we pulled out from the opp_table a =
few
> > >> lines before this. So it is unlikely that this call would fail.
> > >>
> > >> But it is okay to add a check here if that would make Smatch checker=
 happy.
> > >>
> > >
> > > No, no, just ignore it, if it can't fail.
> > >
> > > Or I can add dev_pm_opp_find_freq_exact() to the "no need to check" l=
ist.
> > > That's easy to do.
> >
> > Would that make Smatch ignore usage of "dev_pm_opp_find_freq_exact()" i=
n
> > other code/drivers? If yes, we may not want that.
>
> It just wouldn't print this warning if people left off the error handling=
.
>
> I'm going to ignore it anyway, right?  I recently had a case where I got
> mixed up which functions needed error handling and I ignored the wrong on=
e.
> We still caught it in testing, but I'm also going through and marking whi=
ch ones
> to ignore or not.

drive-by comment:  Would it be useful to have a comment that smatch
could look for in cases like this.. similar to how rust has a practice
of adding a comment describing unsafe blocks?  It could be a useful
way to document "safe because: this isn't expected to fail" cases,
both for humans and tools.

BR,
-R

> regards,
> dan carpenter
>
