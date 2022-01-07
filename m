Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3977486F2E
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 01:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC38F10EA32;
	Fri,  7 Jan 2022 00:55:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8E310EA32
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 00:55:00 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id t204so6137191oie.7
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 16:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=0pYB0RbUQb+ZQoPYrHQZu7/mbDpmz+DgyrT9hvQMHLY=;
 b=Eiq2sMVpWWW2opwh1s3oSD+oaO/zGcn7FnlC2rBpA08jcz+kUVeafqwvNnJuMyuUqe
 9uGs/R9Fds44whRulyvtahDBqPz7smp88bIRpxpAz265T29JGxifo/nt/hHjFROtlIDX
 DsN9DptDMweVHlZ/nJxP1DklA36xVnYoAXjMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=0pYB0RbUQb+ZQoPYrHQZu7/mbDpmz+DgyrT9hvQMHLY=;
 b=5NrAXHUStZvAqW8K6b/NqGdqDX6VLVjIckIX3uezdiGB0zwqDoe0DXXzjUjyZroSe4
 1sKV5Irkyn/9Jm8hzj3gwjvupp2j7VzpQr3ZNex9AVIW1UBR2OiskEmtD9E5FV5Kzmh5
 ubAyGc2zyF2/ycDVS+GqpkjK8UL+3AwkDl481gqHZX6L0KjCdy/JzsjqPDfSH5ugAsUz
 WOFsWh9LYHuzK9bgUsZaXgzkqF87DKSfq1iFdLl8cBof2unFpztgEFhatgTvqCAFIoLu
 cS/AVO9Om2PKvKQfccxwhfOhCYfVWJjpfi4YoNb+8o9UrIKAGs9a7ieRJqi34Hy2gR5m
 V9yQ==
X-Gm-Message-State: AOAM531Xrsnlq27Fo4jiTJzmJ+ff+hHWxnqP/KtgcH8v00nXn3M3W4Nz
 4g3KzrivkFYXY0roQDnZ1/CMzuFz0r5rQe9ZQIWpKw==
X-Google-Smtp-Source: ABdhPJzYKjK4yEo/vzFZbZ8eeAgkwCnr5IK1Nsn86Bcg+g6fm4a6GbPnGoQH9r+nY1PYdtmE7DycRXW6TwBE0GwCX40=
X-Received: by 2002:a54:4710:: with SMTP id k16mr8059411oik.32.1641516900087; 
 Thu, 06 Jan 2022 16:55:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:54:59 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-3-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:54:59 -0800
Message-ID: <CAE-0n53OWdu7jdA-d_xr7LJunkZycjQE78Md+457_8=88uo2-Q@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 2/5] drm/msm/dpu: add DSPP blocks teardown
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:10:28)
> Add missing calls to dpu_hw_dspp_destroy() to free resources allocated
> for DSPP hardware blocks.
>
> Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks in dpu driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
