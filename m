Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D350E9ED
	for <lists+freedreno@lfdr.de>; Mon, 25 Apr 2022 22:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DB210E249;
	Mon, 25 Apr 2022 20:11:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F28610E26C
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 20:11:23 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id m11so7612571oib.11
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 13:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Mjic/+zJme8zynP2sX08SrHAg/3yMfrQ4Fx00iF0fX0=;
 b=YFgrUyczjyRzM90CDf5/Q+sTl7Kk/h/LjwzwpqWYXv8MY6Ga3wHBTtJbp4NrHlrftw
 bnW+y73vDjwcQZmAoJZZRdXVMvoZOcrRQGqlI+V9gNKnqrvxEAUaR0vvfMW+3XTxIAi0
 S42sLU1a7TGGtIAvPUaN1sh2Nl4dEk/2gxGYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Mjic/+zJme8zynP2sX08SrHAg/3yMfrQ4Fx00iF0fX0=;
 b=7/XDmfkSlRZp6d252FGOyGa3hnvDODKLMDheZYUSJlrIOOoJS+XkzDXyP3QmaK1MYq
 k0TY+fLEAn4vXkTJ21gaTyFlX5FhC242JVOg/E2rQU9gzzmc8a2CUWDu9ON45LBKnqpl
 V1K9/QdjGbAI6BBMDgpUHeX2cQItD1B6UYPXvzwxfnz8g+p7VcxCwInuWH/PII2wFkPI
 pomTRLe2UhhygF9DcctD8yYE0jqYsGr2GUKGLd/fseP8s5ScMZvxmqRJnm278gxxhf5Z
 +bf+4eaXvhjJXL2tT5DNDLHqPwCXNE6NPPb1ClLSMyVgRjnvrNv1rdEXBVvM8qPRa7oX
 56Xg==
X-Gm-Message-State: AOAM530pAXmUQFDgqAXTVKrvEj/fYiIPoZqGYliR9naMN5GfJdU/mxHu
 iZx+WtZgDqqHRf/EedIIWg34UfxneIvqF6xvhjhaNA==
X-Google-Smtp-Source: ABdhPJxsMQaEqd9ibkQQl1fMlnDAr7kXgMYwl7tspORWVrkHPLW8+XsZ5FMAITRuX/xmgDJGyjvQ9czYe2KUg+TvZD8=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr5230521oiw.193.1650917482697; Mon, 25
 Apr 2022 13:11:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:11:22 -0700
MIME-Version: 1.0
In-Reply-To: <20220425091831.3500487-1-lv.ruyi@zte.com.cn>
References: <20220425091831.3500487-1-lv.ruyi@zte.com.cn>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 13:11:22 -0700
Message-ID: <CAE-0n53xBM+n__eKKGaCuB+3Ea4O+rNk2PUQbD2bjW3JS7YJBA@mail.gmail.com>
To: cgel.zte@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/hdmi: fix error check return value
 of irq_of_parse_and_map()
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
Cc: daniel.thompson@linaro.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 lv.ruyi@zte.com.cn, linmq006@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 christophe.jaillet@wanadoo.fr, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 angelogioacchino.delregno@collabora.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting cgel.zte@gmail.com (2022-04-25 02:18:31)
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return a negative value anyhow, so never enter this conditional branch.
>
> Fixes: f6a8eaca0ea1 ("drm/msm/mdp5: use irqdomains")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---

This one fixes a commit that moved away from platform APIs!

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
