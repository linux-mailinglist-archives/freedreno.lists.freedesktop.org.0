Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC0940F094
	for <lists+freedreno@lfdr.de>; Fri, 17 Sep 2021 05:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA35B6EB51;
	Fri, 17 Sep 2021 03:54:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95B66EB4E
 for <freedreno@lists.freedesktop.org>; Fri, 17 Sep 2021 03:54:08 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so11145225ott.10
 for <freedreno@lists.freedesktop.org>; Thu, 16 Sep 2021 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=d5KyeDq946nuEeP72I+rCwfJA6i1ndu160NKjlUa2U0=;
 b=mt1KgHCUrzi0gHUfIAMUuM50Mo8Ku7RFyKsj1qvnM2za0GMZ7eHfB+N2t9eBxjt7vS
 MVnIxvn0Uz1RI0WYgj1ULdJJHLoi4wAHt2ST37m5sfn7bGAXLpGsbL/FULbxhsq2T37v
 DkIQseFnkfaed/TqEmvIaV7jHFC+81p/zsZxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=d5KyeDq946nuEeP72I+rCwfJA6i1ndu160NKjlUa2U0=;
 b=WVEkj+ZHN5dMx5agU5qDLRO1gQRqGT/pnXJhUcuXOitUwlpqIO2XF1Nn9qr8xUecKQ
 kqWV/nE/bIUlnXMYYDzVrH1GXGiQ4ZefQJvKpdYkORP67NR99A7thvGU5ZAEIu6e+2r5
 rU9fs3i1HX/yrsMhw5TDgbxaL5UN00XIAxAveSjkkP59OEXcO8NrX0JgVANUhTmBp4xA
 RrjBxw6t8mJp+DozJfYTn+VrUj/1H+i0H6BZPaZYhZnTIntVYNpSWK1sRVvICpyjMsy3
 B449v5Ybz8tbDYd/joMtWtyD7RVpVpLnSjR+vO4s62rsH06UMC8Kym8ObXm6rSLk948d
 PWdw==
X-Gm-Message-State: AOAM532nXfkK4LmcNO3YmXTiXS53hbmO8N/oAjM6r1+yITf992JVfSaz
 k4u00lYkN58EBDhaSjFuOPYCLakRyiQmQoZhEujTMg==
X-Google-Smtp-Source: ABdhPJzcbhAQp1Hj5R9izqiK2ZL89sVw4r1RXvzPY1p8ELBpYgolJMvLXTBcI+y11f9ZXleFHZ3dGmm68Ou4VgvCCb8=
X-Received: by 2002:a05:6830:1212:: with SMTP id
 r18mr7334996otp.159.1631850848045; 
 Thu, 16 Sep 2021 20:54:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:54:07 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-10-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-10-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:54:07 -0700
Message-ID: <CAE-0n504ZgOW-=3_DgPy+rFxNnkYjjp2U83X=K1ZMne-cN0ZPw@mail.gmail.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 09/13] drm/msm/dpu: Remove useless checks
 in dpu_encoder
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sean Paul (2021-09-15 13:38:28)
> From: Sean Paul <seanpaul@chromium.org>
>
> A couple more useless checks to remove in dpu_encoder.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
