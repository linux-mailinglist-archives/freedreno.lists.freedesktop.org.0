Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F9C43DB32
	for <lists+freedreno@lfdr.de>; Thu, 28 Oct 2021 08:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4240F6E7DD;
	Thu, 28 Oct 2021 06:34:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C886E7DD
 for <freedreno@lists.freedesktop.org>; Thu, 28 Oct 2021 06:34:32 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 x16-20020a9d7050000000b00553d5d169f7so5514830otj.6
 for <freedreno@lists.freedesktop.org>; Wed, 27 Oct 2021 23:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PRgWCRCX7AtwJtD++BtDcASmdtlLCky0vNsp17MLlCo=;
 b=em7rMEP++cDD6gn1cQ27hJKr0PZKndl+gMTj5cIe4wcUsLq1UdZ258NJ827zstWX79
 EmDvUqjsQQT7BlzCpY13u6u29OM3jwkeYBAvmvdv1rvMxknpaUWbppiNXIueAmOAvjPz
 LhbvwuU3B7empW598hrp22LTfyfUFg6buyuU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PRgWCRCX7AtwJtD++BtDcASmdtlLCky0vNsp17MLlCo=;
 b=zhzbZnUxK+Fn8Svdj9EHpguorJSpuv8FqXneCkcV+jpG6Gr9xg5YKdNw06gfMH07RV
 fIzyRVN2wH9U3dr/eecKihhbMZH6Mucuotim7yavKcfIGitc4nm+Knt33DzMn1SMOPld
 KjNv6zK/xr4om+Ng5WsMbEnvVe1wWsUfiHQmhLUzhUc7Dd+byAVaWmh0NJA0cQxDsotb
 NGoD6L0oWVMKz7/iI8kJ6dYD3i7rWML1NEhUPnm5QjJSd3nkVXI9LIb3T4KJ1uwAaYWP
 KHSk/Mo5ALENWBz5xkD3yEihHioZ8SbFRRA9fzU7q1iilMqxUsbyJAQ0E/PGe74cSMYf
 x8uQ==
X-Gm-Message-State: AOAM5321I3CC/6E/SoEOsxG0r3Vjag9In+Oh+7wcI7KLMJY27HzwlupF
 95TblLU+i7yVP1ucG9UEnC30oNsLDeW09eGBYcPciPUcX40=
X-Google-Smtp-Source: ABdhPJxWcOa3Xkk6Hw5Lr0txJqbDDMJPmnfEf8oGlsnZUqb3TVVAZTrS+4RFqV0jimxB4yUnK+VWxsK2/WZ+xbzr3qU=
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr1863400otr.77.1635402872221; 
 Wed, 27 Oct 2021 23:34:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:34:31 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-6-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-6-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:34:31 -0700
Message-ID: <CAE-0n53U0JARXjzt=Hr5kfEdEHJR5AFKYx796V7LGbn6CVnVig@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org, sbillaka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 5/6] drm/msm/dp: Enable ASSR for
 supported DP sinks
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

Quoting Sankeerth Billakanti (2021-10-27 18:54:47)
> The eDP sink on sc7280 supports ASSR and dp driver will
> enable ASSR in the source hardware. The driver needs to
> enable the ASSR field in the DPCD configuration register
> to avoid screen corruption. This change will enable ASSR
> if supported in the sink device.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
