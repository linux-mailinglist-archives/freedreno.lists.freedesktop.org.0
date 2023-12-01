Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408AA800476
	for <lists+freedreno@lfdr.de>; Fri,  1 Dec 2023 08:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0474110E7F7;
	Fri,  1 Dec 2023 07:14:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F4810E7F9
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 07:14:26 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5d3d250aaedso9010117b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Nov 2023 23:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701414865; x=1702019665; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fwEyNpMfW1Ufx9odV3bnrhN7pz+UIxPRZV5Xveszz0A=;
 b=dOM1YBz4fGYOVFCUx8F8IpIxa03E6KwPyPFMGgVKz1/UY7oY9kDm2zzf87Hu0AaQTU
 bu0tw6rGPZz7k+zmr2aAahcZK66Mwrs8PUQQZ3hx1CknaYHOLtv9sovfGnKIHXOTKOtl
 dfF4WJtCaAuw+zXhPOaV/R+MbwhRgcppcZlkmTtyGZQz9sUf/auUBa21CbeQSMDs1Nps
 FL/P6kIqSi65CJ4nUiM7qZ5EFIb4Om7s9++HBF75cvSdGiQInMOSj3+M1gZ9iGtsyIIA
 Q0tYFrhl2QJrK07uUDFcLOCampI0GvtLeX0wgFGN4dsj8AQWH1OjhLXBoBa95cWAZLcd
 R1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701414865; x=1702019665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fwEyNpMfW1Ufx9odV3bnrhN7pz+UIxPRZV5Xveszz0A=;
 b=JBitI4AiTz75kkWmaw6rbAt5cVJLjeppf2ahPKkufUNofjxQd1P+FHy9fc3XnEMKM2
 fu67oWUqJ+vjrX7IQiLSGBcMsp8NlG8laY0ROsw5j0OcR5apta0WlzU9iGxodjznXl9W
 rcADLuFeadUYP9BIZUfn8W6erY05Wyz467ZiGoJKhR8w5Q6KXbTQKpmoMgElNlih/6FU
 zMfnHNsEI83f+M1i7M7Do4jw96Hwh3kyr0zoAsyQDefgqve3zCiYaV0jRUt6WYJT1ceq
 lyxXDSoZ+a4rNGL5krtzD5T5h1TV0hYxaH00Osy9Ux30svY6NHkq48y5GChJ2Z/af42y
 S9YQ==
X-Gm-Message-State: AOJu0YyeudyUNs4BEqwjufiY1rky1RWFGF1d1+3kB4Y01dBd0lyYyOI4
 ooksypD8XEcQFHNTe1Sw73ooh+88nSa9D1DAQGhmGw==
X-Google-Smtp-Source: AGHT+IH1zrA0sedjaTZM9ZUB1Xj3rWiOnVGBxUse/78AVWt2GLivnKjlJLa6tr6P49ZKi6Z6HiLTYSJNGyzwhMUczKg=
X-Received: by 2002:a0d:fa05:0:b0:5d0:55c:382c with SMTP id
 k5-20020a0dfa05000000b005d0055c382cmr16611927ywf.10.1701414865131; Thu, 30
 Nov 2023 23:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-15-quic_abhinavk@quicinc.com>
 <CAA8EJprZma-e=zbtDuGKfcHK7zTaSykACt+=rh7W92iEpif=Ug@mail.gmail.com>
 <6ed0c636-c222-36b3-aae9-eb822e088a2c@quicinc.com>
In-Reply-To: <6ed0c636-c222-36b3-aae9-eb822e088a2c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:14:14 +0200
Message-ID: <CAA8EJpp4XNCwRzF=Lo4_oV7Gj1yDDcEQn5YJ5vXEx=HiJvByWA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 14/16] drm/msm/dpu: do not allow YUV formats
 if no CDM block is present
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 02:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 8/30/2023 5:24 PM, Dmitry Baryshkov wrote:
> > On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> On chipsets where CDM block is not available OR where support has
> >> not been added yet do not allow YUV formats for writeback block.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> index 7fc174b33ae2..d8edca9bc964 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> @@ -406,6 +406,12 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>                  return ret;
> >>          }
> >>
> >> +       if (DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))) &&
> >> +           !phys_enc->dpu_kms->catalog->cdm) {
> >> +               DPU_ERROR("cannot support YUV formats without CDM block\n");
> >> +               return -EINVAL;
> >> +       }
> >
> > Can we have YUV formats in wb_formats if we do not support CDM? That
> > would be an error.
>
> I can drop this one once i address the comments on the next patch.
>
> Yeah the reason for this change was we had one formats array for wb and
> were using that for all chipsets. We can have two arrays : one only rgb
> and the other rgb+yuv to address this.

Yes, this sounds fine to me.



-- 
With best wishes
Dmitry
