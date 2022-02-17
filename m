Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55E4BABF4
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 22:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A902D10E854;
	Thu, 17 Feb 2022 21:44:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E0010E842
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 21:44:08 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id h9so11020877qvm.0
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 13:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6R8qn+rbL8OvPipxuVgINO0b1lTKNrdKLs//Tzx1/Vg=;
 b=OUIGVb3AgkfYqWJ/jpUcEbfG8cQNrWOf8W2dm9Aqt3J2zie173GvWoJ6AE1eFBXLC+
 BSrfwVz9fk/DeGoOPMaaLOco12vCxmYrdThUp0Oa9hS/3sFO6UnQIqVcOO4F2xKxh+PS
 KxCRQL7yuVFQ8uZvzWDrWsR0S/qmvs3ZYwPY2d2PLEzOwj61ELQhYX+B1P1CQWUgQ3AI
 ZxF2302qHhiCMNBL+mmWhLle2wsG0oQerm4BN3OG3PPiqrNpxvWA/AyXeef6nJeL8ksP
 FrqLcsYjKGcHLtKtfpcvyAxnuIyMEMepLLNdQ1yYlz2Ado2t2Fueu8AP/0v5WbaBpg5o
 +kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6R8qn+rbL8OvPipxuVgINO0b1lTKNrdKLs//Tzx1/Vg=;
 b=yNMaO1nGc9G6v1TzJcYO+d8kla90IQP7mU694uBKRqUo0YvoPCiIU00ccAbggtZBsN
 zmOcR7i3FupJesEKGg/T9BCv0VLsmM+brqeysY91+SxULvSwEP2qznj1p3r+06ffxeee
 +LkclGvbrvZk9PfWrE3YaV7woHL1Uv8gIW1re95W48f+iNHumNceI0qX9CMF32oV+0AM
 2J3GIyD/0Lh5ij0C1Fu1oWRBvGt5oTUpFN+wkF8y2mCadDzljRdpzYwWPa3uiRLDEzth
 hpNd+V56wuJ+26VLLBHaVZ5y8MCZx+7EPd0aCCUQmD+87xzQHFwe2SXl8prHK2ig2jEw
 j3Tg==
X-Gm-Message-State: AOAM533rXUjZjUkNKr8LE4fBqsyJvTFlEB5ENq2nCZb5aOMrOZvzMHux
 bIZkQH26jj5qA9W0p2qG6fw2BuWs1og7sMrQnABbAQ==
X-Google-Smtp-Source: ABdhPJy1qvJVD1rgLNeWV3GUhnlxwMyxzExFz2q3A1g24QsHgiswLGR3hNBpdmvyvE2dyuEWTwWn6PzdWBJHOiiKd4Y=
X-Received: by 2002:ac8:584c:0:b0:2dd:89dc:8000 with SMTP id
 h12-20020ac8584c000000b002dd89dc8000mr1907274qth.370.1645134247505; Thu, 17
 Feb 2022 13:44:07 -0800 (PST)
MIME-Version: 1.0
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1645133788-5057-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Feb 2022 00:43:56 +0300
Message-ID: <CAA8EJpqu2VsYkACe+FL+Z0J=j7Pp-w69_YNyBWn_7Ah1GoW23Q@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v8 1/4] drm/msm/dpu: adjust display_v_end
 for eDP and DP
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
Cc: quic_sbillaka@quicinc.com, Jonathan Marek <jonathan@marek.ca>,
 quic_abhinavk@quicinc.com, airlied@linux.ie, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022 at 00:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The =E2=80=9CDP timing=E2=80=9D requires the active region to be defined =
in the
> bottom-right corner of the frame dimensions which is different
> with DSI. Therefore both display_h_end and display_v_end need
> to be adjusted accordingly. However current implementation has
> only display_h_end adjusted.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Fixes: fc3a69ec68d3 ("drm/msm/dpu: intf timing path for displayport")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_hw_intf.c
> index 116e2b5..284f561 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -148,6 +148,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dp=
u_hw_intf *ctx,
>                 active_v_end =3D active_v_start + (p->yres * hsync_period=
) - 1;
>
>                 display_v_start +=3D p->hsync_pulse_width + p->h_back_por=
ch;
> +               display_v_end   -=3D p->h_front_porch;
>
>                 active_hctl =3D (active_h_end << 16) | active_h_start;
>                 display_hctl =3D active_hctl;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
,
> a Linux Foundation Collaborative Project
>


--=20
With best wishes
Dmitry
