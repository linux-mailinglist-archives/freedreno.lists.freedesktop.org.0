Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CC950ECBD
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 01:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9540310E3E3;
	Mon, 25 Apr 2022 23:42:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056A10E3E3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 23:42:43 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 w27-20020a056830061b00b00604cde931a0so11939675oti.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=K4FutLiPYIeP/HOxIs4qYHrWa4LrVjZXyTDuVMwAdkE=;
 b=ZilM88c+fnY6fhL+dsclBFXXrJZ2HAsNMGm+Np/+Mt+Oc9B8TPZAw7q2viTTA6ak7B
 yoPgBTRydMcwU9nqmb2RwnJ6/9Ab+iVUtgpDZMQnsf8c60ouFHjhpnnlMa5L2jaUEi7S
 mNECsZCv8EsiAIE7sqJFlw+mv3p73HVE1KFXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=K4FutLiPYIeP/HOxIs4qYHrWa4LrVjZXyTDuVMwAdkE=;
 b=555J1t1z6VbdHLlghVA6gpqjaMbT500H3IgL5ancZRSsTdERiuZRXg05n+ZBMrWIPH
 sf5NJxBu/mWmO8jx07I8T+B+AjRAKlG7H0DIYq03RQn8RBPWCY/0Htmy8W3VfJnS0eAe
 uIkZu3y4zODhpGi4TJhs/GMyRbyeuAjmgqUYAcSSbvZ6QhLcqZJjlb0cYs+Q36zDa9MK
 hOHE7f1cVqPkAF103btjpYEkbJ41/KGkq33p/4cedj/2ukj4eA2/pJka30ppy4bARO8z
 oHgooqIT4cJJvAaAa8bgLKrbm0gEs6bjrryF/HMR82TLN2vwOKziWOAbdnzDB4hp16Hh
 usjw==
X-Gm-Message-State: AOAM532tmZWaiZZFXE2xZsCFaTzKEn+Msej+aR3PePlYb3q/tW4tGlJB
 PHqKwlwc30vDms2uOTSR/Hbc5Y+wNIZm44ACkG1+XQ==
X-Google-Smtp-Source: ABdhPJzjMENQDYBD08IVFVW0/QWyMQfeTI6EyQhCyi/4NXFypeigA/5BTebt0pYawZnga1Nb8BVc8Zivs55QAsnebDU=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr7434111oth.77.1650930163239; Mon, 25 Apr
 2022 16:42:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 16:42:42 -0700
MIME-Version: 1.0
In-Reply-To: <1650924663-24892-3-git-send-email-quic_khsieh@quicinc.com>
References: <1650924663-24892-1-git-send-email-quic_khsieh@quicinc.com>
 <1650924663-24892-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 16:42:42 -0700
Message-ID: <CAE-0n5356Mf8AyW4ytNjuz95P5+T0fAD+EZ9p3Zkqp7hgpsYKw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/2] drm/msm/dp: do not stop transmitting
 phy test pattern during DP phy compliance test
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-25 15:11:03)
> At normal operation, transmit phy test pattern has to be terminated before
> DP controller switch to video ready state. However during phy compliance
> testing, transmit phy test pattern should not be terminated until end of
> compliance test which usually indicated by unplugged interrupt.

And what does the patch do to fix it? We need more details in the commit
text. I think it should continue with:

Only stop sending the train pattern in dp_ctrl_on_stream() if we're not
doing compliance testing. We also no longer reset 'p_level' and
'v_level' because XYZ and it's OK/better to retrain the link after
enabling the stream clks because XYZ.

>
> Fixes: 64e190e720a7 ("drm/msm/dp: DisplayPort PHY compliance tests fixup")

Should be

Fixes: 6625e2637d93 ("drm/msm/dp: DisplayPort PHY compliance tests fixup")

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 193cc1a..f99e173 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1699,8 +1699,6 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>                 ctrl->link->link_params.rate,
>                 ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
>
> -       ctrl->link->phy_params.p_level = 0;
> -       ctrl->link->phy_params.v_level = 0;

Why is this removed? Can you mention in the commit text why we don't
need to zero it out anymore?

>
>         rc = dp_ctrl_enable_mainlink_clocks(ctrl);
>         if (rc)
> @@ -1822,12 +1820,6 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>                 }
>         }
>
> -       if (!dp_ctrl_channel_eq_ok(ctrl))
> -               dp_ctrl_link_retrain(ctrl);
> -
> -       /* stop txing train pattern to end link training */
> -       dp_ctrl_clear_training_pattern(ctrl);
> -
>         ret = dp_ctrl_enable_stream_clocks(ctrl);
>         if (ret) {
>                 DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> @@ -1839,6 +1831,13 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>                 return 0;
>         }
>
> +       if (!dp_ctrl_channel_eq_ok(ctrl)) {
> +               dp_ctrl_link_retrain(ctrl);
> +       }

Braces not needed. Please remove.

> +
> +       /* stop txing train pattern to end link training */
> +       dp_ctrl_clear_training_pattern(ctrl);
> +
