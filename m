Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096A4E69A2
	for <lists+freedreno@lfdr.de>; Thu, 24 Mar 2022 21:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887D310E268;
	Thu, 24 Mar 2022 20:07:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6377310E268
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 20:07:44 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id o64so6029538oib.7
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Cg3NylWZJ/PElbZt4b99/mDNvvoDZp7ffKlCSxaDUYg=;
 b=chW8YydqlNUXwkhifh8g9HI1cQG2scXiQLAtd/9C96Ro0YahW6RUj3JdB3ortjEQ5D
 XYIEzngiMK0LVLardc9TBW9wmke8bxwDrQw81faArJaoCdNc5/aXcNZO7YTasnEXsj1d
 rNu4CXlzwVi1omwO68IOCQInfhnTIfAIjPtgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Cg3NylWZJ/PElbZt4b99/mDNvvoDZp7ffKlCSxaDUYg=;
 b=RSfEuKYQ5NQuSLr1BjsmmfEzDo7Ds8GzbqTGapgPpePEpQTD0bZK1dZ6Kp9lKizHN+
 CTrz8b5giQ9GbJVLksd8/ovaFHBF0X5gdHN2rTvK+VrR0a3Lc4P07dIKuL6NNKYJYdVz
 6I+7C7Djc0BdvIwpBSf7YrDXSf/iEjKi+jssniESYegOIrFh8wyIoim0DN2rJOCR/Y7U
 i0eY+vN9+urJvDl1hdg26bnpblngFqfHaFGk4NvstWRtJjUCmZmfcPxyMJ0JEbaQP6TK
 RsCOE3/vOqH/6+R17jz1tyABo2mTjkxEfu0NLZ2X9fhhtzVm4gHeN9fb3tHXPNARbXkV
 VP0Q==
X-Gm-Message-State: AOAM531aHXlgSLkPMVv0paI1wMllKCTq0ppWq8/S6Zga5zGythaNkZk1
 N3TOvhjzTYL5SHuwELwmOqJnAMw3FoG1/x9NrZ8Y0w==
X-Google-Smtp-Source: ABdhPJxLd9283LWH/H+RVJS+GlWfRyT8dqeb5nlwjkad7sBHwIlXo5+tm7x05Z6jNmDfcbRKWPNOiVp0XJG/1vESqBQ=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr3297126oie.193.1648152463729; Thu, 24
 Mar 2022 13:07:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:07:43 -0500
MIME-Version: 1.0
In-Reply-To: <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Mar 2022 15:07:43 -0500
Message-ID: <CAE-0n52bf2VHfC+a58+P88bG2WiwDZrFd0hzAPcSFDNC_RYW8Q@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dp: drop dp_mode argument from
 dp_panel_get_modes()
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
 freedreno@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-23 03:35:44)
> Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
> case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
> the dp_mode argument. Drop it completely.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
