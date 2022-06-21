Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4655392C
	for <lists+freedreno@lfdr.de>; Tue, 21 Jun 2022 19:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225E310E895;
	Tue, 21 Jun 2022 17:49:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA13710E895
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 17:49:22 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id 43so21486997qvb.3
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 10:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nw0DlBYDfBdu22kSo0+uETWJWz7c+f9JtMxmK4Kl8RI=;
 b=dyq/TyGYhw8UU4mdyDE5mNCj129SFfyHjyX0dumMMkgB3V73o1m3jd/o0FAOfHjDAX
 dQZdD9UIP/FuACILeg/LBhBndr0mOpj8vRWjVXWfiklW8vGbrmu3Fw5X8R38DUfVfc/a
 BHCQcch51EY+WTFGOfppYA/hQ8ylFE6vzV0w8+JlSiq/sHozNRGvbd1FmU8NP8I98GN2
 zANcOgU+VsUk/lezKgdT2jdFDaroYQI9YoGX8lrL90gF7uGPDLbma2t9rlOjNBNhNF/R
 gzshyndEmw6dU54D45OE2N6NS5gM89HRH1EU0AMHfqN9QeMpMy6T2++emFsp1XQoGttn
 FZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nw0DlBYDfBdu22kSo0+uETWJWz7c+f9JtMxmK4Kl8RI=;
 b=Sy0JT/ZxmV8E+uUUM3uLALa1CW9U+A10HYWV7nE3PloFt1Eebe3O6USu8z8VAAeOXV
 2CMRdbP4Ei951Z5f/9jnmPLYhcgvJnrwzl45Wt2Cl9HVEDqFl1P4sYew5hDxziQhda/o
 b3yGk4el55UdX5XOQLdOWWxgcSVZwRXTWFyjXBCmVw8P+xFnaqnZwBqZa4Ri1vJWOskp
 xlqA+ZUc53xtalHHeb6UVJ61xx9jHmczb3n6ntHE5ms93aQ7xn7OBsAz7LpTgwxxSsCy
 XaLryF7xZJENvk5MMidkPZxKWl8bBGKKhjRbZ3ElnQ4xRBVZAdiv9er4bgPLlRS+8aHt
 W4Sw==
X-Gm-Message-State: AJIora8yFB63tWGs41MMN28KDLEeieeSjExmhf4pRFIYZ6KCDm3/P5XM
 mCgqfeHeDUbCJzU/PLUuO8lM89cZe3qxoAIpPA2rCw==
X-Google-Smtp-Source: AGRyM1vRZ27TE9JLxl0H2Bf2+iemKBHDRiHFCSDiyD9/BWISYi/Q905z5NHGQAOdijq8GrzXd4JAVga2mXdEiVg1o9w=
X-Received: by 2002:a05:622a:1351:b0:305:2e58:939 with SMTP id
 w17-20020a05622a135100b003052e580939mr24711190qtk.295.1655833761773; Tue, 21
 Jun 2022 10:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220621110634.368913-1-sunliming@kylinos.cn>
 <d4b882ba-b773-5271-6050-416c8f3cad4b@quicinc.com>
 <955f881c-7731-a337-3ff9-e58863c41976@quicinc.com>
In-Reply-To: <955f881c-7731-a337-3ff9-e58863c41976@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jun 2022 20:49:10 +0300
Message-ID: <CAA8EJpreR2bk827Mb4doU5yf=Af-3djoJ=UiOomfsGmuV1MUhA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix variable dereferenced
 before check
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
Cc: kernel test robot <lkp@intel.com>, kelulanainsley@gmail.com,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 sunliming <sunliming@kylinos.cn>, freedreno <freedreno@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 at 20:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Copying freedreno

The patch needs to be sent to freedreno@. Otherwise it doesn't exist
in patchwork.

>
> On 6/21/2022 10:42 AM, Abhinav Kumar wrote:
> >
> >
> > On 6/21/2022 4:06 AM, sunliming wrote:
> >> Fixes the following smatch warning:
> >>
> >> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:261
> >> dpu_encoder_phys_wb_atomic_check() warn: variable dereferenced before
> >> check 'conn_state'
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: sunliming <sunliming@kylinos.cn>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 +++++-----
> >>   1 file changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> index 59da348ff339..0ec809ab06e7 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> @@ -252,11 +252,6 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>       DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> >>               phys_enc->wb_idx, mode->name, mode->hdisplay,
> >> mode->vdisplay);
> >> -    if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> >> -        return 0;
> >> -
> >> -    fb = conn_state->writeback_job->fb;
> >> -
> >>       if (!conn_state || !conn_state->connector) {
> >>           DPU_ERROR("invalid connector state\n");
> >>           return -EINVAL;
> >> @@ -267,6 +262,11 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>           return -EINVAL;
> >>       }
> >> +    if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> >> +        return 0;
> >> +
> >> +    fb = conn_state->writeback_job->fb;
> >> +
> >>       DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
> >>               fb->width, fb->height);



-- 
With best wishes
Dmitry
