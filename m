Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B13F6C13
	for <lists+freedreno@lfdr.de>; Wed, 25 Aug 2021 01:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153C589FCC;
	Tue, 24 Aug 2021 23:07:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF9989FCC
 for <freedreno@lists.freedesktop.org>; Tue, 24 Aug 2021 23:07:51 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id a15so28456164iot.2
 for <freedreno@lists.freedesktop.org>; Tue, 24 Aug 2021 16:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WE+YtBA3gJnr+ACnUTzWBgYKs5rZNaGQyfyCqSLCJh4=;
 b=XR8IPmMsfb9AITUHo8H7bgAFJbyTroEyqBamjYr4/G1KWUAhK9q9B/TaXjlqsz6JNL
 lmuSqtjEAd6pcHjtv9EvIFF0nyacrsz1Op48/IRk4c4mBbQP72dS06JO6BHCq14yNc3P
 Pp9LH7ufBggVEDobtoj8S/HX0fEXtUOLKHkS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WE+YtBA3gJnr+ACnUTzWBgYKs5rZNaGQyfyCqSLCJh4=;
 b=NDtK4iM5p3fjntkDXKuLE8iwgxOHcPAkVtk3TLPL+83425viTeAAZkDylXNcwXIFcE
 LFKpWdnB/g6/4oS6Nhyq9oSJ8SFvGH+zsZg9DBtxqqQVJIYQHZVgeUV5yHutqBh5xB4y
 ugmZfnjz4/MOHjFOjB9LyawoRgPTbiOH7/ea6uYB8tk+/eVSNn5RbWgf5gDLvHC1gjJp
 wG56CgmtN53PCsIrI2BrSOVYqp0oc3O/8N/AFzJeOHDVRcnJlRSA4ceFIK59d/x32kMJ
 rLHCJQHEeJ/5tJirbqQE1nHVSL2TDR5MGLzkgwxxX8QBjEcfb0DdXtohD4hk40FPSk4r
 c0eA==
X-Gm-Message-State: AOAM531gUu0X62k6Racmmvc74vHjxsgCyPSEp5c664XceRLcxHwxT0X3
 zvKVZbS2M/tP0Mj9EA91fohHqkiuImPIZQ==
X-Google-Smtp-Source: ABdhPJyxX8IX0B5Wrn8w3B6jBFxEBvBa121BgjpfJo2yhBwYWIodPfSQP6E/LbENSnINGHJEGzHWQQ==
X-Received: by 2002:a02:ab87:: with SMTP id t7mr1694130jan.127.1629846470676; 
 Tue, 24 Aug 2021 16:07:50 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id b2sm3268002ioe.23.2021.08.24.16.07.50
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 16:07:50 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id b7so28476355iob.4
 for <freedreno@lists.freedesktop.org>; Tue, 24 Aug 2021 16:07:50 -0700 (PDT)
X-Received: by 2002:a02:644:: with SMTP id 65mr3305905jav.84.1629846469728;
 Tue, 24 Aug 2021 16:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Aug 2021 16:07:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VgWm76kb1KwsieTXUmddPgkENtGBQ2UtMzQ38ob+6EKw@mail.gmail.com>
Message-ID: <CAD=FV=VgWm76kb1KwsieTXUmddPgkENtGBQ2UtMzQ38ob+6EKw@mail.gmail.com>
To: Sankeerth Billakanti <sbillaka@codeaurora.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/2] dt-bindings: Add SC7280 compatible
 string
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

Hi,

On Wed, Aug 11, 2021 at 5:08 PM Sankeerth Billakanti
<sbillaka@codeaurora.org> wrote:
>
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to msm/binding.
>
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)

The ${SUBJECT} of the patch should probably be updated to say _what_
you're adding the SC7280 compatible string to. In this case, that
would be the msm dp-controller.

-Doug
