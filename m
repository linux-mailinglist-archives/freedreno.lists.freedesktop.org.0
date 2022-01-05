Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160B485C0A
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 00:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8686B89C97;
	Wed,  5 Jan 2022 23:06:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E4A89C9A
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jan 2022 23:06:46 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v6so1142860oib.13
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 15:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lU9azqMMeh6DbnZbcl2lSC5dKYwkqe50hupc+vf9d2A=;
 b=Z9FbV6j7G6xEZbBAvkwVyHKg5BQt5GXvM0+SeRVFiYv6O2H9oIk4aB0sqpDVrsPbiH
 ypCSlfEsuA1No8hWDK464tQClc9ZqdceuvmvlX6LwjBNeSHUhvWTknpTJyCoO1TTvOtN
 gAnMT1s1Pwz7ZjXMu+PARjQiTN0MHm17V1YjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lU9azqMMeh6DbnZbcl2lSC5dKYwkqe50hupc+vf9d2A=;
 b=xyeROe8i3vvVSXoZ+3Ael6Y8YqMa2g73lajzxmo8NMS6yLRwt4Okfwkn6/IIpnr71Z
 3TsUCpfmo+R8N9lbgPHFrpQFyLCNhzSeWq+9S686vAGGdny+57oKIQcb70mjtoSXxOGo
 g0oruWJIRlBBKoAtBwq1p7wr8LNu+jOw0XBqOXFlhxfoX3SUu+8zjU5EhYrNXeSsViOx
 zzv60rLy+M2EENMeJhXFDItHuBGEqeaRVqlgKZ4rHTeXIs2tUi9NJry7DdrIHiQtD87l
 RqgnJCfxbiBceK6+aFU/Ej60gdLcWiaQ72uF/NMPZpSJgVJAx6PYTsRXxmREhe8zLIaX
 hSIw==
X-Gm-Message-State: AOAM533Gs0x1jNyhx2vDRgXraa3Sgjw4qdVPFWyw1+1uW8y+f+HOzWda
 FLX4NwgPqgvF3X1jOqzptBiGi4BHoYePZqFroIiJ5Q==
X-Google-Smtp-Source: ABdhPJzAcJpvSF5lMXKo34QRJSTgW30u7+pLOgzDBuej/puQhjouq1bVASLz+ltH62MKR1xkor5WM7U9YV0dxZ5iFqU=
X-Received: by 2002:aca:a953:: with SMTP id s80mr4308576oie.164.1641424005319; 
 Wed, 05 Jan 2022 15:06:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:06:44 -0800
MIME-Version: 1.0
In-Reply-To: <dc2d6f535379dd38a5e3f9ba502f1f2b3d1f56b7.1640201523.git.christophe.jaillet@wanadoo.fr>
References: <dc2d6f535379dd38a5e3f9ba502f1f2b3d1f56b7.1640201523.git.christophe.jaillet@wanadoo.fr>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 15:06:44 -0800
Message-ID: <CAE-0n53Rcs+BGgwFy-yB2zT+s=WoK94cZJ6yHYE_od=6K6zbzg@mail.gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@linux.ie, 
 bjorn.andersson@linaro.org, daniel@ffwll.ch, quic_abhinavk@quicinc.com, 
 robdclark@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Simplify dp_debug_init() and
 dp_debug_get()
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Christophe JAILLET (2021-12-22 11:33:47)
> dp_debug_init() always returns 0. So, make it a void function and simplify
> the only caller accordingly.
>
> While at it remove a useless 'rc' initialization in dp_debug_get()
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
