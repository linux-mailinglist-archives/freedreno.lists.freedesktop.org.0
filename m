Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E8D4CC87E
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E118B10E322;
	Thu,  3 Mar 2022 22:05:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CEC10E2CF
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:05:41 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 12so6110344oix.12
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PKohUg2qG/pCEPlXibG2AgUnEJqrXhfRLiwdaT8RtZw=;
 b=D7YSxbf9YXlA/4GXf6hdHT3HLvlA58JNPLh26N+ob5BKmSnH4xtDfs1DKlG+a90Rv4
 ZO6EG+FZRdzqxbfeZimjrs6Kb+2JcEXIB0O+cBLy7GH5s4NOT7pSYnmyW3G8ySdnTQDh
 zZfjkPYBJYi+jjdSHrHTw0Oz/FOmDKscxJib4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PKohUg2qG/pCEPlXibG2AgUnEJqrXhfRLiwdaT8RtZw=;
 b=cZATs49eitdiXXvQ7MPNe7XlLrwbywlexoXEeA36FG/F6O7qfvdGqsdbpqefJeoGO9
 Ab3AsXKJQDS3q8gVFb2OgWWR/3A2ZT2nhjsn0LD1XpwSYdImpSZ+xSW0hIhS1dJO+3w1
 N1JGgIvUm7quD2cqFrAXJqiz8mhpRDHjZauDBLyjs1O0h4leMPEfNaR2ZksvA+oNqNuL
 8E2+wyteRU6UKXAivI9S6y5YEVCERIfn1kpWV+0/7RBFFh3MrFW5RT+rzN54Q2yAVymZ
 USqlzd+nHsxQ/F/SnENdCR5mUo3VpvJwcN/G4qW6jwUOvXjnLvzq/xM8pj0hPtAo8JqJ
 oakA==
X-Gm-Message-State: AOAM533jQ/D+I+USUG8y74nLajCq/d8sH+x2FvJRYWjYKmb/Rjy3Xq54
 p7Rm+y+PcrlOlUb3zFF6YSUqALorXLlxcfhki+VNqQ==
X-Google-Smtp-Source: ABdhPJy47x1D2qJGCMALwvxUqjRjAF8d7zyb8QVQXnlC6qzKxDZbC7qJi/ar2Vw+nacHvEUEoLG1Gb9z04TrKcGKOvM=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6563793oiw.64.1646345140349; Thu, 03
 Mar 2022 14:05:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:05:39 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:05:39 -0800
Message-ID: <CAE-0n53FVc_JNN-gkXeaQjt810e7_nV6kCireqgPfPsE7rq4Bw@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 1/4] arm64/dts/qcom/sc7280: remove
 assigned-clock-rate property for mdp clk
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
Cc: quic_kalyant@quicinc.com, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-03-03 01:39:58)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
>
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)
>

This changelog goes below triple dash when they aren't intended for drm.

> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
