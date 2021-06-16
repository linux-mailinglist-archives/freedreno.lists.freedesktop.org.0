Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D303A9E73
	for <lists+freedreno@lfdr.de>; Wed, 16 Jun 2021 17:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5650689E86;
	Wed, 16 Jun 2021 15:02:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE3289E86
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jun 2021 15:02:23 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id c9so2995203qkm.0
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jun 2021 08:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j51VtbWEsPmNthXDSqqlA/0JAvr0xhkR2POpSAUOx9c=;
 b=ZUIi2qzqYGHwJx+79Fc4944r16x9UMQqqYLtcBz8HCOT0nsZkxfGcmRp23lvyNfAP+
 2knAodSGIE5+PM0wcoqn9rQAvNIbG2+5Sas5+iUH6G+5iioPe8sGy4aqBr4h9MHBFQLA
 j4DhsbCGODeTQCqVCt1gM8KYJ3xJ2R6oiax+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j51VtbWEsPmNthXDSqqlA/0JAvr0xhkR2POpSAUOx9c=;
 b=RF8U8usfUgA+tBbqTtOG5NP+gIZB2whxHtY8UtlU4rRXhtXo5s9BXzzb0KZQuaWwHe
 r4x+N/Tgds+PEZYmI1R/G1sV7zaambGecmJ5t62zFzm6ykSh4UroRJZnJI2Mj/CL8FS1
 VguuWntIAkKo+8TYYpJdwmfJ8Zfjv0EumwBHuHWYMpWWjCXSlRkuzRb3GomEIIXV8jNx
 b9WstB0mVoORY0jK0TNulqphAXufHbn69RKKehxoZH11m0y0ektpdMeww5xVJJMbEWzc
 lq5uUBnbz38PJk9XiMOvj+4YS6q0Zt16PPN2FCGzcdQzD1DLfUHj43WWNIe8WznjzqQ4
 z46A==
X-Gm-Message-State: AOAM530Nw+s8spAKXjRyTDgSJdCqKSgHzBdPs3bm0iil22d1d5qtMLlH
 MpvA3UksJqiIZo5qjAYRBo7c5aYY3auGPw==
X-Google-Smtp-Source: ABdhPJxcqn95HfY9aj4rPw2rWlHotvD/TuFEQmvmxt9qfkiPKDZCwg4WyvNaaxv54Lv+aeip2TxMKg==
X-Received: by 2002:a37:a74b:: with SMTP id q72mr453701qke.59.1623855742020;
 Wed, 16 Jun 2021 08:02:22 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id c11sm1375468qth.29.2021.06.16.08.02.19
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 08:02:21 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id m9so3477084ybo.5
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jun 2021 08:02:19 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr207252ybp.476.1623855739461;
 Wed, 16 Jun 2021 08:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <1623499682-2140-1-git-send-email-rajeevny@codeaurora.org>
 <1623499682-2140-6-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1623499682-2140-6-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jun 2021 08:02:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2_LJkXX-9v2ArSspKHy6PABn1E-hkCOeT=Dk5R0CQ+Q@mail.gmail.com>
Message-ID: <CAD=FV=V2_LJkXX-9v2ArSspKHy6PABn1E-hkCOeT=Dk5R0CQ+Q@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v6 5/5] drm/panel-simple: Add Samsung ATNA33XC20
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
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Lyude Paul <lyude@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 12, 2021 at 5:09 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> +static const struct panel_desc samsung_atna33xc20 = {
> +       .modes = &samsung_atna33xc20_mode,
> +       .num_modes = 1,
> +       .bpc = 10,
> +       .size = {
> +               .width = 294,
> +               .height = 165,
> +       },
> +       .delay = {
> +               .disable_to_power_off = 150,
> +               .power_to_enable = 150,

As per <https://crrev.com/c/2966167> it's apparently been discovered
that these should be:

.disable_to_power_off = 200,
.power_to_enable = 400,
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
