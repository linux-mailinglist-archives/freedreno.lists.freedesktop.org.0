Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9F15177F5
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 22:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF4010F40C;
	Mon,  2 May 2022 20:21:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4DA10F40D
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 20:21:48 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id e189so16302682oia.8
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Hnmgk1ySV+moaLIfrdDLqyWaX7EZfxJDQNVTelHhwlk=;
 b=gydCa1XT3apUAkWqXWGcIv8NATUn3b5OIjEgWQojw1AQGHzMfpZeo9joN/mAtp6vF4
 RATtUVBlgARss+TIibRbANVlifmimy169eXr6DHY32MIJqavLG7QyZWzHaVCqkKbsbGH
 bTsbNB8No7BI70qEq7TAxEiYAo+mL6p0QUQVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Hnmgk1ySV+moaLIfrdDLqyWaX7EZfxJDQNVTelHhwlk=;
 b=7m3xJOeQ3h8rYAsyPQAHhUBFfUCKRtmCnkLkvRqB/c+/or8rJEC63BuELz6CTq6Q9L
 M/TQcJIxsmW6z/sEMCgQYqkIlXNteqHE4HEDuuXD8uR+lhVfDoioZESTeicI4zTjp0BY
 3TpIWUSybW9OPow8cqFsvW3B29u6U5MQSu7IlW0NJPG9fqas5iNaLE6bq6CdRRVp6OTO
 SP7h9LTkSj/zDaf40yPPql/ToaklCUrLno6BDWn4Ubstxf5KqAevsa6jmbxw9rX9FZJR
 g8n4ehAUxTDxMoI4Xp9Ta7pxSlSR5ewgeRFIRhQDnzsxtbAKxAYvR6ytcd7TmOtq1vAa
 3T7A==
X-Gm-Message-State: AOAM533l4Yxb4cf6zKCU7Vss0QhmdRG1sn6lhCS3IVM70/eVziU66S1v
 2dLbnN6Hb9K8lPi5WpAnLCXQtnOTokpdQZKhnnJMUw==
X-Google-Smtp-Source: ABdhPJz7Vn608xLnAEGnfBR/CF4+B1u6SgDOO8wJhOwh61lwA74hFrR7wESd2zWhIRSmS2D8o8Hov5xpX/cGP4R/d9s=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr389482oiw.193.1651522908083; Mon, 02
 May 2022 13:21:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:21:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220430005210.339-1-quic_jesszhan@quicinc.com>
References: <20220430005210.339-1-quic_jesszhan@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 13:21:47 -0700
Message-ID: <CAE-0n53rPrJwK+6BfdeDR-LYmLTrdbvagrQZzGtM34OWtW8aVA@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Clean up CRC debug logs
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Jessica Zhang (2022-04-29 17:52:10)
> Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
> This causes a lot of spam in the DRM debug logs as it's called for every
> vblank.
>
> Instead of returning EINVAL when CRC is disabled in
> dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA check
> before the debug log in dpu_crtc_get_crc.
>
> Changes since V1:
> - Added reported-by and suggested-by tags
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
