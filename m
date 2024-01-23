Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F888378DB
	for <lists+freedreno@lfdr.de>; Tue, 23 Jan 2024 01:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224FD10F195;
	Tue, 23 Jan 2024 00:24:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1CA10F195
 for <freedreno@lists.freedesktop.org>; Tue, 23 Jan 2024 00:24:57 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5ffa694d8e5so24991547b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Jan 2024 16:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705969436; x=1706574236; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E3d6mz6ecOg8V6XgFCLvP26GQr21ov7L5DgrH8grpUQ=;
 b=p+KGLtrunKv3xI6wdgeSHmFW5HV+UJJBuUdsmf7F7Zihw+NHQsWqVQba32LLIqgxEE
 Q1UjWJhsrBeRDUNN3VOO9HoBeYf+SosTuSfIDMK1eJvcZOau/dZ56No5B5THtcFrMau2
 RKjUiLgBbGSONvR8eCrtoVAVufFXYmlcPRGDOBAbFEm7tyX5KePXCBuBIRcYrJjW7m54
 qUZNu4MaAfnQx2s3ehlaZNX5V9QUpH9c9rRRwRhW7rbUFIsFgz7JhkG/TUQbciXXf1mi
 SgLyN2QT9mw6ubhpm8Nh+5Y0V60o8jB7ABZxPwEiO0pYeJVL2O06o10YiCdj6LTWOHS6
 1Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705969436; x=1706574236;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E3d6mz6ecOg8V6XgFCLvP26GQr21ov7L5DgrH8grpUQ=;
 b=lTQ/m9ChYDbHfyJ7cw3z0w3I2vkUiXpJS+XMLcRspNRKGvQRkrka2JHnk2yM4VH/7U
 rvrHcxB3QWpDkBr4EvzX26aVCtrUk4D0wCbCm2fIB2WIAWsvRXu7BhEN2leyVQ3Nr2ed
 yJXr/Yrn4aedRaqxaE3KmCyygIy/dabAovFP446ITlJ8/PdwofZSfYrznAFSJFuuk/2Z
 Db7sv0fl1L/cQXeFmvvCYYafPgVWC2Vh6g/a/gocm0nXc2pPtvUXQEDN+LAtgWyRmKmw
 wMkjU2ZMBLcqn7ZUHGjzZUivbD82i/iPsDLZ2CUs7SLLQeilbYDrdDWMQPIIOVVdv0e5
 mPjg==
X-Gm-Message-State: AOJu0YxqVe2xKzGEG2CoZhnnvmjbVCgHniVdE0X5d9x7Qlqhl49hPBtI
 Hj9hwkWk6q6AVBcbUgf1S1uljAWBV2ScHm7sz2PER1RF22PzfJHaClCMhSH2KlOvg0AKwFTvzcc
 +I3PR0C4FlB8VmvFmNJ38qfk2XlTEtA7Z18Cwbg==
X-Google-Smtp-Source: AGHT+IGSVPYdfMPgFOpk1Cz/WIZyqOXYNkicttOcvG3cuY4WBHtIE5f4tB3f6I2ks4T2PRZrcMGsokV/y6ywHpaGv84=
X-Received: by 2002:a0d:e611:0:b0:5ff:91c2:7ead with SMTP id
 p17-20020a0de611000000b005ff91c27eadmr3858253ywe.10.1705969436261; Mon, 22
 Jan 2024 16:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
 <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
 <CAA8EJpqvyOsPErUE08mcCAcG41zRJS+Q6qQi83-ZNCBcwv3kCw@mail.gmail.com>
 <18b7e28c-c969-c5f4-28a9-74ff79c94aca@quicinc.com>
 <bb4cac9c-4de7-8ad0-5cdc-f7c089eaa75c@quicinc.com>
In-Reply-To: <bb4cac9c-4de7-8ad0-5cdc-f7c089eaa75c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 02:23:45 +0200
Message-ID: <CAA8EJprpbtwzQc5LBOV8KurfHQvQW7SY4LLQpyMzVeyfmQ=dBw@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024 at 01:20, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/22/2024 9:28 AM, Kuogee Hsieh wrote:
> >
> > On 1/19/2024 6:31 PM, Dmitry Baryshkov wrote:
> >> On Fri, 19 Jan 2024 at 23:14, Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> wrote:
> >>> Dmitry,
> >>>
> >>> I am testing this patch serial with msm-next branch.
> >>>
> >>> This patch cause system crash during booting up for me.
> >>>
> >>> Is this patch work for you?
> >> Yes, tested on top of linux-next. However I only tested it with
> >> DP-over-USBC. What is your testcase? Could you please share the crash
> >> log?
> >
> > I tested it on chrome device (sc7280) which has eDP as primary and
> > without external USBC DP connected.
> >
> > It crashes during boot.
> >
> > I will debug it more and collect logs for you.
> >
> Below  patch work for chrome with both eDP and external DP.
>
> We have to return failed if it is the external DP and return value of
> devm_drm_of_get_bridge()  is !ENODEV since DP does not have next bridge.
>
> Otherwise should continues to component_add()

We also should not continue if it is eDP in case of any error.

So it is if (is_edp || (!is_edp && ret != -ENODEV)) which is exactly
equivalent to (is_edp || ret != -ENODEV).

Could you please post the backtrace that you have observed?

> @@ -1210,7 +1210,9 @@ static int dp_display_probe_tail(struct device *dev)
>          dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev,
> dp->pdev->dev.of_node, 1, 0);
>          if (IS_ERR(dp->next_bridge)) {
>                  ret = PTR_ERR(dp->next_bridge);
> -               if (dp->is_edp || ret != -ENODEV)
> +               dp->next_bridge = NULL;
> +
> +               if (!dp->is_edp && ret != -ENODEV)
>                          return ret;
>          }
> >
> >>> On 12/29/2023 2:56 PM, Dmitry Baryshkov wrote:
> >>>> Remove two levels of indirection and fetch next bridge directly in
> >>>> dp_display_probe_tail().
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_display.c | 42
> >>>> +++++++++--------------------
> >>>>    drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
> >>>>    drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
> >>>>    3 files changed, 13 insertions(+), 57 deletions(-)

-- 
With best wishes
Dmitry
