Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F64CC8CC
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FC510E34A;
	Thu,  3 Mar 2022 22:24:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF3A10E34A
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:24:55 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id y7so6162364oih.5
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EecN/c73wOIohuQn8PrvwN6Jgs4DeI3pWu9Onrz9zIk=;
 b=D2ku5iFZYEW8dRCUEjIo7CmTFPTLpViWt4NR+wE9RDPu6pnRjpPLzESu6g0DvdX12N
 NC6Cq++YiWxu5cXJtoKnD0lZn/3n/kJ6UBKg4BQYg3A7YjfaI0rBPTYBpWFIu6HtUZN3
 0GqFMncJH0+2TWuEMO2iBFeDGsftk1GFg/8pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EecN/c73wOIohuQn8PrvwN6Jgs4DeI3pWu9Onrz9zIk=;
 b=AhjY7HLde7FbV0L/VWYkn8sj0GxG7YolKiETM04iiEG/9j1QgS3UVq/FV//1pr2y7c
 0lPRHgLf7FEGWSEgzZ/iW3fvS7q+TDJi4kxKytlqfA/yxv2HxCEW36+K8vcEnXjjEZ/h
 KOsYPHn5OHXmxCdQij2DWqflKaJG3wmT9ciiiFoout6Ua54ZCubcghUV7IKL7eiYI4tO
 xiX/+MvElaK6hz0dfSUo0hzWri9Ak5n7ff8S5hXnr2m45IoDLWB8gAQQQlK3deodJEQa
 xy3dVvmuL5+7wWhJwaBTwZ4+jJzRPu7dBoLNpYzjjK5gC1rDt8iiBz6YEV/NK2PBbG9R
 aESg==
X-Gm-Message-State: AOAM530UW6Tm61RyPnnHhXTyR8pjKyOc8pmYUPBHJ2Ae5c8MUuA/bWT9
 edbHIL0tPz5laNBTw+ggQOSgRcvOeKj/9YU3l6yLBg==
X-Google-Smtp-Source: ABdhPJw3s6IiTQazalElWt1zQLZWoj7bqeupLQ/GlHpoXcCWZwMKBEBZz4ZLID/hc55EMLVOcGr2F5uBkONp1NDZN1U=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6640139oiw.64.1646346294538; Thu, 03
 Mar 2022 14:24:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:24:54 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-2-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:24:53 -0800
Message-ID: <CAE-0n50_o1jHOj6OFVOQA=-aXXMsC35ZTtNDxWQa8CsPuQP+qA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/5] drm/msm/dpu: simplify clocks handling
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
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-16 21:55:25)
> DPU driver contains code to parse clock items from device tree into
> special data struct and then enable/disable/set rate for the clocks
> using that data struct. However the DPU driver itself uses only parsing
> and enabling/disabling part (the rate setting is used by DP driver).
>
> Move this implementation to the DP driver (which actually uses rate
> setting) and replace hand-coded enable/disable/get loops in the DPU
> with the respective clk_bulk operations. Put operation is removed
> completely because, it is handled using devres instead.
>
> DP implementation is unchanged for now.
>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB3 (sdm845) and RB5  (qrb5165)
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
