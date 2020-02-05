Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEEC1538F2
	for <lists+freedreno@lfdr.de>; Wed,  5 Feb 2020 20:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3356F93D;
	Wed,  5 Feb 2020 19:21:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7BF6F93D
 for <freedreno@lists.freedesktop.org>; Wed,  5 Feb 2020 19:21:48 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id b79so2105009vsd.9
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2020 11:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKWhr/qeopXFJ+ock8a5scgNwm8h5rGNiI2lQhosRco=;
 b=d+Lea2T1FikkJSXKbyM1VkmMu7+6OK51opstzFjKZqfVTWGc0HJyavyLb+VPLonbdH
 XamEHLtjdwui0xj8WnEoC7whi/BeT3DvPVSnA1XJbAN0mMEripODaa76GX6Q5KujvPEs
 uxYN8bYLDYx5xjHsKtyyQHKN8OKwwXdxQ/T74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKWhr/qeopXFJ+ock8a5scgNwm8h5rGNiI2lQhosRco=;
 b=qc8KNClIsMogXTyYin4mizyVaYy0IYkAUEpmHYvH1+Fh8CjB6o0maTjQB7j/91lU9H
 lXUPFkgsZK6Kqvbuoql8fYmbTRVni/DTqiqsP2im8jk0JvpFL4ZeJ1hO2qFF20zgDOnA
 lcjaiQ+t5WbFddXtGGxNWq7itw/2jm5rQzJ2NwfHE6Mz6OhuzCGK+5y2Mntows5mIY/c
 rUvHLyGoLeoEHUArc6Ts5Fpbik6rKhTlfzfxPxwp+JApBDrKyDK0+mkyFjFjkF/OKunS
 UaIMXqOMmOcMKSKIDnSWzgNavdiJqk0YvI3BYpF6vf2Pxlo9fKQ8vcQVI2K0qpoIO8PJ
 uNoA==
X-Gm-Message-State: APjAAAWHCnbHB54z1oQMEuImX/g44E9XcpCUH2NjsdPtl6ylLOSDQhbO
 SQ59WN5/AQW2jw7Pu1P/9ztOqv8/YA4=
X-Google-Smtp-Source: APXvYqy9LnAT7oH0U5pJr0RHIWckzEOIqBWxoRaffD41o2uscsLQDoF8uLtPfmqPTteS9fPmPdPZxg==
X-Received: by 2002:a67:d011:: with SMTP id r17mr21519957vsi.159.1580930507391; 
 Wed, 05 Feb 2020 11:21:47 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46])
 by smtp.gmail.com with ESMTPSA id v21sm238878vkd.54.2020.02.05.11.21.46
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:21:46 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id r18so2111841vso.5
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2020 11:21:46 -0800 (PST)
X-Received: by 2002:a67:fbcb:: with SMTP id o11mr22314847vsr.109.1580930506045; 
 Wed, 05 Feb 2020 11:21:46 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
 <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2020 11:21:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com>
Message-ID: <CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v4 1/3] dt-bindings: clk: qcom: Add support
 for GPU GX GDSCR
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
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 4, 2020 at 11:01 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Taniya Das <tdas@codeaurora.org>
>
> In the cases where the GPU SW requires to use the GX GDSCR add
> support for the same.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>

Since you are re-posting Taniya's patch you need to add your own
Signed-off-by as per kernel policy.

Other than the SoB issue:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
