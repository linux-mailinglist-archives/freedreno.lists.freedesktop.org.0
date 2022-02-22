Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A24C0382
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 22:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E935010E666;
	Tue, 22 Feb 2022 21:07:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E7D10E666
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 21:07:51 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 k22-20020a9d4b96000000b005ad5211bd5aso8671835otf.8
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=yTWyYubMR//Jgsba7P9C6e+8BGed7UAn8IRrcIATL28=;
 b=EM/gc7DZswlv9F7GcnoSAd+qWrEWCPCbdyvy1Py5xUaiPWiOKdwoetuoclsEBcoOLE
 i03D1Td1H5ewCy/8qce7cWHqo5h6HT2N4cJgr/39jzBveFcGQTJjP6grkpTWdlIwu83u
 zzQQKVyA4t31l4fZoOGzkbxEUJhNBlJKTM0Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=yTWyYubMR//Jgsba7P9C6e+8BGed7UAn8IRrcIATL28=;
 b=xxx9cEoW8abYr+XwUm7bH2PS9xSpoYzqc6i5M0loywp5UvxB0T5j113QuvWxoaLY4l
 xzHwTNdcCiXGZmLuKLMDGqZysoU4ECr3oJUBl2Nj3xLCP9JGM3HTCIOn3ca3FHKJCIBA
 MRCSH1muRi7u4GiBrGiwQnr4yaQ6VPrE35XT1TICkQ8YMZzwmIe0cxwBv9Chq2xKKInf
 ft8ET+VnfYoMFP2kjek/S6w4xn6guiNBkbivhrewmgl0RMsCWTNYruR9kmc5FljoCtAT
 8y2Cqko3pH/fg/OIeOJ815Pyj5GyI/sEEMiUGXOcGIsI97XMqQRkZGo2zte2PhXq6vNh
 NPTw==
X-Gm-Message-State: AOAM53134B6rkPOWsruQM2XlnojFwNDu9lpBClvyxMd0Yt+T8LCMmks+
 thv+3PTU3Hsag+abJmIj7FSxNc0NG2HHAsuXtg7yPA==
X-Google-Smtp-Source: ABdhPJxpUMNXg0CVkf4Zqe1XypjicGyou6NwnzAMp7S4QlSBTuMZu+qAWALcLW1hZMEP0IgnlZifMNj5zQNSwhz5f5U=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr8930738otl.77.1645564070331; Tue, 22 Feb
 2022 13:07:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Feb 2022 21:07:49 +0000
MIME-Version: 1.0
In-Reply-To: <20220221073339.10742-1-jose.exposito89@gmail.com>
References: <20220221073339.10742-1-jose.exposito89@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Feb 2022 21:07:49 +0000
Message-ID: <CAE-0n50cW4-xzabNjb0mHLCgUYj+Mcp3_XxYrYf9AVuZO_9qKg@mail.gmail.com>
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 robdclark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: switch to devm_drm_of_get_bridge
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, maxime@cerno.tech,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Jos=C3=A9 Exp=C3=B3sito (2022-02-20 23:33:39)
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
>
> Switch to the new function and reduce boilerplate.
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

Dmitry is rewriting this code in a larger series. This patch is
superseded by that work.
