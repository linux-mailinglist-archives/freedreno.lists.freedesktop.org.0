Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997AE4402ED
	for <lists+freedreno@lfdr.de>; Fri, 29 Oct 2021 21:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4786EA74;
	Fri, 29 Oct 2021 19:10:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B866EA77
 for <freedreno@lists.freedesktop.org>; Fri, 29 Oct 2021 19:10:17 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 x27-20020a9d459b000000b0055303520cc4so14888870ote.13
 for <freedreno@lists.freedesktop.org>; Fri, 29 Oct 2021 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6E8vcYJD1fKDP3XaD/ycH8JYuUdwy86+ns+dWhU9gv0=;
 b=RocDwXFrDGO/UvAZFqVuRg/v72xtGyOM9Lk5I2qYuyt1+h8yABESCofSInZzYjJ7g5
 cOTtJivWVwprgwt3Q5LXiAJYIEl+sdyNTcBH1qmMMZJlh1QmB9bHBS76g/C8pElZQDuB
 q4l3oiqhf6zDfV9HFpik4L4/j1+eP7S6z4164=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6E8vcYJD1fKDP3XaD/ycH8JYuUdwy86+ns+dWhU9gv0=;
 b=bPJophO21HVLqS0Jcgq9itP0JDgA5bLnwoZZWHyeYSrEEy14NAbB/waAs8jwYo/9Ym
 AhuvxX0vTSExJm559LWBbiCRk6mxrdNsyepgNrXHXA4kbtY1GmACJLkdi9HrWTQ4HRef
 rbniuJgOkuX+GhriKpoAqpvXr/OmauN1bJSRM+xGgluW4c2YO4K76lMxqcj+vVtwuFTB
 i/AbB1DmDc2kbEbBU+QYum9aUDkrC8Bw0ucwHLndyemt+itM1fvSTZ2VNbFnyi5zSknC
 LMIWJUb9Asl1Ha+Sl0lNNf/+dOnW71g6caYk4EYodPr3crz/bPmc/0ziRgt5lon8cCz1
 SPYQ==
X-Gm-Message-State: AOAM530JPwfGZNboDSbjUA6vcvPT3Y4+gP3ynlTy00po6Rriq9gBwX9s
 xZCGD6GFwR4hbUDEQmLk67E7RiiXDFBR1Jkr8FFcXQ==
X-Google-Smtp-Source: ABdhPJxCk6IMb59lyzYez87DGQZ6Gc3q17oYBRmUQDgX/ynDSJlazwQKn7ZL0Q43BMkQWirfnUQPme8eEHyOBDDqfXA=
X-Received: by 2002:a05:6830:1290:: with SMTP id
 z16mr2825771otp.159.1635534616693; 
 Fri, 29 Oct 2021 12:10:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:10:16 -0500
MIME-Version: 1.0
In-Reply-To: <1635510619-6715-1-git-send-email-quic_kalyant@quicinc.com>
References: <y> <1635510619-6715-1-git-send-email-quic_kalyant@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 29 Oct 2021 14:10:16 -0500
Message-ID: <CAE-0n51eW3kkeW+3vJyqVTUF-R5G38SF2VjXi4SksuFbz=zcQg@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, y@qualcomm.com
Cc: linux-kernel@vger.kernel.org, robdclark@gmail.com, dianders@chromium.org, 
 mkrishn@codeaurora.org, abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v2] drm/msm/disp/dpu1: set default group ID for
 CTL.
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

Quoting Kalyan Thota (2021-10-29 05:30:19)
> New required programming in CTL for SC7280. Group ID informs
> HW of which VM owns that CTL. Force this group ID to
> default/disabled until virtualization support is enabled in SW.
>
> Changes in v1:
>  - Fix documentation and add descritpion for the change (Stephen)
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
