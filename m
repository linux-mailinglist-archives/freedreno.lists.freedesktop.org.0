Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C8C39CB2E
	for <lists+freedreno@lfdr.de>; Sat,  5 Jun 2021 23:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8196E1F4;
	Sat,  5 Jun 2021 21:25:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26F988A33
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jun 2021 21:25:40 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id x196so13324392oif.10
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jun 2021 14:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=nDGVMkwUgwdjkEH0hG7ASi22La0UWmLtqIvR+gpN50c=;
 b=BTK1W0VgQTwdsUqPJC2JMeWQHe/oG0sV0uSI7t/AuJN4FhyLldkvR/V50OgZ1WkQ3Y
 E2KIBDbE8jzDxK1L8GQj9FHWF9sbHqjk03gw52+j1vksR4WcFb8pBAhOtA6ILoPRRF/5
 Fu0bRbfzhLXQVRZQLg4nMWzU19aRBMl0wGMo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=nDGVMkwUgwdjkEH0hG7ASi22La0UWmLtqIvR+gpN50c=;
 b=VQhWTMXObNaP/IvnP0Xo43dg9bx3/QnH5OH4wU6tuoV6uj7V6DW3i2VFdP9lg0nE4M
 31RdHPBcM4V5REiFDSpYagmfc54nC/yzCY79luiw5YyP0IXuRIe749WwH7QeZ2hD52eW
 CmG4I0DvogpIR45D737Z/eVY5BS3JoXa8iFPmLlmgyT9qAG4w5Vd2KfK2jBNrt5/w7pT
 MLQq0g8Q3KS5MPzYhlKJ4sU5EMNtUzzhDDclvOfdVJlTgelnvcHHjd34Sug/NSuiSi2W
 lQxyUYlwaBsh1L/FUDg5+u+Hm8Ypgwk5p7FJRMq8/XbROo08I10+EnO0q+zj/xwk+Z2k
 byAQ==
X-Gm-Message-State: AOAM5332KIQTWJwSC0GL/WkMgKYz1RKPj2uvITV0cXsG/YJ1BNtiUbsq
 f7dz1dGqKZ12oXVVSHRCSCz7Vk2uoASZkNi7klvflw==
X-Google-Smtp-Source: ABdhPJwqWjgtkV6EVmyoaOkoIT65rH0dn9l4jgw00hx1mo9ouL6X8MY7KOpfRx2AQCm8fVUEz37W3iRqokSQ23ETSXo=
X-Received: by 2002:a05:6808:144e:: with SMTP id
 x14mr15519145oiv.166.1622928340013; 
 Sat, 05 Jun 2021 14:25:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 5 Jun 2021 21:25:39 +0000
MIME-Version: 1.0
In-Reply-To: <20210605123543.8986-1-bernard@vivo.com>
References: <20210605123543.8986-1-bernard@vivo.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 5 Jun 2021 21:25:39 +0000
Message-ID: <CAE-0n513KEA+_5m=X1EKjnAbVVAeGXADqJ+S=Hs+E9cr7gEzJQ@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Guenter Roeck <groeck@chromium.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm: remove no need local variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bernard Zhao (2021-06-05 05:35:20)
> Unneeded variable: "ret". Return "0" on line 880

But the variable is "rc".

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
