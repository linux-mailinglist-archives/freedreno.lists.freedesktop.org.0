Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024725388A7
	for <lists+freedreno@lfdr.de>; Mon, 30 May 2022 23:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A5010E0D8;
	Mon, 30 May 2022 21:49:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ABD10E102
 for <freedreno@lists.freedesktop.org>; Mon, 30 May 2022 21:49:33 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id 199so1752555qkk.0
 for <freedreno@lists.freedesktop.org>; Mon, 30 May 2022 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oXaOVjxu9BRXioIvJGUPeph15IZ7f+RIDq16BIHjmoA=;
 b=MXfdGkwALQnjWH6rK/1fSXDcuWOUo9C8ZG2sO9wNr+MKKvRiwjciQ+mEp7fq6ZKKqa
 JiGwltb6kFwr13ASse+qgNwZCbfGcmKHJxoZLefcqsu1qhJfmzrT1+t8yJM+/YPxJx1M
 kXIQUt3oIqyISHEgwiqR1EqnwC3doPe+j9SbWXoAY3vW7WOYYGQhvNJ3FSrlS9jkb/5+
 XGOKTUgJnkooU8bIUvkgV0Zibj2hN4HTtvYI4YTKbQKaRDEEPGsM8LqZWUzpVTR8WBOz
 sMEvIlx182Rg3pXShcGXIvjgCMGFOqWUkCtm2qDhMz6tOKceqZEPvRXb6fxxhjEI4q0E
 N0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oXaOVjxu9BRXioIvJGUPeph15IZ7f+RIDq16BIHjmoA=;
 b=uQwXeOABAzLt3zp/NQ4wlGaD9/UYOODdA8IdhoOTwud9LArxbrplg/m1ZiCHQRx+Ye
 JKl7smXwwOsRyr134nv/DnnEuslTW/u+DKCa4F8uPApb2NITnrTnsVyDMqpDu+jcoL6u
 x1qafFJ8boz2mYxsYCqapba3TxWoYH1144BEVXhHdmjT7ievbzzCatO/icXaBWC2JkvF
 dFpjn30hPLZoJWBAvYrBkyz4PcXsr3Wmta6ZTIXCGihYXtqFpB0hZenJW1ykWC4laqox
 J9YCRmu4DGLsATuqjzA7Dj3djVSSm1Kz+AiLafeFbb2s+yPvGiDmSb+J/ytz4qERdMNI
 cdqw==
X-Gm-Message-State: AOAM532lmHs+qfcYPWBObQ+O/0SoHglnqI9LgH2JK/vCFXCbAFeiZm92
 nZXlYV0wRGGnCjmqEWt4dW8sWQWm/OFE1IfkEanC9Q==
X-Google-Smtp-Source: ABdhPJzh9WsdzR5//egtXV1XikapFrTINZPmX4fFRgsjAj4mQhfoLHQ1FXuKd2ZeCPj/PcYntJhO1dwhQVQuvS6qnJQ=
X-Received: by 2002:a05:620a:414e:b0:6a5:8dec:57bb with SMTP id
 k14-20020a05620a414e00b006a58dec57bbmr21169409qko.30.1653947372228; Mon, 30
 May 2022 14:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 May 2022 00:49:21 +0300
Message-ID: <CAA8EJpoA2VOO28tzT24fzYseFg__thXHcuXHiXGX-pwxGNz8HQ@mail.gmail.com>
To: Haowen Bai <baihaowen@meizu.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix pointer dereferenced
 before checking
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A nit: patchwork thinks that two patches from the same author with the
same subject are two versions of the same patch. In future, could you
please send such patches with distinct names? No need to send v2 now
unless review shows other issues with the patches.

On Mon, 30 May 2022 at 10:33, Haowen Bai <baihaowen@meizu.com> wrote:
>
> The ctx->hw is dereferencing before null checking, so move
> it after checking.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
