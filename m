Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF63D2C6A
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 21:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B58F6EB91;
	Thu, 22 Jul 2021 19:08:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE706EB3D
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 19:08:04 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso1496444otu.5
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 12:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=scp+1rc24jdnxfL7eF19kK3DL+3J9gDohwlrgvGebZ0=;
 b=Kzg1+v+ASBz1l6YFdUYjoIJ1ycL30KyMVNUxiZbSsy/9xwgH7nYvbx0C2luXa/RK6v
 hHxo0L2IjE8alE4iJAA9A3eGelmKnpSy2X9ID5+zVi+2oucyhkHRSZFjbrdICtI1EGtp
 EERE2M2fk6+PWXVFGXH8veERzxrjmQZPsQdMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=scp+1rc24jdnxfL7eF19kK3DL+3J9gDohwlrgvGebZ0=;
 b=qsUTuus/8rVELuYiJ0GaICf55bGkyDAoBrgx3mCoSkoN0/SbZXCjNsmT9d0r72sGyL
 ndXYCWh0WKsAHaE5Uv4no2uosz3iERlAPEwiBK2anyc+hdFhQSTXEFkD8m0ag823XJyI
 qZ0GRsFOVU7y+TWH3BLI3x85LXAEr2sA6SEYLi8Geizc9NfoV2FJDmz0fTU6e+CViIQj
 yZX4NfSqv2S2Ng54Lz50G9iumdZ6KJJB9D1kp7TcbTuYoPj31Teq2xcMpXd4Vmzuo5zF
 VKAqdqqw+6pQCIjqUeEGGMiCqu8YqBxWGnn9j02ogNW3YM1ASEm4gFJE2oAUGw6nUFJn
 pf/w==
X-Gm-Message-State: AOAM533BFGB/Q3vgvkHc3i1n2D0h2Do+uZW3fuvHQzQd8b4y7vCey8th
 0mlNzSiwddQLanYB/k5kSMnDDu0bjHSLR8QRrCK1ZA==
X-Google-Smtp-Source: ABdhPJzKPYX4blphNqYsrnAPfYagc8nG5lxdFDRdRvNxCcZa50YCfFPtbMdNhV6GjS7SG0R1yOQPOpaxxJ5vYACZZ0E=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr838011otl.233.1626980883940; 
 Thu, 22 Jul 2021 12:08:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:08:03 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-4-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-4-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:08:03 +0000
Message-ID: <CAE-0n5121VG4V9mqw6UTj2T4DrN66r53aCONMJr4bqe_niHz_w@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm/dp: reset aux controller
 after dp_aux_cmd_fifo_tx() failed.
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:03)
> Aux hardware calibration sequence requires resetting the aux controller
> in order for the new setting to take effect. However resetting the AUX
> controller will also clear HPD interrupt status which may accidentally
> cause pending unplug interrupt to get lost. Therefore reset aux
> controller only when link is in connection state when dp_aux_cmd_fifo_tx()
> fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
