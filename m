Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598773D2D90
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 22:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A526E499;
	Thu, 22 Jul 2021 20:20:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461E6E499
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 20:19:59 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 o72-20020a9d224e0000b02904bb9756274cso6489015ota.6
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 13:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Fe8pajUE7NDpP+KFoDH14YyaziM8HYOjmxDI4HcE0+Q=;
 b=MrwpkA0AeKDnvtOPhOU+UgtudfAtOHCjLbSpo3JiDU9qOHMaYB8ODyTaQa2sdqp2SR
 izy7tedILcpoCkkMAX8UpYpLS25bl26x1U+mXQo/9n7204kVjnVmNMwqnRTk+SnilJ6p
 yLBa/1IdvxnerBSnyho0pG+5tT5P5QtxJGemY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Fe8pajUE7NDpP+KFoDH14YyaziM8HYOjmxDI4HcE0+Q=;
 b=UVc5j7f23yyAM0HtidCs/ld4SWFORxah3sqSIcBtUuHAZM8xu+iW6YW5uFe460dmKO
 44ILFdcBO+RWKSZd3uQ9wm7ZaPvVBL72kbsDGrWIrdO9GX6JAIH78QbH1FglmM9FKy3f
 jMJz75yKDc2dvzoB7638i3V5/Waljy15lTFa16tdzvfkMNy0kfasAZAGw+H9od3unMFI
 RhwCgjMFYkuHcuCBZ+XeRwiyyiJ3CDO37gr4vWGS1bDoWD62+uVhZ+iqxHsB24vs4ghJ
 FvKlwnthDddphLK9J7mLtf+1/I0OnecEiS1B2PUQ3dfahpqYKZsPSAiyRORrd0nEUFP7
 LnWA==
X-Gm-Message-State: AOAM53216PWjcDsy6Y1179K+V2Ytu62A8NWeE2rJbLS379242/rVrDHa
 7Shro8bUKfUTK1RRdJWBzV0ZKzh/m4cXTvlgsDYywQ==
X-Google-Smtp-Source: ABdhPJwt7g/hkXpMcwuy3NhbJrzVZd1klNp7hUF1Csjwy5CxmWyIavZZtANOEVOAjS1O5p8mwwxI8J4B3J06pIKbg1k=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr1004458otf.25.1626985199252;
 Thu, 22 Jul 2021 13:19:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:19:58 +0000
MIME-Version: 1.0
In-Reply-To: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
References: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:19:58 +0000
Message-ID: <CAE-0n52zudM+tiByvhNbiBeoYwb+hSqtH0yDgSPU1oTinnSO+Q@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dsi: update dsi register
 header file for tpg
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
Cc: linux-arm-msm@vger.kernel.org, khsieh@codeaurora.org, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2021-07-21 19:50:31)
> Update the DSI controller header XML file to add registers
> and bitfields to support rectangular checkered pattern
> generator.
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
