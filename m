Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7952C3D3
	for <lists+freedreno@lfdr.de>; Wed, 18 May 2022 21:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE6810E55B;
	Wed, 18 May 2022 19:57:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3314410E55B
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 19:57:59 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w127so570335oie.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 12:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UcTbUgGIvqsT3olvD3JU2VJ3/UUh5htiHSA1O+KkiiE=;
 b=YobbZ2QJc+rrHelFAGviFrdAvTVXo2zCucJrpGg+idHoeBAZ6YRxtZDeL0MP+vxdGE
 /bKWX1zSLEFTdq2KMZxiviOpAnw4gVrn7TkFfm1WaTmyRbQgxbESeDdZaTdXYYPOJ1gR
 DWspatPXKL1M3VuocDgKM8N8ed7ZLQrozT7hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UcTbUgGIvqsT3olvD3JU2VJ3/UUh5htiHSA1O+KkiiE=;
 b=WqhUXfWXwRqWeFp9M7vynLDWfz7r8kRcI5J9SMESHx0wx0bwMdP88w7Zof2ttmgMJ6
 cPV/f6+ktqxTn4H7BPNm32WwWiwrS2cgNUk7eB0Jl4YAITHrGHONlWDTTACnFi1UXq4V
 rwQjEM4VgVMMKrjiQhCWtWccYetHhVwezkDrLGUwVigiAERCf4iNedfKt/pwpl4Ab5p9
 /aR5DD3LFv1kBc59V0LYC9MCVLApp1j1Jmd+VOA8fpo9UzoP7QG1giMHjbvDxhE8i4Kb
 n2+U1Jv6yUfUz5BmWj/4CYCm+fjlfaEqRB8IpeSAvCmhBpS3+ADFn5WbE4JYj2RhNsVo
 4WvA==
X-Gm-Message-State: AOAM531GjTEtDzQSQC1Yulc/R3jvV0t4fOsdBQ3Q/kuN6G3KSw5Cs17n
 UbdiAyBkHv+3Dhk3PyUFSSTmGaHZ2uuaTxwpbt2DIA==
X-Google-Smtp-Source: ABdhPJxcBIZ6WAPAF+BE1ubh8zCQ2HtllaswZgL+Lw9xO6F45Cwgz9H+CQ8gV9kxkAh/6j0nnKospRlAC18YtbTnsk8=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr771163oib.63.1652903878386; Wed, 18 May
 2022 12:57:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 12:57:58 -0700
MIME-Version: 1.0
In-Reply-To: <20220518195540.30459-1-quic_abhinavk@quicinc.com>
References: <20220518195540.30459-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 12:57:57 -0700
Message-ID: <CAE-0n538GBcz1TgsamEoJvUZRYEVZ6inTo=9A7YOo8PMreYeLQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: handle pm_runtime_get_sync()
 errors in bind path
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
Cc: dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 robdclark@gmail.com, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-05-18 12:55:40)
> If there are errors while trying to enable the pm in the
> bind path, it will lead to unclocked access of hw revision
> register thereby crashing the device.
>
> This will not address why the pm_runtime_get_sync() fails
> but at the very least we should be able to prevent the
> crash by handling the error and bailing out earlier.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931474e0..2fd1f5b70a06 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1089,7 +1089,11 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>
>         dpu_kms_parse_data_bus_icc_path(dpu_kms);
>
> -       pm_runtime_get_sync(&dpu_kms->pdev->dev);
> +       rc = pm_runtime_get_sync(&dpu_kms->pdev->dev);

Any reason to not use pm_runtime_resume_and_get()?

> +       if (rc < 0) {
> +               pm_runtime_put_autosuspend(&dpu_kms->pdev->dev);
> +               goto error;

Then this is a single goto error
