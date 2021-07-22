Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB93A3D2CC9
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 21:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110006E2B4;
	Thu, 22 Jul 2021 19:33:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4A6EDF7
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 19:33:40 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id c197so7754272oib.11
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6sZ7huFu4QsNFxnrBDafBDlbHlNytaLnm0nq8FswDwU=;
 b=WymYdktUlRBmMKQLtjkvozdpaU5i/01Ctu/IIM4hIiKk7uvJhsJPUu24DoxwIWa0So
 0gqburhQ2PKtCgdQEfnB239f1zQZIHbA0RY6AUJNrI4cXXHMnTB1rINT9SSQ7pb3XMWP
 dUMxTtzSoIoVYaLSrWkEi7gBmIhEBfuQ5v4bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6sZ7huFu4QsNFxnrBDafBDlbHlNytaLnm0nq8FswDwU=;
 b=BePOysR62gJCUMAz78gLgmjcqL9vZVf7kRkjmqJpILw8gc+5XVdErQA13bsrOY4Kgw
 VGDH+KewE4XEMELlkcZNFvkKBPaAvHTaOfhrpSkCanPkCLWA2lhpDc7oNjcVqvH7crsB
 qetrDXfCqJjZf9WZjv0yi5ky0gQekSZ89u3kRRbDL/XALXn1BXAmgzYUoeJP2jIqa/LB
 Msc3SxSdBLE7Xi2JJ+W5p68Gu+Nf267Yw0vtv5bqIygGr9qtXkNnAEP8Hp9yH8zc+0e+
 SYgXui4srbe9iqU07fMHpKlY37n+dWT2gjUqhNsqngCx/ayGjDIXZhZVo8N9qIiZsy36
 wznA==
X-Gm-Message-State: AOAM532lsKjz11VLWIkqfsyI/V8ZMZM56S/BSor1yqAir7WcFN0AFBM9
 E7Tu7YCjaQR2bn0jQnfgPGBgZNDFxd9Thr9jvqcAvg==
X-Google-Smtp-Source: ABdhPJwqiAw4oHcAYrmnpJwwnDQOY2aWE8FH1iTkin5KHAN8tJqKjH1PqHmOGxwIdHQS6uWixabWA+4VT4Apg9rNolM=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr1094329oiu.19.1626982419605; 
 Thu, 22 Jul 2021 12:33:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:33:39 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-2-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-2-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:33:39 +0000
Message-ID: <CAE-0n52g4rxdcLbLBSOqoFywUJUYw6MRtBLv_41MtZSo8AGHnw@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 1/5] dt-bindings: msm/dp: Change reg
 definition
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:42:23)
> reg was defined as one region covering the entire DP block, but the
> memory map is actually split in 4 regions and obviously the size of
> these regions differs between platforms.
>
> Switch the reg to require that all four regions are specified instead.
> It is expected that the implementation will handle existing DTBs, even
> though the schema defines the new layout.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
