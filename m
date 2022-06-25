Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D155A583
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 02:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85F510E377;
	Sat, 25 Jun 2022 00:29:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED2910E83E
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 00:29:09 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 m24-20020a0568301e7800b00616b5c114d4so1236546otr.11
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 17:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=LXmmRy87+sIBg3s1n6Pu6xPGWPwzc/E6GViq/zkd0us=;
 b=lXiOewqLDrZ9GvGJYWdlSf++vARR/9prI+nGhrawfJvUGCRagH6zpWOZQkVuBgt42+
 LH6QSY/05hmKOTYL4T5t1df0moaO/A4SykIbgn3s9Qn6bht+RMblaqER4lR1B9IjboPD
 JFi2pCRcPMWEhuT0igcBzJI5u0p44xnq8kpC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=LXmmRy87+sIBg3s1n6Pu6xPGWPwzc/E6GViq/zkd0us=;
 b=ed1tdNzgKSaXzAyMM4gLPnRBytLa7mXXBvD2ZSNzMMf3WiwuxFXoQz2oUAmWHYJGt/
 b4gmWyGzFqZniZCYqbnqOUnWBGZQubpbpAiX3b9TObS04nydj8mIvW/cMBz77+Z+Ko0m
 zuq/EZOmrwVlhjnpoAkjamksLGSOMVB4yZG5BrFZl2biIBsoLvGDN5j6uGvgsrbSuTi8
 cNIWDMIkcyrUcKgfU6hDcDhmwHRHugyXYtcB6hEA6JSEsEdBgfs25xvCQqQc49YFWOXb
 UYI5RUXdmjC36aLGwohGaF9byp4MnMRfKqZ2apepXXkAk74rJyeg1YOK6llngfIk3e/u
 BPyw==
X-Gm-Message-State: AJIora/44ie1XVy/hjn5c1DqX3PcusEjtiDBfpP8rwluYfCycTO0o4h1
 Yzol9XOc7nbZkCN8kd+OcOxWEbzoylD0Cvh6216mZg==
X-Google-Smtp-Source: AGRyM1tT6h5FoFSS2Otm0Dnj/Vb+Oi1EmolLE+5U5um27K2zbfA3c1mSSY/+m9Ri/fOZLT6kHhTxLr+H+FGNwDVJDsk=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr721652otj.77.1656116949136; Fri, 24 Jun
 2022 17:29:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 17:29:08 -0700
MIME-Version: 1.0
In-Reply-To: <20220624235120.376293-1-dmitry.baryshkov@linaro.org>
References: <20220624235120.376293-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 17:29:08 -0700
Message-ID: <CAE-0n530WzC1eAbHdtFn6jgXm71ujy+ENi4Q7pvhN8zd0UpSSA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: simplify and unify
 dpu_encoder_get_intf and dpu_encoder_get_wb
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-24 16:51:20)
> Remove extra nexting level from the dpu_encoder_get_intf(), replacing it

s/nexting/nesting/

> with the explicit return in case the INTF_WB was passed to the function.
>
> While we are at it, also change dpu_encoder_get_wb() to also use
> explicit return rather than the goto.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
