Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BEF4EE4B3
	for <lists+freedreno@lfdr.de>; Fri,  1 Apr 2022 01:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B6810E32E;
	Thu, 31 Mar 2022 23:23:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2441010E32E
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 23:23:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id u26so992201eda.12
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LLB/4ErH2KmNX4icsPtz8gcVd91Ba8xsooM5WCEu/To=;
 b=nO2IsBJyBf/P3KA7s8QuuGM6xFZSrWZovU/MfhkXj0KUNNuFJ3JGAq+Rs/3rX52qsY
 7P5N2AMJME5FGhl9OxAp3JLusS1z1TEB+mUKXGDbBLppxe902V/8Zo5Zc7k50FYB1oxq
 GxXAOnEIWO1JRgUrPmufk1e5oNiZETTlMRBzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LLB/4ErH2KmNX4icsPtz8gcVd91Ba8xsooM5WCEu/To=;
 b=bXjxJ7jSAUm6tBNA/1vq/CqTqmRKgIhnhGVvz46NSiQ5nQfuHJu/+oxmJ5FWpjhIjp
 scXaEKuzLw47nRZe6NQyKsp/4EV3rIICdBbzfgTqKHFGg8vLL6Z51UJK3z9TemGARXnu
 BNCQ44cy1pYERLXcgUWxaqYM6auZDNxpCtzzdqLoox0ziwzn09VasoZI+nONxyBqmCsX
 1jOZFtwwWW0WeKSueFfbAB3pd6cxa4tr8SPrS44war7+3jPGrlGxfAtmqixXxUNSHu7Y
 ckRmtPzcMlVh5piEGfyCnPKkOOhfkNhSazxMhczc5vZsw0vuB9Rqgo8JO9xLUZvWK8Bv
 D3FA==
X-Gm-Message-State: AOAM531gRUEcsolAz5t1/b7HDN7mhsddNgM3p8Z9ZbCjcbgcyKWbxgvb
 J15p+uzgv78b8yzhXcJe0tgN8MwQoY6XU+8M
X-Google-Smtp-Source: ABdhPJzWJk81OaxxIoD8HzfX0yf3zdZXYwpjPMYVwrgqC1hL6DHp9QkAhz1qAPhKeJmB50ixkxL6Zw==
X-Received: by 2002:a05:6402:1c1e:b0:416:5b93:eacf with SMTP id
 ck30-20020a0564021c1e00b004165b93eacfmr18895868edb.302.1648769018305; 
 Thu, 31 Mar 2022 16:23:38 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170906284500b006cc551d6cabsm323218ejc.63.2022.03.31.16.23.36
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:23:37 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id h16so731544wmd.0
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:23:36 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr6394707wmc.29.1648769016448; Thu, 31
 Mar 2022 16:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-7-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-7-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:23:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UX9Mg71EKvgNp_wNG5q7_ugBgVPbcFWFX5XBG+cQCi8Q@mail.gmail.com>
Message-ID: <CAD=FV=UX9Mg71EKvgNp_wNG5q7_ugBgVPbcFWFX5XBG+cQCi8Q@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 6/8] drm/msm/dp: remove unnecessary delay
 during boot
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Remove the unnecessary delay in executing the EV_HPD_INIT_SETUP event.

Tell me more and put it in the commit message! Why did it used to be
necessary and why is it no longer necessary? Inquiring minds want to
know.

-Doug
