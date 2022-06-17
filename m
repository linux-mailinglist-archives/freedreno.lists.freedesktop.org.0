Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299054FE2B
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030CB112C51;
	Fri, 17 Jun 2022 20:15:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A089E112C3E
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:15:23 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 93-20020a9d02e6000000b0060c252ee7a4so3853199otl.13
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=x4as2ZkeTzWY1neBp0pSqFxYj7FvUKGmqCj9lFfh46Y=;
 b=jL9i7Buk6SOOHObeThBYqPreYlCVl+OpGSR+jNZBMrSfoB1QYntFn3u6z+nJTvigce
 VBwenMjhFopuHqns/67g6yQAunM9l/71QNfBId3EqQ2MflO/F5EKVaC7RRlQ/ADStdG5
 2smcG2mIm1zKF2VFUSfELh3VT3Zvt/s+Ubv68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=x4as2ZkeTzWY1neBp0pSqFxYj7FvUKGmqCj9lFfh46Y=;
 b=F0VXCwiVcD+x9P405r1NCnOm3SQAIZyCQNwXtwHqEKJ1mFRodViI3kVKCURGmXdkPN
 7cgreOVQ918ALiUoO2QwVNb6BDrW5+Ee52g7g2wc353iCXMXfxIlJhME8Ax4rwIoQPUC
 dKnx/TboUeMNCSfGoyGcM8P3Kl31kRqG87AyZUP+PQcPleS8111UJvYXbxqtO9Wl/1g6
 0gnwb0FH0beCBqs3lHC7orAiccwLlEkjQAKQsPtCVMpoiIOQZy7AgmCdoqlMHGsPCl9y
 ri4o8NrNEJ0vm3bYkGswJ3TQi9vjEdnG65e4516uUw4AFA/zCvCSzDt8jTrY5SU74w+o
 gtNQ==
X-Gm-Message-State: AJIora9SgZeJk65K+IhqxjEwb6c7Curd7NkugMs3ceP9kYm8vhTNgMMp
 9RZUYl+FRgl8Uo8lgaIL7Gz/FsImDQbDAWWBhoFmMg==
X-Google-Smtp-Source: AGRyM1u4nMHweik4URlw+DCJbLUl0w+UrlWDIBvKtDehatittlrFKAJ8bL5+y6eZyKP4hA1WsTKrT7WnEl7enizsIq4=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr4702235otl.159.1655496922910; Fri, 17
 Jun 2022 13:15:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:15:22 -0700
MIME-Version: 1.0
In-Reply-To: <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
 <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:15:22 -0700
Message-ID: <CAE-0n51vDC-a=87hbM_rvxhNNV7KNpCHy3=wH0N5VCEvdrjyuw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dp: remove
 dp_display_en/disable prototypes and data argument
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 12:49:21)
> Remove unused dp_display_en/disable prototypes. While we are at it,
> remove extra 'data' argument that is unused.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1e34ac2126f6..42ceb4c5796c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -607,9 +607,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>         return 0;
>  };
>
> -static int dp_display_enable(struct dp_display_private *dp, u32 data);
> -static int dp_display_disable(struct dp_display_private *dp, u32 data);
> -

This part looks good.

>  static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>                 bool plugged)
>  {
> @@ -856,7 +853,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>         return 0;
>  }
>
> -static int dp_display_enable(struct dp_display_private *dp, u32 data)
> +static int dp_display_enable(struct dp_display_private *dp)

This will conflict with Kuogee's patch[1]

>  {
>         int rc = 0;
>         struct msm_dp *dp_display = &dp->dp_display;

[1] https://lore.kernel.org/r/1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com
