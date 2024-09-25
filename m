Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532E2986871
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 23:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0383A10E303;
	Wed, 25 Sep 2024 21:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OcY1ASB8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E1410E135
 for <freedreno@lists.freedesktop.org>; Wed, 25 Sep 2024 21:45:03 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6ddceaaa9f4so3344767b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Sep 2024 14:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727300702; x=1727905502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubPBBQVOHIfvcTIrZ3BiWyzlJHwV7im5oru7kaK9elc=;
 b=OcY1ASB8kfya3xdNzqXP5G9NktdvBoi5QJRUrUVSlfXCZ4uBgEQpClDci2SDtNtTJ1
 JC2cqNLF1oT4YH71vWBys2+3DtX5oKsfphJ2uw9r8VgFUw2rxfsjErxIisr+ETMdEZ6o
 KwupponevYdVNR/EL3YoVEJ+SVjCD2W6uYMT5lzUzL726rwEn3QoAEVQWcROVi9jaFyM
 96eV62sBVfLkdgHrjQbhqZl0jOlp5k8MnnuN7nUkF7XLENKXoidy/ACLU505nQX0RMVi
 cfjab2ze6DlaALTK1GzuZEg5o6TZtdo0ASF+ReD6IfdQSrHmk+CIjEqp4/UTsRKCARWu
 ZsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727300702; x=1727905502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubPBBQVOHIfvcTIrZ3BiWyzlJHwV7im5oru7kaK9elc=;
 b=j1USNkX1j6tNiIz/OiRt/0J9yuSwHjkzd8g5VpasANlyFRYvyyrB+8DBTL/uB7scAk
 eQys8X3ZCBMeMlS3YX6OU9y3sGJ9ckiXxHz2EC8o4gykE/S53QsHBmY2817cCPtM8DuA
 DR3c0r+b7vIlyQCZDLd7gpqx1+yEWCGeRmL4ZfxF3MAv9WID0+hvcdV13zfcJw2sGRv2
 UxskJuCChSEADQfnBPN8NaCu7qa0ojLcHx/7uO8sl6qmPa4HjXN3X6yUilUe3DyPnN0N
 iDcTSPHIeQyShfmydWfIOWzhbpEHAxJEif0jtC6KGt0q/x7dbYhlMrVcEU+sJrZigFIM
 1gQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4CloyOCnXDgEQDHyBM5oYeAzQXbdrNSUjb5D37YhCxSse0khNlVJBqbGNZ17Dz/Z+9L8DowD/4mA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFehYqdXvpe2y9UCWQiexCMqxeSJ8kdeWgDgBXu7AP6a+1YOlG
 VKVhRF3zxqoIkAWcxvDMm3F4ycvSn+CuQpraBfDhea4rIoZlFpFDEwoxkWo49jom0gyCYTQHzNt
 zd/KWhAdQ+ufXd1eC2CZO7Pc8mRqj7hjJ1TSDGw==
X-Google-Smtp-Source: AGHT+IE/SrMUOY+KWSLW5zk97MvQ22eIeIEKxGTbZauRUyitZ1JC/rqr8e4DxLrrb/cew8JOD5gC1mS8SchEsDjXfIM=
X-Received: by 2002:a05:690c:89:b0:64b:5cc7:bcbc with SMTP id
 00721157ae682-6e21da002camr36163757b3.32.1727300701758; Wed, 25 Sep 2024
 14:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
 <e69b07677ff786e35a5904cf1a455851@mainlining.org>
In-Reply-To: <e69b07677ff786e35a5904cf1a455851@mainlining.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Sep 2024 23:44:50 +0200
Message-ID: <CAA8EJpoDYs2v=1=c9+APq-H+mm-xifCy5WHBgziQYROu-kKE5A@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
To: barnabas.czeman@mainlining.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
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

On Wed, 25 Sept 2024 at 23:28, <barnabas.czeman@mainlining.org> wrote:
>
> On 2024-08-01 21:25, Dmitry Baryshkov wrote:
> > On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
> >> This patch series add dpu support for MSM8996/MSM8953 devices.
> >>
> >> Note, by default these platforms are still handled by the MDP5 driver
> >> unless the `msm.prefer_mdp5=3Dfalse' parameter is provided.
> >
> > Could you please provide a summary of features actually tested with the
> > DPU driver? Have you tested YUV output? Have you tested RGB planes?
> > Which LMs have you tested?
>
> How can i check specific feature?
> I have set echo 0x32 > /sys/module/drm/parameters/debug
> DRIVER+ATOMIC+VERBOSE ATOMIC log is pretty verbose and big this way.
> For lm i have found this kind of message in log: [ 1027.577132]
> [drm:_dpu_crtc_blend_setup [msm]] lm 0, op_mode 0x2, ctl 0

I think the easiest way to test other LMs is by temporarily commenting
out LM_0 / LM_1 in the lms array.

> >
> >> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlin=
ing.org>
> >> ---
> >> Dmitry Baryshkov (1):
> >>       drm/msm/dpu: add support for MSM8953
> >>
> >> Konrad Dybcio (1):
> >>       drm/msm/dpu: Add MSM8996 support
> >>
> >>  .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218
> >> +++++++++++++
> >>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348
> >> +++++++++++++++++++++
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
> >>  drivers/gpu/drm/msm/msm_drv.c                      |   2 +
> >>  6 files changed, 678 insertions(+)
> >> ---
> >> base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
> >> change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
> >>
> >> Best regards,
> >> --
> >> Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>
> >>



--=20
With best wishes
Dmitry
