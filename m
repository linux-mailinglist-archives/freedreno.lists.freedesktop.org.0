Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DDD4B7D1E
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EF110E60B;
	Wed, 16 Feb 2022 02:20:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336E510E609
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:20:10 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o23so1005453oie.10
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XAfwp7j7WHoPgTggKUVHhjFZruqxqm2zyO1xWp3l9wk=;
 b=a/efTqnqJvKpAM+8MzMGUZIgMNN3UU2Xkp6YQHELWkg3ORnsO/0ZSYogApRAXnopbX
 iS7HSbQLbddTq9dUa6yHmNSWHpTSRX3fxTM9FXrGo339L8URZstD06L2Q3OwV7zctTgf
 28B56I0HpqR4HR4lc8WThUn/1obYmxpncCJ3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XAfwp7j7WHoPgTggKUVHhjFZruqxqm2zyO1xWp3l9wk=;
 b=wP/p3Cr10XQIUvhUi/SxvOaKl55wWi9CwAgGWgJlcHm+y49RayFxCscYzfL38P/YBr
 CyG7SKmUHELKiE5gknOp2DnXmsJ8WtRgYyw4Nl99ineJ1QQdOy9yroleZuSmBQKb1ywb
 NmNG4TCcupH1S6NfaUjITniDCpffj4SbZZSZoKjfj/9DItDdRHpHlH0j9dzb6LEt2M0A
 1fI8PeP/VsYTIJkGnNsGgXPLfmBvweGPi5RZQ998CMJNx1s24gUlekPbFezFVkVD5549
 5CSTzVnbQyCBYsmIHWpku7NqjmewARmiiFdojS7X05u9KVl0zym5578hP/jC4utpeHUo
 01OQ==
X-Gm-Message-State: AOAM5316Ws+i2KPtKEIpq8OCMScokV3EhGCukahW2pgeVH7GqWQ/4z1z
 aG6hiS+bjtYIhUflt9XC/kPkvSc7cxXOWOGJkkeJCw==
X-Google-Smtp-Source: ABdhPJyxPyJO6OqJE+BDPaGZkFjijQe/mgb97dL7c6jiU3sz1MQvlSq/GF3c8TGS3LIMqD2nycVdiz9/0kfTz/Jv2ik=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2976794oig.40.1644978009506; Tue, 15
 Feb 2022 18:20:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:20:09 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-5-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:20:09 -0800
Message-ID: <CAE-0n51xcCdHjjq_S4h_4HhF88czSDDqi4qk=3LrLxchC0MY5A@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 4/6] drm/msm/dpu: get rid of
 dpu_encoder_helper_(un)register_irq
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-01 07:10:54)
> Get rid of dpu_encoder_helper_register_irq/unregister_irq helpers, call
> dpu_core_register/unregister_callback directly, without surrounding them
> with helpers.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
