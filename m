Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677C320A829
	for <lists+freedreno@lfdr.de>; Fri, 26 Jun 2020 00:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAA76EC1F;
	Thu, 25 Jun 2020 22:21:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AEF6EC1E
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jun 2020 22:21:29 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id m21so499369vkp.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jun 2020 15:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HiC4BtBcvypNi0TT+uKmaMyQomfNIooMQQ9SMeSvJuE=;
 b=hQeh5IvCT9+c5THqtc6WWb2AHU0aYgWF5ReZ+qFjCCpfIqgW19aaZnB90R90eRy0XI
 aqqBosgZeXnP5zp2JACRzpjqBvLLkUVWfrSy6pNESy7bXlN8NAGyTcPtiDfqcYQkAXxh
 Dtax+BMxyCZeltX5LaizJxMHd1OeZVgKaCSgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HiC4BtBcvypNi0TT+uKmaMyQomfNIooMQQ9SMeSvJuE=;
 b=V4CtWFyvO7sx/Eh/dFztbRqN8c7UxbrNZFbADsfXlB+yKbQbTvgEP/XRT+QpNiTQhQ
 5fmGjj8eO8YERDtKzXKaLMqMlhLIPW/tRKuInwbsVBhKXqOGfwkfy4CdqFnhiRz8aiA9
 aVfNJKZm1RqWgdjKFRLTHq5sLkk/pSsO/i5LAh5UX6BaJeytN2nMzM8Ta4LU0ghBLbTV
 mhhJBC2ApoJmeHuzzUqZcAnY7DZQTG6b81q7fnhk3aYVY58PiOQD2LUzrFWAPKnEcf5p
 QXI5V7IKsqYygE7DcKc2nVmaN9Phy6CICzxGCqM3MGTPbqinfM8swKbmAxn3xzLChtuA
 3gcw==
X-Gm-Message-State: AOAM533nhh3awyxVADMtnQ2o0b9dlx0JoOMrFNzPgAoFa/RYsQb2vqjZ
 aqQgydDJWLE44ooLYwc+cAKi5HRwRGs=
X-Google-Smtp-Source: ABdhPJwZoS1+zMotKUAhtjPdnO1YfJuIHojTyQU7syUOlsUnj84IkcGCEJr3edcAR5qfEr/FH1O5LA==
X-Received: by 2002:a1f:c8c5:: with SMTP id y188mr7556vkf.67.1593123688599;
 Thu, 25 Jun 2020 15:21:28 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id n12sm2861699uap.8.2020.06.25.15.21.27
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 15:21:27 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id r5so4442440vso.11
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jun 2020 15:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:20c8:: with SMTP id
 i8mr347826vsr.106.1593123686688; 
 Thu, 25 Jun 2020 15:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Jun 2020 15:21:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
Message-ID: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [v2] drm/msm/dpu: add support for dither block in
 display
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 25, 2020 at 5:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change enables dither block for primary interface
> in display.
>
> Enabled for 6bpc in the current version.
>
> Changes in v1:
>  - Remove redundant error checks (Rob).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 39 +++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 63 +++++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 28 +++++++++++
>  3 files changed, 121 insertions(+), 9 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
