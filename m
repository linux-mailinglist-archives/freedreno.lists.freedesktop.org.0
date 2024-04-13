Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A38A3B3A
	for <lists+freedreno@lfdr.de>; Sat, 13 Apr 2024 08:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD63510E4D8;
	Sat, 13 Apr 2024 06:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VNQDTc+1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD5C10E4D8
 for <freedreno@lists.freedesktop.org>; Sat, 13 Apr 2024 06:02:55 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-617cd7bd929so17207267b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 12 Apr 2024 23:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712988174; x=1713592974; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3p6Jg0iNIK+PAJ8XdMgBNFqaUw3Dj5y6DUftWKBMSqc=;
 b=VNQDTc+1E7vfIO2KfU2XDZ50csdGXlbNG5V/+lfRduFOagqWYdqCgV62qdm6wOw2kf
 UdGGEpUmOoLry3CAtHVqrfgotxIfXypF6cHOJkKbQ2X5DWb7HHyRBVbubjeH1EzsuWcJ
 /mIxi3UxYdW0kSLRHJflaBs0+W6Z8YYC1w01dP2wHfg5KSMJF1tlbSCAT1VWpbU5TdLo
 En40aqpxn4QOxOQglr5UGmlbCEAdmcb1+jVIbdXhRJNSn7xwpcQM1lQsF6neEyTeCOaY
 1ZDOZQr/UNvpBn3zTkiCdMSSZklt76bijFzcUGOgz/CHmxkKcOBKK9GYc68qI7RnOkaD
 dnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712988174; x=1713592974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3p6Jg0iNIK+PAJ8XdMgBNFqaUw3Dj5y6DUftWKBMSqc=;
 b=kA80nl5mx0Yhur8c0BxBw0FrajwVrWKuDqsLmlbXOcHMKRXxfGupwt+seiQjgOhzWV
 uV4rC7gxqll/BsQjQS4w+4mKlr0yldCLEFf3QlqNyMy9yR0HZK9UMYWgejSeAHSqxttG
 5WlrNYgTcMnlVjEFgRxPaNOkSNTKO3ekamXgABwcbuXupClCLuR6J+0JLiZWlnDoMj3I
 NpvOSu9CTGFBxwdJ6vNnXgDJySQGnHe/dJW3bnrS1Eban9KvC2G1H8dtY+lezuQvXdzP
 oqDLzSncUoxm6KFrKSSMNh88xGq433I3c2FG7JZTOTPblkhWGdE1RJQYfWMuMAeCbla5
 aiNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdIf1nSDilw8sl3lGlNS9qvLUgmv9f3rs6lyKWwtZ2hTRSbcQw4VIFLM2/WGokv7tV3b3ErrH8cSCVDnq03BEdg6+28v8+oGu/6o7B+7GP
X-Gm-Message-State: AOJu0YwOV1gkRtPej7gSHQNXx2S7ZYquVaom3galp+QBT1zU0L/Q87vo
 M3C3PhuaalDVry81f3Qo7r2rd5qVWeIEaglgwcLa8VZSE8fo0z24a7A6d2xEJIco0VCcC+L8C0k
 wn+gFLdgpvuyNkbwJWozcKcIlS25GtPW/3xb63A==
X-Google-Smtp-Source: AGHT+IFwiHasDbNqUmN3FeLVBrKDayEjmne8Pj/l5CVaBDswgbABq+xouKyVSZPrztCGNB9W5w2neAMPfmbgJxATrOY=
X-Received: by 2002:a25:4ec2:0:b0:dcc:1449:71ea with SMTP id
 c185-20020a254ec2000000b00dcc144971eamr4409535ybb.50.1712988174430; Fri, 12
 Apr 2024 23:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-12-dmitry.baryshkov@linaro.org>
 <6ed5bb25-979e-bb48-3dfe-4af581bb5dd1@quicinc.com>
In-Reply-To: <6ed5bb25-979e-bb48-3dfe-4af581bb5dd1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Apr 2024 09:02:43 +0300
Message-ID: <CAA8EJpqgmf=22O44qFEpxBuGiO4LDyOMrNVnksOdJ9G0z=X2Ug@mail.gmail.com>
Subject: Re: [PATCH 11/12] drm/msm: merge dpu format database to MDP formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 12 Apr 2024 at 22:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > Finally remove duplication between DPU and generic MDP code by merging
> > DPU format lists to the MDP format database.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   2 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   4 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 602 ------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  23 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  10 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   3 +-
> >   drivers/gpu/drm/msm/disp/mdp_format.c         | 595 +++++++++++++++--
> >   drivers/gpu/drm/msm/disp/mdp_kms.h            |   2 -
> >   drivers/gpu/drm/msm/msm_drv.h                 |  12 +
> >   10 files changed, 549 insertions(+), 706 deletions(-)
> >
>
> I cross-checked a few macros visually (not each one) and it LGTM in
> terms of just moving it from dpu_formats.c to mdp_format.c
>
> Even in this change I had the same concern about whether to use MDP for
> dpu formats.
>
> But I think even if we make it MSM_*** then we will have to keep them in
> some msm_** header and not mdp_format.c
>
> So lets go ahead with the MDP naming which you have. If we see its not
> working out later on, please be open to a mass renaming that time.

Ack.

>
> <snip>
>
> > index dea6d47854fe..e7651a0e878c 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -267,6 +267,16 @@ enum msm_format_flags {
> >   #define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
> >   #define MSM_FORMAT_FLAG_ALPHA_ENABLE        BIT(MSM_FORMAT_FLAG_ALPHA_ENABLE_BIT)
> >
> > +/**
> > + * DPU HW,Component order color map
> > + */
> > +enum {
> > +     C0_G_Y = 0,
> > +     C1_B_Cb = 1,
> > +     C2_R_Cr = 2,
> > +     C3_ALPHA = 3
> > +};
> > +
> >   /**
> >    * struct msm_format: defines the format configuration
> >    * @pixel_format: format fourcc
> > @@ -305,6 +315,8 @@ struct msm_format {
> >       (((X)->fetch_mode == MDP_FETCH_UBWC) && \
> >        ((X)->flags & MSM_FORMAT_FLAG_COMPRESSED))
> >
> > +const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
> > +
> >   struct msm_pending_timer;
> >
> >   int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
>
> I am now thinking that do you think it makes sense to move all
> MDP_FORMAT macros to a new mdp_formats.h including the RGB/YUV bitfield
> macros (even though I already acked that change).
>
> Instead of bloating msm_drv.h even more?

Sounds like a good idea, yes. Thank you!

-- 
With best wishes
Dmitry
