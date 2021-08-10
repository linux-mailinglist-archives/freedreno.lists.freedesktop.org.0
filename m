Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851343E5057
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 02:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983A889DA2;
	Tue, 10 Aug 2021 00:28:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFFA89DA4
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 00:28:49 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 r19-20020a0568301353b029050aa53c3801so3117522otq.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Aug 2021 17:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HRoKBbC120mpZO7Rwf3yY2Wqv2ZDw0SsZhaaP3iG9Kw=;
 b=b7oTI7pXK4UvT/slNhXBHpYCZP7+MeBmfeSSbjI/aKYSqGEunyiYcIMcqA1eq8BC+H
 oBPqmdPIA6cv0p6LCUDFdtUC2mXrZd5B+ZzB5di1KJyFAwfYBrwtoEgy2bp7dQ9B6FCr
 yJ+hAioIV+wD6A0vvTE08xu163VL+w/zKRi7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HRoKBbC120mpZO7Rwf3yY2Wqv2ZDw0SsZhaaP3iG9Kw=;
 b=SRhgb/XqflFtDQD1jQlcr/LCZUGg/bI08Lv/8Vj680g1qBK0H5fyZeFr8VrLsgnzfP
 LcIic8BOqin1jWyWfppy0yypjVxTKTTmXd+C2Ne1OvYNJqm9XeFjNmrPX/vbPSFCGAuq
 8F6/IDkcw63+rcCM4GUv76L0rV+h/loo/Gzq9tgGAK6VBu/J/9dlSqL7pyuZIx9AxUQ4
 GgQa6N7Fekvso7yiila7BR0UNlAEgSc6t4HhcwSDrcvtxECNloy8a3LpSdDYciUFvKOk
 CKPLtCSZTb6hG5PJ6WZ73f/5bGqjavLszPFIwTFhweIqU2w7eCDEdrdu2Uueu83IkIiU
 iVGw==
X-Gm-Message-State: AOAM5331kjUpxy0WdrVodIOMmY7n4RC4ZQ+QhUO8PXKG2CGTdV31CfQc
 3IFB9wJSFPxO5j0/blnWlKGUIrotoNQQjzL23T+i4Q==
X-Google-Smtp-Source: ABdhPJxoo8NK9wFlwHerqC8A8M68otlXDKJXzE8FXoEI3Z9Tb47KJ4Do1b1frIJJ5Zy4cKOXDh55LHg6NY73iIRVaGI=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr19010939otq.233.1628555328400; 
 Mon, 09 Aug 2021 17:28:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Aug 2021 17:28:47 -0700
MIME-Version: 1.0
In-Reply-To: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
References: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 9 Aug 2021 17:28:47 -0700
Message-ID: <CAE-0n52Ebezuek_HrBHRFVyUv28aj=F+6FqnBkZZLMYwUa8veA@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: add drm debug logs to
 dp_pm_resume/suspend
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

Quoting Kuogee Hsieh (2021-08-09 14:58:57)
> Add drm debug logs to dp_pm_resume and dp_pm_suspend to help
> debug suspend/resume issues.
>
> Fixes: 355ab7428f09 ("drm/msm/dp: add debug logs to dp_pm_resume/suspend")

BTW, I have no idea what commit this is. Best to probably just drop it?
