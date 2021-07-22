Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D943D2D83
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 22:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF6D6ECCB;
	Thu, 22 Jul 2021 20:16:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A056ECCB
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 20:16:46 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id u11so7960710oiv.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 13:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lGBGDn+lOFNngvvH3L1P75ECn+Xc69iUtWDhuizhmRk=;
 b=WBVq6pEiIdZU+GzhLnjTWPaJtocMzNL82BgTggr5nUPLGGS8R8sX+BOMVEApmfkRw9
 8Y56V3g4r4I8SqKRkOSNP4326oh1kzb+1PuACxmp6HoAfAsgtrdlAJ556GV92PT7exzL
 McADJKZB9Lb+pcbQrmy4bQpGWLhDQQptnnwPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lGBGDn+lOFNngvvH3L1P75ECn+Xc69iUtWDhuizhmRk=;
 b=RXnxnlhYawT+wJgrMQvZMJFNhLcPy1ASDrEYN/oA5yESmV7ajURHPxKWyfeUKS8Gy9
 uwo/fdoHaoWiq/WHCCEFzyOxQBWyDeLs8UXA2c+pCUaqE090Q7GHfA5lCdPsc6A/4v+T
 hSGeW5Tyl7dO2UXLrIt4De8bfwx1Ex6FRESAmKCKOw9cH6KROgvxyVQjbvt3SudzVUFk
 FpkMJ+B/appzG5OTMuozj6LEF6WehadYKrK4Zvfz6dE9A0GUjpSITqssVoLHQIhGMg1z
 GLmZpHlGocwYBDzL2i0zDT2hBLwT/Ry38ej90R13lTavA4cor51HUxJSZgHTKVZXKPMQ
 JLeg==
X-Gm-Message-State: AOAM532+hUW6FLj+kcHhugf668NJt8FP9nA08enVOmu3lQLLtTSpRSgG
 5CPOntZzMhugEgD97BwtSiHF4cg2+AbuCf8tQaf7XA==
X-Google-Smtp-Source: ABdhPJxjTaEbkRrBN/FqiRS6clBxB0FcklPeiI3sKW/kjDjrRLw/EbOnNhQjT9Uf5BJl9SFEVjqPUChYPfrbRGjQLhI=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr1175746oiu.19.1626985005662; 
 Thu, 22 Jul 2021 13:16:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:16:45 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024434.3313167-1-bjorn.andersson@linaro.org>
References: <20210722024434.3313167-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:16:45 +0000
Message-ID: <CAE-0n50iOP5K8Q79ShmLowWErxMFRdYZRg=hDszYn8O4OJaz6A@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Initialize the INTF_CONFIG
 register
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Vara Reddy <varar@codeaurora.org>, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:44:34)
> Some bootloaders set the widebus enable bit in the INTF_CONFIG register,
> but configuration of widebus isn't yet supported ensure that the
> register has a known value, with widebus disabled.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
