Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD733E855A
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 23:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B1689C0A;
	Tue, 10 Aug 2021 21:33:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F5C89C0A
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 21:33:47 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 w2-20020a4a9e420000b02902859adadf0fso90668ook.1
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=K89ryxZKdGzSi1l6ZgbY5SW5/B4L1gkXo7ILZAccfU4=;
 b=iBzrlbp6mNut88ED6fWJqIB9hl9saDzoC0ziK0cNST5Dd4rpzrrfFer7Ih/9Wm+rQQ
 3c0d9XcwLXshbkR3X5DbIRHOytVjh2ZYKOq+DRRa1euJMdl5rNdXD2Y4zPcXTn587tsM
 yQtL1P8eTdlE5WsraMeaSEvpIQigKz8gi2cW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=K89ryxZKdGzSi1l6ZgbY5SW5/B4L1gkXo7ILZAccfU4=;
 b=ZKW1rJHXIO++rz66EHmq43aFXpVnZOtx6e3LJtBmCjiawTTaOcBXgScY1ptJonXTll
 mC/gtXRICnuwajYp8M9GTtm1kt9I4Mu9DJnJos9gjLFB+vpVAzezptfFmXWj05kqcNWA
 8Z+Nk0jYcm1xGygK+3HsHKkiqj1jf9B7IIAlRxVnzz5hWdjfKMLZbbBEv48V1tY6mqh5
 vk+YIma88NvnafLOGag5nNAJhuX0wQIAW3XsWy5Wc3sKFDwLOm6/Ler4Vr5u3H1o7aFR
 NcnEHxuytUGMsUo+iAQzArX3O6Td6smXC2uPLbJ0aNEGcCUKE9RRNOjXZmmwkyOeFIwU
 DPbA==
X-Gm-Message-State: AOAM532QjB6d+eS4zClY7v5WcDQpkl4TL4nD/VqmH8zKM3f3ABdS7aAy
 zgxbgcmBu26oML64pTTnCczG3WhUY9yMd0tn1tDgWA==
X-Google-Smtp-Source: ABdhPJzMSqm7mlJWw7m6cKtMxq0odiWwUHDwLozyyqB71lusEKk+/E8sZ86F1JfKGqRqGY8ymvo2r2rYgeFoZrYEHrc=
X-Received: by 2002:a4a:c60e:: with SMTP id l14mr18621189ooq.80.1628631226738; 
 Tue, 10 Aug 2021 14:33:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:33:46 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-5-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
 <1628196295-7382-5-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:33:46 -0700
Message-ID: <CAE-0n535+OOwQ=td-ow71MPZNq4=DFjP+hLEvrE1ZaMo+0j1rw@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 4/6] drm/msm/dp: replug event is
 converted into an unplug followed by an plug events
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

Quoting Kuogee Hsieh (2021-08-05 13:44:53)
> Remove special handling of replug interrupt and instead treat replug event
> as a sequential unplug followed by a plugin event. This is needed to meet
> the requirements of DP Link Layer CTS test case 4.2.1.3.
>
> Changes in V2:
> -- add fixes statement
>
> Changes in V3:
> -- delete EV_HPD_REPLUG_INT
>
> Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly")
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
