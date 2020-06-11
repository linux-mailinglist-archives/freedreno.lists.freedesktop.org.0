Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A92A1F6CDF
	for <lists+freedreno@lfdr.de>; Thu, 11 Jun 2020 19:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CB46E929;
	Thu, 11 Jun 2020 17:36:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EBD6E929
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jun 2020 17:36:33 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 25so6104331oiy.13
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jun 2020 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jrCOk7vsq1IE7uGd57AzoLSP1ALvkvtrfTao0LV5h+4=;
 b=PjCLvAgUk17O5rGvaRSULcAXIKgAeNPYfQj4+nc/jEDzvDt79xSOJ9y90gnyDsej57
 d6kv8CTeKJDW3tgsSbIhUH7B684pz0QDJS1PAC3ELlVYxup3lQZTLhIejtwsgQQWCbBm
 whcIjLz3Q4YA0rJbpmM7ez8cXb5PsSzB5hLw90jsFbfweSA0DgsHHTj0a3UpXNkTiXsK
 FHCNP6NH+PXkniJe6PD0IrUkKYLC/AfJYgTbByfESpbB7Eh6RWa3w2B8JexkbcgtqPsr
 BKFM8ErfoR7rUDwZJTpr2FypGZPTKX734j7VFNPPb3SuZIWCuP8HJJ3I2VIKp5nax4vd
 X7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrCOk7vsq1IE7uGd57AzoLSP1ALvkvtrfTao0LV5h+4=;
 b=EgRqrTnqoE+06HTa+gL203gWe4Xv+af/JhrBlMpMrsuDHP/Slx1F3XtnLGLabXgDtI
 wKeDEj4KOo5U1I+Z0C+juaGPTphAsiJzy0uosUuZwq7+OhuFTdkW7HwjvLbfc1WNMVXn
 +ZALOncM0tWIAgfNxjyNGHXknG4vBEvaK7GfCFIQQANSKGSZ+iYPJbb1c9JZK24XGtlQ
 yKPK0IRCDtrNFcUV2seWs5TAx4jqkD1L55K6Js64q+lAwwQvjJdWdIhvEhi52WnrwNc3
 Hht2l0sG4TDTHC1IxvYEXyBW2JzVt1Nrz4AOuVGfCYZ83SrGa8TDRyc5wEau6l1e/GVQ
 MosA==
X-Gm-Message-State: AOAM531WAqJhwIHYwUCva+7m0IQn6+atU69Sn+CPG2CV/dZn/UM3uFLe
 3A8ABwXMjvLtrMi4Dy0Ocof9AcVxuCMpPpNZ9qU0DQ==
X-Google-Smtp-Source: ABdhPJzBOdT+Dsmoz25Sk2BkH7lQgOo+1veTThTfIOcpemZoPqBRr3Bokq20sHjcYAD8NriytacdHguqDLTVuu4eLUw=
X-Received: by 2002:aca:2108:: with SMTP id 8mr7354040oiz.10.1591896992417;
 Thu, 11 Jun 2020 10:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 11 Jun 2020 10:36:21 -0700
Message-ID: <CALAqxLWnXD4XzGU=7mkLCyAkN1ONB=NRne9y8PxPWGZg4hgX8Q@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: request for display color blocks
 based on hw catalog entry
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
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 5:55 AM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> From: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Request for color processing blocks only if they are
> available in the display hw catalog and they are
> sufficient in number for the selection.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for the quick fix!
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
