Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A79E9EA1B4
	for <lists+freedreno@lfdr.de>; Mon,  9 Dec 2024 23:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB4910E034;
	Mon,  9 Dec 2024 22:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I04NoRpp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3BC10E0B5
 for <freedreno@lists.freedesktop.org>; Mon,  9 Dec 2024 22:16:55 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e387ad7abdaso4246631276.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Dec 2024 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733782614; x=1734387414; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GjdBU58GLyG4jXaeGh1WmIo6+crxO9Fl9Blf1+csx7g=;
 b=I04NoRppBeUHnX6AqwZ73vxk0y7HyrrNJwcUIiPfMAaoguMkh+wg8TmrEYqJAS6JPN
 E5BxoAfJwPEVKLN+KFvvaD49Yc3byFBzlmRJcXtX+cL4FisX2Uv97SZ6vYV6fNI6KCS0
 AUAoLKSDPWVbEeG9CHIFEdwOGPMFs1GY+VUz3HzoPKdTynqpLibxZrItWc7LWG5dLvIj
 VDaUYbp3dj356411tIJZHCnD5FJoeWhI9gLnZ4gSXLLbi7zGysLg1WwWPKT7VVQvAW27
 4H8eT2QtqSMakmP1TKhbmQFYI/SBHVPPDA6x8U2mEd7Tb+W8zgGI1jrSFVOMa7QBG303
 8OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733782614; x=1734387414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GjdBU58GLyG4jXaeGh1WmIo6+crxO9Fl9Blf1+csx7g=;
 b=Ca6Ljybzq8IKvgv6iblYMTts/lASV2eELCMtBp3D8nMPdIaGRBUC8sO49Vdag8VxAw
 MHq/VXtuyMACCufsjCd5ItWLL/yZH09nFWfzGcqrvUKly9hd4HT4KLZ5agv7jwCmScsL
 +b2UG3R+uzPtbnmX/PNhd+2LpAVGvb+BmIkz41H22qbLJmJL4EPfE/CXQn8uiEXQM+y7
 /RjxzJJyO2lkFbnUPjh+K31vwDc5UeLy/aTVJuRfN4LlYF3zjEwLOWuVvsavKejdWY81
 Mey7zDwOH3rWtH1r02c6HYb8qy7736O5ZcgvvG1JAOTZkewxA72F/yX4nT9xqUpJiXma
 1ZOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQcj9tew9reXr9xe2LiZ51gZ7RCJJ+oURZToxJPgJn/n293PF60JGsWt/ysZo4My3INB5HnxL9x+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFtyRi8BEDzgYb0Rqx+PDm/xEJUzou6ksdYaMlv+1pHEsM0NWG
 pzKNhsWpH3LHstiQ/ssyTYYLR0WcOvTqqpO2EXZQy05k3dDIzfHy/GdRNy5Ph15U86O23PoJcGA
 br47mGkDxfiTWdf3D7VLN9/CrX+qafjIlBZY8DQ==
X-Gm-Gg: ASbGnctflHj45YfutOD9SeCsDICNIPCSlhM+lBRauymDtKySTaDogD0xCn412fYcPdD
 ZJerTkXa5S3soy00tvTgq632+cKCyX5pyX9k=
X-Google-Smtp-Source: AGHT+IE3KVx9ellET6od2Fov33jjRyilDngNFD1e4QdzTDVV+Uuh2NyO57XkBrcDlZwfvuJUuaClqS4lRUo1DxYviZw=
X-Received: by 2002:a05:6902:2886:b0:e38:bf8b:e2d0 with SMTP id
 3f1490d57ef6-e3a59d08124mr1793629276.46.1733782614229; Mon, 09 Dec 2024
 14:16:54 -0800 (PST)
MIME-Version: 1.0
References: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
 <zae7rlojv5iiq2dx7bxhdsmmzj73o65cwk7kmryxsst36gy2of@k3vcm6omcias>
 <b784049f-a72c-47ff-a618-e7c85c132d28@quicinc.com>
In-Reply-To: <b784049f-a72c-47ff-a618-e7c85c132d28@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 00:16:43 +0200
Message-ID: <CAA8EJpojwG+_Q_9GYBFzQ_ReDbnO=+GbTPZscWgS1f=fkU0Anw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

Hi Abhinav,

On Mon, 9 Dec 2024 at 22:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/7/2024 9:29 PM, Dmitry Baryshkov wrote:
> > On Fri, Dec 06, 2024 at 12:00:53PM -0800, Abhinav Kumar wrote:
> >> On chipsets such as QCS615, there is no 3dmux present. In such
> >> a case, a layer exceeding the max_mixer_width cannot be split,
> >> hence cannot be supported.
> >>
> >> Filter out the modes which exceed the max_mixer_width when there
> >> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> >> to return failure for such modes.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >> Note: this was only compile tested, so its pending validation on QCS615
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 9f6ffd344693ecfb633095772a31ada5613345dc..e6e5540aae83be7c20d8ae29115b8fdd42056e55 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
> >>      struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >>      int i;
> >>
> >> +    /* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
> >> +     * before even checking the width after the split
> >> +     */
> >> +    if (!dpu_kms->catalog->caps->has_3d_merge
> >> +        && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >> +            return -E2BIG;
> >
> > Is it the same as checking that there are LMs which support
> > DPU_MIXER_SOURCESPLIT ?
> >
>
> DPU_MIXER_SOURCESPLIT tells whether we can have more than one SSPP in
> the same blend stage.

Do we have a feature bit that corresponds to the ability to use 2 LMs?
I mean, there are other *split topologies, not necessarily the 3DMux
ones. E.g. PPSPLIT.

>
> 494     if (test_bit(DPU_MIXER_SOURCESPLIT,
> 495             &ctx->mixer_hw_caps->features))
> 496             pipes_per_stage = PIPES_PER_STAGE;
> 497     else
> 498             pipes_per_stage = 1;
>
> That is different from this one. Here we are checking if we can actually
> blend two LM outputs using the 3dmux (so its post blend).
>
> >> +
> >>      for (i = 0; i < cstate->num_mixers; i++) {
> >>              struct drm_rect *r = &cstate->lm_bounds[i];
> >>              r->x1 = crtc_split_width * i;
> >> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> >>   {
> >>      struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >>
> >> +    /* if there is no 3d_mux block we cannot merge LMs so we cannot
> >> +     * split the large layer into 2 LMs, filter out such modes
> >> +     */
> >> +    if (!dpu_kms->catalog->caps->has_3d_merge
> >> +        && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >> +            return MODE_BAD;
> >
> > This can be more specific, like MODE_BAD_HVALUE.
> >
>
> Yes for sure, will fix this up.
>
> >>      /*
> >>       * max crtc width is equal to the max mixer width * 2 and max height is 4K
> >>       */
> >>
> >> ---
> >> base-commit: af2ea8ab7a546b430726183458da0a173d331272
> >> change-id: 20241206-no_3dmux-521a55ea0669
> >>
> >> Best regards,
> >> --
> >> Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >



-- 
With best wishes
Dmitry
