Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6889943C2B
	for <lists+freedreno@lfdr.de>; Thu,  1 Aug 2024 02:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19FA10E832;
	Thu,  1 Aug 2024 00:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tvtgMDT9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F3510E832
 for <freedreno@lists.freedesktop.org>; Thu,  1 Aug 2024 00:34:58 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-67682149265so52395577b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 31 Jul 2024 17:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722472497; x=1723077297; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M/CELQaNvMQTBTPJnHhuNUlt/nKrqYgz+WkyNAnHqFw=;
 b=tvtgMDT9WWCD+EUdiUGJJz9EWIL4HHA5d9XRbgsOEteWGzP5CBqfrpBc3gx+rfAdHC
 qLyJxWdY+n8MMhGbD8/iIz/S/moKcsxx0FX0UBBWm8WZTenoe7le6Z9YzRoGsMbTvBOY
 zwnHTzQJBbtOqZ+zwZOhwBvwQ6cq3LprYol1CzQvo93MoWFZOJ97BjLUgIfpyLCDT2LV
 8gEelrM02se5qsEKNv/lBs1W5eO4Kqxk9wTM0Aq7KwqY1brkDlhvTbfcjOCgEb5Z6C6h
 HLndTDapgyoNRy64zwxGnX0smBbmOGa9fxNG786BMqSGTifW7fSFGLVUudbmYRwIEkum
 h5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722472497; x=1723077297;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M/CELQaNvMQTBTPJnHhuNUlt/nKrqYgz+WkyNAnHqFw=;
 b=NIuPQm627119j0pk+um63APv398K7gMAC1VNBUB34tgWpLO2hvO+wcmjmABTtLdHMt
 HM+WK9LThoAD4E4FlbEjV0VfI4iVK0coo9j+N2KNd7S1Ig78D1vQFQ4R67b/HhKi+RSC
 s6fXn4Bt2dL5Xaemz91wC+UbSeaPS8X0CHr2X9K1yChtcaJwFGCk4H5W1EgX+HJWFpMy
 oRE0xCKrl77EsP6uty94xwIyBI1jfKTiku4Etdd82i3BQs3X1nhiLQebCqsHVMRf6HR7
 2wPXw9J/j7F53a4Nv5xfOB5e8OtnhV53FbuzDY/jq3WSJT9PdEq9yFDjDlBT8jeJJ65H
 y/kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgWEHE76zZsm+CwJi2H19wjnHXv/qEIlLS/NwAWVFbQjMAawMVNcNJp2gHEHcYcEvSQai9cHETcw4npmSwS5HuOkC6Sk6UiGW2fitbGaZr
X-Gm-Message-State: AOJu0Yx7dBE3I5xzocQawWvNjTvf/7q9FpADv9r21U5U4he2tT4gbgwE
 WEeYre15d6WIeGzp5vWUP9y0jBKb3Bb3FTK+Jz9aQ0ROLqqoUP2ruahyReBmBh3wTkJ1yS2y0tZ
 krsQZgtYzjB6WbDzTuaB0QIq46u4a+1rGsy+QIg==
X-Google-Smtp-Source: AGHT+IGaBGM1AayDPzuZZA1cyOtTi6oJv13xWErQOdKjC4oVXJkICQP5cLrmmu5xwR7QC6Y4C3u8Iwj/z6IN0YJq5QE=
X-Received: by 2002:a0d:f3c6:0:b0:650:a1cb:b122 with SMTP id
 00721157ae682-6874bc631bcmr9370347b3.27.1722472497251; Wed, 31 Jul 2024
 17:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-2-5efb90cbb8be@linaro.org>
 <b2cceeb8-fe81-4212-9b07-b70cad8d3b9b@quicinc.com>
In-Reply-To: <b2cceeb8-fe81-4212-9b07-b70cad8d3b9b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Aug 2024 03:34:46 +0300
Message-ID: <CAA8EJpp2pg1FyrE8ftxGduHUnX=nsu=Zg_mwCrkcdqJqMJZjDw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] drm/msm/dpu: relax YUV requirements
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 31 Jul 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/26/2024 2:45 PM, Dmitry Baryshkov wrote:
> > YUV formats require only CSC to be enabled. Even decimated formats
> > should not require scaler. Relax the requirement and don't check for the
> > scaler block while checking if YUV format can be enabled.
> >
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 1c3a2657450c..148bd79bdcef 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -743,10 +743,9 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >       min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
> >
> >       if (MSM_FORMAT_IS_YUV(fmt) &&
> > -         (!pipe->sspp->cap->sblk->scaler_blk.len ||
> > -          !pipe->sspp->cap->sblk->csc_blk.len)) {
> > +         !pipe->sspp->cap->sblk->csc_blk.len) {
> >               DPU_DEBUG_PLANE(pdpu,
> > -                             "plane doesn't have scaler/csc for yuv\n");
> > +                             "plane doesn't have csc for yuv\n");
> >               return -EINVAL;
> >       }
> >
>
> Change seems fine, but one question, is there a chipset in the catalog
> with a Vig SSPP which has only csc but not scaler? Even qcm2290 has
> neither scaler nor csc
>
> So was this just a code-walkthrough fix or was there any issue hit due
> to this?

Just a code walkthrough.



-- 
With best wishes
Dmitry
